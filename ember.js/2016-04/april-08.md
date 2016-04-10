# Ember Core Team 2016-04-08

## Agenda

- (public rwjblue) Evaluate/discuss risk of backporting [emberjs/ember.js#12666](https://github.com/emberjs/ember.js/pull/12666) into release-1-13 ([original PR here](https://github.com/emberjs/ember.js/pull/12666) / [backport PR here](https://github.com/emberjs/ember.js/pull/13220))
- (public rwjblue) [Issue/PR Triage](https://github.com/emtberjs/ember.js/issues/13245)
- (public dgeb) Modules RFC Update
- (public krisselden) supporting super() calls when there is no method overriden [emberjs/ember.js#13242](https://github.com/emberjs/ember.js/pull/13242)
- (public) EmberConf followthrough (YK)
- (public) Meta-package (YK)
 
## Attendees

MB, RJ, YK, GC, MM, IT, DG, AM, KS, TD, EF

## Minutes

#### Meta-package

YK: I want a way to upgrade with `ember upgrade beta` or something like this. The process now is a bit too manual. Robert thoughts?

RJ: This makes sense, but I think it is good that we are solving module normalization first. IMO we can prototype something easily and try it out ourselves.

EF: I suggest that too. We can build it in an additive way as well.

YK: There is some mental model for upgrades where you only need to upgrade a single thing instead of all the little ones

YK: And there are two things to upgrade, upgrading and app and the version of Ember installed on your machine

EF: When you `ember new` you should likely be prompted for a what version of ember you want to install.

RJ: I'm not opposed, this is all good developer UX that we should push forward. I want to focus my efforts on modules and testing for now.

YK: Right and the max/min on getting the low-hanging fruit first.

YK: I want to publish a thing that lets you upgrade your app with a single command. And a subscription thing that reminds you when there is a new version available.

RJ: We added this for ember-cli itself recently. The package doing this is pretty generic, we should be able to re-use it when ember is an NPM module.

#### Evaluate/discuss risk of backporting

RJ: This is a patch that fixes a memory leak in Chrome: https://bugs.chromium.org/p/v8/issues/detail?id=4578&thanks=4578&ts=1448559714 The PR backports it to 1.13, but I am worried it is a huge change and risky. The bug has been hanging for 4 months and Chrome doesn't seem to want to change it.

RJ: It basically fixes a memory leak perf issue in testing (and potentially FastBoot though FastBoot isn't a 1.13 thing). But prod/dev perf is fine.

YK: we can inform people there are de-risking things they could do to to land it. Is there a hack?

RJ: there is a hack on the PR, you add a ton of text to keep the function from inlining

TD: this sounds like it is too big to backport without adding a bunch of risk.

EF: We can suggest if someone can solve this in a low-risk way we would accept a patch.

#### Issue/PR triage

RJ: we have an issue for this, Bill has been doing issue triage in Fridays for a while now. Can we grant commit-bit to some people for doing issue triage?

YK: Seems good for people we trust and who understand issue triage is the boundary.

TD: I've never had an issue with granting this before

RJ: awesome, thanks

#### Supporting _super calls when there is no method overridden

KS: In ES6 if you call super and there is nothing there it is an error. I want to attempt to unwind supporting this behavior. We've taken care of it not infinite looping (like we used to do). I think we should keep it as is but provide an error.

RJ: The thing that is convenient to tell people is that they can just call _super on framework hooks

KS: those hooks should always be on the base class though

YK: you suggest that if there is a framework hook they should call _super. the problem is that if there is a thing there and you don't know the semantics it is possible there is a bug anyway (do you pass arguments? is there a return value?)

KS: We've been bad in the past with adding a method that it supered after the fact, and bad about documenting the default hook implementation. We just have a bad habit, ObjectiveC went through the same thing, and now you need to call _super if you override something.

YK: I think this part of the conversation (should you need to call _super, is on( a mis-feature) isn't related to the proposal.

YK: I'd like to see this on the glimmer object model, in a test

(discussion of how we would add an error to the root)

Kicked back to technical discussion. General consensus that a) all framework hooks should have a base method defined by the framework b) if you call _super and there is not a method there, it should error (ala ES6, and helps us handle some errors like the one raised). c) the technical path for some of this is still vague.

#### Modules RFC Update

DG: There are still a few tradeoffs that need to be decided. Let's try to get consensus on this stuff by next week so I can update the RFC

DG: Some items still to be decided: Broadly speaking there is a concept of where to place utilities (non framework modules).

RJ: I'd certainly like to still have other files in there.

YK: we should make sure you put the files we know about in the right places, but other than that it seems good. Perhaps there is a strict mode that would warn for unknown files or something.

EF: Asserting that you have hbs files with hbs content and js files with js content would be helpful.

DG: I think the more challenging part is with JS lib files. If you have an md5.js file, that would conflict with a future type of md5 in the modules/ directory.

DG: Another set of tradeoffs is visibility of addons/engines to apps. But I need to rethink it for this regions proposal. Happy to work with people.

RJ: Hopefully I'll be spiking on it the middle of next week.

TD: Where is the testing RFC?

RJ: I need to update the RFC with the final insight, perhaps I can do that and we merge next week. There are ecosystem things that need to happen (eslint) and such that are moving forward already. I am excited.

#### EmberConf Followthrough

YK: I'd like to continue to follow through with some of the items from the conf keynote (and Portland F2F) and start to track it

RJ: Let's create a list of the various items discussed in the keynote, and continue to check in on them during our meetings (as a recurring task item).

YK: Sounds good.
