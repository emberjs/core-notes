# Notes from F2F, Portland, Dec 2018

## Agenda

F2F Agenda (covering both days):

- Proposal: Internal Communication Strategy 
- Proposal: Core Team Member Roles and Responsibilities (Process Document)
- `{{use` / Template Imports / Module Unification Namespacing [RJ]
  - https://github.com/emberjs/rfcs/pull/367
  - https://github.com/ef4/rfcs/pull/16
- Upcoming F2F’s [RJ]
  - Timelines
  - Weekdays?
- TC39 style stage system for RFCs [RJ]
- Accessible Routing RFC (Work in progress, not submitted yet) [MS]
- Specific process to change the default application / addon blueprints. [RJ]
- Octane-related RFCs:
  - Editions
  - Remove jQuery by Default
  - Glimmer Components
  - Rendering Element Modifiers
  - Tracked Properties
  - Object Model Decorators
- Website re-design preview/discussion
- Conversation: Technical Debt 
- Are we happy to continue with all core teams are flat? [KG]
- Overall state of our documentation & main challenges (slides) [JW]

## Minutes (only for day one)

### Website Redesign

Melanie presented current draft website redesign work.

Discussion was generally supportive.

Major takeaway is that we want to move the process into the public sooner rather than later so the community has a chance to provide meaningful feedback and feels consulted.

Reviewed an early preview of some design work done on the public website. These designs flowed from the community survey and conversations around making our site more modern. Positive reaction, request to make sure that fonts, colors, etc are accessible

Will do the implementation publicly. Will have a beta deployment (instructions how to help - Inviting ppl to join the learning team meeting). We’ll add it to the other sites through ember-styleguide, beginning with the navbar.

Ember learning team is emberizing the website. Target for launching new look in January. 

Actionables

- Should announce new website design in more detail in the Ember Times
- Post about the new website in the forum
- Attention to mobile design for new website
- Make sure to do a round of community involvement before launching

### Internal Communications Strategy

EF: To the extent that the all hands are about dissemination instead of discussion it seem like you could do an in person all hands for one or two hours then break out.

YK: An example of what we want to solve is that something like Octane can be better socialized even amongst the core teams. Does the CLI team know what octane is for example. I think it is useful for Tom and I to try out messaging in a smaller group. I like to think of it as trial keynotes throughout the year.

RJ: number of meetings is a lot of work, meetings.  Do we have resources?

MS: I will coordinate this. I think that we do have the resources and planned time for this. It will be rusty for the first year.

(discussion)

EF: I think these would work well recorded.

(discussion)

EF: I’d like to suggest that much of these meeting topic could and should be farmed out to other people. It helps give them a voice and develop contributors

YK: I think in the long term should should reduce work. Since Tom and I spend a lot of time socializing ideas already.

JW: I think people should soon be told about the in-person F2F all hands. Since they are planning travel soon.

GC: I was under the impression we would do a virtual one first?

YK: Yeah but this is re: people booking their travel etc.

MS: We would like to have the first virtual all hands in January, next one at Emberconf

LS: We could kick the core teams etc an email about the in-person first.

DG: We should send people TCQ and make sure they know how to use it.

(some discussion about TCQ, improvements, etc)

EF: If we are helping people use TCQ we should add docs to the TCQ project

(side discussion about shutting down the old discord)

GC: Wanted to raise why we’re discussing this instead of the steering committee?

LS: This team just has a history that it could feel less consulted if we didn’t share these topics here.

GC: I think it was good that we had the discussion.

YK: The SC’s job is to execute the logistics for sure. There is a question re: is this getting feedback vs approval or what is there.

### Modules

(discussion, presentation)

MS: Are we really ok with putting files anywhere?

EF: Yes. So the way this starts off is that we should decouple core primitives from best practice guidelines. In practice blueprints and lints should out of the box be present to suggest best practices. I agree this proposal is light on the best practice front.

KS: Blueprints tend to lead a lot of app layout

YK: We should keep in mind that an aggressive lint that does’t do what someone wants will be disabled. We need to make sure the lints are good and don’t block real use cases.

EF: Rather than the lint as a single line of defence, we should have multiple lines that come up

YK: We should have carrots

MS: Should we engage with NPM to be sure they don’t do things that conflict with out system.

KS: I think module loaders expect a string based loader and we though we noticed it via NPM it applies generally.

