# Ember.js Core Team 2016-02-12

#### Agenda

- Glimmer 2 Update
- [Grand Testing Unification RFC](https://github.com/emberjs/rfcs/pull/119)
- [Route Serializers RFC](https://github.com/emberjs/rfcs/pull/120)
- Ember CLI 2.3 (or 2.4) release
- Service Worker / App Cache

### Attendees

Alex, Dan, Igor, Matt, Yehuda, Robert

## Minutes

**Glimmer 2**

YK: there is basically enough work that people are being productive without us being the blocker. This week we've been improving the test harness to use less of the internal machinery. Basically creating a public API version of manual element for use in testing. New infrastructure is done and we have tests passing in Ember. Ember uses Glimmer master, so today we've been fixing that up adding pinning.

YK: I'm comfortable with changes for Glimmer to go through the normal PR flow

RJ: Right and then updates to Ember happen in another Ember PR

YK: Components are going well and should be done soon. The biggest open issue is the router.

TD: What is the issue with the router?

YK: Outlets and outletState is the biggest known unknown. It's unrelated to all the work we've been doing. Hopefully it will be easy.

YK: There is an open issue with scoping and synthetic blocks that is the most technically annoying open issue. I'm hoping to get to it today.

MB: One thing that's left to be done is element modifier helpers. Are you still planning on doing that?

YK: You are right that that needs to be done and I guess I can't keep punting it forever.

EF: I don't understand why you couldn't implement it on Ember master right now.

YK: You mean with Glimmer or Glimmer2?

EF: Glimmer 1.

YK: Ah, yeah, of course.

MB: I'm less concerned with making progress on the new feature and more just curious about the state of element modifiers in general.

YK: Yes, in addition to routing, that is another big thing that has not been started yet. We will try to write down at least the general implementation strategy. Matthew, are you the person I should be talking to about making sure the proposal works with the ideas about element modifiers? I want to make sure the infrastructure we build allows for the things people want to do with it.

MB: The biggest difference from regular helpers is it needs to have a teardown phase as well.

YK: We should consider having lifecycle hooks on class-based helpers (Stateful Helpers™). There are several things you can express easily in components that's still hard in helpers, like the difference between initial render, update, attributes changed, etc. Before we eat a KFC Double Down, we should make sure we verify that the hooks are useful across helpers and components.

MB: Once you add element modifiers, you throw away the purity argument a little bit.

YK: I think there's a way to make them "pure enough" that you get the benefits. The whole point of stateful helpers is that you can use services, which makes them intrinsically impure. Rather than throw everything away and say "It's not pure," we can still try to be rigorous about the inputs and outputs.

YK: For FastBoot, we may want to consider making the DOM helper a first-class abstraction since it's so much better in Glimmer 2.

GC: The hard blocker on making an app boot with Glimmer 2 is that we need to do the swapping the DOM helper, compile functions, etc. Right now that's all just in the test harness.

YK: The nice thing about this is that we don't even have a feature flag. Everything is intermediated through the renderer abstraction. For the Glimmer 2 integration, we've just been creating a component with a different renderer, so we don't even hav eto have a feature flag.

GC: The point of bringing this up is, it will be hard to test a build of Ember with Glimmer 2 until we do the full infrastructure integration.

**Grand testing unification**

RJ: I submitted an RFC, everyone read it

YK: There was some discussion on owner in chat, but that isn't directly related. The only thing that makes me a bit sad is that `fillIn` is much shorter than `await this.fillIn`, as a DSL. I don't have an alternative, but the API was pretty constrained before. In terms of DSL it was meaningful. The extra 25% is a lot of overhead.

YK: when you look at a test it is a list of `await this.`.

TD: It is hard to argue about it, but the aestetics are bad.

YK: Not fatal, but not good. The rest of the RFC is valueable no matter what

RJ: So where do the helpers come from, that is the problem.

YK: `this.` is tolerable, `await` is tolerable, but combined it seems bad.

TD: you could use test context

RJ: I don't want to add anything that limits multiple tests running at once

YK: In angular's world view they would put the test in a zone. I'm not saying we should adopt it, but the motivation is to solve this same problem.

TD: The ideal of multiple tests at once is that you might have multiple apps running at once.

YK: This whole thing is a future proofing.

EF: I'm not convinced that all the helpers need this state

RJ: They need the root element of that test. Even `fillIn` is a selector on the root node.

YK: Basically what we have today has rough edges, and they are making us ignore the ergonomic challenges.

(discussion of global test state)

SP: basically you need process isolation to test two apps at once.

YK: I think there is too much global state already in the browser API. As soon as you want to isolate you are playing whack a mole.

(discussion of alternative APIs)

YK: I propose that we make the helpers imported, and use global state for the current app. If there is a major issue with global state for the "current test", someone needs to enumerate it carefully.

YK: I also continue to have concerns with the proliferation of the 'owner' concept without clear pedagogy thinking or thinking about how it affects the existing de facto `container`, `registry` and `application instance` terminology. "It's a trait" is true but at this point there are too many terms and we need to consolidate carefully.

**route serializer RFC**

SP: This just landed. tl;dr in engines you need the serialize function to build a URL before you have the route itself.

(discussion about the API)

RJ: this is related to the stuff you put in the URL, not everyone cares

SP: I want to look at other codebases and see if there are uses of state or not

**Ember CLI 2.3 (or 2.4) release**

YK: Can we get a release of ember-cli that is the same version as Ember?

EF: People are using the betas really widely in production now. You can say if things break it is their own fault but that doesn't really hold

TD: If the whole community is already using the beta version there isn't a lot of a point

YK: docs team is feeling a lot of pain around this as well, spending a lot of time on it.

EF: I think the locking of version numbers is causing a lot of pain here as well.

(much semver, metapackage, lockstep pain discussion)

YK: Right, let's release a 2.3 now, as is then.

SP: Great, yeah. Just need to fix a broccoli-rev thing and we can cut it.
