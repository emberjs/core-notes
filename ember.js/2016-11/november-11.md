# Ember Core Team 2016-11-11

### Agenda

(please note (private) or (public))

- (public) [#14377](https://github.com/emberjs/ember.js/pull/14377) document `readonly`
- (public) [#13163](https://github.com/emberjs/ember.js/pull/13163) make `Controller#replaceRoute` public
- (public) ember-cli intends to adopt Yarn when [yarnpkg/rfcs#1](https://github.com/yarnpkg/rfcs/pull/1) lands and 0.12 expires, any objections? (RJ)
- (public) Discuss backtracking re-rendering assertion [emberjs/ember.js#13948](https://github.com/emberjs/ember.js/issues/13948) (RJ)
- (public) FYI - FastBoot + ember-cli joint subteam work on [ember-cli/rfcs#77](https://github.com/ember-cli/rfcs/pull/77)
- (public) FCP restart for [ember-cli/rfcs#50](https://github.com/ember-cli/rfcs/pull/50)

### Attendees

DG, EF, YK, MB, RM, RJ, SP, TD, MM, KS

### Minutes

#### FCP ember-cli/rfcs#50

MB: Seems good but there have been small edits. I propose we should just restart the FCP period after the final edits

#### #14377 (readonly helper)

RJ: Locks made a PR for these docs, question is do we want to document this stuff and make it public? We added it in 1.13 to support "auto mut" and didn't really intend to create public API.

YK: I'm not wild about this. It is becoming a bit of a "protip" to use `readonly` everywhere. Documenting this and making it public is kind of a legalization of using it aggressively.

SP: Seems to be a feature for dealing with a legacy thing.

RJ: Well auto-mut is a thing today. Perhaps we should make this part of the glimmer component RFC? Figuring out what to do here.

YK: We will not auto-mut glimmer components. But people who want to be future-defensive are trying to use it aggressively.

TD: We don't need to document it if it is on the path to going away.

RJ: Either way we should land docs, we can land private docs. I think that is fine. I look forward to reading the glimmer component RFC.

MB: Consensus seems to be land the docs as private.

YK: I'm not in love with adding more docs as private before we add the ability to strip private api docs from the main API doc site.

SP: we may want to make this public, as part of a future

RJ: So we will land docs, as private, and continue the work to make private stuff not appear in docs by default.

#### `Controller#replaceRoute`

RJ: I think this was made private when I flagged all things as private back in the docs sweep a long time ago.

TD: I'm pretty sure this is intended to be public. You want to route to something without adding an entry to your history

YK: Point of order, making things public should be RFCs

TD: Well this is an error. It was a bug that it was ever marked private. And there is not a big paridigm change, you can already transition from the controllers today.

SP: So it seems like it should be public so the whole suite of features around routing are public together? Seems ok. I don't like it, but seems like the intent.

RJ: Ok, we will land as public.

#### Adopt Yarn

RJ: After a few discussions with the ember-cli team meetings, we want to land yarn support for `ember install` and `ember new` after [yarnpkg/rfcs#1](https://github.com/yarnpkg/rfcs/pull/1) lands (and ensures Yarn meets our requirements for LTS support).

TD: I think private / scoped packages are not working and that would be a blocker.

YK: I can work with folks to get issues fixed if we can prioritize blockers

SP: Some feature compat issues w/ npm will block integration

RJ: Right we need to handle the blockers, but we should start clearing the path

SP: Getting things working allows experimentation and is good

RJ: We can land as soon into 2017 as possible as long as we allow for a full cycle and at least 2/3 weeks on master before going to beta.

#### Backtracking [emberjs/ember.js#13948](https://github.com/emberjs/ember.js/issues/13948)

RJ: I want to make it easier to use a build of Ember that has backtracking. I think it will be a blocker for big apps to make it onto Glimmer2 without backtracking. I don't think we change course and make it default to on, but we have a repo or bower or something that enables it.

KS: I think people need more context. There is a dataflow issue that is backflow that was not asserted/deprecated before. It should have been but it was hidden by streams. There was a testing thing in the Twitch app that exasberated the issue in a way we didn't see at LinkedIn. These are two real-world experiences with the change we should look at.

In Glimmer1 if you set a property that binds upstream (backflow) and it didn't change DOM then there was no deprecation. In Glimmer2 this case (in addition to the DOM changing case) is caught. Streams hid some of this churn in Glimmer1. It was still horribly bad for performance to do this (as it forced a large swath of the rendering to be recalculated until the churn settled).

RJ: Right, so I want to publish these builds to make it a bit easier to find the escape hatch from the error and allow apps hitting their heads on this issue to be able to upgrade a bit easier and track down / fix the deprecations as they go. I mostly want feedback (especially since folks here feel so strongly about it).

KS: At LinkedIn we intentionally didn't publish these builds for our use-cases, by treating it like an error it gave us the chance to fix our app's performance issues caught by it. It allowed us to make a clear line in the sand and fix many cases that had poor performance.

RJ: Right, Ember needs to push to do the right thing, but if apps are totally screwed they may need this thing...

YK: What are our options?

RJ: We can do nothing (leave it throwing and error and require manually built assets to bypass errors), we can change the flag to enable backflow by default (and hurt performance of all apps due to the backflow support code being inherently slow), or we can leave the assertion in and publish builds to allow folks to change the assertion into a deprecation and continue forward.

YK: Are we getting complaints?

RJ: On older apps, yes. Stanley has reported a few scenarios around this, my apps have had a number of pretty non-obvious issues.

YK: To be clear the issue here is that it is a massive performance hit to support the backtracking.

KS: It is worse than people think it is. If you have a complex, massive tree you can bounce around in streams without changing DOM and never know in Glimmer1.

YK: There is a cost to the backtracking support, it is unbounded (might take a lot of time). I can imagine if you have this build and it is easy to get it is easy to just keep using it for a long time and your app is still slow. If you need to build a custom build for each release, it creates some amount of pain that encourages them to fix the issue. I think it is a virtue that this support is a build-time flag.

YK: I think if we can measure something concrete about the cost incurred, we could display it and that would be a better option than anything else I think.

GC: I think Stanley's complaint was that he didn't know where to look to fix the backflow, not that the build was too hard to do.

KS: When I was fixing this in our app I was looking at metadata on the meta object which made it really clear. We have better information to inform users about this than we did before. We should try to review the error messages folks get and make sure the message is as clear and helpful as possible.

RJ: We don't need to decide today. My concern is that there are scenarios that were public API before (they were still bad and slow) but they didn't really get a full deprecation cycle. I worry about after release things coming out of the woodwork like what I found.

TD: I think being able to show people the time they could save to incentive the work is a great path. Much better than creating a cliff like in 1.13

(some discussion)

SP: I want to compliment that the stacks in Glimmer2 make it clear what the issue is when there is a failure.

GC: I think you and Kris have a workflow Stanley doesn't know. If we can better communicate that it would be really helpful.

SP: Kris has been annotating stacks to show what should happen and it looks really clear.

GC: Stanley is eager to help if we can provide direction.

(some discussion)

#### FastBoot + ember-cli

RJ: Discussion is joint FastBoot + ember-cli team meeting next week to discuss the RFC to unblock the path to FastBoot 1.0, build performance etc. Anyone who wants to attend just ping me I will send an invite.
