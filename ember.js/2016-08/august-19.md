# Ember Core Team 2016-08-19

### Agenda

- (LS) Updated Getting Started Video to replace outdated one, any comments or thoughts?
- (SP / RJ) [RFC for Hook/Event for Transitioning During a Transition](https://github.com/emberjs/rfcs/pull/126) --- Propose final comment period... 
- (RJ) Enabling ember-glimmer feature flag for canary. (public)

Blockers for rolling to beta:

             - [ ] Migrating & fixing all remaining skipped tests.
             - [ ] Review and comment on all open "meta" issues.
             - [ ] ???

### Attendees

AM, DG, EF, GC, LS, RJ, TD, MB, YK

### Minutes

#### Getting Stated Video

YK: Seems good, Gavin is great and this is based on the github app

MB: Uses ember-data github

YK: Yeah that seems less than ideal

TD: the ideal would be to have the intro video not use ember-data at all, and have a second one that migrates the code to ember-data

TD: #millenialshaming, we should optimize for a short video format

YK: DHH's 15 minutes video is not compatible with the way we share and talk about things to today. I agree.

TD: They are also linkable, each section would be "I want to think about this"

YK: If you want to make smaller videos you need to think about what discrete chunk of knowledge you're teaching

RJ: Unless I missed it, also this does not talk about tests

YK: It is hard to do tests in 15 minutes

TD: If you chunk it up, you do it as build the feature and test it.

YK: I think if the chunks get too long (10m) it seems difficult

GC: Five minutes sounds better

TD: The marketing message angular had with testing was really powerful early on. We can probably use that to our advantage now especially if we have the improved testing items.

GC: Anything we can do to keep it up to date?

YK: For me screenflow has been the only thing useful. I'd like a tool that let you script this. Applescript can do stuff like this.

YK: If you restrict it you could likely build something. Making it generic is what is the pain in an ass.

#### RFC for transition event

RJ: I'd like to FCP this

YK: I have some blocking thoughts.

(discussion)

YK: There are several hooks in that space, and I'm hesitant to add another one without understanding the impact on teaching, or knowing how to steer people away from it when they shouldn't land there.

KS: It overlaps with the routing service right?

EF: There are things in this RFC that take private objects and makes them effectively public. They would also need to be documented and thought about.

YK: Ed does your RFC cover this case?

EF: Not as written, no

(discussion)

KS: The router itself being an interface is kind of hap-hazard. This RFC exists b/c a side effect is important for tracking but it isn't observable. In some of my apps we're overriding a private method to get access to things.

YK: I think the routing service is the better place to add cross-cutting items

MB: I will make some time to help Edward push it forward.

RJ: There is a decent amount of work implementing a chunk of the RFC as it is currently written. The bigger issue is getting the design stuff finished. The stuff implemented doesn't need to be re-done.

EF: One of my takeaways from last time was that the link-tos should not be using the service for sideways bindings, it should be coupled to the outlet states.

KS: By doing the outlet state we also have the timing we expect visually with the URL.

EF: Right is helps timings for animations and improves performance.

YK: Seems like main action is to move the routing service RFC forward. The author should contribute to the routing RFC.

EF: Copying the current API leaks into the public/intimate API surface shouldn't be done. I think this is "scratch and itch" and that is why the RFC might be getting a bad reaction.

EF: If he wants it to be separate as an RFC that is ok, but it should be in terms of the routing RFC.

(discussion)

#### Enabling ember-glimmer feature flag for canary.

RJ: Last is glimmer status and stuff. I have some specifics and some feedback. Anything else first?

nope

RJ: I ran through testing the top 25-30 addons. All but I think all but five are passing:

- liquid-fire
- ember-concurrency
- two addons using select behavior YK/GC just fixed
- ember-cli-flash (ember modal dialog)
    - if you yield a block param with the word "component" really bad things happen {{foo-bar as |component|}}{{component.title}}
    - this was the only addon with component unit tests. You can't do componentInstance.appendTo and have it work today. The instance have no template etc.

YK: I think using a built-in name is kind of like a keyword

YK: I think locals winning is like every language with lexical scope. It is a bug that it doesn't win today. We could add a warning.

RJ: Seems knowable and managable

KS: Re: the unit test case I know what I need to do for this. It is annoying since it is only test.

RJ: I'm wiling to deprecate the whole idea of non-template test, but we can't break it

(discussion)

KS: I wish template had always been the entry point for the rendering system. All these use the isolated container right?

RJ: Right, if the question is do they always have DI then I agree. If you create a component outside of DI I don't think it needs to work.

RJ: I think you could do it, if there is no "owner" set everything up like there was one but it seems like a lot of code with very little benefit.

(discussion, ember-islands)

RJ: I would like to enable the flag on Canary with a few blockers on going to beta:

- All the remaining skipped tests (10-15) need to be enabled and passing prior to branch point.
- Fastboot. It is a supported feature we need to have it.

YK: I need tom to clarify, but, getting fastboot working doesn't have a clear meaning. And example: people tell me updating needs to work. Updating can work, but updating in some cases doesn't work on htmlbars. We're fixing bugs like making append-mode input values actually work.

KS: In today's system htmlbars just always sets attribute since there are no props

YK: I think the issue is that rehydration doesn't work so maybe it doesn't matter what shenanigans we pull. tl;dr updating attributes doesn't work right now, we can do whatever have you want and make it work, but I think the needs are smaller.

TD: We allow data fetching- the fastboot service can pause rendering

YK: We can just set attributes in fastboot mode, however if someone relies on the attribute being present it would be broken later. If the server sends the attribute down but on the client-side we would not set the attribute, we will have differing semantics between the server render and client render. This matters more with hydration, less if the goal is "no javascript" mode.

YK: we have decided we can get away with setting attributes in SSR b/c it just works. However on the client we sometimes use properties because there are bugs or quirks setting an attribute.

(discussion, some re fastboot and attribute v. prop rehydration, some re: deprecation plans)

YK: Things like onclick= are not so bad b/c the server sends back nothing. The problems cases are things that are visual when attributes and not when properties, and being stuck on a bad upgrade path.

YK: Since fastboot 1.0 wants to be stable, maybe fastboot can do deprecations for this.

YK: I'm saying if the updating step on the client wants to use a property, and that property would not set an attribute, when the server should deprecate setting the attributes.

RJ: What is the list of onlick value aren't options?

YK: Constraints for SSR are that you need to see the output, and that it needs to be the same when rendered on the client. So if value is an attribute on the server to be visible but is a property on the client, how do we communicate the upgrade to Glimmer

KS: I think some things you will just need to create on the client-side

YK: I think it is ok if people don't expect they can see all things with their eyes.

KS: I think forms are a good test suite and strawman for thinking about how to restore these things.

YK: I think a strategy of sending down the initial value and pulling a switcheroo to set the attribute back to the original value on boot will work. and pray it has no jank.

DG: I'm concerned about forms anyway. A user can interact with form elements and it isn't clear.

TD: You really want to let devs control this. You can add a class to the body and control animations

YK: You can't make form inputs disabled though, which is what you kind of want

MB: If you're doing the switcheroo you can just ship disabled from the server and update it to the original state when switching

YK: Kris wanted me to talk about how every element/attribute already has a policy for set attribute and update, we can make another step for rehydrate with special behaviors

(much support for using element modifiers to run code at didInsertElement time on the client-side during fastboot)

YK: The timing around fastboot and glimmer it coupled. We should not consider this a blocker for Glimmer in 2.9, however we should consider it a blocker for Fastboot 1.0. Tom and I can have a conversation to de-risk that, and I think we can do that.

YK: Or we can treat rehydration as a new feature, and ask people to make changes to make it work. It doesn't seem to violate semver but the curn would be less than ideal.

GC: We need to talk more about technical things. RJ what do we do with the node tests?

YK: Chad is working on them

KS: Yeah we need it at linkedin

RJ: My proposal is we enable the flag with the tests skip and the blocker to leaving the flag enable branching to beta is enabling those test

YK: The current semantics for the flag are "just enable the flag" if it gets to beta. Alpha is kind of like a new channel.

RJ: My mental model of alpha was different. I should be canary plus some flags that are off.

YK: We discussed the possibility of having an alpha state. that would not mean rolling forward.

TD: The visit api running in node is a public API, needs to be supported

GC: The visit node test has some monkey patches from half a year ago that obviously won't work, and chads work must be landed first.

YK: The current policy is that we won't turn the flag on until the feature is g2g.

(some technical discussion re: how to get fastboot's dom helper to be compat with glimmer2)

YK: I'd like to turn the flag on after the weekend.

RJ: We have until next monday at least.

GC: That seems like everyone can push toward that

YK: It seems like a layup, we just need to do it.

Blockers on enabling flag:

- Node tests
- getBoundingRect used by ember inspector, that is marked public (get inspector working)

KS: All getBR needs to do is ask the renderer for the bounds. The issue is the need the nearest bounds, the appendable.

YK: I will work with teddy to get it done this weekend. Either we will make the API work or we will make a new one and figure out what to do with the old one. The issue is we need the tree but we don't have it any most.

KS: The mustaches all have bounds, if we can get those we can make the rest work. the dynamic scope has it

GC: Those are my hard blockers, there are some soft ones like performance I'll keep working on.

RJ: right now we're 15-16k bigger.

YK: I wonder if the templates savings will pay off and still be a win.

RJ: yeah based on how many templates you have

YK: Yeah the win will pay for itself in real app. I'm not claiming we don't need to worry about it

GC: Know anything about i18n?

RJ: I made a couple of patches, they were basically using the old streams API for legacy stuff. Not for new version of Ember, but they had some things at module load time.

RJ: I offered to help strip the stuff based on version.

GC: Also the mount keyword needs to work

(some discussion of engine template lookup)

RJ: Ok, I will organize a sync up next week for remaining blockers.
