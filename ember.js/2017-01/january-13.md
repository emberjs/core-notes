# Ember Core Team 2017-01-13

### Agenda

- (public) FCP? https://github.com/emberjs/rfcs/pull/186 (SP)
- (public) Update on [Router Service RFC](https://github.com/emberjs/rfcs/blob/master/text/0095-router-service.md) (and discussion of shipping in phases). (RJ)
- (public) Standardizing microlib structure and build process (RM)
- (public) Merge [JS Module API RFC](https://github.com/emberjs/rfcs/pull/176)? (TD)
- (public) 2.12 deprecation checklist

### Attendees

MB: DG, GC, IT, RJ, TD, KS, SP, MM

### Minutes

#### FCP, Track unique history

SP: I would like to go to FCP.

KS: I would like the id to not be a counter, for example if a tab is reloaded you must be able to restore.

SP: Ah you need a unique id

KS: You could serialize to session storage and that would be a good enough scope. Session storage is not designed for this.

SP: So this is not ready for FCP. The identifier should not be able to be duplicated. We need to do a uuid or something.

KS: You don't get enough history states where there is a reasonable chance of colliding, and the consequenses are very low, so yes.

SP: I will present that feedback. So can I FCP once we get the feedback?

MB: Yes once the change is made, we can FCP it

TD: I would not mind another week

SP: But you will have it. This seems the point of FCP. I will comment, get the change, and FCP. We will copy Kris's uuid things based on Math.random.

DG: Do we have to be more careful about collisions and use a more rigourous UUID implementation?

KS: We do not need a rigorous thing here because I do not think that the browser itself would keep track of this many states.

SP: Kris do you have a link to the previous implementation? Lets circle up on it afterwards...

#### Router Service RFC

RJ: Update on the Router Service RFC. I have been working with Steve Calvert on phase 1: intro the feature flag, the concept of a public routing service, and starts adding some APIs. I don't want to block the first PR on having all of the APIs from the RFC. It will be better to do these one at a time so we don't have long-lived branches. Of course, we can always defer enabling the feature flag until the entire RFC is implemented.

RJ: We're starting with the "easy" things that map on to things we already have, `transitionTo`, etc.

KS: One thing that might not be straightforward is the timing guarantees noted in the RFC. I'm not sure if the current router implementation meets those requirements.

RJ: I will read it again and ask you or Ed about this if I have any questions.

KS: I'd like Ed to review it.

RJ: I reviewed the RFC again last night with Ed at the Ember Boston meetup. At first glance he said it looked good, although he wasn't able to do a deep dive.

KS: I just am not familiar with the router on a deep level but I think there might be some issues.

RJ: In the PR, we actually fixed an issue where when you `transition.then()` the current URL is correct. We had to dig through and understand why it's wrong in the current semantics and we fixed it in the service implementation.

*discussion on `runOnce` and when URLs change, even a court stenographer could not capture this conversation*

TD: Is there an action item here?

RJ: I was just giving an update on this.

KS: The action item is, you want to merge it in soon and do the whole feature in baby steps.

RJ: Yes, the current PR is missing a few tests but I want to merge it soon.

KS: So are we waiting to enable the feature flag until the entire RFC is implemented?

RJ: I think the first iteration has a lot of value that it would be a shame to hold up to complete some of the less-used features. But that's a separate discussion that I don't want to have right now. The only thing I want to do is land the PRs to master behind a feature flag so we don't have a long-lived branch.

KS: I thought we wanted to make some things `outletState`-driven, but that's hard to do with a service.

RJ: Yeah that's more of a `routeInfo` (in the RFC) concern. None of the currently implemented API requires us to expose any state data structures, like `transitionTo`, `isActive`, etc.

#### Standardizing microlib structure

RM: I've been looking into SHT and noticed conversations about standardizing the build processes for this stuff. RJ and KS I think have been working on it?

TD: Many people have discussed it, DG has done most of the actual work

RJ: Right now it is painful to not have the deprecate/assert infrastructure across microlibs. Plus, regular FF and svelte flagging etc.

TD: Are we comfortable doing all this in the glimmer-build package?

RJ: I am more concerned about the conceptual part, not the code. glimmer-build sounds fine, and when we move ember or backburner over we will need to deal with it.

TD: I have a proposal doc/visual for this. SP or someone has a disagreement with some of the deprecation/assert/FF stuff.

SP: In Ember CLI we learned we want build steps to be in sequence, not branch/merge. For performance. Each filter already knows how to decide exactly what files it wants.

KS: When you have a step that tries to reduce (tree-shaking) you don't want it to pass through.

KS: I've found that if you have a series or several steps it can be faster to reduce first, but SP is working on fixing the diffing

SP: I can't imagine the diffing is going to be fast enough though. We should do a strike team thing.

TD: I think this will end up more rather than less urgent. Can we do it today or Monday?

SP: I suggest we use babel-preset-env to decide what to build or not.

(some discussion of build targets)

#### JS Module API RFC

TD: Kelly added a few comments. Are we good to go if I address his comments? He wants logger and compare etc.

SP: I'm concerned that this will never be merged if we can't merge without having this prefect.

KS: I am concerned about Logger not being a logger, it is a console.

(discussion about logger)

TD: There are no real objections to making any minor edits called for by Kelly and merging.

#### 2.12 deprecation checklist

GC: Went in: factoryFor, component lifecycle hooks. Did not happen: enumerable observers and createRootView.

KS: I tries to get going on it but didn't have enough time.

SP: The enumerable observers deprecation is just non-trivial

(discussion about enumerable observer deprecation approach)

RJ: For `targetObject` we should pull it into beta branch. There's no urgency other than we need to land the [PR](https://github.com/emberjs/ember.js/pull/14590). There's a few tweaks needed but I just need to provide feedback.

GC: I guess we can remove the argument to `didCreateRootView` whenever.

RJ: We can backport deprecations to the beta channel so long as it's early in the cycle, like beta 2 or beta 3.
