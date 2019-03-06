# Meeting: Ember Core Team 2019/02/15

## Agenda

- Determine note taker - JW
- Clarifying Question: Should `willTransition` and `didTransition` events on the Route be deprecated? [#17585](https://github.com/emberjs/ember.js/pull/17585)
- Clarifying Question: What is the actual API for `{{in-element}}`[RFC](https://github.com/emberjs/rfcs/blob/master/text/0287-promote-in-element-to-public-api.md)? Does it have `nextSibling` like the private thing or no?
- RFC "How we teach this" (CH)
- RFC Tracking quick overview/reminder (KG)
- Confirming `class MyComponent extends Ember.Component {}` (RM)
- `@tracked` progress (RJ/KS)

## Attendees
- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [ ] Matthew Beale
- [x] Edward Faulkner
- [ ] Martin Muñoz
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber

## Minutes

### Clarifying Question: Should `willTransition` and `didTransition` events on the Route be deprecated? [#17585](https://github.com/emberjs/ember.js/pull/17585)

RJ: Are the methods supposed to be deprecated?

EF: The method on the route must *not* be deprecated. There’s ambiguity but it wasn’t the intent

RJ: There are actions, events, and hooks

KG: only events are deprecated. Actions and methods do not throw deprecation warnings

YK: Should we be doing risky deprecations while we’re doing Octane?

RJ: these have been out for a long time

EF: The code seems to do the right thing. The discussion is around the communication of the deprecation

YK/TD: are we actually changing anything?

CH: The question is about whether we remove the deprecation, and what we should do to address the confusion. People are just now hitting this deprecation.

RJ: Leave deprecations as they are, clarify language in the deprecation guide, and we’ll be good to go


### Clarifying Question: What is the actual API for `{{in-element}}` [RFC](https://github.com/emberjs/rfcs/blob/master/text/0287-promote-in-element-to-public-api.md)? Does it have `nextSibling` like the private thing or no?

CH: The RFC is under-specified. There’s a caveat about insert-before. Is next-sibling the API now?

RJ: Private to public API shifts have been painful. We should always focus on first principles

YK: Agreed, I was involved in this one

RJ: Concretely, forget about next-sibling, only support insert-before. It’s a better semantic naming. We only support null as a value. Append, otherwise we replace

CH: I will update the glimmer vm PR

### RFC "How we teach this"

CH: Point of order: I believe we should add a sub-section to the “Detailed Design” that is effectively the API docs. I feel like we are under-specifying things which is leading to churn in implementation.

Examples: 
- [Router Helpers](https://github.com/emberjs/rfcs/blob/master/text/0391-router-helpers.md#url-for-helper)
- [buildRouteInfoMetadata](https://github.com/emberjs/rfcs/blob/master/text/0398-RouteInfo-Metadata.md#buildrouteinfometadata)
- [Contextual Helpers](https://github.com/emberjs/rfcs/blob/master/text/0432-contextual-helpers.md#invoking-contextual-helpers)

RJ: The deprecation language is not clear either

RM: “How we teach this” section isn’t working

RJ: Part of the difficulty is that the division between API docs and Guides isn’t obvious

RM: We are working on this

YK: Need to get the learning team more involved in the RFC process

JW: In short, content that is about how pieces of Ember go together to solve a problem belong in the Guides. Content that can be explained in isolation, such as a new helper, belongs in the API docs 

### RFC Tracking quick overview/reminder (KG)

KG: Just a reminder! Need to go through all RFCs in the project tracker and create issues or link to existing issues. Need to know what has to be done to call them complete. Especially the learning team has a lot to do

JW: What's the urgency level?

KG: Many are focused on Octane, so those should be addressed very soon. Others can wait.

### `class MyComponent extends Ember.Component {}` (RM)

RM: what’s the support plan for this

YK: We support what is shipped

TD: Typescript has unique needs. We will not break the functionality. We’ve shipped and stabilized it. The caveat is that we do not have any RFCs for some of the classic component api that relies on decorators. You can’t show them without a 3rd party library. For the mainline guides, we only want to show one way of doing things. Otherwise, people will run for the hills. Glimmer components will be mainline experience, which includes classes. However, a migration guide should show how to understand classic components.

RJ: We shouldn’t limit a *migration guide* to just the Octane experience. It's good to show the older styles there even if they are not in the rest of the Guides.

YK: It is also good for us to think about what the recommended migration path is. For example, if we support `tracked`, you have 2 options. People looking at an ES5 class should migrate their ES5 class to use the tracked CP macro. They should not use computed. Just an opinion.

TD: There are good docs for decorators that help fill some of the gaps.

RJ: Need to circle back to the main question. Clearly, classes are supported. `ember-decorators` are NOT an official Ember Core addon. It’s basically impossible to use TS without native classes anyways

JW: the migration guides will show moving from classic ember object extend, and the mainline guides will show Glimmer components with native classes. I will ask for help with making sure the migration guides cover the bases.


### `@tracked` progress (RJ/KS)

RJ: We determined that there is a gap in what should be autotracked. It wasn’t ready for the alpha so we didn’t merge it. Chris Garret is working on addressing the missing pieces. The goal is to have them together this week. It’s going to be another couple days before there’s an alpha.

