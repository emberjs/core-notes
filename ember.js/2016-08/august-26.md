# Ember Core Team 2016-08-26

### Agenda

- Glimmer update
- (LS) Does Core want to review nested sub-routes PR for our tutorial? [Have a few things we're suggesting in there that might be worth review](https://github.com/emberjs/guides/pull/1603).

### Attendees

LS, YK, GC, RJ, DG, MB, IT, TD, MM

### Minutes

#### Glimmer update

(discussion, liquid-fire status, ember-islands)

RJ: To land support for ember-islands glimmer must support multiple root templates.

GC: Perhaps we can only use an array of root templates if you call appendTo more than once, opt into a slower/messier path.

RJ: Right the appendTo would have to upgrade from the static case to a list

YK: Would this have just made Skylight work?

GC: No createChildView is gone, but in theory something like that. We can just make appendTo do the slightly more expensive thing. It isn't a blocker, but it is probably a week out.

YK: I want to make sure we don't leave the ember-islands people behind.

RJ: Mitch is eager to help migrate his codebase/userbase or working Ember. I think if we are committed to making it work we are ok.

GC: Now I recall that I originally suggested using multiple application instances at first.

YK: You could use multiple engines that support sharing

GC: I think if we could do multiple application instances that would be great.

GC: Robert landed instrumentation this morning that is good.

GC: I'm implementing childViews as a getter that looks to a backing array of items in the view registry.

KS: Does this includes tagless views?

GC: Yes it would need to.

(optimization strategy for guidFor can optimizations, garbage collection of childViews)

GC: Am I on the right path with childViews being made lazy?

KS + YK: yeah

RJ: Ok the few blockers are 1) childViews stuff

GC: I don't consider it a blocker

RJ: But it is needed for the inspector

GC: Yeah that is true.

RJ: Other two are 2) Engines and 3) SSR work

KS: I've worked with people on this. Main issue was that the htmlbars tests presumed a default container, so the idea is that we can now removed that. There is progress, I think it is close to being done.

GC: What else? Edward LF?

EF: I have forks of LF and glimmer with small changes that make everything work.

GC: Cool get in touch if you need help.

EF: I'll link to the WIP branches. There is some new syntax stuff.

RJ: Cool, we've also been tracking skipped htmlbars tests- I'm pretty sure there will be no skipped ones.

KS: I want to be sure- The intention of skipped tests was to say these are needed for compatibility. I want to know we are running them or not, and be clear everything has been visited and compatibility has been evaluated.

#### Subroutes

LS: I will tell them we will have comments on there by Tuesday.
