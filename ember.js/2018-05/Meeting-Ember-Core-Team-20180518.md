# Meeting: Ember Core Team 2018/05/18

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/05/11 


- (public) Minor MU Update
  - RJ: Multiple apps for acceptance tests
  - MB: handlebars precompiler has a PR for getting the correct context
- (public) Upcoming release
- (public) [ember-engines 1.0 roadmap](https://gist.github.com/MelSumner/17d3cc6166771c880afd9124e79dad95)
- (public) What’s next action for angle bracket invocation? -EF

Next week: +Meeting: Ember Core Team 2018/05/25  

## Attendees
[ ] Yehuda Katz
[ ] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[ ] Melanie Sumner
## Minutes

**Minor MU Update**

RJ: We got multiple apps working without any changes to ember cli. We should ship a generator that generates the app etc. I think the large ember cli issue today is the change for the feature flags. Ember cli previously had all experiments enabled by default on master, we found that we were trolling ourselves and tests were not running correctly. We re-worked it two weeks ago, not all experiments are off by default. It feels much more similar to Ember’s system. But it means all guides on how to use MU in an app are wrong. But the changes are good, we test with just single experiments on, with all experiments on, and with all experiments off.

DG: How did you structure the different apps?

RJ: Generally we copied the dummy folder, gave it another name, then tweaked the ember cli build to call `new Addon` twice. You build it twice in two contexts. With MU the idea is that you have a MU app and a classic app.

EF: Is this a chance to move ember-cli-build into dummy apps? Bc that is where it belongs.

RJ: I think it belongs as a similar to the tests files, not in the dummy folder. We need to choose where it goes. We can consider if we want one per app. I agree we need to move it out of the top level. It is confusing, people think ember-cli-build is something apps consume. I think all build commands could take a path to the build file. FWIW I also want to move the index.js out of the root as well, no reason except making the linting/node stuff simpler.

**Releases**

MB: what up, Monday?

RJ: There are a few broken things we need to fix. KS is working on fixing the last biggest things. It is around using descriptors…


https://github.com/emberjs/ember.js/pull/16653


[emberjs/ember.js#16653](https://github.com/emberjs/ember.js/pull/16653)

KS: Was never really intended to work.

RJ: My argument for fixing it is twofold. We never said not to use it. We can deprecate it until 3.5 and remove it as intimate API.

RJ: It has become a blocker for people to upgrade to 3.1 unfortunately.

RJ: It is deprecated until 3.5 (3.4 is the first LTS)

MS: I have time scheduled for Sunday re: release post.

**ember engines 1.0**

RJ: MS and I have been meeting on Fridays to go over roadmap and stuff for ember engines. there is a draft here that is a gist. We intend to publish this the discourse. I’m running it by SP. This includes timing. I don’t like including timing, but it is in there. It:


- Lays out the official testing API. There is some discovery that needs to happen for use cases.
- There is a lot of documentation that needs to happen (DI, when to use engines)
- There are a slew of build issues.
- We need to make routeless engines doing lazy load easy for anyone out of the box. It is possible to do today, but it isn’t simple.

(discussion re: packager and engines)

**Angle Brackets, what next**

EF: The RFC work is effectively good.

RJ: Yes so we need to make it happen. Where are we with the custom component manager RFC? It is convenient to implement the angle components via custom component managers.

GC: I don’t think I’ll have much free in the next few weeks for the custom component manager RFC, but I don’t think they have a lot of overlap.

KS: There is not a lot of overlap any longer.

GC: I’m not very happy with the current custom component manager implementation. But is it good enough that we can build the glimmer thing on top?

KS: Why would we do that if it doesn’t even expose references?

GC: We can expose more things than what is in the RFC.

KS: Is the tracked stuff done?

GC: I can’t say. I think there are problems around the edge cases.

KS: I would presume the tracked stuff is needed for glimmer components to work.

MM: I think is is pretty close to being able to ship.

EF: Right but the custom component manager RFC was aimed at allowing us to implement glimmer components outside Ember.

(discussion)

GC: who is owning the implemeantion for angle components?

RJ: I’m happy to help but I need some help on th VM stuff

GC: I think it would be good to get someone like chat involved. The first step is probably to expose the …attributes stuff from glimmer.

EF: I think we should maybe be running Ember’s suite with glimmer.

GC: yeah there is an argument for that. But we should just write the test in Ember today and we can port it. To the extent that some features are not syntactically valid in Glimmer those may break the build in glimmer.

RJ: In the hbs precompiler I was going to catch old versions of ember trying to use `@` by replacing that line with a `throw`.

GC: Ok, so I can’t sign up for this but the next step if to find someone to write the tests. Once we have the tests and know what is working and what is not we can break down the work.

(some discussion about tracked a decorators behind a FF in Ember)

GC: @tracked has a blocker. There was some speculation that there were some cases where a getter would miss things, but that we need to generate the same list for computed.auto. I’m quite sure the conclusion was that auto doesn’t help as much as we want.

KS: I don’t recall that. I already thing people inconsistently use get in many of these cases.

GC: Sure.

EF: So GC you think we need to enumerate where there are gaps in iteroperability with CP and tracked?

KS: Yes, around the interop between the systems. Or people just need to use tracked all the way down and you can’t interop with non-tracked. Both seem like a big footgun. but the thing is tracked needs to be aware of consumption. otherwise it is just volatile.

GC: I think YK has it on some gist/paper thing.














