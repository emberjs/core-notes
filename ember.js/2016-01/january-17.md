# Ember.js Core Team 2016-01-17

#### Agenda

Sun Morn

- Security Team (Tom)
  - Annointing New Members?
  - Key Sharing Party
- Ember 1.13 -> 2.0 transition pains (Stef)
- LTS Release #1 (Yehuda)
- Ember 3.0 deprecations (Trek)
  - I'd like to start the discussion now about what can be deprecated now (replacement exists or we simply don't recommend a 1.x holdover) or soon (new programming model invalidates existing pattern) to avoid some of the 1.13 -> 2.0 pains (see above). Pretty important for Guides contributors (deprecation is a signal to audit guides for removals/updates)
    - _DON'T_ want to bikeshed specific deprecations (we can do that in core calls), just hoping on consensus on whether this is the inflection point for starting some of these.
    - Major release ~ 18 month cadence 2.x  Thu, 13 Aug 2015 -> Mon, 13 Feb 2017
    - Remaining Releases  (9)
    -  2015-03-04 2.4   2015-04-15 2.5   2015-05-27 2.6   2015-07-08 2.7   2015-08-19 2.8   2015-09-30 2.9   2015-11-11 2.10   2015-12-23 2.11   2015-02-03 2.12
  - \#soon classNameBindings
  - \#now reopen/reopenClass
  - \#now Ember.CoreObject (previously used as super class for Set/Object, could just be moved into Object, but needs to be deprecated; unfortunately marked @public)
  - \#now ArrayProxy
- How to deal with Ember.js performance frogboils

Sun Afternoon

- Glimmer 2 Status (Godhuda and Stef)
  - Demo (Godhuda)
- FastBoot status update (Tom)
- Internationalization / Localization (Leah)
- EmberConf
  - Keynote plans (Yehuda)
  - Overview (Leah)
- Ember Data (Igor)

### Notes

#### Morning Session, Day 2

## 1.13 -> 2.0 transition

SP: If we make 1.13 an LTS, does that make 2.0 an LTS too?

YK: 2.0 is very much not an LTS.

EB: Announcing a 1.3 LTS would go well with an official upgrade guide.

YK: I don't want people to think that the Glimmer --> Glimmer2 upgrade will be as invasive and radical as HTMLbars --> Glimmer. I think people have forgotten how big, yet smooth, the HTMLbars transition was. Glimmer felt rougher because we tried to make many programming model changes due to the run up to 2.0.

MB: The 2.x LTS will be the last one that is compatible with the view and controller compatibility addons.

YK: Yes. Any helpers that do context-shifting in Handlebars templates need to be removed before Glimmer2 lands. `{{partial}}` still exists and we probably can't rid of it, so that sucks.

YK: Glimmer2 100% assumes that the lexical scope is known at compile time. Matthew, your talk at EmberConf UK explained why that was the case. If we have any context-shifting leftover we may have problems.

\<discussion on whether controller context shifting exists in Ember 2.0 w/o addons>

EB: It would be nice if we could extend view and controller support throughout the 2.x lifecycle. Large apps are not going to be able to refactor it away.

YK: Which features specifically?

EB: ArrayController et al, itemController with itemView

YK: It's possible so long as the template features don't introduce dynamic scope.

\<discussion>

## LTS

YK: So, correct answer for LTS is that is should be the release before glimmer 2 (seems uncontroversial). Problem is we won't know that glimmer 2 is good to go until the start of the LTS beta cycle.

\<some discussion about the timing of when to declare a release an LTS, and how to deal with the timing>

\<discussion re: dependable LTS cycle>

### Points of Consensus

- 1.13 had mistakes, and was rushed in before ready
- First LTS in 2.x will be 2.4 (thus, second LTS will be 2.8)
- LTS releases happen six weeks after the stable release. 2.4 will be released as normally expected, but an LTS branch will be maintained for six weeks before 2.4 is considered LTS.

## Ember 3.0 deprecations

\<Kind of turned into a wishlist in the Agenda>

TG: talked about how 1-2 was painful. Lots of last-minute/backloaded deprecations. I'd like to start looking at 3.x deprecations now. Deprecations have real overhead for docs/guides etc as well

TG: going by our 18 month cadence, we have 9 releases between now and a 3.0. I want a discussion and perhaps consensus about starting 3.x deprecations.

