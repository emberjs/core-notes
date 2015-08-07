# Ember Meeting Agenda 2015-08-07



### Attendees

Robert, Yehuda, Stefan, Peter, Matt, Martin, Kris, Erik, Trek

### Agenda

* Angle bracket update - @wycats
* 1.13.7 Update / Blockers - @rwjblue
* Deprecations needed for 1.13.7
* Ship 2.0. Like now. - @wycats

### 2.0 Release Plan

* Blog Post
* What is left?
* Messaging 2.0-2.2 and the potential instability early in 2.x

### Deprecations for 1.13.7
- [ ] Deprecate block usage of unbound in 1.13 ([emberjs/ember.js#11965](https://github.com/emberjs/ember.js/pull/11965)). Should be PR'ed directly to stable.
- [ ] Deprecate multiple arguments being passed to unbound in 1.13 ([emberjs/ember.js#11965](https://github.com/emberjs/ember.js/pull/11965)). Should be PR'ed directly to stable.
- [x]  Deprecate using `@each` as a "leaf" ([emberjs/ember.js#11990](https://github.com/emberjs/ember.js/pull/11990))
- [ ] Should swap `@each` with `[]` when used as leaf on a declarative observer or dependency key
- [x] `{{with foo controller="bar" as |baz|}}` [emberjs/ember.js#12000](https://github.com/emberjs/ember.js/pull/12000)
- [x]  Deprecate using Ember.TrackedArray https://github.com/emberjs/ember.js/pull/11993
- [x]  Deprecate using Ember.SubArray https://github.com/emberjs/ember.js/pull/11993
- [ ] Deprecate using `.render` with a component or view [emberjs/ember.js#11515](https://github.com/emberjs/ember.js/issues/11515)

# Synchronous Observation Related Things

- [ ] addArrayObserver, removeArrayObserver (all that should remain is the `"[]:change"` event)
- [ ] willChange support in ember-runtime/mixins/array 
- [ ] willChange support in ember-runtime/mixins/enumerable
- [ ] willChange support in ember-runtime/system/array_proxy

### Minutes

SP: Much work has been going into performance with ember-cli.  Some great changes at the caching-writer / sourcemap-concat stages.

YK: Angle brackets is going well, we expect to be mergeable early next week. We have a checklist of seven items.

YK: This work also opened up some new context for attrs/props. Basically the root of component can be the identity element, an element like a div, or another component. You don't want element attrs to be shadowed like a component, but you want the semantics to be akin.

KS: Could we explicitly bind reflection?

YK: The problem with opt in is that the caller has no ability to change behavior for an attribute. They are stuck. Additionally we have an opt-in mechanism today (just a programmatic one) and we gets lots of issues about binding.

SP: Does this mean the attribute bindings can become pay as you go?

EF: Yeah attrmorph was really high up in my profiles this week

YK: Absolutely. Yes.

KS: Getting rid of the ember-view class would be good, to keep from the complexity of generating the class attrmorph and such

KS: The event dispatcher should use ids instead of needing the class, and we can remove it

YK: we already decided that none of the class name bindings stuff would be on angles. I think what you'e suggesting is that we add the ember-view manually in angles, then remove it later

SP: it is unfortunate that it is called ember-view since we are getting rid of views

YK: I just don't want to block angles on something new. Angles will be in canary for six weeks and if someone want to pick up the work of fixing event dispatching to use ids then remove the class that seems fine.

YK: ok so that is angle brackets, what is 2.0 robert

RJ: There are a couple bugs and issues that need to be locked down. I'm focused on the next 1.13 (link in the agenda) and adding deprecations for the things removed in 2.0.

RJ: This includes the render method. the timing of it has changes (it is not called on serenader)

YK: I'm unsure we can make it work well, but we can deprecate it (and remove in 2.0).

RJ: It was reported, but it not common so fixing the behavior is not that important.

RJ: I should hopefully release beta.5 today if some regressions opened today are not too big.

RJ: There will be a deprecation in 1.13 that says not to use `@each` as a leaf.

YK: Could we just swap it to a bracket when declared?

KS: In the declarative case yes.

YK: It is trivial to do and seems like a good thing this late in the game.

KS: A long time ago I made volatile remove the observer behavior and make it manual, but this has changed...

YK: what you mean is you have to explicitly notify property change?

KS: Right. I opened a PR against master but it should have been against beta.

YK: I think any breakage would be breakage in undefined behavior cases

YK: I think we just didn't ever define the semantics of volatile. It seems reasonable to define them this way now.

KS: ...

YK: the number of people using it is pretty low

YK: one way to say it is that in ES5/6 a volatile property is literally just a getter

YK: .set used to notify property change and now it will not?

KS: yes.

SP: it is important regardless of what it breaks, and the argument is that it simply aligns us better with the language

SP: basically we could move CPs to be real getters and setters. we're blocking on decorators.

YK: I am very strongly in favor of installing getters, but in light of the react model .sets are very rare. Making people go through `.set` makes it clear a change may update the UI

SP: yeah that seems easy to do

KS: would it stomp without a setter

YK: no it throws, but not with the error we would want, so we would need to install the one we want

EF: I feel strongly we should use .set 

MM: agreed

KS: What are we doing with unknownProperty

YK: I think we're inching in that direction

EB: I really want to stop using `.get`

SP: proxies have allowed us to fix things in the short term

SP: you could define a class for the attrs proxy on each invocation. it would cost nothing at runtime.

KS: I thought we were moving toward adding an observer for any property on an object

YK: I'm just talking about the specific case of the attrs proxy right now.

KS: but you're just talking about an alternative legacy component implementation

KS: I'm very very anxious to just use defineProperty

EF: I'm on a rampage to remove all lingering synchronous observation

KS: There is so much I have been waiting to do that I can do after that is done

YK: Ok 2.0

RJ: So I got cut off at the volatile change. That is the last thing

YK: So basically messaging and blog posts need to get done

RJ: We need to make sure beta.5 is essentially the same semantics as 2.0 to people can test it

YK: we're basically cheating the train system.

YK: so we need to talk about messaging the early 2.0 section. Basically the

MB: We can message that 2.0 is the "garbage collection" release.

RJ: Looking at file size charts across versions of Ember is error prone.  Many versions released between 1.8 and 2.0.0 had various issues that make analysis hard.

SP: I have a PR that may have the ability to make execution time much less, and JS execution time is much more important that actual file size.

...meandering discussion of boot time performance and messaging improvements to it...

YK: RJ, MB, anyone else who wants to attend, and I should meet to discuss the specifics of 2.0.0 messaging and prepare for the blog post.

RJ: I can probably be ready by Monday for 2.0

YK: I think the blog post will be set by Wednesday

...emberconf website launch discussion and timeline...

...toronto f2f discussion...

...project marketing / identity design ...
