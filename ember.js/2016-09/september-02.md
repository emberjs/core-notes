# Ember Core Team 2016-09-02

### Agenda

- Glimmer 2 Status [GC]
- Build Refactors
- FastBoot 1.0 Status? [GC added this]
- LTS support blog post https://github.com/emberjs/website/pull/2673/files

### Attendees

MB, DG, GC, RJ, MM, YK, TD, LS, KS, IT, EF

### Minutes

#### Glimmer

GC: We flipped the flag. Robert fixes remaining test. Need more for engines. We have a few bug reports since flipping the flag, seem like small things. I ran benchmarks on Skylight and we've been steadily improving from 2.6-2.9, with 2.8-2.9 having a notable impact. That is a lot more stuff than rendering, in particular the eval of the Ember payload has regressed which Kris and Robert are working on.

RJ: Kris is doing a lot of build work and I'm doing code restructuring. If you require a thing go through a common package entry point etc. The goal is for each package to have an entry-point and that entry-point will not export globals but will export the things needed for globals. Then we can create the globals based on a config and tweak and play with settings. To the file-size point Kris's work will help more. Rolling up each package into a closure without internal packages. It is a non-trivial impact and should help. I hope to get 2.9 the same size as 2.8 or smaller.

GC: It is only b/c we have more modules or something else? We fixed the babel helper duplication etc.

KS: That was around before, but yes you are using it a lot more.

YK: Can we try alternative compilation strategies for internals?

KS: I have a refactor and can generate our own helpers etc.

GC: I'm not proposing solutions, just trying to get to it. Is the filesize the main issue or just one of several issues?

KS: I was seeing a dramatic increase in transition time in a simple test, like an each over 100 link-tos. The rendering time was massively improved by the loading time regressed so bad that rendering time gains were lost. I don't know if it is only that but there are a lot of strings just as module names. Deps re-exports etc.

YK: I've been talking to a few people about a new resolver API that we could maybe run on the server. We could do things like all deps are a integer key into a list.

KS: This is like the reparse

YK: Right just getting rid of the runtime string splitting and strings etc would help.

KS: I tried and the private loader stuff from addons hurts

YK: We can make resolver 2 opt-in

RJ: I will help migrate things

YK: We talked about making it opt-in via the `src` directory.

KS: I tried migrating to Babel 6 which has some nicer APIs for custom helpers etc.

YK: I'd like to explore a new resolver that could statically run on the server. Glimmer templates could resolve components/helpers eagerly on the server-side. Does it seem reasonable to explore and RFC?

RK: Yeah, an RFC would clarify it.

YK: I will work with DG on it.

GC: Quickly the context is that a few meetings ago we said the next sync point is 2.9 beta which is on Tuesday after labor day. We didn't talk about it last time so lets.

#### FastBoot

TD: Stef isn't here today right? Ah he is on vacation. I don't know about 1.0, we were talking a bit but there were extension points in Ember-CLI we needed. It would be quicker for him to add them than me, but we kind of got blocked on other things. If the hooks were there we could move forward but I'm not sure where we are now. I agree adding fastboot and having the build time double is bad, but...

TD: I guess I don't feel comfortable making the call without talking to Stef.

YK: I think you need to make the call on timing. It exists.

TD: There are people using it in production.

YK: you could make compat guarantees without 1.0

TD: I think this thing will mean changes for almost-ready-to-ship teams though. There is a thing with two directories for env-specific items. I'm not crazy about supporting the old system at the same time as the new system.

TD: I think the longer we have a 1.0 RC the more people we will get more people on board.

YK: I think you own it. If you're ok with doubling build times etc seems ok.

TD: I think punting a release might be ok- There isn't PR pressure to hit the 1.0. 1.0 will make people pay attention and if it is a poor experience we are in a bad spot. I think stef will do the work as well. I suggest deferring until the next release, 2.9 final.

YK: To be clear everything works now. The issue is build times.

RJ: I think we could ship. The issue is there is no way to signal to users that there will be a breaking change.

YK: We want 1.0 to signal you can use it and it is a good experience. The current state is you can use and it isn't a great experience.

TD: If we wanted to cut a 1.0 there is still work to do anyway.

RJ: We did announce a date in our EmberConf slides.

YK: yeah we should not have announced a date in the first place

