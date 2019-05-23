# Meeting: Ember Core Team 2019/01/11

## Agenda

- Angle Brackets in the Guides (JW)
- RFC Review (RJ)
    - FCP → Merge
        - [Remove jQuery by Default](https://github.com/emberjs/rfcs/pull/386)
        - [Decorators](https://github.com/emberjs/rfcs/pull/408)
        - [Deprecate](https://github.com/emberjs/rfcs/pull/272) `[Function](https://github.com/emberjs/rfcs/pull/272)` [prototype extensions](https://github.com/emberjs/rfcs/pull/272)
    - → FCP
        - [Tracked Properties](https://github.com/emberjs/rfcs/pull/410)
        - [Glimmer Component](https://github.com/emberjs/rfcs/pull/416)
        - [Render Element Modifiers](https://github.com/emberjs/rfcs/pull/415)
        - [Deprecate Route Render APIs](https://github.com/emberjs/rfcs/pull/418)
        - [Deprecate Application Route Properties](https://github.com/emberjs/rfcs/pull/421)
    - Pending Submission
        - [First-class values RFC](https://github.com/emberjs/rfcs/blob/contextual-helpers/text/0000-contextual-helpers.md) (GC)
        - [Template imports RFC](https://github.com/ef4/rfcs/pull/16)
- I need help to get the [accessible routing RFC](https://gist.github.com/MelSumner/b87b8400b93029f35da17e300be80d68) across the finish line
- https://github.com/ef4/rfcs/pull/16

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber

## Action Items

- [ ] Write a little widget that converts a component invocation to angle brackets (JW)
- [ ] Schedule an MU Postmortem
- [ ] Open an issue to support `<LinkTo />` as an alternative to `{{link-to}}` but it’s not urgent, should link to RFC
- [ ] Schedule a meeting about Ember Data integration (YK)
- [ ] JW & YK pair on 2 way bindings
- [ ] Next meeting, explicitly decide who takes notes

## Minutes

### Angle Brackets in the Guides (JW)

JW: We are making angle brackets the guide content in 3.7. We expect there will be a bit of confusion initially. My request is that if you notice people running into walls on discord or elsewhere let us know what those things are. I don’t have a ship date but we are looking at the next 2-3 weeks.

YK: Is the suggestion to use the old guides for old syntax?

JW: Yes. And we will have a link back to the old guides where they see angle bracket syntax in case it is unfamiliar. An issue is that the learning team isn’t super knowledgable about angle brackets.

YK: The idea is that the mechanical transition from curly to angle brackets should be straightforward. If there is a problem with converting something, we should bring it up here immediately.

RJ: I think the biggest thing is forgetting curlies around arguments passed to a component.

YK: Should we make that an error?

RJ: There is a lint. I think it would be fine to forbid not using quotes or curles.

YK: I’m only talking about non-curly non-quoted

GC: I don’t think it make sense. The lint is fine when the lint is working. I think if the lint doesn’t work that is a problem.

JW: I’d like to chat with someone after the meeting about a GUI that converts a component invocation from curly to angles.

YK: I think it would be easy.

RM: Yes we can do that, we cannot do `this.`

GC: Is that fact that link-to and input are not angles components an issue for the guides? For example `<Input`

JW: I don’t think it is an issue yet.

RJ: We should fix those things.

JW: I think people’s mental model isn’t that they are components. They are more like a helpers.

YK: I think they feel like `{{yield}}`. They are magic.

RJ: I think for the link-to case it is really easy to fix. You need to add hash args for the positional things.

RJ: There was an RFC where someone tried to write an RFC for this. I advised a different path, the RFC is a much more drastic approach.

(discussion)

YK: I think GC’s point is that it is urgent as a pedagogical issue. I think the mental model of “its magic” is acceptable in the short term.

RJ: I think it is good for input but not for link to.

(discussion)

YK: I think new developers will think angle brackets are how you invoke components you write. They will just think things from Ember are curlies.

YK: So I think the conclusion here is that this is not a broken mental state to be in.

JW: I think this is important but not urgent.

RM: Are values one way or two way bound passed to angle brackets?

YK: I don’t think that is a well formed question. We don’t use `mut` in an AST transform?

RJ: No we haven’t done that since 2.9

YK: So Ember components will get a binding of the argument to their property and the either way. Glimmer components don’t do that.

GC: Basically the named arguments syntax and angle bracket syntax has nothing to do with the semantics.

YK: Right which is why we can write that transform JW

RM: So you need to look at the component to know if the bindings are two way

RJ: Yes. But IMO you already need to do that.

(discussion)

### jQuery by default, FCP → merge

https://github.com/emberjs/rfcs/pull/386

[emberjs/rfcs#386](https://github.com/emberjs/rfcs/pull/386)

RJ: there have been no comments since the FCP so it should be good to go. I left minor comments.

RJ: YK and TD when we get the prose for the deprecation and blog post we have an action item to have one of your review the exact verbiage. This was a takeaway from the F2F.

Resolution: Merge!

### Decorators, FCP → merge

https://github.com/emberjs/rfcs/pull/408

[emberjs/rfcs#408](https://github.com/emberjs/rfcs/pull/408)

RJ: We talked about this going into FCP last week. It is predicated on the idea that stage 3 happens. If we decide to advance it without stage 3 then we will have another RFC talking about the specific reasoning and approach.

YK: It might land in January, maybe in March. If it didn’t land in March we should get concerned about it.

RJ: We have some big implementation challenges besides that anyway. For example adding the babel helpers to stage two means we require symbol. That causes some infrastructure issues.

Resolution: Merge!

### Deprecate function prototype methods, FCP → merge

https://github.com/emberjs/rfcs/pull/272

[emberjs/rfcs#272](https://github.com/emberjs/rfcs/pull/272)

RJ: We moved this to FCP three weeks ago. Since it was FCP’d and nobody chimed in I added it to the list. Specifically this deprecates function prototype methods, it doesn’t change the methods not on the function prototype.

Resolution: Merge!

### Possible items → FCP

**Deprecate Route Render APIs**

https://github.com/emberjs/rfcs/pull/418

[emberjs/rfcs#418](https://github.com/emberjs/rfcs/pull/418)

RM: I’d like more core people to talk about this one.

### Tracked Properties

https://github.com/emberjs/rfcs/pull/410

[emberjs/rfcs#410](https://github.com/emberjs/rfcs/pull/410)

KS: Was this updated for what we talked about yesterday? Those changes impact the observer interop.

YK: I’ll take an action item to go through this. I think it is linked incorrectly here. I need to talk to Kris about this before we can advance it.

### Glimmer Component

https://github.com/emberjs/rfcs/pull/416

[emberjs/rfcs#416](https://github.com/emberjs/rfcs/pull/416)

RJ: We think the Glimmer component RFC doesn’t require the render element modifiers.

YK: And modifier manager already landed.

(discussion)

Resolution: FCP

### Render Element Modifiers

https://github.com/emberjs/rfcs/pull/415

[emberjs/rfcs#415](https://github.com/emberjs/rfcs/pull/415)

(discussion)

RJ: Goal here is to provide modifiers that bring back the legacy hooks. I think this proposal is good at that.

MB: I’ll dig in and try to get comfortable with the hooks here.

Resolution: FCP
