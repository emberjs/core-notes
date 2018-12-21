# Meeting: Ember Core Team 2018/11/09

## Agenda

- https://github.com/emberjs/ember.js/issues/16915
- https://github.com/ember-learn/guides-app/issues/298
- RouteInfo Metadata
  - Created this after moving our tracking stuff over to `RouteInfo`. We still need to call into private APIs to read metadata off of the Route instance. Seems like a good way to also do `document.title` stuff.
  - Maybe FCP?
- RFC Round Up
  - RouteInfo Metadata ?
  - RFC Process Update
  - FCP To Merge
    - Router Helpers
- Module Unification & Addons (https://github.com/emberjs/rfcs/pull/367 and others)

## Attendees

[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Dan Gebhardt
[ ] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Action Items

[ ] @Robert J to comment on root cause of https://github.com/emberjs/ember.js/issues/16915
[ ] @Tom D to comment on https://github.com/ember-learn/guides-app/issues/298
  [ ] Find someone to move out RSVP docs
  [ ] Examples in guides should work in all supported browsers
[ ] @Yehuda K to share draft of component import syntax RFC for next week
Minutes

### Guides app: Should `RSVP` be removed from latest docs

RJ: Someone opened an issue about this in the docs. The issue spiraled into “should Ember ship RSVP” which is very different. I think: RSVP docs live on the Ember docs right now. I think they should be on their own site and we should cross link to them.

YK: I was reading this yesterday. There is a point where RSVP is said to no longer have any benefit…

RJ: I think removing RSVP is fine, but it needs an RSVP. RSVP still adds things over native promises. It would probably be plausible to have augmented utils for the promise lib ship.

YK: So there is a question about should the guides mention RSVP. The original request identifies RSVP in the original guides (routing) as being a place that we should remove suggested usage.

YK: Should RSVP be used for incidental uses in the guides? I think the answer is we have work to do, but then we could tell them to do that. Then should be have RSVP docs in our docs? And it seems we should mention the global Ember.RSVP, but should have docs elsewhere. And the last thing is should we ship RSVP at all, and that is a whole different thing ala jQuery.

YK: I think this could use a response explaining why we don’t remove it right now.

RM: Yeah this is why I brought it up. I’m not sure we can remove all uses (explains some uses).

RJ: I think also… IE11 doesn’t have native promises. Do we support IE11? Right.

KS: Right most people expect you need to bring your own promises in IE11

TD: I think RJ’s point is that you need to have the documentation just work in IE11, since it is supported.

YK: I agree with TD’s point.

KS: I think what everybody would like… it is like the jQuery thing. People want to be able to opt out of it and have things work.

YK: In my mind it is broadly speaking like the jQuery removal process.

RJ: I think the thing to do is probably decouple RSVP from Ember itself, and make RSVP an easier thing to use on its own. We need some changes in RSVP, some in Ember it needs to be well thought out.

(discussion)

TD: I will comment on that issue. Beyond “the guides should work in all browsers” any other highlights?

RJ: I think we should change the docs so RSVP is on its own site. It should be adding YUI doc and GH pages or something.

RM: I will set it up.

### RouteInfo Metadata

CH: At LI we have a bunch of tracking code, and I was able to remove a bunch of it. But we are perhaps missing an API that lets you access information about the current route.

CH: This adds a hook to the route that becomes a field on the route info that becomes available in transition hooks

(discussion, RJ supporting)

YK: Most people will not be using this API. The long name seems fine.

TD: How well does this feature work with a future of multiple class decorators. Multiple decorators want to add metadata, for example. You could just have each decorator wrap the previous?

RJ: I think you might do it differently, and have an alternate API built on top of this for the specific app case.

(discussion)

RJ: We should consider that we want routes to become more stateless. Don’t set state during the model hook etc.

CH: This runs before any of the async hooks, so you cannot access any of that.

TD: So if you are dependent on the model, you cannot build metadata based on it?

CH: There is a subclass of the routeinfo that has the model on it. And the instance of the route has this.

TD: Something feels off, like there is a missing rationalization. You have the routeinfo which I think in some sense represents the output of the route and router hooks.

RJ: I think it is the input.

TD: Does link-to compare to routeinfo (conceptually) to see what route you are on?

CH: It should, but it does not today.

RJ: It needs to use dynamic state, which it doesn’t today.

TD: In order for link-to to know where you are it needs the routeinfo and the model. So conceptually in some way route info represents the post-transition world.

CH: RouteInfo is just metadata about the route status. RouteInfoWithAttributes has metadata like models.

(discussion)

TD: I think once this is in people will want to include things based on the model in the metadata. Maybe we add another hook that is called later?

CH: so it returns a unknown. You could return a function closing over `this` or whatever so you can access it later.

EF: Right just by preserving the object identity you could read any state

(discussion, re: should this be an async API, and consensus that it should not be)

Consensus to FCP this small, nice enabling change.

(public) Module Unification & Addons

YK: I think there are three things that need to be resolved.

The original RFC for MU was simple expect for the components stuff.

There is Matt’s RFC which attempt to improve APIs to in Ember to make MU work with Ember. And it includes what is happening in templates. Any anything in templates is talking about what is happening in  the complex part.

I have another RFC that attempts to access helpers/component via imports only in templates. My RFC might have seems like it was opening a pandora’s box, but it was actually very narrow and focused on templates. So my proposal for harmonization:

We repeal the component-specific things from the MU RFC. As a consequence also remove any template/component stuff from Matt’s RFC. What is left is still significant.

They will be supersede by my RFC which describes how to import/invoke components/helpers. I think this is ok b/c components were already a weird part of module unification. Templates also have the effect of being stateless. what I am suggesting is that we should keep around all the work from the MU RFC and followup that has to do with having directories with files in certain locations and lookups. All my RFC really wants to do is change how lookups in templates work to be imports.

(discussion)
