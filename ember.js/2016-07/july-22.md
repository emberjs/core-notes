# Ember Core Team 2016-07-22

### Agenda

- Router Enhancements RFC - [emberjs/rfcs#154](https://github.com/emberjs/rfcs/pull/154)
- Router core team champion (@locks via @tomdale)
- Issue triage strike team (@locks via @tomdale)

### Attendees

YK, MB, DG, AM, TD, EB, GC, IT, MM, RJ, SP, KS, LS

### Minutes

RJ: Update on engines. We had a meeting of "stakeholders" of people working on
lazy loading and engines. New RFCs for asset loading and asset packaging. They
may not land in Ember proper but they certainly affect the ecosystem, so we
wanted to open this as an RFC. Not clear where to put something that has a big
impact but doesn't concern Ember directly.

RJ: Probably okay for people to start reading through and digesting the stuff
here. Looking forward to having an alpha-quality version of this working in the
next few months.

RJ: There's an RFC from @cibernox on general router enhancements. Includes two
major features: optional segments, and dynamic segment constraints. Influenced
by Rails. A bunch of us have talked about the idea of optional segments. I want
to bring this up today is because I know that core team members probably have
strong opinions on this. I want to make sure we steer the contributors in the
right direction early so there isn't any wasted work. Would like people to gauge
these changes at a high level, no need to fully dive into the details yet.

RJ: Nathan Hammond has been working on some other nice router things like
precomputing the route table.

YK: I've talked with Nathan and generally think he is on the right track

RJ: I think so too, need to look into details.

RJ: aside, but as of this morning we enabled flags on Canary.

TD: Locks pinged re: two things. One is the number of issues is growing. He
wants a strike team to help burn them down. But also he has a concern that a
number of the issues are things that cannot be closed b/c the relate to router
and query params bugs.

RJ: I looked a month ago, about 10% were router bugs.

YK: I think nathan is about ready to ship his change with full compat. I think
the new primitive is much better than the old primitive (new primitive
http://www.nathanhammond.com/route-recognizer)

TD: Not panicked

RJ: Most that I reviewed/labelled were not new. There are a lot of hard edge
cases that we need to deal with.

TD: I'm curious to understand what yehuda's model of what problems people are
running into.

YK: I only have a hunch. Many of the bugs seem conceptually like state machine
bugs, or around the lifetimes around controllers. It feels like the arch is ok,
but if we look at what people are doing to can adjust. Like Glimmer1.

TD: You think Nathan will want to tackle a glimmer2 rethink?

YK: I want to push router.js to better encapsulate all the concerns in one place
(like pushing ember concerns into glimmers). We should not stop fixing bugs in
Ember, but we will be WAT for a while.

RJ: I don't disagree. But. There will be some attempts to whack a mole.

YK: Many bugs are since inception. But that makes the interactions (timing etc)
intimate API. It is easy to fix the bugs and not fix the real problem.

EB: I'd like to design what we want in a routable components world (API-wise)
and migrate people to that

SP: There exists a large number of things in the existing things that can be
solved. We don't need to wait until the future to resolve outstanding things.
I'm not enthusiastic about an 18 month process before we fix anything.

YK: I object to the framing of there are bugs in glimmer1 that are not fixed in
glimmer2. Don't want to go into it now.

TD: There is a bigger issue here- many of the biggest issues stem from
controller lifecycle and how to keep state around. If we can drop that
requirement there is a saner arch we can use. This may not be the right time to
make a large change. I think we would need to think about what the thing we want
to build is before we attempt a grand unifying theory.

SP: I'm a little scared now. Without a major rewrite there is tons of code to
cleanup in the current system. Whomever did that would have a great
understanding of the current system (providing context for the next design). And
this can be done without massive thoughtleadering.

EB: incremental fixes could cause pain for existing users as we break intimate
things.

TD: The API of router JS is not what we wanted in Ember. b/c the microlib was
painful we wrapped it in a shell. I think stef is onto something by suggesting
that router.js is probably just the wrong API and we can migrate it to have more
in common with Ember. And reap those wins.

RJ: Side thought: It seems like we won't move query params to routes without a
whole rethink. There is a slew of tests and etc trek did to make QP work on the
routes. If we won't be using the same API for QPs, we can perhaps remove that
code and feature flag.

YK: We've removed some other flags in the same vein.

RJ: I can't fathom moving things wholesale from the controller to the route. So
we cannot reuse it.

YK: The current system has some characteristics of pinning a value to persisted
state, which is great. I think that simplicity of API will be a tough design
problem.

KS: query params are global to the URL. There is no base primitive that models
that aspect. We don't namespace anything

SP: There exist bugs independent of this stuff though. And that the ground is
fertile for that work. Would like to nudge people towards that.

RJ: re: feature flag, should it be removed then?

SP: Yes, but plz just make nathan and miguel aware of this work.

RJ: I'll ping trek to get his thoughts, but yeah it seems good. Thanks.

RJ: Next, committers is a go.

TD: Ok looping back to the issue triage thing. Is that team a formal team?

SP: We discussed it and put people on it.

TD: So locks has been working on PRs to put more info about subteams on the
website?

YK: yeah issues seems to be more of a subteam than a strike team, but existed
before the subteams existed.

TD: So what is the process for proposing a group?

YK: I need to work on a proposal that we

(discussion)

RJ: I think we should review that email godfrey sent and re-confirm that the
issues team is an actual subteam.

SP: I think members may also cross-cut over time

TD: Sounds like everyone is onboard about this

CONSENSUS

YK: we need to look at getting a better process for this stuff

TD: I'll email that team and clarify things

RJ: They have a friday meeting, and a spreadsheet. No notes though.

SP: I think you can change the notes for a spreadsheet. Or send out a ping to
people of their issues or something. We need to close that loop and see where it
goes.

RJ: They've been doing this for a while, so we can ask them about if there is a
better way to represent it or something.

RJ: They only have access on ember so far, but we can add them to other projects
if we make them a subteam

RJ: Serabe has been doing a lot of work as well.

SP: Bill has been delivering a brief to be for a while now, like a year now.

RJ: yeah he has been working to contribute.

TD: I will close the loop.

RJ: (talks too fast!!)

TD: I will blog post and email etc

RJ: Glimmer2! Curious for thoughts of others.

(discussion)
