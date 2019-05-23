# Meeting: Ember Core Team 2019/02/01

## Agenda
    
- RFCs
    - → FCP
    - FCP → Merge
        - [Forwarding Element Modifiers with “Splattributes”](https://github.com/emberjs/rfcs/pull/435) (**5** **min**)
        - [Deprecate Route Render APIs](https://github.com/emberjs/rfcs/pull/418) (**5 min**)
        - [Deprecate Application](https://github.com/emberjs/rfcs/pull/421) [Controller](https://github.com/emberjs/rfcs/pull/421) [Route](https://github.com/emberjs/rfcs/pull/421)[r](https://github.com/emberjs/rfcs/pull/421) [Properties](https://github.com/emberjs/rfcs/pull/421) (**5** ******min**)
        - [Tracked Properties](https://github.com/emberjs/rfcs/pull/410) (**5 min**)
        - [Contextual Helpers & Modifiers](https://github.com/emberjs/rfcs/pull/432) (**5** **min**)
            - Can/have we considered a `(bind` helper instead of component-subtype-specific helpers for currying? MB
    - → FCP to Close
    - FCP to Close → Close
    - Promote
- Do all public API deprecations need  a deprecation RFC? (RJ) (**5 min**)
    - https://github.com/emberjs/ember.js/pull/17540 (`aliasMethod`)
- General plan RE: decorators path forward? (RJ) (**15 min**)

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [x] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber

## Action Items

- [ ] Merge “Deprecate Route Rendering APIs” RFC
- [ ] Merge “Deprecate ApplicationController Route APIs” RFC
- [ ] Merge “Tracked” RFC
- [ ] Link to all Helpers in the Guides ([PR needs review](https://github.com/ember-learn/guides-source/pull/375))

## Minutes

RJ: I attempted to post the RFCs in advance as per our last meeting.

RJ: The first one re: forwarding element modifiers with splattributes was merged earlier this week based on the discussion last week.

### FCPs → Merge

### Deprecate Route Render APIs

RJ: Anyone opposed to moving forward?

RJ: There are a couple comments that CH replied to.

CH: I was able to address the concerns that were raised with some twiddles that showed that the scenarios could be solved with `{{in-element}}`.

MB: There seems to a scenario not solved by `{{in-element}}` in which you moved to another route in your example. The navbar would not be present.

GC: I believe that when we RFC’d `{{in-element}}` we said that we should not document this because it is considered low-level and that the average ember developer would not need to touch it. Do we still believe this?

RJ: I still think that is fine to say, but it is not clear how an addon author would know at all.

RJ: It should be in the same place in the API docs where we have action, etc. We need to document this.

RJ: On the guides side, we should probably at least *list* the canonical helpers and include this one.

MB: Ok, this seems fine. The person who raised the issued thumbed up CH’s response.

### [Deprecate Application](https://github.com/emberjs/rfcs/pull/421) [Controller](https://github.com/emberjs/rfcs/pull/421) [Route](https://github.com/emberjs/rfcs/pull/421)[r](https://github.com/emberjs/rfcs/pull/421) [Properties](https://github.com/emberjs/rfcs/pull/421)

RJ: The transition path is just to inject the service and use the same method names.

CH: Yeah

RJ: Anyone opposed?

RM: SHIP IT

### [Tracked Properties](https://github.com/emberjs/rfcs/pull/410)

RJ: We moved this into FCP last week. I need to review the comments to understand if there’s anything new.

CH: I’d like to understand how to proceed based upon the results of decorators in TC39.

GC: Can we ignore that greater part for now and discuss it in general later.

GC: The tracked RFC has the ES5 mode.

RJ: Yes it has that. It has support for classic and native classes.

YK: In today’s world there’s no decoration of the tracked fields. But a lot of people use a syntactic pattern `foo: null`. In most cases in an ember class they meant to write `foo: tracked()` .

RJ: Is anyone opposed to merging?

MB: Would everyone be happy if the ES5 way was the canonical way to write an ember app?

RJ: I think it’s still better than having to write `set` and all that.

*Long silence*

RJ: Ok, I will do that one too.

### [Contextual Helpers & Modifiers](https://github.com/emberjs/rfcs/pull/432)

MB: Should we consider a `(bind` helper instead of component-subtype-specific helpers for currying?

GC: I don’t know of any reason that you need to invoke it with one of the three helpers. Therefore, I don’t think you need an extra helper.

MB: I’m thinking that sometime the helper would be passed and sometimes it would be invoked.

YK: I think the way to think about this is that you are always passing. And sometimes, Ember is invoking that which is passed.

YK: Maybe this feels pedantic in the abstract, but I think it makes sense.

YK: The problem is basically that you used attributes a lot before args. You have a classic helper named `time-stamp` and then at a later time you started using a helper that passes an arg.

YK: For me, the killer is that for the problem to come up, you needed to first have zero-arg helpers. And this just isn’t that common.

RJ: The only other case that was semi-common was that ember-test-helpers made it possible to add a positional arg to every helper. But they are working to remove this (now that we have splattributes).

YK: What gives me pause about this is that I had some confusion writing examples. 

GC: I think we should move people away from the mental model that you need to use these to invoke. Everything is curried and ember is selectively invoking.

YK: The way we should look at this is that if there are args then it is definitely an invocation. If there are no args then there is some ambiguity.

YK: {{foo bar}} -> always {{(foo bar)}}

YK: {{foo}} -> a little more involved

GC: In fact, there’s no way to take this away because if pass a curried helper in a position then ember will invoke it.

GC: Take a look at the RFC to see all the cases we should lint against.

GC: Anyway, it all has the meaning that is reasonable in all the positions.

*No one opposed to merging*

RJ: Whee!

### Do all public API deprecations need  a deprecation RFC?

RJ: Do we *need* to RFC every single deprecation. This came up re: to `aliasMethod`

YK: I would say that RFCs depend upon usage. If there’s any doubt about whether a deprecation will cause unforeseen issues, we should RFC.

RJ: This one has just 15 usages on ember-observer.

YK: If the answer of whether an RFC will bring forward new information seems close to zero, then it’s probably ok to skip it.

RJ: Ok, I didn’t want to make unilateral policy decisions.

### Decorators

RJ: How do we proceed given the TC39 meeting?

YK: I think the Plan B is still active. There are implicit imports into modules.

YK: People could just use the babel plugin. And they could use decorators.

RJ: From a practical perspective, it’s tough to track our semver guarantees based on the presence of another library.

SP: Is it ok to bring the babel plugins by default?

SP: say ember-cli-babel brings the decorators plugin

SP: if the internal implementation of decorators changes, then it could be a major version bump of ember-cli-babel

GC: I agree that we should ship decorators, but I would like to do something more like jquery where we are “shipping by default”.

YK: If we want to start shipping decorators, then we need an RFC.

GC: I think we all agree that to use (native) classes (in ember), you need decorators. We absolutely will have a decorator ecosystem, and we need to manage that.

GC: Let’s end the meeting but find time for a decorator strike team.

RJ: The alternative is to keep shipping ES5 classes, which no one wants.

SP/GC: We probably all agree on this and we need to figure out tactics.

RJ: Perhaps we should discuss further in the Octane meeting.