JW: When it comes to teaching and “users need to know how import works”, I don’t think it is common knowledge how an import works. I think we would need a before/after in the guides to help teach people.

(discussion)

RJ: Re template only components, or when you have a JS file without a default export, we should definitely make them work.

YK: In general we want people to be able to import/export and pass things around so we need to do this.

(discussion)

EF: If we make the config for globals a prelude- imports do in fact have side effects and you could need to make it observable. I don’t want this file to ever evaluate.

(discussion about the globals config being a config)

EF: I want people to mentally model this as “it will be imported when I use it”. another model is “you can copy paste this into any file”.

YK: From the way that things evaluate in glimmer we already aren’t there.

MB: I don’t think we will exactly match the semantics of import. Re: `import` `"``foo``"` what does that do?

YK: It is already true that you should name make assumptions about when a imported thing evaluates.

EF: I think these things should really tree-shake, regardless. Which is different than plain JS semantics.

(discussion)

DG: Single file components. We should ensure that we have a path forward to this design. There are some big implications re: how that could be done, how imports that are local to a template and not not just JS… There are some natural ways that this design could flow into single file components. I want to make sure that we at least strawman it out.

DG: Other FWs are successful with single file components, and I think we should recognize that. They help with scoping and in terms of not leaking what is used in a module out of that module. And in terms of not having to bounce around in your editor.

DG: This is a big picture item to throw out, but I think this is the time to discuss it, and to think about it as we consider what is allowed in the import section.

(lunch break)

DG: I raised SFC b/c I need an understanding about SFC to consider the value of front-matter etc. I think it is worth considering if SFC are worth pursuing. There are a lot of questions that will arise form the discussion of frontmatter re: single file components. I think this is a high order bit.

(discussion)

KS: In the RFC there is an implication that exports from the component JS file and they behave like imports…

RJ: No it explicitly says the opposite of that, you must use `import`.

KS: I never had in mind the . import thing, instead I was thinking you could have a file with helpers and import from that.

EF: import v. export mental model is coupled to single file components. If you have to use 

(discussion)

Are there other projects using $component or that sigil as a special thing.

YK: I’ve heard people say use the package name itself, since it means nothing.

EF: The RFC should have a section re: escaping relative import hell (co-location being painful). Maybe that is $component, maybe that is the globals being generated based on a top level directory.

(discussion)

RJ: The frontmatter requires a fairly large amount of syntax overhead, and effort for us to build out.

RJ: Depending on the result of the SFC discussion: I think it would be a waste of time to build highlighters/tooling for this if it is not our SFC solution.

YK: Agreed, we should not duplicate the effort

MS: What kinds of things need to be considered? Where should we put the list of things.

RJ: The RFC should specify the things to satisfy the development.

YK: Which of these are not a problem with use?

RJ: Highlighting, AST shape for transforms.

(discussion about `<script>` as an alternative, or alternative delimiters for the front matter)

Wrap up discussion notes:

- Decide what frontmatter syntax to use
   - `---`
  - script / template - YK has concerns about script seeming like it is not owning the template content
  - We’re not going to solve this right now
    - Wait maybe not
    - Can we agree on a design without meeting physically? YK and MB bet yes, Robert bets no.
    - Let’s split into small groups tomorrow morning and come up with proposals
    - GC want the parsing to be strict. We should have a grammar that is specific.
- Import v. Export?
  - Import
    - export is harder to develop in a compiler step
    - concerns by several re exports from the JS being “public” when using the export strategy
    - you still `export default Component…` in both cases, so there isn’t any advantage to using exports
    - we can lint against top level mutable things (like let) and that should be enough to help with the uncanny valley about “what JS is supported”.
- Do we write a new file extension? Is this needed to use the frontmatter?
  - Total consensus blocked on frontmatter
  - GC: Differences between .hbs and .sfc
    - explicit v implicit association
    - minimal editor work - registering .sfc as alias for .hbs. If .hbs basically works today, then an alias will be sufficient
    - backwards compat
    - our syntax highlighting won’t get into hbs anyway
- Rollout, migration plan. We should write out notes for this.
  - Consensus blocked on frontmatter
  - Existing templates in classic apps will need to consume MU addons
