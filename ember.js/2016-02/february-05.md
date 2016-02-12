# Ember.js Core Team 2016-02-05

#### Topics

- Pods update?
- glimmer progress update
- Retiring legacy view addons in first LTS release (when is first LTS?)
- Get +1s for removing `ember-htmlbars-component-generation` [GC]
- Quick recap of feature flag policy [YK]
- next steps for https://github.com/emberjs/ember.js/pull/12575 ? [@stefanpenner]
- next steps for https://github.com/emberjs/rfcs/pull/97 [@stefanpenner]

SP will be a few minutes late, likely arrive around 11:20 PST or so.

## Notes

MB: Pods status?

RJ: Dan has been continuing to move ideas forward, but we need to circle around with Dan/Yehuda/Robert to see if we can move.

YK: Yes, I agree. I do not believe that my concerns are terribly complicated, so we can almost certainly come up with a good solution.

DG: I think that the module form that was proposed at the last meeting was the strongest proposal, and the main blocker was the presence of support for multiple supported paths. We should be able to close those loop holes.

**Glimmer progress update**

YK: We have a new testing harness that allows to better test both old htmlbars and new glimmer

GC: Example usage at https://github.com/emberjs/ember.js/pull/12914

RJ: Serabe has been reading and catching up

RJ: We've started porting adding tests to the glimmer package, and symlinking them to the htmlbars package.

YK: There are a set of test helpers that are available in each package as the implementation

YK: We don't even need a feature flag since testing the rendering can be done alone

RJ: If 2.5 goes to beta before this is done, we can mark the FF false and strip it out of builds.

RJ: I'm pretty happy with the progress. It is nice to have a better test harness to move forward.

YK: We implemented truthy and falsy semantics yeterday. Chad is doing some work. We have helpers working so people can implement helpers. Copying the helper over, then rewriting the tests.

TD: Are you running the node tests with glimmer and ember?

GC: We need to get to the point where we switch the renderer

TD: It would be nice, during the rethink in tests, if there was a way to say a test should run in node.

YK: we did one cheat (jQuery) that makes that not work, but it is a good constraint to keep in mind. Will think about it.

TD: We had a node regression, and I'd just like the testing to be better so we can catch them in the future.

TD: How is glimmer provided?

RJ: We import it and compile the TS code with Ember

YK: unrelated but there is a general issue with dependencies. "i need this asset to build" but that isn't a thing

RJ: I perceive the problems are solved, but lets talk offline about the use cases

YK: if and each have a symmetrical problem, the basic case is simple but the specific Ember implementation requires some protocol. Glimmer needs to be flexible enough that you can swap out some inner part.

RJ: each and components are the biggest things, once those get done I presume we can have others help make progress

YK: yes

RJ: I said this probably won't be 2.5, want to get your opinion on it. Not do the 1.13 rush

YK: a lot depends on how unstable it feels

RJ: whether is feels unstable or not I don't want to do it close

YK: There are fewer hacks than in 1.13's glimmer. Once one thing works many others should.

RJ: We're about a month from the cycle turnover (branch point)

KS: I understand the caution and that the last integration was alpha, that being said I don't want to discount talking about it at EmberConf

RJ: Right. I'm not saying no, just want to be cautious and get it right.

YK: I spent the day arguing with Mozilla about this. We should not be rushing it for anything specific.

YK: I think two weeks before with a small number of edge cases is ok. all apps would run on it at two weeks before I think. Must be feature complete.

**Retiring legacy view addons in first LTS release (when is first LTS?)**

RJ: Two questions: 1, can we retire legacy view addons with the LTS?

(much discussion)

RJ: 2.4 will be the first LTS release

**ember-htmlbars-component-generation**

GC: This feature flag has been disabled at this point, can we remove associated code?

YK: The issue is that we cannot support, the old glimmer v1 engine is broken in ways that prevent the tests to pass with this feature enabled.

SP: Feature flags are intended to be enabled/disabled/removed/etc, this is exactly what the point of feature flagging is.  We should remove it.

**next steps for https://github.com/emberjs/ember.js/pull/12575**

SP: Make test helpers fire native events instead of using jquery events. I want next steps

RJ: I want to merge right now

SP: I want to merge now and use it in real apps and test. It is behind a FF

go go go

**next steps for https://github.com/emberjs/rfcs/pull/97**

SP: Prefetch RFC for models.

(discussion)

YK: This needs to consider the programming model at large

SP: I want there to be an example or path forward for this. I'm frustrated.

GC: Let's review and read and revisit
