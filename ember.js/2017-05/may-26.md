# Meeting: Ember Core Team 2017-05-26

### Agenda

- `torii` security disclosure: [Disclosure blog post](https://medium.com/@bantic/torii-vulnerability-disclosure-dd98b6d88ec3)
- Ember QUnit API refactor: [emberjs/ember-qunit#258](https://github.com/emberjs/ember-qunit/pull/258) (RJ)
- Deprecate and eventually remove `unit: true`, `needs: []`, and `integration: true` in `ember-test-helpers`. (RJ)
- Module Unification status? (TD/RM)
- Positional argument merging behavior changes with `(component` helper. [emberjs/ember.js#15287](https://github.com/emberjs/ember.js/pull/15287) (RJ)
- glimmer-vm repo status/issues (RJ/KS)
  - 2 build systems
  - many different and unrelated test harnesses
  - disabled node tests
  - broken demos
  - needs test overhaul (similar to efforts in Ember)
  - fundamental functionality tests are simply commented/skipped?!?!?
  - remove various object models from glimmer-vm

### Minutes

#### Torii

RJ: torii has a security issue, Cory wrote up some stuff explaining the
mitigation, following the same best practices that we do. I wanted to
discuss/consider these types of things being able to email the security mailing
list. We haven’t done it in the past and haven’t discussed it.

TD: I think other seeing this happen would encourage others to follow this kind
of disclosure.

GC: I worry about the signal/noise on that mailing list. I wonder if having a
secondary official list would be better?

TD: The alternatives don’t seem better- Each project using their own mailing
list would not be ideal. And I think most apps use addons, so you will just be
subscribing to two lists instead of one. How does Rails do this?

GC: I don’t think rails does anything for libs.

RJ: Ruby has a general one.

GC: although many apps use many addons, I think there may be many addons of a
low quality with issues.

RJ: I don’t suggest we let anyone publish, so the volume would still be what the
Ember security team chooses. To my knowledge this is the first thing of this
kind from an addon.

GC: yeah I think people unsubscribe from a list when they get something they
don’t care about, and I would not want someone to drop from the Ember security
list b/c of an email about an addon. In general it is nice to know the ML is
very low traffic, and signing up is a low bar.

RJ: I think there should be some measure of popularity etc that we can use.

GC: I guess I don’t see the downside of a second list.

RJ: I want an officially curated mechanism w/o subscribing to a lot of things. I
think two mailing lists solves this.

TD: I worry if you have two it implicitly says one is more important than the
other. And I don’t think you know each email to the Ember.js list is always
important to you, it may only be an issue in certain uses of Ember. I just can’t
think of an example person who would care about one thing but not the other.

GC: Well, me. I’ve never heard of this addon for instance.

TD: but also if there was an addon that made all logins to skylight insecure you
would want to know.

RJ: I don’t think doing it with one (this vulnerability) means we have an situation
warranting a second list. There is still a bar, a proper disclosure write up
etc.

TD: I’d like to talk to EF and YK who are not here, since they are the security
team as well. So lets have a second discussion.

MB: sounds good to me, I want as many people as possible to know about this.
There is already an issue regarding security notices you don’t care about if
there is a vulnerability in glimmer apps but you are an ember user.

#### QUnit refactor

RJ: This PR is an API refactoring of QUnit
https://github.com/emberjs/ember-qunit/pull/258 I think this needs to happen,
the points of this refactor is to stop being in the way of using the normal
QUnit features. I don’t know if it requires an RFC since it is shipped by
default for Ember-CLI. The blueprints for tests would change. Instead of using
`moduleFor` etc we import those things and pass them to normal QUnit.

TD: b/c it impacts docs and guides it seems like a good thing to RFC. The
learning team should provide feedback for example.

RJ: Agreed.

MB: I’d like to know more about how this interacts with the testing unification
RFC

DG: I like it though

RJ: Yes, I want to get this done as an incremental fix to we can use the new
QUnit features etc, and don’t want to block those features (and some bug fixes)
on that larger RFC. I can document the plan in an RFC for this and will also
update the testing unification RFC. If this was an independent addon it would be
merged, but I wanted to get feedback from the team.

#### Deprecate needs/integration/unit options for ember-test-helpers

RJ: I’d like to drop them, and the default would be they are all integration.
Today people use the needs array and they just keep adding to that list.

(discussion, general agreement)

TD: I think this is a case where we tried to provide something we thought was
good and it was not.

KS: These always break on upgrades etc.

RJ: So should I write an RFC? I don’t want to write an RFC and argue about the
words and semantics and not the technical problems that we have.

TD: Keeping it as scoped as possible seems good. The point of the FCP is that
the core team seems aligned. So if we are pretty aligned we can try to keep the
discussion scoped.

RJ: I want to keep it apart from the other API change I mentioned earlier. I’ll
do this RFC as well, try to talk about how it interacts with the unification RFC
and avoid talking about the religious war and stick to the API pain.

TD: the smaller we can make these RFCs the better the discussion tends to be.

#### module unification status

TD/RM: An update, I’ve been talking with DG.

(discussion)

We will create a strike team, currently coordinating in #st-module-unification
on slack

#### Positional arguments in closure component

RJ: This is a breaking bugfix, and I wanted to raise it. We’ve discussed that
the behavior should be fixed. I tried to search of codebases that will hit this,
and couldn’t find any. We should be ready incase there are issues supported.

(general agreement that this bugfix is the right decision)

#### Glimmer VM repo status

RJ: The glimmer vm repo is kind of wacky. There are node tests, but they are not
running. There are demos, but they are not working. There are a bunch of skipped
tests. There are some files with two test harnesses in the same file. I think
there are some packages in the repo that should be removed. For example the
object model and the demos.

TD: YK is on board with removing the object model stuff.

GC: The issue is that the tests are dependent on them.

CH: the idea is that there was a test harness akin to the ember test harness
that we wanted to use. It uses decorators for the test etc, I think that was
what we wanted to move toward.

TD: I think this is maybe a hidden opportunity. If we can give some clear
direction we can rally community people to help out on this if we provide clear
direction.

RJ: I’m not complaining, but the current thing is a blocker on up doing better
work.

KS: We need to get rid of some of the playground stuff.  Prominent people in the
JS community have come to look at it and the codebase doesn’t make a good first
impression.

GC: the demos were supposed to be integration tests was the idea. We wanted
tests for those demo. But it didn’t pan out. I’d still like something like that.

KS: we did make them part of the build, but people kept removing them from the
build. I’ve fixed them several times only for them to be removed in a
refactoring. Either they are important enough that we fix them when we refactor
or they need to go away.

RJ: I think we should move them out of the repo. If we want a standalone test
project like glimmer build that is fine, but the ones in the repo should be
fixed or removed. They aren’t providing value right now.

TD: Earlier we didn’t know the constraints the stable state of the design. Now
we do have that, so we should be able to do better. We should just have a
discussion about the glimmer build stuff and figure out the constraints.

RJ: I think the repo is in a good state re: types, that stuff is great. The
larger issue is that different people have different constraints, for example I
don’t use vscode but others do. But we can run `yarn problems` now so that is
helpful.

TD: I think there is consensus about moving the glimmer demos out. GC wanted to
capture the constraint of real apps for smoke tests in the test suite. We are
halfway through the new test harness, so we should make a quest issues to finish
that. And last we should complete a list of the build system constraints, I’m
happy to take a stab at that list.

CH: I think this is on par with what I wanted to talk about two weeks ago.

CH: My goal with glimmer-bench is that we would run it as part of the app. So it
would fail over if we broke something.

RJ: Right there is a chicken and egg thing there, since we will definitely make
changes that will break the build.

CH: The immediate goal is actually just reporting the change in benchmarks.
