# Meeting: Ember Core Team 2017/11/03

## Agenda
- Quick MU Update
- https://github.com/emberjs/ember.js/issues/13815#issuecomment-339998193 (RM)
- publishing Ember 3.x to bower (RJ)
  - https://twitter.com/lincolnnathan21/status/925721349070426112
- PR REVIEW
  - https://github.com/emberjs/ember.js/pull/15307 - bailout for empty string too in `render`
  - https://github.com/emberjs/ember.js/issues/15768 - `onClick` handlers are leaking memory
  - https://github.com/emberjs/rfcs/pull/267 - deprecate `disabledWhen`
- `[async](https://github.com/emberjs/rfcs/issues/175)` [/](https://github.com/emberjs/rfcs/issues/175) `[await](https://github.com/emberjs/rfcs/issues/175)` [in app code](https://github.com/emberjs/rfcs/issues/175) 😭

## Attendees

AM, DG, EF, GC, IT, KG, KS, MB, RM, RJ

## Minutes

### MU Update

MB: I’m organizing a few people this month and next month to push on this. Several of them have small or large amounts of work time to get route bundling and MU done. I’ll facilitate, please ping me if you would like to be involved and can commit some time/thought.

### Map / MapWithDefault

RJ: Summarizing discussion: We should extract Map and MapWithDefault into an addon, and deprecate these as private API (targeting 3.4 or the appropriate LTS) after Ember Data is updated to not trigger the deprecation warning.

### Bower in 3.0

RJ: TL;DR person was asking for clarification on things after 3.0 being in an addon so you can keep using it after 3.0. They were asking if this was true for Bower as well. I’m not sure it is a big deal to do the migration, but there is some nervousness. I really want the published globals builds to go away. If we continue to support bower, we need  to continue supporting this.

GC: This is just window.Ember?

RJ: Yes and no. It is a bit more than just exposing widow.Ember.

MB: Perhaps a clarifying question: Do we still support IE9 in 3.3 with the addon?

RJ: No.

MB: Yeah so we already have things we’re not considering part of the transitional API supported by the addons. I think global builds are a valid part of that.

RJ: And it is more than just bower, for example once we don’t have global builds we can stop using a custom loader for internals.

KS: Yes I had a build doing this, but ran into issues regarding what the new modules API was going to be.

MB: I think the 3.0 blog post is the closest thing we have to a commitment on what we will support.

RJ: OK so I think this was vague then, and we should update this content. Nobody should have this question.

MB: I’ll do it.

RJ: and to be clear someone else could do this as a 3rd party, but it is not our responsibility.

### PR 15307 - `render('', {})`

RJ: This cleans up an assertion. But do we even need `render`? Ed?

EF: The uses cases are rendering outside transitions, named outlets, and re-using templates etc. I think these use cases have other options, but we need to do a pretty serious RFC to deprecate it. This PR looks fine to me though.

RJ: Cool, merged. We should probably start an issue in the RFC repo saying hey this is something we want to deprecate and start a discussion. I might help signal we think these things are anti-patterns.

### PR 15768 - onclick leaking memory

We generally reviewed this, but we don’t see how a leak would be happening here. We tabled it for further discussion.

### deprecate `disabledWhen`

RM: Do we want to do this?

RJ: What is the motivation? Also, we have things like activeWhen, what happens to them?

MB: This mentions `disabled` as being a better name, but `disabled` on `<input` comes from native APIs.

KG: `disabledWhen` doesn’t even seem to be part of the public documentation.

RJ: There is some documentation in the class section, but none on the API docs.

EF: I think the feedback is just to get rid of this. Some of this is old features and it is good to question them.

### `async`/`await` in app code

RJ: I wrote a things on using async/await. It works great, you can set tests up, the post describes how to set your tests up to use async/await etc. I bring it up b/c it is super painful that we cannot use async/await in the model hook etc without runloop shenanigans.

EF: Right RSVP promises don’t resolve as normal promises in Ember.

RJ: Yes so you get failures about autoruns in testing.

KS: I think we need to bit the bullet and look at this.

RJ: I’m not even sure what the issues that  might arise are.

EF: Most will be timing, for example setTimeout running after something reliably.

KS: If we can get the runloop to use the microtask queues we can mitigate order concerns in applications. I’m concerned about `andThen` and global helpers more.

RJ: Well good news!

KS: I’m worried about uses of Ember.run around promises to specifically break the spec.

RJ: Arguably that should not have even worked.

EF: Yeah, but it is very common.

KS: The concerns about order of execution I think is already present. Autoruns already have strange ordering. In general we arrive at the correct result though the path to get there is hard.

(discussion about getting this change into backburner, https://github.com/BackburnerJS/backburner.js/issues/181 as a blocker)

RJ: I’ve been working on the test helper, and I only wrap things that specifically need runloops.

KS: Right but if we move to microtask we can just embrace autorun. If we have async/await in tests we could do that.

(further discussion about timing)

EF: I think we should get the testing stuff shipped first. Then we could land this.

RJ: I will bug KS and we will get it done! In three weeks ember master is 3.0.
