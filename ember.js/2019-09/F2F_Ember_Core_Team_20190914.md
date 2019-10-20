# F2F Meeting: Ember Core Team 2019/09/14

## Agenda

- Octane Plan / Marketing
    - Colocation status
    - `EMBER_VERSION` game plan
- Octane Rough Edges
    - Yielding Angle Bracket Component Attributes
    - Using Glimmer and Classic Components Together
- Steering Committee. A report from the steering committee re: emeritus process, the steering committee charter, and core team roles (requested by JW, KG presenting)
- Octane Tutorial Engine Introduction (GC)
- Literal Object/Array Notation (YK)
- Shinking Ember to 70kB (CG)

## Minutes

### Octane Plan / Marketing

YK: I think the plan of record is that we should not tell just anyone that they should use Octane during 3.13, just early adopters. Then 3.14 is when we feel comfortable telling everyone to use Octane.

DG: Does the Octane flag go away at 3.14?

RJ: We have to keep the flag or it's a SemVer violation

YK: Also helpful for people to look at one place to determine if an app is Octane

RJ: People who are eager to use these things in 3.13 will help us with the polish

DG: Will we reevaluate at 3.14

RJ: We have to treat this like any other feature. If it's not ready, we should not enable.

JW: A long time ago we generally discussed Octane as being a community-facing milestone, rather than something we shout out to the broader JS community.

GC: I think the latter is something we don't do enough anyway, and Octane seems as good a time as any.

YK: Both recollections exist because both are true. I think we want to avoid saying "Ember is competitive with React". We want to avoid a narrow competition between JSX and Glimmer templates. But there are plenty of people who may have wanted to use Ember, and we want to reach out to those folks.

EF: So in sum, there is some concern about messaging and the specific things we say.

YK: We shouldn't tell people *not to evangelize Ember.* 

RJ: When we ship Octane 

DG: We should talk about more vision items / blog posts. The tactical things like element modifiers are going to mean little to newcomers but the high level topics will really be fascinating.

*Discussion of some blog post topics:*

- CG: Autotracking - could post it on the official blog or personal blog
- YK: will write some blog post, either on Ember ergonomics or high level
- General release announcement on Twitter, HackerNews, Twitter

RJ: It would be great for us to brainstorm topics for blogposts. We can pool ideas and coordinate who will write them.

- RJ: will make a board in Notion to seed with ideas.

JW: I was wondering if anyone is planning to give an "Octane talk" at a non-Ember conference.

YK: I think we should also give talks at meetups.

EF: This should also go on the marketing board.

MB: Perhaps we should identify what comparisons should be made with other frameworks that will appeal to the general JS audience.

RJ: Something we often say is that "All good ideas come to Ember".

### Octane Plan / Marketing: Colocation Status

RJ: Colocation as a feature landed before the Ember 3.13 branch point. So 3.13 will include the blueprints, the generators, etc. That's proven to be pretty stable.

RJ: To enable this, we now have to do some build time magic to associate the template with the component (with `setComponentTemplate`).

RJ: This will be a net positive to runtime because we will be eliminating quite a few modules.

RJ: Everything that's downstream of template compilation will be invalidated and thus have to be rebuild. 

YK: If you edit a template file, how much more will be re-run?

RJ: Everything will be rebuilt - template, js, sass, etc. This will be slower.

RJ: I can try this in the LI app. It's probably not going to be that much slower. It will not be an order of magnitude slower.

RJ: As I discussed with YK and GC, what we can do is put this behind the Octane flag so that it will not affect other 3.13 users.

YK: Do we feel comfortable saying "3.13 with the Octane flag will allow colocation"?

RJ: Yes.

EF: How much work to fix the invalidation?

RJ: To fix this we need to do a diff of the inputs.

RJ: So this could take a couple days for one of us who knows what they're doing.

### Octane Plan / Marketing: `EMBER_VERSION` Game plan

GC: There is currently an env var `EMBER_VERSION` that you need to set, in .ember-cli. You are supposed to set it to "octane". The blueprint sets this var for you. The only thing that uses this internally is the generator, to decide whether to give you colocated component classes. The idea is that we still need something for it, going forward. Is there another name we should use? Is there some abstraction we want to use for checking for it?