YK: I agree basically with what you are saying. I wish we hadn't screwed up 1-2 so badly that we could just do a yearly. I wish we could just have a yearly process where no release breaks your stuff so much.

TG: That would take us to 5 releases which would not be very many

YK: We should always be thinking about them. Basically "hey guys we made everyone so angry with deprecations so we took a break lets start thinking about it again"

YK: should include a path away

TG: right, some don't need that anyway. For example `ArrayProxy`.

YK: the bar for deprecation guides should be higher. They should have more than one scenario that is discussed.

TG: Found much of these things via an API docs audit. Old integration points for removed APIs etc

TD: On core we can be poor on process. Checklists etc for contributors would be helpful.

DG: is the role of a "doc cop" useful?

EF: I like the idea of trying to share the load and let people claim ownership

EB: Dunno what people use for managing issues but we need a tool.

EF: would be a great to have a bot for doc review

YK: high-five will assign thing

RJ: high-five hurt my brain

TD: do things manually with the intent to automate

RJ: I can look at high-five

TG: In future meetings we can discuss specific things to deprecate/remove

### Points of Consensus

- Deprecation transition documentation should be more wholistic, provide more than one case for example
- We should start to consider and make some 3.x deprecations

### Action Items

- [ ] Ask the docs team to create a list of issues for review and discussion, after they are already digested and understood by the person presenting them.
- [ ] Look into high-five integration (robert!)

## Frogboiling and Perf

KS: I want to track performance on every commit. LinkedIn may support. I don't know if there is anything OSS/docker/something.

KS: I've been seeing network time as a significant thing. Vendor is big for apps.

YK: tracking for each commit can have an adverse impact on design. Cannot gate new features on size, they will always add size. We need a strategy to make things shrink.

DG: measuring the size of ember with and without deprecations may be more useful

YK: Yes, svelte builds

KS: Those are harder than you think. Flagging code you plan to remove is harder than things you add.

KS: wants to measure boot time not just size

SP: we could just run it through v8. Perhaps see the size of the AST and use that as a proxy for complexity.

YK: an mvp of deprecation flagging (for something simple like legacy each) would be low-hanging fruit.

TG: I suggest arrayproxy as an easy one!

RJ: I will pick up the svelte build tooling for deprecation

SP: I want someone to product manage this

YK: Let me and leah talk about it after

SP: I'm going to make a meta issues and lock it for build things I want to do over the next few months

\<technical discussion re: what things are in builds that should not be in builds>

### Action Items

- [ ] Robert will move on svelte building Ember
- [ ] Yehuda/Leah will talk about project management for svelte

#### Afternoon Session, Day 2

## Glimmer 2 Status

GC: Last week GC & SP did a bunch of work integrting with ember

GC: Going to add glimmer integration as a package to Ember. In the short term builds will not include glimmer, but we will have a canary FF to enable it

YK: A huge amount of what was in Ember's HTMLBars integration is in Glimmer. The Object model is tricky and will come back

YK: we have curly curly components for example. With, each etc are all implemented in glimmer. If you look at integration in ember it is very Ember specific (making array proxies look "empty" for example). The tests in glimmer are ported versions of tests from Ember. Also have implemented all lifecycle hooks. The details are much better tested for these.

EB: The plan is to get the tests passing in Ember?

YK: right we will port some

RJ: good point that glimmer tests run in Ember's suite

YK: I changed the tests to be more like a DSL since many talk about the same things with different syntaxes

YK: in glimmer 2 the component lifecycle is not managed in Ember. It is internal to Glimmer.

\<many jokes about self-control, self-awareness, defining "self" or context>

YK: one thing in glimmer is I basically copy/pasted test files from metal and re-implemented the object model in glimmer. I feel confident it it 80% and fixes many problems in the current model. However glimmer itself does not rely on that at all, and I don't suggest we port to it immediately. change notification is based on value, isDirty and get so the interface with any ember-specific solution is small and we don't have pressure to change much.

YK: In glimmer2 we only hook up a granular observer when a path is "hot". The first pass implementation will probably be dumb, just hook up observers on the second render instead of the first.

YK: to be clear Ember objects have not changed at all and will not. I'm really talking about streams (in Ember) and references (in Glimmer).