(robert would like to ship 1.0 b/c there was a date goal, YK is ok with blowing the date and focusing on a good 1.0)

TD: The thing about shipping a major rev if that you can build upon it. This isn't as similar. Addons building on fastboot won't change that much with stef's changes regardless. We could ship it and say we will fix it in a point release but I'm worried about he quality.

YK: Seems good to be.

TD: There isn't tons of angst about it today. And this is weird since stef could be working on it now.

DG: We could use the module unification as an opportunity to change behavior.

RJ: We should also consider unification in general.

TD: Can we punt to next week?

YK: That is a decision to ship with 2.9 final I think

TD: Please keep in mind the number of apps with env specific initializers is almost zero. It is almost only addons.

YK: Only supporting 2.9 would be neat with only support for Glimmer2. But you likely want to support the LTS.

TD: Ok let's punt.

#### Node LTS

RJ: tl;dr is we are supporting the node LTS for master. Past versions won't get support for new versions of course.

RJ: Fastboot assumes node 4 and if it detects and unsupported platform it will do a transpile on the fly.

YK: It would be great to have that as infrastructure for elsewhere.

TD: It is a package

YK: I image you could target node 6 or node 4 etc.

(discussion about semver, node LTS policy etc)

#### More glimmer

GC: Also we removed htmlbars code from master. Exciting!

RJ: Right it wasn't being tested etc. Fixes for LTS etc will need to happen on those branches. I didn't want for anyone to chime in but feels good.

GC: I was a lot of code.

YK: There might be even more.

RJ: Kris was working on a graph to visualize dependencies

GC: I be there are mixins no longer being mixed in etc

YK: Is there a ways to get a viz of dependencies when you point it at a JS tree?

KS: No tool, thats what I'm building. I'm using the output from TypeScript to create the graph. It does all the resolving and import/export stuff from ES6 modules. The build build I'm doing is build an ES6 tree and analyze the ES6 tree and this allows us to pick and configure strategies.

YK: So it sounds like the tool does exist it is TS

KS: Well I'm making the engine that goes from TS -> dotfile but yeah

YK: That is really exciting I want to use it.

GC: One more item not an agenda moment. Is this the right time to start looking at Glimmer components again?

KS: Maybe the RFC but there is still a significant amount of finishing work. I'm not confident about the test coverage when getting down to sub trees. We're not done. It might look like busy work and not visioneering but

YK: I think GC is suggesting we start inching toward RFCs because we will get to the end of the cleanup work and not have anything in front of us.

RJ: Starting on RFCs would be really great to start. Getting the process started now would be great I think. I would be surprised if 2.10 was not only a bugfix cleanup speedup release but...

GC: The base implementation is in there so we could validate

EF: We also have module unification ready for work, we don't run out of implementation stuff

YK: A nice thing about RFCs is that entanglements become clear very quickly.

RJ: Right I want to work on mod unification and testing clarification next. My intent is to separate these concepts from the main app as addons for experimentation etc.

(discussion of resolver v2 ideas and module unification, where and how they may overlap)

#### Router Service

EF: got the changes in, the last items is regarding splatting models and if we can reform existing APIs as well.

RJ: current private routing service does this. The issue is the inconsistency. Either deprecate all the old ones or do something. My preference is just to be the same across the board.

EF: Right this is that chance. We can add deprecations for bad cases.

YK: Did it turn out there are enough ways to build all the helpers you want for routing?

EF: Seems like we can build them all they are listed in the RFC. We may want to ship them.

EF: Other things I'll add is if we're changing semantics for how to pass models we could always make them params and run model hooks all the time. Today you can pass ids or models to transitions. Ids run the model hook passing a model doesn't. People get confused. The argument is that you handle the caching at another level like the data layer.

RJ: You need a transition plan for that.

EF: I can see the migration being confusing. calling transitionTo on a route doing a slightly different thing than on the service.

RJ: In the RFC you propose making a public API for the outlet state stuff. Where do sit with the feels on that API

YK: I think GC has some thoughts

GC: We are out of time

RJ: As an aside I'd like to not stop staged implementation if we can. I think it would make it easier to iterate.

YK: I think landing anything behind a flag is fine.

GC: If I'm doing glimmer experimentation should I add a flag?

(some discussion of details here)
