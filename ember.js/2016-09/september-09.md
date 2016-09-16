# Ember Core Team 2016-09-09

### Agenda

- Glimmer 2 Update [GC]
- FastBoot 1.0 Update [GC]
- Discuss https://github.com/emberjs/ember.js/pull/14233 [GC]
- Discuss https://github.com/emberjs/ember.js/issues/14168 [RJ]

### Attendees

Alex Matchneer, Dan Gebhardt, Edward Faulkner, Erik Brynjolfsson, Godfrey Chan, Martin Muñoz, Robert Jackson, Tom Dale

### Minutes

#### Glimmer 2 Update

GC: I believe we shipped.

GC: It is in the latest Ember 2.9 beta. We also posted the blog post. So far, we have not received any unexpected issues. People seem happy so far.

(private) GC: I happen to be pairing with Stanley right now and the Heroku dashboard is running on Glimmer 2. We hit an error and he asked for help, but we fixed it in 5 minutes and it seems to be working well.

EB: What is your take on the add-on compatibility story?

RJ: I reviewed the top 20-30 addons and have been testing them against canary as we did the integration. ember-i18n needed an update which was published this morning. I've been working on Liquid Fire today based on my discussion with Ed.

EB: So it sounds like most addons should just work?

RJ: Yes, that's true. Sometimes addons were using deep private APIs, and those I've had to tweak. But addons using public or intimate API all seem to be working well.

EB: I imagine it helps that we have public helper APIs to make the upgrade smoother than last time with HTMLBars.

EF: There's a weird corner case I found with hash but it's been pretty small.

RJ: Yeah, we've tried to deal with these issues by freezing objects in development mode. This helps us preserve the optimization while preventing people from accidentally doing a bad thing.

RJ: There's a few tweaks to attrs that clean up timing behavior. We did have to make some compatibility tweaks that leads to some internal weirdness to maintain it, but overall we're in a good place. Most addons work fine, and Liquid Fire is the last major addon that has compatibility issues.

EF: We have a branch of Liquid Fire that works perfectly with Glimmer 2, I just want to work with Robert to create a version that works in old Embers as well as the Ember 2.9 version.

RJ: Yes, and actually the Glimmer 2 version is much nicer. It now has the API that we always wanted, so the Liquid Fire internals are much nicer now because they don't have to resort to hacks.

EF: There are a lot of internals in Liquid Fire I was able to refactor because the Glimmer internals are so much nicer.

RJ: Ember Islands is another addon that doesn't work correctly. There's an open PR I need to review with Kris Selden, hopefully sometime this afternoon. It is using deep internals that hurt my brain. Overall, it's been very good.

EB: Sounds good. I just wanted to check how it's going. Usually big upgrades like this have the biggest impact on addons, not necessarily apps.

RJ: By and large the most popular addons have been updated. There are a few that have test suite issues, like ember-wormhole that uses `Ember.View` in its test suite.

RJ: The issues we've seen opened since the beta have been small things that are constrained, not huge compatibility issues.

EB: What about the Ember Inspector?

RJ: There was a small change made in the last minute to Glimmer that broke the Inspector temporarily, but Teddy and I fixed it this morning and he cut a new release.

EB: Should we switch to showing to components by default?

RJ: Yes, that seems good. That's the first thing I do when I open the inspector anyway.

SP: One problem is that we had certain things like `{{link-to}}` that appeared as components in the inspector, which tended to dominate the inspector view when components were turned on.

EB: I would love to see the Ember Inspector behave more like the built-in DOM inspector.

TD: I wonder if it would be cool to use template size as a proxy for component importance, and change the size of the display of each component based on its "importance."

SP: Maybe we should actually just let you explore templates directly.

TD: That would be cool.

#### FastBoot 1.0 Update

TD: Stef, let me fill you in on what we discussed last time.

SP: I was hoping to use some inefficiencies in our internal build system as motivation to work on the FastBoot build improvements. However, a lot of it is not possible to move into Ember CLI and it would take a long time to get it done.

TD: I can do the work in FastBoot if you can help me get the needed hooks into Ember CLI.

TD: I am leaving on vacation for a week, but I will sync up with you, Stef, once I get back. Dan McClain and I worked on a draft RFC for targets, but it sounds like Nathan Hammond is working on something similar. I will loop him and Dan Gebhardt in to that.

