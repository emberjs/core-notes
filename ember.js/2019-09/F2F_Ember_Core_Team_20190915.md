# F2F Meeting: Ember Core Team - Sep 15, 2019

## Agenda

- RFC Stage System (YK)
- Two-way data-binding issues (CG)
- [Basic Helpers RFC](https://github.com/emberjs/rfcs/pull/388) (MB)
- Strict Mode (GC)
- Moving to attrs-first-and-only (YK)

## Minutes

### RFC Stage System

YK: One of the goals of the stage system is to unify all the consensus processes in a single flow.

YK: There are already implicit stages that we use: Fully described and approved (eq to TC39 Stage 2) and final "Go" / "No Go" (like Stage 4). TC39 adds others: 

YK: Stage 1: the initial solution may be very different in shape than the final form. Sometimes people propose with a very strong opinion about direction, but it ends up going in other directions. People have general consensus to explore the proposal.

YK: Stage 3: the feature has been implemented and people can try it out. For instance, embroider is probably close to stage 3, but not quite.

YK: I propose that we add directories that map to the different stages.

YK: We also would need a pseudo-process for stage 3 - allowing for trial via alphas, etc.

RJ: I like everything you said. I don't want the URLs changing over time.

YK: How about adding a banner on the top of the RFC.

YK: TC39 has another process - that uses a table showing the stages of different proposals.

KG: I agree that this will be valuable.

MB: *raises point about diffs being available*

RJ: I look at diffs for TC39 proposals all the time.

MB: What is the new consensus process? Are we adding two new points that require consensus?

YK: This provides a lot of value to the community so they feel that they have lots of opportunity for feedback.

YK: My hunch is that we should have a lot of FCPs associated with these stages. Although maybe it's fine to move to stage 3 without waiting, say, to allow for experimentation without worrying about overlap with the beta period.

YK: It's of course very important that we maintain the FCP for stage 4.

YK: I think that part of stage 1 brings a core team member in as co-author.

KG: We currently require someone on the core team to be attached.

YK: So that's at stage 2. I'm proposing that be moved up to stage 1.

RJ: I'm very much in favor of moving forward, but there are some details to work out.

YK: I wanted to talk about this today because there are a bunch of proposals I'd like to make today that should be considered stage 1.

YK: Next steps: do stages 1 and stage 4 in a more formal way.

RJ: It's probably useful to describe the end zone and how to get there.

YK: We can start this process on the core team, and experiment, and see how other teams like it.

MS: Are there any parts of the staging process for TC39 that you really don't like?

YK: Everyone on TC39 finds the staging process to be a vast improvement over not having one.

YK: My main issue with TC39 is that there are people with vastly different goals - and sometimes the process is used to filibuster.

YK: Also, there's a general disagreement about what Stage 3 means. For instance, the V8 team wants to be able to ship features without a flag *at stage 3!*

YK: Stage 1 is pretty awesome. People rarely shoot it down, but sometimes people encourage others to withdraw.

### Two-way data-binding issues

YK: we should start the discussion by understanding the goal of the conversation

CG: I would like to concretely propose a solution for `mut` situation

RJ: lets discuss the current "consensus" before we dig in, and this will be the default checkpoint if we do not come to a clear alternate consensus

YK: The current consensus is that all references in the system are *essentially* considered pointers, and therefore should allow two way bindings for compatibility with classic compoennts

CG: It seems unrelated to angle bracket invocation rfc, instead it is related to named arguments rfc which was silent on mutability specifically. I would mostly like to understand *why* we made the decisions we did here so I can understand.

YK: clarifying question: I don't think I fully understood your proposal

CG: Wrap every named argument reference in the system in `{{readonly` helper

YK: one thing that would break is invocation behavior, by wrapping a named argument reference you must also pass forward all of the internal details **other than** update. There are issues with things like `{{action`.

GC: In addition to `value` on the references, there are a few other properties that are important (`INVOKE`, `UPDATE`, etc).

GC: All of these specific issues are "solvable", but there are other failure modes with not just passing the reference forward (WRT debugging, etc).

YK: I have a bit of a point of order here, I think the pushback here is largely that we have very very little time (before octane).

CG: I see. I think that some of the pushback received earlier was that it was more fundamental, and these specific technical issues were not clear. 

GC: I agree that it is fundamental, the whole system needs to be rationalized well (if we change it or not).

CG: I think that the concern here is that we have to describe that this two way binding is "bad" in release posts, etc.

YK: It's not clear to me that that is true.

YK: The thing you are explaining is that the GC Javascript cannot do the mutation, and if you refactor to GC's that things *downstream* may still two way binding.

EF: Time for a **mandatory** 10 minute break.

~~ lots of discussion (non-breaking) during the supposedly mandatory break ~~

GC: Doesn't believe it's inherently confusing or incoherent. Want's to make work the thing Matt was saying. Showing code:

    // In the user's app application.hbs
    <AddonComponenet @someArg={{this.someArg}} />

As an author if your component isnt using any classic or other feature you should be able to refactor  your component into GlimmerComponent

If your addon uses positional params you can't convert to GlimmerComponent. Thats on purpose because you are using feature inartistic to classic component 

    // addon/components/addon-component.hbs
    {{#if @someArg}}
      <Input @value={{@someArg}} />
    {{else}}
      <SomeOtherClassComponent @foo={{@someArg}}/>
    {{/if}}

By doing ^^ you are not using a classic component feature. Afa you can tell you can't tell if there are classic components used. This is not a very sensible example You might be using the arg in lots of places. As long as you are using it, you don't care how it gets updated. Just using shouldn't stop you refactoring it to a template only or glimmer component. This is what we mean by interop.

**After**

    export default ClassicComponent.extend({
    	tagName: '',
      actions: {
    changeSomeArg: function() {
        this.set('someArg', `lol${i++}`);
      }
      }
    })
    
    // addon/components/addon-component.hbs
    {{#if @someArg}}
      <Input @value={{@someArg}} />
    {{else}}
      <SomeOtherClassComponent @foo={{@someArg}} onchange={{action "changeSomeArgs"}}/>
    {{/if}}

If you do ^^ you can not migrate to GlimmerComponent, kinda by definition, because you are relying on semantics of classic componenet. The only way to migrate is to ask your user to pass you a callback. You can decide you can make a breaking change and do that, or be happy about using classic component. This decision is local to this comopnenet. 

the only way to observe that `{{this.foo}}` is two way bound is to use it in a classic component. 

`{{@bar}}` means just pass the thing through whatever it is, we don't care about it.

CG: this results in the world where some things can convert and some cannot. This is harder to teach. You need to say if you use this feature you are ok, otherwise you need to rewrite. 

GC: Below you doesn't change, above you does change. 

CG: agree

GC: agree that teaching that if you use xyz you can't migrate but this is inherent to the situation. Positional params, wrapper features etc. are not supported

CG: agree this is a line in the sand. It depends where you draw it. We are making the decision. You can say the same about named args. 

GC: If you are passing things through you don't care about 2way binding. The end user cares when invoking the component. 

YK: 2ways2thinkabout2wayBinding. 1st: there is a target location and a source location and somehow they got hooked up. 2nd: every time i pass an arg it sets this. on the prop and its wired up link by link on the prop and it makes its way through the exact links. if you had that mental model you would expect tit work on template only compoents. but this way to think about it isn't the way people think about it. GC point about pass through, it is just as reasonable to think it will work and as is to think it wont≥ Two ways to think about transition. 1st. Happy to not use 2way binding. seeing a 2way binding bad. 2nd: 2way binding used to be important. They are used intentionally. If you see them its not a bug

RJ: Somebody earlier was wrong about a thing

GC: people in the middle fwd the thing are not at fault. 

CG: We have tons of context. Lots of community members don't have context. Look at fallout from `mut` (IT: we don't even agree on how to pronounce it).  People will continue using Input components. It is the EmberWay(tm). We might guide people towards thinking 2way bindings are ok, and then when they discover they work in some places bad things will happen. I am ok with current state but we do need to communicate that 2way binding is going away. Core concern: communicate this

YK: I think its the opposite. Some people hate 2way bindings. They think: glimmer is finally good now, we should never have had 2way bindings.  While there are classic components its hard to avoid leaking 2way bindings. Situation confusing because some people want to claim that 2way bindings gone. YK is nervouse about telling people Glimmer is outside of 2way binding world

YK: My mental model different from a confused user. Lots of components will use 2way bindings where 2way bindings are meant to be used. PowerSelect etc. Glimmer exists a feature that is a 2way binding. We could say its not there, but it is.

CG: lets design components that don't propagate 2way bindings

YK: How to do that? If you have a input component. 

GC: Writing a smart input. You could do it as a glimmer component with a single arg. You could design it with two args, value and callback.

YK: ok with that device, but if you have complicated app with lots of things. If you can't rewrite the app this proposal would break the 2way binidng. Huge lift to make the change.

CG: 2 proposals: break or communicate that 2way binding not a thing

GC: `mut` problem is not that it's two way bound. the problem is ergonomics and design. If you pass mut and you read it `@foo=(mut this.foo)` doesnt work and doenst do the right thing.

RJ: Does not accept saying 2way binding is bad. It is obviously useful in some cases. Having it is fundemantal and we should have it. Saying "Thou shall not bind in two ways is fundamentally wrong."

RJ: This not a problem with GC. This is only a problem if you have classic components. Inside a glimmer component this never a problem. Only a problem in interop. 

YK: The issue is not that you are propagating 2way binding transparently. The only real problem is that top person did not opt in. You did not opt in into your state getting mutated. The fix is not in the passthrough. The fix is in the top level opt in. There is not danger in passing through. The danger is in secretly mutating the parent. 

YK: Q about how you understand the interop code. Another Q on how to do the transition. These sometimes in conflict. People say more importnant to optimize for reading than writing but not true when transitioning.

RJ: We did not redesign the Input in angle components. Input needs a 2way component. If we wanna say no 2way binding we need to write a new Input. We have not done this for current version. 

GC: Is there anything to do in the short term?

RJ: What do do? Add a lint rule for mut? Add a lint rule for input value? Design a better `mut` Design a better Input. 

YK: We need2document. YK will help. Need to design a better mut. We have a good lead, we can do it.

JW: I volunteer to help and review.

GC: Doesn't know if he agrees

KS: We can make the destination transparent for lots of cases.

CG: Main reason to say 2way binding is going away is to get people to experiment with designs. New mut is not hard. Anyone could do it. Agree with everyone that the core concept 2way binding make sense. 

EF: Being clear about improving 2way binding is better than saying 2way bad.

YK: Does nuance help us?

GC: We don't have to tell the regular user that maybe you should come up with a solution for better mut. If they don't feel the pain don't tell them about the pain. 

RJ: The think we did badly in the past is telling people things are going away when they are not. Look at controllers. We don't agree that 2way binding is going away.

CG: There is confusion about what 2 way binding means. Is the current version of 2way bindings useful.

YK: Nuance is dangerous. Controller example. If not deprecated, massive failure mode to say something will go away. Once you have a plan deprecate. If we don't have a deprecation that literally means we don't know what to tell people. In pass through cases, 2way binding is fine. Saying 2way binding bad, will make people do bad things in pass through.

CG: Saying that things are going away helps people experiment. 

EF: When we have a new pattern we succeed

EF: Having a stage 1 thing describing the problem would be great. +1 for stage 1

### [Basic Helpers RFC](https://github.com/emberjs/rfcs/pull/388)

MB: Original RFC was to make ember-truth-helpers actual first class helpers supported in Ember. Lot's of folks liked it, but there was some questions/issues raised by Godfrey. Cibernox responded:

- [https://github.com/emberjs/rfcs/pull/388#issuecomment-436396016](https://github.com/emberjs/rfcs/pull/388#issuecomment-436396016)

YK: The issue was fundamentally that ember-truth-helpers has some behaviors which are inconsistent with Handlebars and the decisions it has made.  

GC: Maybe we can comment back and repeat the same points, but that will probably result in the same thing repeating itself.

RJ: If we were going to write the RFC today, how would we write this? Lack of guidance would be very confusing if I had wrote the RFC.

YK: There is a conflict between Handlebars semantics and JS semantics. The debate is whether or not we should try to "fix" Handlebars semantics, or keep the current semantics for consistency.

RJ: Part of the issue is we haven't defined the semantics of truthiness/falsiness of Handlebars.

EF: Maybe we should delegate this to a smaller group/subteam?

YK: Do we actually have a well defined meaning? Can we get consensus about a principle?

RJ: We should have a single definition of truthiness/falsiness. We cannot introduce interchangeable definitions of truthiness or falsiness.

GC: We should show how these helpers de-sugar into plain {{if}} statements. This will demonstrate the inconsistency to non-language-designers in the community.

YK: Is there precedent for the `eq` helper? I don't think there is. 

GC: Falsiness of empty string may imply that it should be `==`

MK: What is the transition path for `ember-truth-helpers` if we do this?

GC: We should release a polyfill.

RJ: We can definitely polyfill, and it would match the new behavior.

MS: I don't like the polyfill idea, a major version bump would be better

RJ: The polyfill would detect users who are already using `ember-truth-helpers` to prevent failure cases

IT: How will interop work with addons that are currently using `ember-truth-helpers`?

RJ: We would figure it out via the polyfill/other techniques to prevent breakage in the ecosystem, should be possible

RJ: Doesn't seemed tied just to truthiness (also related to equality, etc)

YK: Because we implemented Glimmer as a VM, it would be difficult to change these things, for me it feels like these semantics are well defined and we already have this defined, e.g. `ToBoolean`

RJ: I understand that, but you can't say to use the internal/private `ToBoolean` thing

GC: I think it is possible to define the boolean semantics

GC: `{{if}}` and `{{each}}` should probably agree, empty Map should probably be false-y. Diverges us further from JS maybe

GC: Maybe it's impossible to do this proposal without having those semantics be well defined

YK: Because there is no spec, we should probably accept the implementation as the spec. Asking the proposal to desugar will really help.

EF: We have a public `ToBoolean`, it's `{{if}}`

CG: <Missed some points because talking and note taker>

YK: JS doesn't even have a good internal definition of `===`

RJ: We should separate some things out, simpler helpers should be easier to define like `not`

Proposed action steps:

- Restate the importance of HBS semantics in a comment
    - The truthiness in templates is based on HBS semantics and the Glimmer implementation. This proposal should strive to not change any of those which exist. We should document the truthiness of things as `(if whatever true false)`. The RFC doesn't need to explicitly outline what that does for `whatever`, it just needs to honor these semantics.
    - `{{#if foo}}` should permit `{{#if (or foo bar)}}` shouldn't have a different version of truthy/falsy.
    - Core doesn't have a consensus to change this right now.
    - FYI: [https://guides.emberjs.com/release/templates/conditionals/](https://guides.emberjs.com/release/templates/conditionals/)
    - Many (`not`) should be implementable with an AST transform and short circuiting, based on `(if`.
    - Some cannot be and need semantics to be defined:
        - `eq`
        - `gt` `lt` - maybe we should just punt on this for another RFC?
- Talk about a process of migration for ember truthy helpers in a comment
    - RJ says polyfill should be made, let the ember-truthy-helpers version of a helper win
- Safe string could be equal with a non safe string?

### Strict Mode

YK: I will talk about the implementation I did. Then maybe GC can tell me what I maybe missed.

GC: There is a WIP PR, so there are words. [https://github.com/emberjs/rfcs/pull/496](https://github.com/emberjs/rfcs/pull/496)

YK: Most important in the implementation today is... wait let me screenshare.

YK: tl'dr on what turned out to be hard: There are a few syntaxes:

    {{foo}}
    {{foo bar}}
    
    <Foo />
    
    <div {{foo}}></div>
    <div {{foo bar}}></div>
      ^-> Internally could be thought of as <div {{modidifer:foo bar}}></div>

GC: I realize you might be thinking the contextual helper RFC, not the strict mode RFCs?

YK: Sure, this is a contextual helper RFC update.

YK: I'll start here. `<div {{upcase doo}}></div>` `<p>{{upcase foo}}</p>` in Glimmer today these things can be different. There are effectively two namespaces for these things. 

YK: There is another thing, you can also do `<.input />` which will look up the input property and invoke it as a component.

YK: `{{f.input model}}` This does just have the semantics of "look up f". Ember does an AST transformation  of that to `{{component f.input model}}`. You can imagine if you wanted to write `import { upcase } from 'whatever';` you can imagine there is a problem because `upcase` needs to exist in two namespaces.

EF: So in strict mode there is one namespace?

YK: Well I'm stating the behavior today. It would be a breaking change to unify the namespace of modifiers and helpers etc.

YK: I'm not describing a new problem, but a problem that we already have.

YK: What I've basically done is that anyplace you write....

(discussion)

GC: Basically there were bugs in Glimmer that we blocked with assertions in Ember which we can maybe remove now.

YK: I think I did a smaller things which is clear the space where something like the helper helper would be implemented.

YK: Yeah before Ember had to transform `{{f.input}} -> {{component f.input}}`, now `{{f.input}}` simply works locally.

YK: Today in ember `{{#let (helper 'upcase') as |upcase|}}{{upcase foo}}{{/let}}` doesn't work, but `{{#let (component 'upcase') as |upcase|}}{{upcase foo}}{{/let}}` as syntax does. But only because of hacks. I didn't change this, but now there is a spot in Glimmer where you can write the implementation.

GC: Right, so I want to talk about the strict mode RFC.

(discussion about Glimmer and Ember integration)

EF: You had mentioned wanting feedback on what the next steps here. I want to see the components that you import in JS can be passed and invoked in handlebars.

YK: I think that is a category of things which is pretty easy once you...

EF: It fills an important space where you see people doing silly things like very dynamic eval. You have components which want accept a component to fill a spot in their template or use a default.

EF: I think colocation + the helper helper RFC basically says we can do this.

YK: I think an env hook is what we need, something small that says how to go from a thing like a class to an invocation (like we already have for strings).

YK: I think if you say it works from imports it works from property access.

GC: I think what you're asking is that strict mode is what you... none of these actually require strict mode.

RJ: I'd like to talk about the strict mode RFC. How do you want to frame it? There are some unanswered questions, or there should be.

GC: Summary of the proposed things or status? The status is that the RFC is done, but not accepted.

GC: No implicit globals. Today, magically you have access to the components and templates in your app by default. The proposal is that we still stop having implicit access to these things. You will need to do something to import the things into the template.

GC: My plan was that I would write this part, but we would have someone else write the other part. the other part happens to be complicated and controversial

GC: So the thing to agree to is that you need to import things.

GC: I think there is a distinction between keyword and built-in helpers.

(some discussion about helpers, imports, names like action being duped, yield being a JS keyword etc)

CG: Does this forgo the future possibility of a prelude

GC: No, it just leaves the mechanism undefined.

GC: #2 should not be controversial, it is already implemented. In strict mode there is no `this`.

MB: Oh we've mentioned `.` in templates being `this` sometimes, is that mentioned?

RJ: No, those should just be considered bugs.

GC: #3 you cannot pass a string to the component/helper helpers, they will not resolve from the container.

GC: #4 no more partials

GC: #5 

(discussion wrt partial deprecations leading to removal from loose mode templates in a major version, but they are also just not present in strict mode)

GC: Finally the status... This intentionally does not talk about how to get things into scope. But it is pretty much useless without that. So we could land it, but have a primitive to get things into scope and let the community play with it. In fact there is a primitive in this RFC.

RJ: I don't think we need to block on imports. We can create a helper to lookup/resolve and add that.

GC: Maybe we do that, but presuming that thing is static anyway there is a low-level API to get things into scope.

RJ: I do not see the need to block this on a top level import syntax or decision.

YK: Are you basically saying have a bunch of fields that re-repeat the fields?

YK: I don't want that to become the defacto best practice for years.

EF: I think you're right that it isn't blocked, but there is a question about if we should moved. It is too much incoherence 

GC: I think having people use it without the import syntax is bad, but we've landed things like it before.

RJ: I don't understand how the precompile template thing would... What I don't know is how do you bootstrap the first thing?

GC: You don't. this is a change in the hbs system.

YK: You basically make a `.gbs` thing that exports the compiled output. What that thing does is compile the low level thing.

GC: And basically that part, the syntax, is hard. So this RFC kind of died.

(break)

CG: The SFC primitives are very similar to the primitives here

GC: I think we have resolved the two, at first the primitive here didn't have all the needed functionality but I think it was resolved.

YK: The partial thing is not just about the speed of removing it.

GC: Full Disclosure: This does not imply SFC, but it is definitely paving the way for that. In the sense that this does not let you have implicit globals. Therefore to import anything you need to import it. So it is probably coupled to the SFC thing. So if you care about SFC one way or the other you might want to care about this. The strawman proposal I made here... I think there are multiple avenues here. But last time people were surprised by that both are related.

MS: I still really don't like the idea of SFC, but I do like the strictness of this proposal.

YK: I think this implies that there are variables etc that you can have access to.

GC: The two things are not the same. But by saying strict mode is awesome you're saying  having explicit introductions to scope is also awesome. I think imports from the same paths as JS (even if the syntax is different)... I think at some point if we invent another syntax which is not then it will have a high mental cost with few benefits.

YK: I don't think by agreeing to this RFC you're...

GC: I think you should probably think the explicitness of the import is good

GC: I think we like the idea that you have to expressly bring things into scope, but then you are going to be tempted to use JS imports.

YK: I think you don't need the component JS in the file, but you do have imports.

RJ: One thing that I think would be useful would be to... in the proposal you have a flag you pass to the thing "is it strict" instead if you made it each of the 4 things (but still have strict mode true) 

YK: Where do you put it?

RJ: I think it is easy enough to get it from the thing you compile with.

EF: You could tie it to an optional feature etc.

RJ: I think it is important to make it a bunch of threads instead of a ball of yarn

GC: I can think about it, but I'm not sure if it is easy to take each of them apart. They all interact. You need to check all the permutations of their combination.

YK: There is a more serious issue which is that I want to use the strict as an opt-in for the helper/helper thing.

GC: We should talk about it but I think that cannot be true since the helper helper interactis

(promises to discuss)

(discussions about imports, how nice they are)

GC: So what is my action step? Should we wait for Octane to land or anything? I think it is a timeline where we may not want to spread attention...

GC: I'm willing to wait. If you can review it again etc that he helpful.

GC: btw on this topic there was an open question about why in strict mode we don't do attrs/props. I don't remember the answer

RJ: Last time you said you didn't remember

GC: I think it was something something component interop.

### Moving to attrs-first-and-only

YK: There are a lot of things you could do with the attribute syntax.

YK: What we decided to do was to try really hard to treat it as an attribute, but for things like onclick try to use that property. Because most of the time it is what you want it to do. It works ok since we always fallback to the attribute. So all the many things on the React tracker that didn't work just work. And many of the properties reflect to attributes with casing differences. In 99% of cases setting the prop is a good enough mental model.

YK: But

YK: We have a lot of code for the 1% of cases. And there are a few differences. People think when you set `value=` it should Just Work. But that is also not very well defined.

YK: There is one case it is really important. In most cases if you set an attribute to a boolean it is not correct to put the boolean in the attrbute text. You can presume a boolean means add/remove. But that doesn't imply doing something special with dates etc.

YK: And historically there was a lot of discussion that `onclick=` should work. People show `<div onclick=` and say it should naturally work, but there are lots of reasons that isn't so. If you look at React you can tell people for even handlers they need to do something different. Now we have `on`.

YK: And the last thing is that some properties like on video don't have attributes so they aren't even really guessable that it would Just Work.

YK: tl'dr because of all these things the thing we have talked about is just to make attributes with boolean values work and besides that have attributes be attributes.

YK: There are some odd things, like for ARIA where you actually need to be `true` in there. We could use a lint for catching those.

YK: I think all that suggested in the past that attributes are just attributes.

(discussion)

(discussion wrt class= etc having merge semantics, but that isn't directly relevant since we're still talking setAttribute (or an equivalent) at the end).

(discussion)

GC: I think the case against making this part of the strict mode opt-in is that this is intended to be a per-file thing, but this on the other hand would be annoying in a real app. It would be hard to look at a file and know what it is doing.

RJ: I think it does need to be granular to the file

YK: I think you can have a helper that would let you codemod into the old thing.

GC: I think this is categorically not the same thing. For example you pass attributes to a component in the invocation, what are they? Which system if the internal is attrs but the outside is prop-first.

(discussion: attr-only is an optional feature flag, you enable it and codemod all uses of ambiguous cases (like `value={{` to use `{{prop-first value` etc.).

Action Items:

- Need an RFC for `{{prop`
- RFC to add an optional feature for attributes-only
    - Should include requirement of a codemod for ambiguous cases to a helper
- This should not be coupled to strict mode. But if strict mode lands later it could say strict mode is attributes-only
