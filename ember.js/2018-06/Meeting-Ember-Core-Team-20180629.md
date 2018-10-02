# Meeting: Ember Core Team 2018/06/29

## Agenda
- Feature Review (RJ)
  - [Deprecate Globals Resolver](https://github.com/emberjs/rfcs/pull/331)
  - [Native Class Constructor Update](https://github.com/emberjs/rfcs/pull/337)
  - [Deprecate `isBlank`, `isEmpty`, `isNone`, `isPresent`](https://github.com/emberjs/rfcs/pull/334)

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[x] Dan Gebhardt
[ ] Godfrey Chan
[ ] Ricardo Mendes
[ ] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes
RJ: Class constructor RFC. Last week YK wanted a chance to read through this. I’d like to ideally move this forward, but it is ok if we need more time.

TD: I did not have time to look into it. I don’t want to be a blocker though. YK?

YK: I don’t think this is what I would have done, but I think this is good interop and I think whatever shook out of the work is good. GC and I talked about it for some time. My biggest concern is that whatever we pick here will lock us into a path in the future. RJ convinced me we might have something like a class manager.

KS: Right this is what the DI factory manager was supposed to be.

RJ: I think I saw a pretty well fleshed out gist. When you were working on that we hadn’t done the interop yet, we weren’t sure it was possible.

YK: I think we mostly thought we could have interop, but if that is what we have anyway is fine that is fine. I think maybe in two years we will have some oddness where if you extend from an Ember object you have concatenated properties and some other odd stuff.

RJ: I think `init` should be used less an less, as it is basically now a hook for “things to do after DI”.

YK: I think what that means in practice is that if you are interoping with Ember object the constructor is pretty random. If you want to see the whole story you have to use init. GC and I were concerned that that means most usage will default to init and the interop will be bad.

KS: Right, but in many DI systems there is common a hook for after DI, and construction is a different phase.

YK: Right. The main constraint I think we loose is that many people think it looks like an ES class and “it just works”. What this will mean in practice is that if someone uses ember for the first time and says “how do I write a constructor?” then people will reach for init.

YK: Basically my conclusion is that the nest step for ES classes is that you can use extend but not the constructor. I don’t want it to be niche. b/c other people use `init` you need to use `init` also. In some future state we will have something where you don’t need the ember base class but you get the constructor.

(some discussion)

YK: I think this RFC is good, I just think it should be clear that you cannot use the constructor because the rest of the ecosystem uses `init`.

KS: That is what this proposal is. It tries to get people to think there is a factory methods you can use if you want…

YK: Does the sub-sub class get the injections?

KS: The model is that if you go through the DI system it sets the properties after construction.

YK: Let me state some things I think is true: the constructor does not accept DI. There is some step after that which sets DI then calls init.

KS: Yes

YK: OK so if someone wants to do initialization with DI then the must use `init`.

KS: No, the proposal from the DI team was that we would define constructor injections. The bag of named/property injections was never the right model for `constructor` anyway. We should instead create a DI injection system for constructor arguments.

TD: Back to questions on the issue: There was a request to deprecate using `new` with an object argument.

YK: Ok, I am getting concerned with this. I don’t think we can make the design in the RFC be kind of what ES classes will do. I think the RFC should make extend work and fix issues, but not change the mental model of how initialization works.

(discussion)

YK: I have an ecosystem concern that people will state to think “oh it is just ES classes” but will try to use `new` and hit caveats and be frustrated.

KS: Out of all the things in the RFC I’m most iffy on the deprecation. People who try to use `new` already are wading into bad waters already. Most people use `create` or the DI system, in which case the proposal is fine.

YK: I’m worried about people going out an saying “oh Ember does ES classes” and want to put it in slides. But when you subclass Ember object a lots of things don’t work. KS are there cases where you want `new` and `constructor` in ember subclasses?

KS: There are just shaping issues you can fix. It is one thing for an app to say “I’ll use the new protocol” but addons are in a bad position b/c they generally need to support a wider version range. Some people have dived into this earlier than needed.

(discussion)

Action items:
- YK would like to consider not permitting `constructor` usage. ??? This is perhaps the item of contention
- TD we deprecate `new` across the board

YK: ok so I would like to punt this for another conversation

### Deprecate globals resolver

(MB gave an update)

RJ: I need help figuring out what the deprecation guides should say. I don’t think it is worthwhile to write a transition guide away from a globals resolver app.

(discussion: the deprecation guide would need to cover “use the owner API instead of `reopen` from `App.Whatever`" and “use files on disk instead of globals”)

RJ: gaurav also added a list of things the deprecation should do. If you can look MB that would be good.

### Deprecate isBlank and friends

RJ: There was some back and forth on the RFC here. I think the path is clear. Extract it from ember source and put these things into another package. I want to make sure we’re on the same page?

MB: yeah that is my recollection

RJ: Ok, I think I just confused myself. I will move it forward and FCP.

### Release

RJ: I got 3.2 released. I’m on the road but trying to get the betas out as well.

EF: I’m worried about cutting a beta from ember-cli master b/c it is broke.

RJ: I think beta is correct right now

EF: Right I wasn’t sure when we roll over

RJ: Right we usually do it at the same time. I could cut beta that is the same as release, but I don’t think there is anything in the current beta anyway. The package stuff is supposed to be property guarded to not impact anything without the FF.

EF: Yeah I think it is a bit of a mess. I would like to dive in and refactor it, and I have started.

RJ: I can just cut the beta from release. But yeah I don’t think cutting beta from master would help us shake out bugs or anything. We know what the bugs are.

(discussion, possible reversion of the packager work on master so we can cut a beta)
