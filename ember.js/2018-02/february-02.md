# Meeting: Ember Core Team 2018/02/02

## Agenda

- `const` vs `let` - performance benefits in V8, type inference benefits in TypeScript (TD/KS)
- Ember 3.0 checklist (RM)
  - https://github.com/orgs/ember-learn/projects/5
- FCP ModelData https://github.com/emberjs/rfcs/pull/293
- Decision on https://github.com/emberjs/rfcs/pulls?q=is%3Aopen+is%3Apr+label%3A%22Final+Comment+Period%22 (RM)
- Needs Champion
  - https://github.com/emberjs/rfcs/pull/298 (RM)
- firstObject/lastObject/[] + array prototype extensions

## Attendees

- [ ] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler

## Minutes

### Ember 3.0

RM: 3.0 is in ten days, a week and change. I want to identify blockers.

- blog post (MB, RM)
- extra blog post on marketing (TD, YK)
- legacy addon
- search for the API docs
  - Ember data side has an issues with the builds
  - Guides are mostly ready.
  - We have infra challenges moving the site to Ember apps, but we will not do this during the 3.0 release.

(please add to https://github.com/orgs/ember-learn/projects/5)

RM: There is a project on the learning team dashboard, adding notes there would be good.

### const / let perf in v8

KS: When you have a closure const plays the same role it does at the top level. None of the closures below it can mutate it. This is what TypeScript uses it for.

KS: I discussed this with YK and he is not worried about this being done to satisfy cases with TypeScript. Maybe we can get tslint to only permit it inside closures/functions.

GC: I don’t think there is an off the shelf rule but we could probably make one.

KS: I’m not sure, since you need to evaluate the flow of the code to write the rule appropriately.

TD: If I recall the issue of const in a function being disallowed is that it is annoying to refactor.

EF: No, I think it is about const as a signal for refactoring being permitted or not permitted. For example the reason the top level is ok is because it would be super trolly for you to change the variable.

KS: And with lots of closures that can happen inside a closure. This is also the only place where I could imagine it being a performance benefit for const.

EF: They already remove things you don’t use anyway. You can drop a debugger in and things not used are missing.

TD: It seems like it would be difficult to evaluate.

KS: It would mean a closure doesn’t need to know about use or not. anyway I think inside closures `const`  can identify taking the value from the outside.

(discussion)

RJ: I don’t think we have quorum to make any calls here.

TD: I think we have some agreement that there may be appropriate places for const inside closures.

RJ: I would find it very annoying to change styles when moving between codebases. I’m super annoyed about being inconsistent across the board.

EF: I would be annoyed if we went to far to the other extreme and require const if you are not mutating.

### Proxy assertions variant 1

RJ: The one on beta is a descriptor trap. I implemented changes from GC an YK etc. All reported issues have been resolved. I’ve heard nothing since beta 4 or 5.

GC: I change the message for Kris and I think you changed it this morning?

RJ: Yes and I’ll be sure it gets into beta.

RJ: I also made sure ember-data tests are running on Chrome. They were still on phantom to issues with the proxy assertion were not actually triggering (no proxies in phantom).

(discussion)

GC: Cool, I raised this b/c it was a 3.0 blocker. I think we are good now though.

### FCP modelData

IT:  I want feedback on the naming, and perhaps we can FCP

(discussion)

GC: We can FCP and merge leaving open a name change. I don’t think it is a blocker for FCP.

RJ: I’m in favor of FCP, I don’t think changing the name later is damaging anyway.

(discussion)

TD: Turns out SproutCore called them SC.Record

### RFCS

RJ: I will comment on https://github.com/emberjs/rfcs/pull/287 and also get YK to fire a salvo.

RJ: I will merge https://github.com/emberjs/rfcs/pull/294

RJ: I will merge https://github.com/emberjs/rfcs/pull/284

RJ: TD and I need to pair on https://github.com/emberjs/rfcs/pull/158 https://github.com/emberjs/rfcs/pull/153 https://github.com/emberjs/rfcs/pull/122 I think we need to close, and communicate. Some should be merged, some closed, some are simply in addons already.

### Component lifecycle RFCs

(discussion)

### Backburner

RJ: I have done benchmarking around my change ahead of my runloop RFC. I don’t want to backport it further than canary. In theory with this change we can remove the autorun assertion. Combined with settled.

### Array prototype extensions

MM: I’ve been trying to remove the need for these. Most of the methods are easy to remove, you make a function you pass the array into. Also there are properties on the prototype, @each etc. Just to watch. b/c they aren’t intended to be “get”ed they can just be moved into chains.

MM: firstObject lastObject and [] are the hard ones. Like some people pass `foo.[]` into a helper to ensure it updates when the contents change. I’m curious how many people use firstObject / lastObject.

RJ: I though the path was: Make it work without a prototype extension, and after we’ve proven it then we can decide what the deprecate/remove.

TD: RJ’s point is that we don’t need to worry about what people use, we need to build the hot path.

(discussion)
















