# Meeting: Ember Core Team 2017-06-09

### Agenda

- Module Unification update (MB)
- Rehydration update?
- ember-next blueprint https://github.com/ember-cli/ember-next (SP)
- fastboot-rc.x update (SP)

### Attendees

DG EF GC IT KG RJ SP YK MB RM EB MM

### Minutes

#### Module Unification update

- Still need help with the [test suite globals resolver
  EPIC](https://github.com/emberjs/ember.js/issues/15058). Please help!
- Decided we need to support defaultType, but not named exports: https://github.com/ember-cli/ember-resolver/issues/189#issuecomment-307442737. Core agrees.
- MB would like to add a flag to the migrator to disable/enable local lookup. This would allow us to more focus on addons with real migrated app use cases.
- RJ sez: Lots of great help from people in #st-module-unification

Goal: Use the migrator on TravisCI and boot the application. Blockers:

- ember-module-migrator must remap imports - https://github.com/rwjblue/ember-module-migrator/pull/47 almost done.
- `defaultType` - https://github.com/ember-cli/ember-resolver/issues/189#issuecomment-307442737 will land today.
- Local lookup - https://github.com/ember-cli/ember-resolver/issues/191 @iezer is diving into it. We’ve done it a few ways before but need a production-ready path with tests.

Next goal: Addons. RJ and MB getting into it this weekend, KS already shared some ideas with RJ.

Next goal: Replace the Ember container with Glimmer/di. This is the subject of the EPIC test issue.

#### Rehydration update

MB: Just wanted a quick update, saw a lot of work

YK: Going well, I will merge today. No long lived branches. More or less the mental model I though would work is true. A couple things were forgotten but we’re at the end of that process and things are working. I did some changes to the test suite. You can now write a single test that asserts rendering happens and that rehydrating works. There is a thing “Element builder” which is the API that other parts of the system call into to create elements during the append phase. I created two new kinds of element builders, a rehydrating a serializing. The rehydrating keeps track of the candidate node, and each low level operation (openelement etc) checks to see if the candidate is the same as the operating it is trying to do. For example if the op is to append a text node, it just checks to see if the next node in front of the cursor is a text node. If the node is a match, the new code returns the element which was found. If it is not a match, it will delete all content until the end of the element. Say you have a span / p / span and rehydration wants to add a text node. If it must add the text node inside the span it will first delete the p. So there is some cleanup of bad data.

SP: Does it do merges?

YK: General answer is right now we are very conservative or lazy. Everything is sure to be correct, since you just delete anything bad. Indeed you could do better than that re-used-wise. For example blocks (treating blocks as a “virtual element” for the purpose of clearing bad nodes).

YK: text nodes or comments are treated as clear, and then the content is compared and replaced if needed. In the case of safe HTMl I already serialize boundaries and only clear that fragment/block if needed. The fact that it is already clearing based on elements is pretty nice, because when you pop back up later DOM is treated as candidates for rehydration.

YK: One more things: Serializing builder does two things. It adds markers around HTML so I know the range around curlies. (and something else) it uses comments for this. The rehydrating mode expects the serilizer mode to have been used initially. The fact that there are three modes here means perhaps there are use-cases for consumers to pass their own builder.

YK: There are two cases where things don’t match this model and that is where most of the work is: dynamic content and attributes. In both cases that code manipulates DOM. It uses the DOM helper directly. That codes isn’t through the element builder, so the subclass cannot do something different. content is done, attributes still need to be done. Any part of the append process using the DOM directly needs to go through the builder. Basically the new arch has less patience for very tiny helper classes.

SP: Any benchmarking yet?

YK: No, there is plan for when we get it working. b/c it is a mode it should have not impact on the main modes (like rehydrator). If you look at the code: There are several places where low level operations were being done kind of randomly. Very temporarily we made all the low level operations __ on the builder. We have no intention of keeping this API. That object, those methods, should be moved out somewhere but since we have too many bad helper patterns we didn’t have a place to put them. If you see lots of __ it should make you unhappy but we want to avoid prematurely creating abstractions.

YK: I’ll need help migrating tests.

#### ember-next

SP: I created a blue print which inherits from the default ember blueprint but can do better at deleting files etc. Shortly it will have no jquery and use the strict resolver. It is supposed to be a way to play with new patterns without adding things to the main blueprint. I want to port some of these ideas back into ember and perhaps things like MU can use it for blueprinting.

YK: I would appreciate a quick readme on it to have an idea of what is up.

SP: I would appreciate questions on the issue opened on that repo. https://github.com/ember-cli/ember-next

RJ: I ran into some people at a meetup who just found this and were confused. People tend to just find out things randomly.

RM: Can we not publish this to npm?

RJ: I don’t think it matters.

YK: If it is just an experiment seems fine.

EB: Is the name the concern?

RM: Yeah it is a bit confusing. It is as easy to use a blueprint from npm as it is from github.

SP: I don’t care. I’ll make it print out an error/warning when you install it.

YK: I think as long as the work EXPERIMENT is in the page near the name it is fine.

MB: fyi https://github.com/emberjs/ember-module-unification-blueprint is where the current MU blueprint stuff is.

(discussion)

#### fastboot-rc.x update

SP: It lives! Many addons migrated. Krati (new ember-cli core team representing fastboot) has been improving the addon ergonomics such as wrapping vendor assets during the fastboot flag. We could cut a 1.0 now, we just need to get a date. So what is the criteria for a 1.0?

MB: Probably need TD :-/

RJ: A personal requirement is that we need it to be 1.0 when the things it requires are 1.0. I don’t know if we have any cli changes required?

SP: no…

RM: Personal concern is that there are still many popular addons that have not migrated yet. People will want to try it at 1.0 and everything will break.

SP: There is a burndown issue and community activity, but there is a chicken and egg problem.

RJ: As an addon author I’m not likely to go through the whirlwind of breaking changed b/c of a pre-1.0. If we declare “fastboot done” I’m more likely to add a breaking change to my own addon.

YK: We need to make 1.0 when we’re stable and make it clear about what the quality limitations are. The points RJ makes is basically b/c there is a conflation of stability and quality. If we don’t want to land 1.0 b/c of quality concerns, it tells people we arn’t stable. So we need to say it is 1.0 stable, but addon authors need to help us raise the quality.

RM: I don’t suggest we block until more addons do work, but let’s get KG to help get a list of more popular addons. Make sure ember-power-select is good etc.

SP: I ask then for a top X list of addons that must be delivered. The more actionable it is then we can get it done before a 1.0.

SP: after 1.0 better story for (?) and fetch

SP: major version bump change, enabling streaming from assets