YK: what I hope happens is that we intergrate glimmer with a shim for Ember's model. The glimmer model is faster and I intend to make it 100% compat with Ember's, but it is not the high-order bit for performance today and we should ship the shim and better rendering first. The object model stuff is in another package and will not be shipped for any immediate integration.

YK: object model stuff was motivated by trying to get a good baseline for performance

\<server uptime demo based on github activity chart. Demo has ~4k components>

\<demo glimmer template compiler visualizer>

GC: Integration!

TD: Do we need an isemberfastyet?

YK: Yeah. We have not run the tests yet to see how many there are. isemberfastyet is good for milestones

AM: you mentioned transactions when rendering?

YK: when you start slots for scope are cleared out and they are added back in during rendering.

\<some discussion of using try/catch and resetting transactions to flush bad state left after a failed render (due to an exception in a render hook)>

RJ: The current flag puts both engines into builds

GC: I will make sure this is fixed

GC: After the next release we can merge a PR with this

MB: What do the hooks for integration look like

GC: They are a bag of hooks to be fulfilled. The list is much smaller than Glimmer1

SP: I think there are many tests that should move to the glimmer repository.

RJ: and glimmers tests are run with Ember so that is reasonable.

EB: things like env it sounds like you can run glimmer's tests with various envs

SP: glimmer tests also test intimate APIs

YK: it seems ok to make any non-low-level tests more generic

TD: I have a question about how to talk about this

YK: you should talk about promising results etc

EB: Is there an arch.md or something? I want to be able to talk about it

YK: there is not yet. if there is it is out of date. I continue to want this to be something other people can use.

### Points of Consensus

- `@foo` in templates should not be exposed in the near future

### Action Items

- [ ] The feature flag in beta/stable should not include both engines (GC)

## FastBoot

TD: Status update etc. General status is things are good. Most blockers were design considerations. The biggest thing that doesn't work in real apps is network requests. The way you acces the network in node is very different than in the browser. There is an ember-network addon now that implements `fetch` for node and the browser. Very close, just need to do some stuff with npm packages. For a client I had a fastboot in prod since mid-december. It has not gone down or crashed (with a req every second or two for the whole time).

TD: The remaining big items blocking people using it in production. Ship ember-network (ember-data has always worked). The other two major things are a fastboot service that allows you to see request headers and auth from inside the app (needed for dashboardish things). The other is specifying OG tags, meta tags, etc (for public websites). Both will live inside the Fastboot addon.

\<demo of a plugin for Ember-CLI deploy>

TD: started this project with the goal of taking any Ember Fastboot app and deploying it to production in one command. Just `ember eb:provision && ember deploy`

\<many bikeshed are painted on the nicest backend and tools to use for hosting>

TD: My hope is that we can release FastBoot 1.0 at EmberConf

## Internationalization

YK: to motivate, regardless of if we are going to do this people are already doing it. There is some value in us sheparding the process.

LS: We have someone who is taking initiative on translating things. They have some experience <reads an email from the person>

IT: Are there examples of projects that have successfully done this?

YK: Basically big things like Ubuntu.

YK: Important to note three categories: Don't know english, have perfect fluency, or can struggle through. This effort best serves the last group, who can combine parsing the most recent info with a complete translation of older info.

TG: I don't think I've seen this done with any project at our cadence. We need to be comfortable with it getting slowly out of date.

LS: these people should probably be on the docs team etc. But yes.

TG: There are a few services that allow for translation maintenance by the community. But it will still take some effort manually.

IT: we should scope on high-value langs

LS: yeah but we need to scope on ability and availability

LS: we have people from Japan, other people so far are just interested

IT: meetups would probably engage.

LS: I will keep the fires stoked. Limit it to one or two langs and a subset of content at the start.

SP: Also technical writing courses happen in other languages, they might be useful.

LS: Once we have languages we can probably get help.

IT: StackOverflow did Portuguese first

YK: Let's see where the dark matter is, like a Chinese one I saw.

LS: This would be an OK RFC as well, how we want to handle translations.

SP: getting a list of confusing things from the guides etc would be useful to improve readability for english-as-a-second-language speakers.

### Action Items

- [ ] Work with Ember Observer to add FastBoot support
- [ ] TD to work with Stanley on getting offline API docs reader ready

## Ember Data

### Action Items

- [ ] Ember Data team to nag Stef at the end of this week about the async CP RFC