- RFC has unanswered questions about routes
  - We have not discussed this at all yet. This is a pretty major item.
  - EF: Summary of the problem. In this RFC is did not rewrite the earlier part of the proposal about where route templates go. You will have `src/ui/routes/index/template.hbs` etc. That is a coherent world view. And there if you want to nest you can use `-components` to isolate from other routes. That could still be true. But it means inside the templates for those routes you will need to do a lot of imports. And it will mean a lot of `…`. The “re-export of the top level component” is one solution.
    - This is specific case of “relative import hell”
    - There is maybe also a discussion about `index.hbs` vs `template.hbs`
- CSS in single file components
  - If we are doing frontmatter do we need to do CSS?
    - No, but like any SFC concerns it shapes the discussion about delimiters etc.
    - A frontmatter syntax should be able to specify multiple types of things. multiple names of things?
  - CSS blocks is supposed to handle many of the traditional style issues here. This would need a place to put that stuff.
  - Implies the sfc format needs to be open-ended. RJ says this implies some series of build hooks etc.
    - Perhaps consensus that we shouldn’t have conflicting types in a sfc (TS and JS) or multiple JS files. This begins to confuse if there is one module or many named modules

### jQuery

RJ: remove jQuery is a goal for 2018. the first RFC we landed made migration away easy. This was via an optional feature flag. This RFC takes the next step to make jQuery opt-in and not opt-out. Obviously we will officially drop it in 4.0, but in the interim we can deprecate the jQuery specific APIs in Ember. This should make the @ember/jquery take over the responsibilities for built in jQuery.

RJ: There are a few specific as I think of “in the weeds” issues. I don’t think they are appropriate here but the basic gist is we want apps to not use jQuery by default. This makes the path forward work.

YK: Is this a breaking change.

RJ: No. It continues to support the APIs with deprecations. If they use those APIs they will have deprecations.

YK: Does this set a timeline related to octane.

RJ: No, it doesn’t have anything to do with octane specifically.

YK: I would be concerned about changing what new Ember apps do willy nilly.

RJ: No, but I don’t think we talk about using it too much.

JW: It’s been systematically removed. There is a guide to migrating away from jQuery in the guides.

YK: My main concern without octane is that there are docs out there, except for Editions/Octane.

(discussion)

JW: Thinking about the fact that libraries need jQuery and an app might try to use it.

RJ: eslint plugin for Ember will tell you when you use any of these APIs. If you try to use a global thing and it isn’t there we could do a thing but it would be hard since other things are detecting it.

(discussion)

RJ: Two things left: Ember Data doesn’t work without jQuery ajax.

IT: Why is it a blocker?

GC: According to the RFC ember-data would need to be dependent upon jQuery, and since ember-data is shipped by default the default build would include jQuery

RJ: We can remove ember-ajax from the default build then. Maybe add ember-fetch or maybe not.

GC: How much do we care about “jquery is not an anit-pattern”. I think by default the perception will be jQuery is a thing going away, and we should not use it. I think that perception is already present. People will think jQuery is a legacy thing. Is that acceptable?

MS: jQuery is already considered a bit of an anti-pattern anyway.

GC: Yes, that is the same group that things CSS in JS is good.

YK: I think thoughtleaders get ahead of reality. I agree though: I don’t want teams to spend the next three months migrating away from jQuery.

RJ: I don’t think it is important to us. We’re not teaching people to use jQuery either.

GC: All I’m saying is that from an optics perspective… is we don’t want people to feel like jQuery must be removed we should do something about that.

DG: At some point it will be considered a bad default.

(discussion)

IT: Is there any inspector work needed?

RJ: I presume no, since it doesn’t require it today afaik. I will coordinate.

KS: RFCs are supposed to have language like this, and that is supposed to be what a champion does.

YK: I think KS’s point about addons is good. Apps should use jQuery when they need it, but addons should not bring it in just for convenience.

GC: And to confirm, that is presumed to be the state of things today.

RJ: Right.

KS: There were a lot of addons on that list though.

EF: There was a big effort by people to remove jQuery from addons already.

(discussion)

IT: Ah, also jquery gives you a global prefilter that things like ESA use for cookies.

YK: We need to design that API?

IT: Yeah it is not easy.

RJ: I think ember-fetch need to add a hook for handling headers etc. Some API we need to design.

RJ: One more thing: Specifically the RFC proposes deprecation this.$ in module for component style tests. I don’t think it is terribly good to have people fix those things when they should just migrate to the new test syntax.

KS: This is the same reason we won’t deprecate this.$ on components when you add the addon.