JW: Does this control native classes for non-components also?

RJ: Yes

JW: Does it only affect generators?

RJ: No, it's something that could be used by addons as well.

RJ: What flag should we use? Unless someone has a strong position about not using an env variable, I think it's the best place. Easiest for testing. Any opposition?

GC: Do we have concerns about it literally being an env var? Does this make it hard to abstract or shim later?

CG: Is this a build time only or runtime flag?

RJ: I would imagine that Ember Compatibility Helpers would have a flag you could import. You need it at runtime

DG: Would we regret using a name and not a number in the future? So we could do "is this at least Octane" 

RJ: could make a lib to do this

DG: We don't want this to be like Windows 9

DG: concern that people will not use compat helpers, and instead check this string. Incrementing numbers would give people a clue of how to plan ahead

RJ: Incrementing numbers could also be fine. Starting at 1 could be confusing because 1 tends to indicate true/enabled. Don't want it to be a version like 3.14 because Octane spans many versions of Ember

YK: Maybe should punt this to a smaller group. But this flag is about making these features default.

IT: could use an object w/ a version and non semver string

CG: lots of weird footguns with env vars. Could make this a library

RJ: You still have to use it and put it in a user's project. Weird to say it's private when it's in their project. Could have a set/get for interacting with it

GC: (please fill in, I didn't get this)

YK: Could do something with years + month

RJ: weird to have years because times don't align. Most of this year was not Octane

JW: Can we call it `EMBER_EDITION`?

EF: That is the proposal on the table

RJ: Could have it be `@ember/edition` that you can require?

GC: do we need to land anything before Monday or before the 6 weeks?

RJ: yes

**Conclusions**: We will make a package that has a get edition and set edition methods, and some kind of comparison. And we have some kind of "edition" name that refers to "octane," or something like that. Still need to decide the name of the package but that's implementation details.

### Octane Rough Edges: Yielding Angle Bracket Component Attributes

RJ: The problem is basically that if you are using the component helper, it is impossible for you to actually set attributes you want to be set and curried across levels. You can't curry. It is a missing feature.

EF: This is a problem with the passing in of curried, first class components

RJ: Straw man suggestion, have an HTML keyword that you can use as a positional param. It has to have a special keyword.

MB: does it have to be concatenated?

RJ: Yes, have to merge and do merging behavior (clobber or not)

CG: There is a discussion on an RFC issue that is relevant. Seems good for temporary measures. But I also feel like component syntax is verbose. Would be nice to do something cleaner

RJ: I do not want to put angle brackets inside of curly. But want to close the gap of not having a feature

GC: could have angle bracket syntax on the outside.

RJ: could be a valid possible option. Not sure how to distinguish resolution

GC: I think we need splat args, which we don't have, but if we did, maybe we wouldn't need this at all

EF: Need to distinguish invocation and not

GC: two separate proposals. People pass closure components because they don't have a way to pass blocks

CG: do you mean named blocks in the RFC?

YK: I think in the sort term, we implement something that gives people the capability. Contextual components are already a power user thing and we are not making it worse. We should not create a new feature without taking stock of what we already have. If you have blocks, you can still put component invocation inside the block

RJ: Yes, but there are rough edges around migration, how do you support both things

EF: Is this an Octane blocker

RJ: no

### Octane Rough Edges: Using Glimmer and Classic Components Together

JW: Very quickly people will want to be using their existing class components and referencing them in new prelim components—and then things get weird. Like you can set the parent value from within the classic component, that would work, but if you tried it in Glimmer it wouldn't. 

RJ: It's intentional. It is important that if you pass a thing through a Glimmer component, that it should still work. You need the inputs to work. That's *why* it is the way it is. In a world with only Glimmer components we wouldn't have this issue. When you replace the thing with two way binding, you'll have to refactor.

JW: Do you think it'll confuse people? I understand it but I'm concerned it might still confuse people. Do we expect a difficult interface for people, or will they figure it out?

YK: I think there's no perfect answer no matter what we do. The original design for angle bracket component <<???>> . We discovered that we had a hard choice to make between doing that and being able to use angle bracket components to invoke classic components. In order to make angle bracket components work with classic components we had to say X. The reason I think this is okay is that the only way to observe the problem is to have a classic component source, and a classic component end, where the end is trying to X. If you're in a Glimmer world, you can't observe the problem. I want to be clear about why.

In pure Glimmer without classic Ember, there's no feature called two-way bindings. 

(Sorry Jen, trying here but I can't hear the details well enough 😂)

In a classic component you are forced to use two-way bindings unless you work really hard not to. But that is an important thing. It's not a minor detail. In a *Glimmer* component, or any that doesn't have that specific behavior (being a subclass of Ember object, etc), there are two paths we could take.

We decided on a future world with no such thing as two-way bindings. People will get closer and closer to that world by stopping to use classic components. As you have fewer classic components, it'll just happen less.

An alternative was a line in the sand where angle-bracket syntax can only be used X, therefor you have to use curly syntax until you can make the target component a Glimmer subclass, and we decided not to do that.

JW: Makes sense. How difficult do we think it's going to be for our users to understand it? And if we think it might be confusing, what should we do about it?

EF: To restate: in a Glimmer component, there's a way to set stuff and you can't do it. So to the extent that you have a parent component and child component and they're both classic and you refactored the parent in Glimmer, (Nope, can't go fast enough).

YK: If you pass a property from a Glimmer component that is a tracked property, I think it will —-.

Example: `<Input @value={{@someArg}} />`

YK: concern about breaking interop if we focus on this

JW: I am not proposing changes, just trying to figure out if this is a rough edge and how we address it via teaching

**Conclusion**: We'll come back to this as its own topic, and Jen wil make a minimal example

### Octane Rough Edges: Plan for Attributes Where Order Matters

MS: re: attributes: do we have a future plan for attributes who can have multiple values and the order matters? (i.e., aria-labelledby/describedby)

YK: I want to help with this. It's "pretty easy." Need to square away the time

MB: Did we land `attrs` first?

- RJ: We should make sure this is in the topic later

MS: Just want to make sure this doesn't get overlooked. We can move on to the next topic

### Octane Rough Edges: Splarrrrguments, in a pirate voice

RJ: If you tried to implement what input tries to do, it's error prone and difficult

(Some discussion, please help fill in)

YK: I think if it's the version where the original args are in some source code somewhere, that's an easy scenario. Arguments in routes seem like they could chnage arguments list randomly which is bad. People will use this feature and it poisons other things

RJ: Let's assume that we said ...arguments. Today there is no way to change what you are passing

CG: to expand on use cases, it is impossible today to subclass a component and provide defaults. With splarguments, you don't need to subclass it. You just need to compose. This is a powerful and useful primitive

RJ: We need to allow people to have private args

YK: the args need to return a dictionary of callbacks. This could address the issue

RJ: You say we return a stable hash and the values are reference

EF: could throw so you have the same shape every time

RJ: This is a trolly thing to do for yourself

### Steering Committee

(presentation, discussion)

RJ: I think "job is to facilitate decision making v. making decisions" is a good framing.

RJ: Is event creation on this list?

MS: Yeah It is on the list

RJ: I'm concerned with the lack of positive explanations of each of the items (the examples are great, but seem insufficient to know if a given non-listed task belongs within any specific category).

(other discussion / feedback)

### Octane Tutorial Engine Introduction

GC: (presentation, screensharing)

GC: Content is mostly ready for review. There are some minor caveats for accessing it.

GC: There was a problem with prior versions of the tutorial: Because nobody on the team actually goes thought and does the tutorial it breaks over time.

GC: So in our tool the markdown source of the page can (for example) run a command, capture the output and write it into an output, that output is committed as part of CI.

GC: The runnable source is in a new repo super-rentals-tutorial but the output is added to the guides repo.

GC: Running a command is one class of common thing. The other is modifying a file.

GC: Also it takes screenshots with puppeteer. The whole thing takes about 30 minutes to run on CI. I have aggressive settings for crunching the PNGs, some of the time isn't just Ember.

(demo of using run:pause)

GC: Nice thing about it is that is runs CI against the rest of the system.

GC: This is implemented as a AST transform for remark

### Literal Object/Array Notation

(live presentation by YK)

`{{hello (a=b)}}`

`{{hello [a.b c "hello"]}}`

YK: Two questions: Without caveats does this seem good.

RJ: I think for the array syntax it is what you would expect to happen. I think less so for the object syntax.

`<Input @value={{(a=b)}} />`

(discussion)

DG: In an RFC this will probably cause some discussion of "why can't we just use JavaScript".

(discussion of the challenges of using Just JavaScript and how to get ahead of that)

RJ: Does this make it easy/possible to... how do we feel about the general spread issue.

YK: what about `...` syntax?

RJ: Yeah

YK: I think as long as the original array/object came from syntax then we can know what to do with it.

GC: It should probably be in scope to consider how it compared to destructuring syntax

    {{#def something as |[a b c] (@d as e)|}}
    {{/def}}

(discussion of where we can support destructuring and how the RFC should consider it or not. Probably not, but YK wants to think about it)

JW: What is the user experience philosophy of this. What does it add to Ember? The literal syntax.

YK: I think the answer is "why did we add the array and hash helpers"

MB: The hash helper was for closure components and dot-invocation of components

MB: Is the reference returned upon update of a bound value stable? Does that matter? Are these returned values mutable?

YK: We don't want them to be mutable `{{#let (x="y") as |o|}}<Input @value=o.x />{{/let}}` should not work

GC: The contract about reference stability is not something we make elsewhere.

YK: As long as a reasonably complex binding example (types one out) works then I think that is all I care about.

(discussion wrt lookup syntax and whitespace sensitivity)

YK: Ok so I think this is looking good. There is a question about if you need a `(` when passing in an object to an `@arg`. And we need to fix `(get a b).c` so it just works.

### Shrinking Ember to 70kB

CG: [Size analysis of Ember.js and included dependencies](https://docs.google.com/spreadsheets/d/1sTFySCHWqOzP0Ba7RsoZs71aYeRnb60GDFrNwZsa_YU/edit?ouid=115900510010132195082&usp=sheets_home&ths=true)

CG: With Octane landing we can now deprecate large parts of the fw. I think we want to start doing this right away. LI is really interested in being able to drop large amounts out of the FW.

CG: To kick this off I started writing a few pre-RFCs. I thought they would be a good first-time or community member stuff.

CG: Step one is to focus on svelte. Svelte flags. I think we need to give users a more targeted way to do this. You can't just tree shake, some stuff is harder to shake out. Instead flags help move code out of the framework.

(discussion)

YK: There is nothing wrong with apps saying "I support x", but you also need addons to say what they support as a minimal version. The version of Ember a library supports (or is "svelte compatible" with) will be the blocking thing for apps. The concept of svelte is really about addon compatibility.

RJ: Svelte is publicly poorly defined.

YK: It was basically "how to refine our build process after 1.13"

EF: To expand: Addon's don't do anything close enough to this today.

YK: I meant that addons today are aggressive about not using deprecated APIs.

EF: Right but they try to strive to support the oldest possible version.

YK: (Some discussion about opcode compiler size)

RJ: We've gotten a lot of push back on pre-RFCs from various core teams. We should reflect on that. I think I want all the things to exist, we need to figure out what is the right balance between "what is the thing I want to circulate to the community" and what is ready to make an RFCs.

RJ: I think in most cases here these were ready to be RFCs. The prose was written. I think the other context was that we wanted to focus on shipping Octane, and I think it was not the intent to cause confusion. But it is good feedback. I think we want to show the direction we want to go in in comparison to telling people things aren't good. Its a balancing act. I think we should put it here. If we were to start tomorrow. I would totally say now we should just make them RFCs. People can comment inline etc.

CG: To be clear I don't think they were done. They need teaching sections etc.

RJ: For at least half it is not likely that someone will pick it up the right way.

(discussion, semi-retro of pre-RFCs)

JW: I appreciate the attempt to get new community members into the process. I think asking for a co-author is a good approach.

EF: Yeah and it is less scary to co-author.

YK: Sometimes you want a co-implementer as well, both things are ok.

YK: deprecation are sensitive. I think we need to be careful about.. Either we should stick to our guns on deprecations "you are ready to get off of this" v. "this is a bad idea but not deprecated".

(discussion)
