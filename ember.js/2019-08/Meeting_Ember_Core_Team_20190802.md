# Meeting: Ember Core Team - Aug 02, 2019 

## Agenda

- Determine note taker (DG)
- Octane release plan (YK)
- Co-location opt-in?
- Ember Inspector needs help! (CG)
    - (MS) Ember Inspector expectations for stable Ember releases
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable
        - (already enabled) co-location support (GC/RJ)

## Attendees

- [x]  Yehuda Katz
- [x]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [x]  Igor Terzic
- [x]  Matthew Beale
- [ ]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [ ]  Ricardo Mendes
- [ ]  Chad Hietala
- [x]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber
- [x]  Chris Garrett

## Action Items

- [ ]  JW + YK to discuss what to make public about Octane release plan.
- [ ]  Everyone: review Octane release plan before next week
- [ ]  RJ + YK will discuss the Octane opt-in flag
- [ ]  Godfrey to help out with Inspector component tree

## Minutes

DG taking notes.

### Octane release plan

YK: (referencing Octane Release Plan doc) I realized that there's a lot of things going into Octane. And each one of those has its own nuanced release plan. What I realized is that there are two categories: opt-in features + idiom changes.

TD: Importantly you don't have to migrate now, but you need to begin learning them.

YK: The idiom changes represent what it takes for an app to be an idiomatic Octane app.

YK: I think this (the two categories together) is weirdly one of the best ways to communicate what Octane is.

TD: This is in contrast to describing Octane as a set of features.

YK: The important thing schedule-wise is that 3.13 is the last blocking release, and it will have an opt-in that's described in the release blog post. 3.13 will be feature complete, but may still have a few issues. 3.14 will just be polish.

DG: What if we feel 3.14 isn't polished enough to enable all the "Octane" flags? We will just push to 3.15?

YK: Yes, it's important that Octane feels polished to new users starting new apps.

RJ: We should publish this. It's an excellent summary.

TD: We have a couple all-hands meetings scheduled to review this with everyone.

MS: I'd like JW's thoughts about this document being public.

JW: Yes, I'm in favor. We should have a shorter, more digestible version.

YK: We can sync up and coordinate.

TD: Please review the document this week and raise any questions in the next meeting.

### Co-location opt-in?

GC: Currently there's some code that uses the `EMBER_VERSION` flag to opt-in to co-location

RJ: An env flag makes sense here because it's not the kind of thing that we should need significant traversal to get to.

RJ: The reason it's there now is so that everyone can easily check.

CG: My understanding from reading the RFC is that we would have options that you can read during blueprint generation. And so it's not just a single flag - you might have glimmer components + template co-location as separate flags.

GC: Should "octane mode" imply the values of other flags - i.e. override those flags to the only valid values.

GC: Are we going to stable with the code in master to read the ember version?

RJ: When we decide what to do, we just need to update the ember release to be compatible.

YK: We still need to decide on the Octane opt-in flag and how it should work

RJ: I'll come back next week with a proposal

### Ember inspector needs help!!! 😱

CG: The ember inspector reaches into metal and does terrible things.

CG: Glimmer components don't show up in the component tree. We don't have a story for tracked properties.

CG: We really need an RFC in the long term for a debug API

GC: I think this is a really good example of why we need the 3.13 / 3.14 split.

GC: I have plans to begin work on the component tree soon.

GC: I'm only narrowly focusing on the component tree, but it sounds like there's a lot more to do.

RJ: I've pinged Robert Wagner about this and am trying to get a plan together.

RJ: I would like to work with David Hamilton on a debug API. For example, it's not easy to get the current owner.

CG: I think that will be very important for tracking, and especially auto-tracking.

RJ: Some of that stuff will require a handshake to enable, so as not to hinder perf.

RJ: For example, the cost of tracking the component tree might be significant. 

### Ember Inspector expectations for stable Ember releases

MS: What is our policy re: inspector stability and releases?

MS: Should inspector stability be blocked by the inspector?

RJ: We can't add more blockers. That's how we end up delaying shipping for 3 months.

GC: We need to upstream more tests related to the inspector to the ember test suite.

YK: We could also theoretically incorporate some better testing automation, say that happens with canary.

GC + YK: There's also a big difference re: polish for editions, for which everything needs to work and work smoothly.

YK: I'm in agreement that this shouldn't be a blocker for regular releases, BUT it needs to be a very high priority.

TD: I think that breakage of the inspector becomes an "all hands on deck" situation.

GC: Given the example of `@glimmer/component` - we knew that this didn't work with the inspector when we shipped. And we didn't have the resources to make it work right away.

MS: I'd like to discuss, aside from past experience, whether we want inspector compatibility to be a blocker for enabling new features.

RJ: There is a difference between "not breaking" and "supported by" the inspector.

YK: If we want to go ahead with what MS is suggesting, then we should add it to the RFC process.

GC: It is both a resourcing problem and an issue with the currently convoluted implementation within the inspector.

GC: I think that this makes the amount of work to support the inspector for any given feature very difficult to consider.

TD: Down the road we might be able to consider this one the inspector internals are straightened out.

JW: I'd like to see us commit to inspector support *at some point*. But it seems like now is not the best time.

GC: We do need to do this for Octane - which is a special case because it requires such polish.
