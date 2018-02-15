# Meeting: Ember Core Team 2018/01/19

## Agenda

- [glimmer-vm upgrade: ready to land?](https://github.com/emberjs/ember.js/pull/15828)
- RFCs
  - Close
    - https://github.com/emberjs/rfcs/pull/221 “deprecate `resetNamespace`" (RM)
  - FCP
    - https://github.com/emberjs/rfcs/pull/294 “Make jQuery Optional” (YK, RJ)
    - https://github.com/emberjs/rfcs/pull/284 “Splitting Ember into Packages” (EF)
  - Needs Champion
    - https://github.com/emberjs/rfcs/pull/297 “Deprecate Ember.Logger” (RM)
    - https://github.com/emberjs/rfcs/pull/298 “Deprecate Component lifecycle events” (RM)
  - Possible RFC: [Microtasks in Backburner.js: Embrace the Auto-Run](/doc/Microtasks-in-Backburner.js-Embrace-the-Auto-Run-FoGeoo9yFGFDTMiaBb7NM) (RJ)
- Ember.js Times (RM)
  - Core Q&A in Ember.js Times
  - Do we have blockers before marketing the newsletter more?

## Attendees

- [x] Yehuda Katz (YK)
- [ ] Tom Dale (TK)
- [x] Kris Selden (KS)
- [x] Stefan Penner (SP)
- [x] Leah Silber (LS)
- [x] Robert Jackson (RJ)
- [x] Igor Terzic (IT)
- [x] Matthew Beale (MB)
- [x] Edward Faulkner (EF)
- [x] Martin Muñoz (MM)
- [x] Dan Gebhardt (DG)
- [x] Godfrey Chan (GC)
- [x] Ricardo Mendes (RM)
- [x] Chad Hietala (CH)
- [x] Katie Gengler (KG)

## Minutes

### glimmer-vm upgrade

RJ: I got this into a working state last night. there are some remaining things I want to do and Kris wants to do. Measurement, clean up from things we learned earlier. It isn’t blocking. If we land it now we have half a canary cycle, so I would like to land it.

SP: I’d like to know an app booted and a benchmark having been done.

KS: There is some evidence in my benchmark (chrome) the evidence of a perf issue is that the tests in IE took two minutes longer in IE.

YK: Tests run in development mode, and we added a lot more development mode stuff.

KS: I won’t merge until I complete a performance benchmark.

RJ: We will be sure it really works in a real app. Hopefully that will tell us that in production mode there isn’t a regression.

YK: I would like us to have some process for us to put onus on the people making breaking changes to Ember in glimmer-vm. I don’t want to block on it.

RJ: I’ll brainstorm with you. We would need to have a way to fix code in Ember master and have that cause CI to re-run on glimmer-vm or something.

RJ: Basically this upgrade too 1.5 train cycles. And that was with a full-time person on it though not an expert. there were a lot of changes, and we probably could have mitigated this by doing small PRs but it snowballed. 

### RFC 221: resetNamespace deprecation

RM: This is something we might want to do in the future. There are a couple blockers, I think from engines. We should lay out what the blocker is and close this.

RJ: I agree. I’m not sure the engine thing is a big blocker, but this is old and we’re not moving forward on it.

YK: I find it annoying that this is widely used by I agree it is how it works. I don’t like the system as it is, but we don’t really have a plan for migrating people to something else.

RJ: And EF’s point about how things *could* be mitigated by Module Unification is good, none of that exists yet. I would not sit down and write a bunch of resetNamespace in my app, but it seems fine.

YK: GC suggested that I use it for a guard at one point recently at the top level. It only works at the top level.

RJ: Luke Melia is working on an RFC for guards.

Will close.

### RFC 294: Make jQuery optional

RJ: YK and I want to FCP this I think.

(discussion)

RJ: We have three things we’re using flag to opt out of: Application wrapper, element-free templates, and jQuery.

YK: I think this is different. You could have always avoided jQuery.

(discussion)

RJ: Making Ember test work w/o jQuery revealed real bugs in the native event dispatcher.

Will FCP

### RFC 284: Splitting Ember into packages

EF: The idea is to create an Ember core project and extract things out of it over time. We start at 0.0.1 or something low, and as we make breaking changes we bump to 0.1.0, 0.2.0 etc. When we have a complete solution we can jump to the version number of Ember itself.

YK: I don’t think we expect there are lots of packages. I think eventually we split out components that need runtime and those that don’t.

EF: In order to be understandable, we want things in your app to map to dependency names. Even before we deprecate old stuff we can move it into its own package.

YK: RJ and SP do you feel comfortable implementing this?

RJ: I think this is better than peerDeps and some other approaches. I have another RFC open for enforcing peerDeps and we should perhaps discuss how that impacts.

EF: Yeah I leaned away from peerDeps since npm/yarn disagree on things. I backed away from trying to lean on the npm peerDeps model.

KS: I think if you mostly build on top of existing  stuff we show a good faith effort to interop.

SP: npm has generally said peerDeps will be used by frameworks and figure out how they should work then they will implement something.

EF: I’ve been studying the existing build for Ember and seeing how I can split it out. There is one large dense file that needs to be untangled, and I’m looking at how to refactor it.

YK: I think what I feel strongly here is that we should make clear to devs who don’t care about size that this will mostly not impact them.

EF: I think people on the RFC heard that. And they responded will to this RFC helping move older code toward the exits.

SP: What are the build time impacts?

EF: That is a good point. I don’t think we want to build all of Ember as part of the app, but we should study it.

SP: I think there is a good avenue for pre-building addons. We have a few addons at LI that do this. I think this is how we make the ergonomics good and other addons can then benefit.

EF: A benefit of this refactor is that Ember itself would respect your targets support.

YK: I think there is a tradeoff wrt build time and svelte and targets. In production builds we can then go slower.

SP: Yes I think we will have prebuilt versions published, but if you want to do something fancy you will need to incur the cost. I think if our first pass is to provide prebuilt things for development mode.

RM: I would like to say we have not mapped all the old Ember namespace stuff into named modules. If we don’t have places for all these things we should find them before we can migrate away https://github.com/ember-cli/ember-rfc176-data/issues/12. Re: the RFC I think we should drive it forward.

RJ: Think we should still FCP. The RFC packaging and metadata stuff is all valid regardless of the build time stuff and exports.

EF: Right. The idea is that this helps incentivize people to do this work.

YK: I presume it is driven by Ember CLI. The details of what gets implemented. Even though it happens in the Ember repo. It isn’t clear you know what to do in Ember without knowing what happens in Ember CLI.

RJ: I think getting it working just for ember-source would be a bit win.

Will FCP

### RFC 297: Deprecate Ember.Logger

RJ: I don’t think most of us have read this yet. I’m happy to champion this.

RM: I made an RFC channel on Slack. I managed to get other people to submit their RFCs. These two were written yesterday. I would like someone other than me to go through them. If nobody else wants to champion I will do it but…

RJ: This is totally a thing that can be extracted into an addon. We just don’t need it in Ember any more.

SP: You can imagine for compatibility shipping an addon that does nothing so their app doesn’t crash.

RJ: I think often people think it does more than it does. It does not no-op in production. I think people use it to avoid an eslint warning which is bad.

KS: It was just a polyfill for old IE.

SP: Using real console would also fix your line numbers.

### RFC 298: Deprecate Component lifecycle events

RJ: I’m in favor of this. I find it really confusing to understand what order these things happen in.

YK: We should get rid of bespoke features like this since eventually in the move to native classes we would need to deal with them.

KS: We should lint that people call super.

MB: But you don’t want to have people blindly use super

KS: No only for these methods

RJ: There are also some methods that already are linted for  super in the default ember cli linting rules, super in constructors and destroy
