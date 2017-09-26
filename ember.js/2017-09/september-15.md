# Meeting: Ember Core Team 2017/09/15

## Agenda

- Advance `ember-improved-instrumentation` feature flag. (RJ)
  - Originally written in [emberjs/ember.js#12088](https://github.com/emberjs/ember.js/pull/12088)
  - Landed in [emberjs/ember.js#13279](https://github.com/emberjs/ember.js/pull/13279)
- Saucelabs for emberjs/ember.js keeps giving false negatives (RM)
- Naming releases. Think Android. (RM)
- Merging Glimmer.js Migration: Introduction of `<IndustryStandardCase />` components
- Removing PhantomJS / IE9 / IE10 testing in Glimmer VM
- Ember.String RFC (RM)
- PR Review, “Are We Still Relevant” Edition
  - https://github.com/emberjs/ember.js/pull/14265
  - https://github.com/emberjs/ember.js/pull/13957 
  - https://github.com/emberjs/ember.js/pull/13800
  - https://github.com/emberjs/ember.js/pull/13787

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM, CH, IT

## Minutes

### Advance ember improved instrumentation

RJ: I wanted to use this recently, but realized we never enabled this feature flag. There was some other work that was supposed to land with it, but what exists is around actions and link-to. I’d like to move it forward. I’m mostly trying to figure out what the status is.

TD: Interesting. Did YK work on this?

RJ: CH and Asa did as well.

KS: It might have been me. I was arguing it was for tracking, but it is not for instrumentation. Instrumentation we could strip in production, can be slower. Tracking we would leave in production and care about performance. The problem is that the action details payload needs to be passed synchronously to the handler.

RJ: I think this might rewrite that.

KS: A corollary: window.performance has now be changed to a performance observer. You subscribe to what you are interested in and eventually it will be delivered. People would request performance records so the browser would do a lot of bookkeeping up front. The observer is not synchronous, the bench will happen but your hook might not get called until later. If the intent is to leave it on in production we should be tracking and delivering later.

RJ: Do basically just not do the before? the after is already…

KS: We were thinking of this as a debug mode thing, but the intent of this stuff was for tracking left on in production. So thats the only reason I was thinking of it as a different… I don’t want to block it and I don’t have the energy to…

RJ: I think that is a good enough reason to try and fix it. We could say these new events just don’t get before.

KS: I think in the history of our framework observers have gotten a bad rap because of guarantees about their timing. The original thing it was done for (and inspector relies on this) is for timeline…

TD: Yeah this was for profiling support and people seem to have tried to abuse it for tracking.

KS: Right and you might need that to be synchronous but you don’t want to do that in production.

TD: Right we want it with the inspector but we don’t want it to impact other cases.

IT: I was surprised this was even suggested to solve a tracking use-case. I would not have thought to use thi.

KS: I think tracking is a thing we fall down on, and a benefit of Ember and routing and conventions is that you should be able to do tracking. For tracking you need to causal event for a transition as the end of a transition, and we don’t trace that. There are so many things that can be improved in this. I’m aware of what needs to be improved but I don’t have the bandwidth.

(discussion)

TD: It seems like there is not a champion and we should remove the feature flag.

### Saucelabs for emberjs/ember.js keeps giving false negatives

RJ: Saucelabs is in perpetual whack-a-mole. I think something is actually wrong.

KS: I’m sure about that, it is either a bug in Edge or a bug in the timing of our tests.

RJ: I have set up a thing that would randomize the order of test runs. I think we need to do that again here. It seems like the issue is only with Edge. I think we need to get something set up to do some iterations and recreate it. We can get access to a video of the saucelabs recording and see the error.

KS: Yeah but the last screen isn’t always the right test because it hangs. I tried to reproduce this locally and I couldn’t get it to hang locally. Travis has an easy way to get the VM running locally which helps with this. The local VM is helpful to reproduce timing issues locally and it is faster. If saucelabs had a way to get their ENV up locally it would be helpful to troubleshoot. The problem is that every time we do another iteration on the glimmer vm these tests catch real issues. There are still things in glimmer-vm that are only tested via integration (with Ember/Glimmer). We can’t disable the failures, there are likely real issues.

TD: It is something in our control or are they just transient?

RJ: There is a small chance it is a thing on sauce, but I doubt it.

KS: It happened when sauce went from Edge 14 to 15.

TD: Are there other systems we could try?

KS: Yes you can use Appveyor. People run edge on that. We could do that instead, or at least Edge.

RJ: Sauce runs other browsers like IE9, so we can’t get rid of it.

KS: You can run Edge in compatibility mode, which some people do. We can’t drop IE11, it is still bigger than Edge which still blows my mind.

KG: I’ve found browserstack a lot more reliable.

RJ: Ah yeah and they do OSS stuff. We should try them out.

KS: Action items?

RJ: someone needs to replicate the failure. You can run the server locally but run the tests in sauce labs remotely.

KS: I think someone was advocating for disabling them?

RJ: It was added to get attention. It is hard to land things in Ember now and we should fix it.

TD: I think we can find someone who can fix it. We just need to give them the credentials etc.

RJ: The credentials are there in the clear.

TD: Oh.

RJ: You can do it another way with JWTs, but the point is we should make an issue about the problem and track the issue and rally someone to help. I’m happy to pair with someone to help and get them set up to start, but they actually need to do the thing.

TD: To close it out, RM can you write a small GH issue to close it out.

RM: Yeah make an action item.


[ ] Action item: Locks plz make issue!

### Merging Glimmer.js Migration

CH: Tom and I got the glimmer-vm working in glimmer.js. The PR introduces IndustryCase components. It seems like we need consensus and that we should not yolo ship it. I don’t really have an opinion but I understand why it was done. YK isn’t here.

TD: Right now glimmer-vm has diverged from Ember/Glimmer. but IndustryCase has been canonized in glimmer-vm. Can we merge to get things up to date but discuss at the F2F?

KS: Merging it we can do a pre-release. We don’t have a migration path.

RJ: Guides need to be updated etc.

TD: It seems like it should be up to the host env to decide?

KS: Lets talk at the F2F. If we want the addon ecosystem we need to make a decision.

(discussion)

DG: I think it is ok to merge to keep moving, but with the caveat we don’t release.

RJ: Right I don’t want to lose the ability to discuss it and change my mind.

TD: So we say: We can merge it but that is not tacit approval.

KS: I’d like to lead the F2F with this put to bed, so lets work on your list of concerns and constraints.

RJ: I will try to prepare a list of things.

KS: I feel I presented your concerns well…

(discussion)

### Removing PhantomJS / IE9 / IE10 testing in Glimmer VM

CH: I mentioned this in chat earlier this week. I believe at LI we will be dedicating people to bring the VM into Ember/Glimmer master. My idea is that 2.18 will be on master soon, after that we could drop IE9/IE10 support. I’d like to drop support out of the VM sooner. It is a couple weeks difference. We would like array buffers, all the APIs don’t work in phantom/IE9 and I don’t want to write a bunch of polyfills.

RJ: I’d be concerned if we merge to master removing support if we haven’t announced the release/change publicly. The issue dropping it now, is that if we wait to do the integration until next year or later we won’t be…

(discussion)

TD: In this instance if it causes headache at all at this moment I don’t think having the polyfill is not too bad since the places are few. I’m happy to maintain it.

KS: Can we just use the babel polyfill?

TD: I don’t think we need to care about the performance that much in IE9/phantom.

RJ: It is already bad.

KS: I think it is enough to test against the polyfill and say “you must use the polyfills to support this” In the in between time.

(discussion)

Resolution: The eager compiler can be supported only in IE11 up. So in IE9 and 10 the tests for this feature can be disabled.

### PR Review

* [emberjs/ember.js#13957](https://github.com/emberjs/ember.js/pull/13957)

We will close, @Robert J will leave comment explaining why.

* [emberjs/ember.js#13800](https://github.com/emberjs/ember.js/pull/13800)

We didn’t merge this before because we didn’t have reliable performance testing infrastructure. Now that we do, @Robert J is going to rebase and run some performance tests to see if this actually moves the needle.
