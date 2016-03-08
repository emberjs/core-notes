# Ember.js Core Team 2015-11-06

#### Agenda

- application-visit [GC]
  - Already "go"-ed in the last meeting but we missed it on the minutes, would like to reconfirm
  - How to deal with remaining DOM-helper patches
    - URL protocol parsing (for escaping?)
    - {{{ ... }}}
- improved-instrumentation [YK & GC]
  - Not quite ready atm, but what would we need for a "go"?
  - Aim to get to that ^^^ state by next week
- Glimmer 2 integration [YK]
- `getOwner` feature
- ember-cli 1.13.x + ember-cli 2.x releases

#### Notes

Attendees: MB, YK, GC, KS, AM, EB, LS, RJ, TD, IT, SP

GC: We go'd visit in last meeting, but want to make sure, wasn't in the minutes

YK: While it is not done, we think the things we need to do in the future need to be done now

RJ: Are there docs?

YK: There are API docs, there should always be docs for new features. I don't think it needs guides since it is a poweruser feature.

GC: They are written in the style of guide, using highlevel scenarios. We can extract it later when it stops being a power-user feature.

GC: https://github.com/emberjs/ember.js/blob/master/packages/ember-application/lib/system/application.js#L985-L1174

GC: there are two patches requires for DOM helper for the visit API to work.

GC: First thing is it uses the dom to parse URLs 

YK+RJ: We use the DOM to parse URLs so we can ensure the correct contextual protocol. An "a" tag

GC: To ship this the options are to tell people to patch it (the dom helper instance), but that is bad. The second option is to expose it as a public API. (some third option?!)

YK: the dom helper is basically already a service. But we don't want to expose it, so a service would have this slim subset.

TD: That seems a small feature pushing us to make a public API

YK: for example having a routing service is OK even though we have router.js

SP: If we need this env at eval time, then it just cannot be a service.

TD: Because everything on the env we know of that needs to be replaced today is for runtime, services could work for parts

SP: We can use the module system to ensure modules providing functionality can be loaded before Ember. I think its something that belongs before the container, which means the module system.

YK: We're not going to do a full extensibility discussion on this call, so lets stop.

YK: auto-detect or passing the protocol for lookup are on fallbacks.

GC: instrumentation PR- it is pretty small and I'd like to land that

RJ: you addressed the concern I had. This would help with some of the inspector stuff.

YK: Glimmer2, we have many tests passing, waiting on Robert for some work

RJ: Yeah I've been feeling crappy, but we should pair up today and can get you guys unblocked.

RJ: getOwner. it deprecates access to the container and provides a function returning the owner object

RJ: You can call lookup etc on it.

RJ: the thing it returns is an application instance, in test we make something else but in apps it returns an app instance

RJ: I need to do some feature detect stuff in ember-test-helpers to make it work there, but I plan to do it this weekend

RJ: The only API that people sometimes use that we don't have public is lookupFactory, it is underscored and private, based on concerns we might want to change it in the future.

SP: Don't say Ember-Clee.

SP: We're going to release 1.13.9 and 2.2 next week. It will be out of sync at the patch level.

SP: Next week with RJ's help we can finish addonify ember.js

RJ: local lookup, I should be ready for eyes next week.

MB: 2.4?

RJ: yeah 2.4, we will have a WIP shortly.

SP: I'm going to try and update the weakmap stuff to get that landed internally soon

RJ: It is related to a sorting bug?

SP: Right. For people who want to try it there is an addon that polyfills it.

SP: On the Ember-CLI front as well I got a bunch of performance work it. We got a lot of work on merge trees in. the next release of Ember-CLI everything except SASS will be much faster. The caveat is that npm need to be up to date, we can make a guide for that.

SP: There are some addons that do crazy monkey patching, and those may need to be rewritten entirely.
