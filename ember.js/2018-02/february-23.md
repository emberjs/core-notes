# Meeting: Ember Core Team 2018/02/23

## Agenda

- RFCs
  - To Merge
    - https://github.com/emberjs/rfcs/pull/284 Splitting Ember into packages
    - https://github.com/emberjs/rfcs/pull/297 Deprecate Ember.Logger
    - https://github.com/emberjs/rfcs/pull/293 Ember Data Model Data
  - To FCP
    - https://github.com/emberjs/rfcs/pull/298 Deprecate Component Lifecycle Events
    - https://github.com/emberjs/rfcs/pull/308 Deprecate Property Fallback Behavior
    - https://github.com/emberjs/rfcs/pull/272 Deprecate `Function.prototype.{on,observes,property}`
  - Status
    - Component Manager RFC
- Readers’ Questions
  - [https://gist.github.com/kategengler/8a3c4c8e7c9d885b842a98076431cfc3](https://gist.github.com/kategengler/8a3c4c8e7c9d885b842a98076431cfc3) How to pitch Ember?
  - +Ask Core, 2018-02-22 “ember explode” means glimmerjs is not necessary?
- Module Unification Namespaces RFC Draft [https://gist.github.com/mixonic/79ddcdd0539d04480d3d04e281e370ef](https://gist.github.com/mixonic/79ddcdd0539d04480d3d04e281e370ef)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Pennter
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler

## Minutes

### RFC - Splitting Ember into packages

(discussion)

YK: I’m less sure now that npm packages are the right solution.

(discussion)

YK: I think this discussion should happen again at the F2F

EF: For addons I added a way to express what they want from the main application as metadata. We could expand that to the application itself.

RJ: Are you saying we should split the definition of what you require from the packages?

YK: Yes

EF: No. I don’t think we need to figure this out here.

RJ: Ok.

(discussion)

YK: EF if you think breaking it apart works that sounds good for the RFC. If not we can schedule another chat.

EF: Sounds good. I also need to update and bucket community concerns.

### RFC - Deprecate Ember.Logger

RJ: I was already supposed to merge this. I will get that done just after the call with a nice comment. This person Ralph has done a great job. Boston meetup attendee.

RJ: Alex asked if there was a way to support many versions of Ember, I will chime in and share what I think of as the solution. They need to include some magic code.

(discussion)

### RFC - Ember Data Model Data

TD: IT is not here to get this going. Last time he was here he wanted to change the terminology, and mention if a better name comes up during implementation we can change it.

YK: I think the ball is in their court and we don’t need to do anything until they tell us.

RJ: Right if they want to merge it is their call at this point.

MM: Aside, there is a bad bug in ED with computed properties through async relationships (promise proxies). I’m worried that people can’t test Ember 3 because of this. The error is that things don’t update, but silently.

MM: We moved some things around in array proxy and it just surfaced some bugs in ember data.

YK: I think it is ok to do something aggressive

MM: I think the aggressive thing to do is try and get the ember data team on it.

RJ: This is an issue in stable. I think we have a few days to come up with a fix. Likely it is a combo of MM and someone familiar with ED internals will solve it.

(IT arrives)

IT: I’m aware of it, have not gotten to look at it yet.

RJ: My concern is that if you go to ember data 3 you get this error even without bumping ember, so…

The issue: https://github.com/emberjs/data/pull/5359

(side conversation about ember-decorators)

TD: Did anyone notice that ember-decorators is broken in 3.0?

RJ: There’s a 2.0 beta that’s working.

YK: It probably has to do with the fact that the old Ember Decorators put descriptors on the prototype.

RJ: Yes, that’s exactly it.

(side conversation about Ember.defineProperty and why it is private)

RJ: As an aside, did you know that Ember.defineProperty is private? That seems 🍌 s

YK: The problem is that we would also need a public API for “finishing merging” that you would be required to run after using `Ember.defineProperty`

(YK editorial note: it seems ok to make some subset of defineProperty plus some kind of finalizeMerge API public)

(MB: we need to pop the stack)

RJ: popping the stack. IT if you or runspired or david and look at it that would be good.

IT: I am planning with MM for a time to pair.

RJ: MM has been responsive on the issue, so it doesn’t appear to be ignored.

### RFC - Deprecate Component Lifecycle Events

RJ: I think this is not ready for merging or FCP. We talked last time about YK and DG having reservations. I need them to chime in. About the mixin use case.

DG: Yeah I have a todo, we should not let it linger. YK I will review with you.

RJ: I think some of the smaller changes we made were: Ensure the codemod make sure super is called in hook, and make sure the linter checks for super being called in those hooks.

### RFC - Deprecate Property Fallback Behavior

RJ: I would like to see this move forward.

YK: We should discuss. I don’t think we were on the same page in chat.

RJ: I perceive the named blocks RFC said we wanted to do this way back when. But I think CH’s interpretation is different.

YK: I think CH thought there was a problem in the named blocks RFC.

CH: so named blocks are just arguments into the component. they are just @args. So why would you ever refer to the @args things (named blocks) with a `this.`

YK: In the old RFC there were no @names yet. I think what happened is we didn’t want that RFC to intro @names for this one case. So we said that for this particular case we need to use `this.`

CH: Ok. It specifically talks about using `this.` to talk about the arguments.

RJ: `this.`is only talking about closure components. The way I see this is that the RFC talks about `this.` to disambiguate things that are pass in.

CH: The RFC I wrote says `this.` always means member of a component.

RJ: but that is true today as well.

YK: It is just how ember components work. Names blocks RFC refers always to arguments, and `this.` as an example of how to reference them.

(discussion about `this.` as a disambiguation for passed in vs local, and `@name` as a better disambiguation)

YK: I think it is worth the new RFC saying the old RFC said something about `this.`, but this RFC clarifies that to be about arguments. The old RFC just predates `@name` in Ember components, we thought it would only be in Glimmer components.

TD: It seems like nothing in named blocks precludes `@` syntax.

RJ: So I want to FCP this.

YK: We need a codemod

RJ: I can help. I want to be clear that I want this mod to change all lookups to be `this.` if they refer to the object.

YK: I think we need one for `@name` as well, but it should be something else.

(discussion)

TD: I think there is a question about if people have seen this. I don’t think it is controversial, but it is significant.

RJ: I expected the verbosity concerns to pop up more. I think it is important, and clearly the tradeoff that we are making.

RM: I think this comes back to us communicating the interim states as well as the final position.

YK: TD I think it would be good to show the end state in the quest issue.

TD: Yeah. I think that `this.` also might confuse people it is JavaScript.

TD: Ok so I think FCP is a good mechanism to get more people looking at it.

YK: Yeah this is why FCP exists. I think the concerns about deprecation spew are real.

RJ: We should talk separately about how to do the deprecation per layer, per namespace. We should talk about it.

YK: So yes to FCP, lets make sure we get eyeballs on it.

RJ: It will be good to show people we are serious and work on the codemod etc. I’d like to have the codemod out next week.

### Deprecate `Function.prototype.{on,observes,property}`

YK: I am not personally ready to FCP this. It has a problem of seeming very noisy without giving a win to people.

TD: It seems trivial to pull the deprecation into an addon and maintain it over time.

RJ: So you mean deprecate it in Ember, but have an addon that quashes the deprecation.

YK: I think at some point it is better to build the new world and not churn the old world that will be disregarded.

RJ: I just don’t want someone writing a new app to do these things today. Hell even observers are a thing you should avoid. I think we should find a way to make observers feel more expensive.

YK: I like the idea of making a mode in new apps that makes it noisy.

(discussion)

(we should make ember-cli-update part of the default build)

### Component Manager RFC
TD: I’ll have a document to share today

### Module Unification Namespaces RFC Draft
<exposition from Dan on what the RFC is addressing>

RJ: services, components, helpers should be namespaced?

DG: Yes, this RFC goes beyond the original MU RFC in that it allows for implicit namespacing of services, components, and helpers within addons. In other words, instead of requiring that a top-level component within an addon always be referenced with a namespace (i.e. `{{my-namespace::my-component}}`), it will be allowed for other templates *within the addon* to reference that component simply as `{{my-component}}`. This will not be allowed for components such as `{{my-namespace::main}}` which are not valid single word components, but such components will be fine in angle bracket form eventually ( `<Main>`) or could use the component helper (`{{component` `'``main``'``}}`). All of this also holds true for service injections and helpers.

DG: Please read the RFC for complete details.
