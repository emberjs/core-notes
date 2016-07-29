# Ember Core Team 2016-07-08

### Agenda

- FCP Process Tweaks
- Igniter w/ @runspired (YK)
- Shipping Glimmer 2 (YK/GC)
    - Alpha state in features.json (YK)
    - Last-mile perfect compatibility vs. performance (YK)
- Feature Review
    - ember-runtime-enumerable-includes
    - ember-string-ishtmlsafe
    - ember-testing-check-waiters

### Attendees

DG, EB, YK, LS, IT, MB, RJ, TD, SP, KS

### Minutes

#### Ember Inspector

YK: Is Teddy still active? We should probably find a group of people to help the
modernization effort.

RJ: I talked to him about getting more people involved in the release process.
We need less bus factor.

RJ: The architecture of the inspector is not well-understood, and the
architecture document is not fully up-to-date.

YK: Sounds like we should put together a strike team to bring these things
up-to-date to improve the chances of people being able to contribute.

RJ: Teddy's recent refactor made it a lot easier to maintain
backwards-compatibility with older, pre-1.0 Ember versions.

SP: Can someone come up with a list of points I can talk to Teddy about? I chat
with him often.

YK: Generally, we need a strike team so we can ensure we have public API for all
of the things the inspector needs to inspect an application. It needs to use
fewer API. We should also publicize some of the features we already have, like
iframe mode.

SP: We also support control over Web Socket thanks to Joost's plugin.

RJ: We have a bunch of work to do to add compatibility for Glimmer 2, so that
seems like a good opportunity to both define the public API and form a strike
team around the inspector.

SP: Let's make sure we get a braindump from Teddy about the Firefox/Chrome
extension release process, it has some rough edges.

SP: I know he's been very busy but wanting to interact, but the timezone issue
makes it very difficult. Let's make sure we plan any initial strike team to be
at a time he can join.

### Glimmer 2: Perfect Compatibility vs. Performance

GC: We said we would not GO Glimmer 2 until after the 2.8 LTS release. However,
we need to people to start testing their apps, and ecosystem projects like the
Inspector to start working on compatibility.

GC: To that end, as soon as we cut the 2.8 beta, we will cut a 2.9 alpha. This
is like a beta release but with Glimmer 2 enabled. Hopefully this will happen on
July 25th. We have scheduled some time on July 20th and 21st to "put a :bow: on
it."

RJ: This is a good summary and it sounds good to me.

YK: I have two topics. The first is uncontroversial. The alpha release is a
thing we have not done before. It means "this feature is ready to be tested by
more people," so we want a build that is easy to use as the beta, but it's not
stable enough for the standard beta release.

YK: I would like `features.json` to have more possible states. Right now it uses
booleans and `null` values; I would propose that we switch these to strings for
the release where they are enabled: `alpha`, `beta`, `release`, etc.

RJ: I think we should just have people use canary and everyone gets the feature
turned on in canary by default.

YK: I agree with your philosophy, but I think the exact strategy isn't quite
right. Alpha means "we are not aware of any more work that we need to do, but if
it is used widely, we expect that there will be more work to do."

YK: Alpha differs from canary because canary contains features that we *know*
are incomplete/still evolving. Alpha means we consider it done but need the
public to help identify outstanding issues.

## Two-Way Reflush

YK:
https://github.com/emberjs/ember.js/blob/master/packages/ember-glimmer/tests/integration/components/curly-components-test.js#L1969-L2030

YK: This is something that *some* apps may rely on, but is a huge performance
footgun, and it's actually easy to fall into an infinite loop if you do this.

YK: We've gotten quite good at not calling `.value()` on a reference if we
believe that something hasn't changed. There are two steps: validation and
getting the value. We've been very good at keeping the number of validations
down; if there are no new invalidations, it's very fast: just a Math.max() on an
array of integers. If none of them are invalid, we jump over the entire subtree.
If you are skeptical of this, let me assure you that so far it has worked
perfectly.

YK: Unfortunately, this process means that "rendering something on the screen"
simply means checking to see if it's still valid or not. So if you have a
property up in the hierarchy, and you check to see if it's valid, and if so, you
leave it alone. But if something further down the hierarchy sets the value, we
now need to add a revalidation step.

GC: The only way to solve the two-way reflush problem is to subvert these
optimizations. We'll need to do a lot of bookkeeping to detect whether changing
a value really requires a repaint or not.

YK: Let me try to outline the options we have:

1. Most conservative, just take the performance hit in exchange for not breaking
   anyone's code.
2. Less conservative, provide an opt-in for the new semantics. We can do that
   compatibly, it's just hard to detect if the opt-in is accessible. It becomes
  a "secret handshake" only pro users will have; not likely to be found by naive
  users doing a benchmark for example.
3. Make it a hard error in development, still allow in production.
4. The last option, which I prefer, is to cause this to break but allow people
   to opt in to the old behavior.

YK: Remember that this only affects hooks that are run synchronously. Async
hooks (`didInsertElement`, etc) do not trigger the problem.

Some agreement that we can introduce an intimate API deprecation in 2.8 that
covers a subset of the current deprecation's usage. In 2.9 the intimate API
deprecation would raise an exception (Glimmer will raise an error in dev mode
and in prod will fail silently).
