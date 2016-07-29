# Ember Core Team 2016-07-29

### Agenda

- Advanced Documentation (LS)
- FastBoot 1.0 (TD)
    - Blog post
- Glimmer 2 Alpha (GC)
- Chrome Canary M54 break (resolved) TL;DR
- TC39 update: decorators stage 2, cancellation, async function
- Async await stage 4 (are we ok, with enabling by default in ember-cli + guides etc?)

### Attendees

DG, YK, GC, LS, EF, EB, KS, RJ, SP, TD, MB, IT

### Minutes

#### Advanced Docs

LS: bringing up that there is some desire for advanced documentation bubbling to
the learning team. There's a lack of docs in a lot of areas once you get to the
more advanced topics.

YK: I want someone to expand that argument into something I can understand, are
there specifics?

TD: I think Ember-CLI is a good example: People want to change the build
pipeline but don't understand broccoli (poor documentation). I've had people
evaluating Ember express that they don't know how to extend Ember-CLI.

LS: Stef and Mike worked on training materials, and there was some suggestion
that the docs could be donated.

YK: I seems good to donate time/resources to a thing that they think is lacking.

TD: I'd be interested if they could assemble a list of topic they think are not
covered (or are covered). I think we could put some marketing muscle into
Broccoli and fixing that whole story.

SP: I think the issues is more across the whole ecosystem, only a little bit of
broccoli.

YK: The general statement that we lack advanced docs is pretty correct. We need
to find an avenue.

TD: The balance is how to add advanced stuff without intimidating new users. We
used to have a complex routing guide that just scared people off.

YK: IMO having clear guides that show people how to do things we need in the
real world is good.

YK: Blog posts generally don't end up being maintained enough.

SP: I talked to the Safari/Spidermonkey/v8 teams about this etc, and they
suggest they cannot possible document all their internals but they can share
their tool-chest for success and provide a trailhead for people to start on.

YK: I think that would be a small thing to do. Seems like good things would be:
Guide to the guides, work on broccoli as a standalone guide, and last some docs
for build process at big companies.

LS: I'll pass this along to David and try to see what he can do.

SP: I think it doesn't need to be part of the guides (possibly), doesn't need to
be newbie friendly, etc.

YK: We can do this in stages. Seems like a good time to do it.

#### FastBoot 1.0

TD: We plan on shipping! One issues left with reloading and watching, there was
a recent regression. I'll try to fix it this weekend but if not we will defer
the issues.

YK: I asked that FastBoot 1.0 make all deprecations errors.

TD: Ah I have not done that.

YK: As a conservative measure I would like to do this. It does not seem like a
violation of semver to have this happen (for example the render re-flush stuff)

YK: In glimmer we've had a lot of trouble dealing with deprecated behavior, just
in the browser. I worry we will box ourselves in if we need to support it in
another env as well.

YK: perhaps not permanently, but if we make all deprecations allow but later it
could make things hard if we allow everything.

SP: One part of the FastBoot thing I'm concerned about is FastBoot watch. I've
thought it was just a thing you could enable with `ember s`. I'm nervous about
1.0 having `fastboot watch`

RJ: Issue with using `ember s` is that we need to replace the express server
with our own. And there are not Ember-CLI hooks to do that right now.

SP: b/c of this I think it needs exploration. Having these two worlds makes me
nervous. Addons need to support both things, etc.

YK: You're suggesting the current solution is temporary but we should deprecate
and get on a happier path soon? Tom?

TD: I want it. I didn't merge the watch PR but I remember pushing the person who
worked on it to just make `ember s` just fastbootified. Given that everyone knew
it was a goal and it didn't happen I'm sure it isn't easily feasible.

SP: By shipping 1.0 w/ that feature we need to support it in the long term.

TD: What kinds of things do addons need to do in fastboot mode. You developer in
`ember s`, but you verify with `fastboot watch`.

YK: Tom can we not just put fastboot watch behind a FF and ship 1.0 without it?

SP: how about postponing 1.0 a week and I'll find time to try and make the issue
go away.

TD: I think seems good?

GC: I am already nervous about FB and glimmer at the same time. I think we will
blow attention spans.

TD: I need to blog anyway, so with all these concerns in mind sounds good. We
need to push glimmer alpha in the next hour to not miss the PR window.

**Action Items**:

TD and SP to pair next week on unifying `watch` infrastructure into `ember s`,
fix remaining watch-related bugs. Ship next week with feature disabled if we're
unable to resolve the issues.

#### Glimmer 2 alpha

GC: first plan was ship on Tuesday, and we're here today. We can release any
moment. So far: LinkedIn and Intercom and Skylight are basically working
(compatibility). I'm not sure if anyone is ambitious enough to run tests yet.

SP: It is promising. I'm sure hacks do not work totally.

GC: I had to disable some minor liquid-fire things for example, but the UI is
working and interactive. Bad news is that it is not faster yet. I have been
triaging issues and I think more are tractable. If we get the compat stuff done
we can focus on performance.

SP: It is risky to publish a blog post when the goal of this effort is largely
perf?

GC: The point of the alpha is to boot the app and compat. We can't optimize
without apps running so we can profile and have tooling etc.

SP: As long as the messaging is like that seems good.

GC: I have a draft of the post I can share.

YK: we should be clear that perf is an area we will work on. The basis is there
for good perf. There are scenarios with good perf. Real apps need to be looked
at to better analyze performance concerns.

#### M54

SP: error.attach stack trace started throwing when you attached a stack track .
I found the issues yesterday and benedict got it resolved over the night. The
code we have here is kind of lol-codeish, so I will follow up to clean up our
code. Chrome's next canary should fix this.

#### TC39 Update: decorators stage 2, cancellation, async function

SP: Now that async function is stage 4, can we document and work with them for
testing etc?

YK: The thing to worry about is cancellation.

SP: It is similar to the problem we have today.

YK: yeah but it will feel even less good than it did before. If you have an
async with a bunch of methods and a context that might be destroyed you need to
think about it.

SP: In testing it is less of a concern.

MB: Documenting for testing is good

YK: We should be aware they will start using it in apps once they are
documented.

SP: right we can document in testing and warn about the concerns for app-space.
At yahoo there were whole categories of bugs that moving to async/await helped
to resolve.

YK: we should just document the caveats.

SP: it should be RFC'd, I propose.

(some discussion)

MB: perhaps it can be coupled to Robert's testing RFC

RJ: right it already does cover async await and it a concern, so we can edit
that away

SP: Next decorators, stage 2. Can we explore the path for ember with decorators?

YK: I think we should adopt, as we need an ES6 class story and we need to push
the process along. Someone needs to use this to move the process forward.

SP: Right, so it is a bit of a chicken and egg problem.

YK: Right there is usage, however Ember's community is so homogenous that when
we choose to adopt something it is instantly used by a lot of people.

RJ: I don't think we should deprecated existing features etc

YK: We actually need to move to classes before we can use them. I don't want the
react thing where there is different behaviors for the two systems and people
gain opinions.

SP: Perhaps we can iterate in private?

YK: I just want to get modules landing first, before we create another strike
team.

RJ: I consider it a bug that you cannot register plain classes anyway.

EF: the question is do we migrate to a new programming model when you swap to
ES6 classes

SP: so after modules lets build a strike team to move this forward.

YK: I feel strongly we should not have a different programming model, but we can
make some specific small semantic changes.

YK: last was cancellation. I think we need to figure out what our opinion on
cancellation is so we can represent a position (as Ember) to the committee.

YK+SP: yeah lack of cancellation is fatal

YK: having an ember approach helps to shape conversations. The cancellation
design is moving quickly so we need to have a position.
