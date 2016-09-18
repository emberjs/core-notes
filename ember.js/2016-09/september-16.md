# Ember Core Team 2016-09-16

### Agenda

- Glimmer Status [RJ / GC]
- [FCP for this upcoming week](https://github.com/emberjs/rfcs/issues?q=is:open+is:issue+label:"Final+Comment+Period") [SP]
- [FCP](https://github.com/emberjs/rfcs/pull/150) (factoryFor) [MB]

### Attendees

YK, GC, LS, DG, IT, MB, RJ, SP, MM, EB, KS

### Minutes

#### Glimmer status

GC: Robert has a better handle on this week than I do.

RJ: Handful of important this. Few issues and more are in progress. I think we need to have a glimmer pow-wow to get the significant items squashed.

- Partials (GC and chad have a PR)
- Attrs/Props

YK: For the next month I'll have less time on Glimmer but I'll be available for a weekly meeting.

RJ: The attrs/props are the lingering item. I will arrange a time to chat. I want it fixed before beta.3. I'll put together a doc as well.

YK: Perhaps I can put something together for a concrete proposal for F2F

(some discussions on attrs/props)

RJ: Fixed some ember island items and issues with flexi. Hopefully will move forward with that tonight. Ember-wormhole has issues with dynamic segments in the root of the wormhole. Liquid-fire is not yet released but EF is planning to release it tonight.

RJ: rough release is Oct 17th. I think we're doing well and I'm bullish on rollout for 2.9

GC: still any plans to land build improvements on beta? or saving them for next release?

RJ: Longer we go the harder it is.

GC: In the blog post we called out build size regressions, just wanted to get a feel on progress.

KS: I'm planning on it, but I'm hitting some tooling stumbling blocks.

RJ: The ember refactor stuff has landed, so if the build stuff can land it should not be big code changes.

KS: A lot of bloat comes from the way the glimmer stuff is build. It is mostly stripped of types but with some type cruft left in. It causes errors in the tooling. The linter ignores it but the tooling barfs. And there is some dead code that isn't removed.

#### FCP #146, resumeTest

SP: We have pause, often you want to resume: https://github.com/emberjs/rfcs/issues/146

RJ: Seems good, there is a PR as well? Yes: https://github.com/emberjs/ember.js/pull/13663/files

SP: It just allows the pauseTest promise to resume.

#### FCP #150, factoryFor

MB: Basically expresses the strong consensus amongst the group on how to proceed

(much discussion)

- `.class` should be the ancestor class and not the double-extended class
- `instanceof` for the result of `factoryFor` should do what? I think throw.
- General rule: you should not use anything except get on `class` and `create` for a factory object

#### Router service

- Need to plan for F2F, lets identify blockers. With EF. Seems like the publicness of dynamic variables and how to unroll models are the last items.
