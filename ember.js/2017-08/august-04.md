# Meeting: Ember Core Team 2017/08/04

### Agenda

- [Custom Components RFC](https://github.com/emberjs/rfcs/pull/213)
- [Classes RFC](https://github.com/emberjs/rfcs/pull/240)
- [`Ember.String` deprecation RFC](https://github.com/emberjs/rfcs/pull/236)
- [aria-* RFC](https://github.com/emberjs/rfcs/pull/242) (MM)
- Glimmer Eager Mode update (YK) (if time)

### Attendees

YK, EF, CH, MM, RM, RJ, YK, MB, KG, TD, KS, DG, IT

### Minutes

#### Custom Components RFC

RJ: I’d like move this forward since it seems like an important part of the story.

YK: Yes, the unresolved questions section must be resolved before we can FCP

(some discussion)

#### Roadmap

RM: Please core team help fill this out so we can tell the world what we are doing.

TD: I will make a paper doc with a few items. The dashboard is roughly modeled after the IE and Chrome feature dashboards. There is so much work happening on Ember, and the idea is to dispel the idea of “There is nothing going on” by making it easy to see what is in flight. SP had a request that we talk about “things we want to solve” and not implementation details, and I’m staying mindful of that.

YK: It is ok to talk more about implementation as it becomes a reality. To get more specific as the work is more specific.

TD: I think this will also give us a way to communicate (in a lightweight way) when we change our plans. For example communicating the change in approach to routable components. I will make a document. RM and I will follow up with people to get their feedback.

+Seeding the Status Dashboard 

RJ: So I don’t know if I’m support to do something specific?

TD: I will message all of you on discord in turn and then try to communicate that.

YK: I’d like to say a few things about the Rust process for this. A few things have been working well in Rust. The first is making the roadmap more of a community process. Ember chose to  start with things we have consensus about, but Rust opened their roadmap to allow anyone to put things up there, and then those things that were active become RFCs. Rust uses discourse more than we do which is part of the story. They also have a concept of epochs, like “this is the push on X”. Basically thinking of things more in terms of timeframes and shifts in thinking. The Rust community has been thinking about “seasons” as well. Like this quarter is for RFCs, the next quarter is about implementation. These ideas are all kinds of squishy, but they do a good job of making things not seem interminable. Rust’s ideas here are less technical but more about creating a mindset of “waves” instead of one long undifferentiated slog.

YK: I’d like to schedule a discussion about this for the next meeting but I’m basically reserving judgement until we see how it goes in Rust.

#### Classes RFC

RJ: There have been a lot of people jumping in on this who want the end results instead of the iteration, compared to out goal of being forward/backwards compatible.

YK: It sounds like we’ve done a poor job of explaining the fact that this is really about getting the internals in place so that it’s even coherent to say that you can subclass an Ember class?

RJ: I worked with pzuraq to reorganize the RFC a bit. Most of that was after the initial round of people reading it though.

RM: I think the edits were good.

RJ: the issue with doing a meta RFC about the final goal is that we cannot do it until this RFC is fully explored.

YK: Right it is hard to know the final APIs without guessing.

RJ: There are a few specific things this RFC suggests we fix in the core object model. All of the things are basically bugfixes anyway. So we’re going to keep pushing it forward. At this point I think relatively positive community-wise. things are moving along.

TD: It doens’t sound like there are many open questions. when should we FCP?

RJ: I’m happy to do it whenever others think it is ready. I’d like others to read it in detail before FCP.

RM: It also might be nice to wait a week or two for the community to be in alignment.

RJ: Right.

YK: Before we talk about decorators we should make clear we will only suggest usage of decorators in alignment with the spec. Not necessarily the implementation but the usage.

RJ: Right for example the old Babel decorators permitted decorators in POJOs for example, but I’m not sure what the status is in the proposal.

YK: Yeah everyone wants them in POJOs, but the work has been deprioritized.

RJ: I’ve tested the more recent Babel work- most of the tests pass which is good. But to be clear I’m not proposing any decorators in this RFC. It mentions them, but makes it explicit that we are not suggesting them.

TD: Akin to the named blocks RFCs: Decorators must be considered, but they are not part of the actual design.

YK: In Rust we recently realized RFCs have two kinds of unresolved questions: Ones that must be answered to merge the RFC, ones that will be answered as part of the implementation.

TD: Can we perhaps FCP next week?

RJ: That sounds great.

#### Ember.String deprecation RFC

RJ: Proposes to move methods off the namespace to an addon except the htmlSafe stuff etc. There is a lot of discussion about changing string methods on the string prototype. The prose introduces some confusion about if this is a breaking change.

YK: The RFC doesn’t seem to provide enough detail about the deprecation semantics?

RJ: The RFC explains the motivation and goal, but there is no real detailed design of the deprecation experience. I think for this we need an addon with the features, deprecate Ember.String. Many people will ship it twice if we are naive, but svelte should help. Basically we will still have the prototype extension stuff on but if you use it there will be a deprecation. I don’t know the name of the package.

TD: Yeah the RFC just isn’t at the level of detail we need to proceed. For instance if we want this stuff to go into an addon this RFC should name the addon.

(discussion)

YK: When we make a global thing public we’re not just saying it is usable by ember users, we’re saying it is a breaking change to move it from Ember.XXX, from that position. If you don’t have it on Ember.XXX using it internally doesn’t mean that much. This is my argument for why you don’t want to add things to the global. 

RJ: I think this is regarding my Ember.expandProperties thing.

(discussion)

YK: Until we have an ES6 class story, I don’t think it’s a good use of our time to spend energy pushing people off the `.property()` and related prototype extensions.

#### aria-*

MM: Mel wrote this RFC about adding more properties that map to attributes. Generally the community responded negatively (bad precedent) and I agree.

YK: I agree.

MM: Right, so Rob and I wrote up an addon that performs a rather dubious transform to allow you to set attributes.

YK: I like the addon solution. I think it would make sense to make it some kind of built-in thing for glimmer components. The reason I want to build it in is that it is nice to have a consistency between the two invocations, and it would be nice to have that for curlies.

YK: In general we have a moritorium on new attribute bindings b/c of the new style coming. That isn’t satisfying since the timeline isn’t clear. RJ what do you think about making html-attributes a thing?

RJ: I think so.

MM: Yeah and I think the RFC is ok regardless of if we think it will be accepted.

YK: It would actually be nice b/c it makes us rationalize the attribute thing without thinking about the glimmer component syntax. I’d like to see the RFC, and communicate that glimmer components have a solution for this.

(discussion)