#### Component Lifecycle Hooks & FastBoot

RJ: This is a PR I submitted yesterday. I looked for a canonical answer to what component lifecycle hooks fire in FastBoot/non-interactive mode and which do not. I could not find a canonical answer, so after a small discussion, I decided on a list and implemented a test to verify behavior.

GC: I added this to the agenda so we could discuss with Yehuda but it seems like he is not here. Yehuda had some reservations about calling update hooks in non-interactive mode, so we could for example skip loading states and just wait for models to resolve before rendering.

TD: I don't know if that works for UX reasons. You basically want to "race" the client and server, and after a timeout, send whatever you have on the server, which may be the loading state, then let the client take over the fetch.

SP: How would it work to send the loading state rendered to the client?

TD: In many apps, there is "primary content" and "secondary content." You want to defer the SSR to the primary content, because it's what you want users without JS or search crawlers to see. But there might be secondary content that you don't want to cause to delay the render. If after a timeout, say 200ms, if it still hasn't rendered on the server, you want to give up and just have the client start rendering. But if the primary content takes longer than 200ms, you may want to delay sending the response.

TD: Basically, think about how AJAX is used on traditional server rendered apps, like Rails apps. You render the main content in Rails, then include a sidebar that loads secondary content via an XHR request. It shows a spinner until it loads.

(discussion about which hooks are available in SSR and when the SimpleDOM element is available)

SP: What connects the loading state and exposing the SimpleDOM element? They seem orthogonal. Why is "going into a loading template" and "the SimpleDOM element is exposed" related?

KS: The desire is not about performance, it's the belief that the tree construction can be permanent.

TD: This has to do with optimizations around streaming, right?

SP: Okay, so loading templates are an example of a dynamic template—part of it will appear and part will be removed. Similar to an `{{if}}` that changes mid-render. If we say nothing is allowd to change, once they're created, you can start streaming elements as soon as they're closed.

GC: We've disabled mid-render invalidation of previously rendered elements, like via changing an `{{if}}`. So the biggest problem is loading states.

SP: I see, so the problem is that, if you assume an immutable DOM that is streamed as soon as its built, exposing the `element` won't have an effect because any mutations would happen too late. It was already streamed to the client.

SP: So what if we exposed a hook that allowed components to return a SimpleDOM-comaptible fragment? Then we could append that once the component finished rendering.

KS: Already today, SimpleDOM can serialize any DOM-compatible elements. It doesn't even have to be a SimpleDOM element.

TD: Good discussion, I think we need to move on since we're almost out of time.

RJ: Just to recap, the PR looks good to everyone? We can change or tweak these rules, everyone should review this.

GC: We want to finalize this ASAP.

RJ: This technically is public API via the `visit()` API so we need to nail it down ASAP.

KS: That's true, but accessing an element from any hooks other than `didInsertElement` or `willDestroyElement` is wrong. Those are the only ones we offer guarantees around.

TD: I will add these to the FastBoot website once we finalize it.

#### Deprecate `targetObject`

RJ: This API exists to change where actions get dispatched. We deprecated this, but I added backwards compatibility so that if you set `targetObject`, actions would still be dispatched there. Unfortunately, this doesn't appear to be enough. People programmatically retrieve `targetObject` as a way to access a component's controller, or whatever its lexical scope was.

RJ: It seems like we don't have much choice but to continue supporting this, with a deprecation warning.

TD: I understand why people want this. It's a way of programmatically accessing the lexical scope of the component from the JavaScript implementation.

KS: But we have better ways of doing anything you'd need this for. It also wasn't documented. Anything in lexical scope can be passed in as an argument, which is a better way to do this without relying on this private API.

KS: I'm against continuing to support this because it was a private API that was never documented, and it has a performance cost. It never even worked reliably due to computed property cache invalidation issues.

SP: How many people are impacted by this? Can we offer a compat plugin for people who rely on this private API, remove it, and tell people to use this if they need it?

RJ: Well there's already a workaround for people, which is to use `_targetObject`. Basically `targetObject` but you can't watch it.

SP: Are people relying on watching this property?

RJ: I hope not because it doesn't even work properly.

RJ: It's tricky because we still have to support *setting* `targetObject`.

SP: *suggests implementation strategy*
