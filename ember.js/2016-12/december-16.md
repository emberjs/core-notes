# Ember Core Team 2016-12-16

### Agenda

- Glimmer Refactor (YK)
- Deprecations
  - `targetObject` needs @rwjblue Review (PR #14590)
  - Array/Enumerable observer things is in-progress, @rwjblue and @stefanpenner will pair on it next week (PR #14710)
  - `didCreateRootView` is not going forward for now because we need a new hook from new router service...? (@ef4?)
  - [Ember.K deprecation RFC](https://github.com/emberjs/rfcs/pull/178) closes FCP tomorrow.
  - Component [lifecycle hooks arguments deprecation RFC](https://github.com/emberjs/rfcs/pull/191) in-progress.
  - _lookupFactory.. @mixonic?

### Attendees

DG, EF, GC, LS, YK, EB, RM, MM, RJ, AM, TD

### Minutes

#### Deprecations

GC: I signed up to shepard these deprecations. I am on vacation soon but I will keep pinging people.

RJ: Curious what the idea re: didCreateRootView was

GC: It was added early in Glimmer as a method for Fastboot. It isn't used for serialization any more, but it is used as a hook to clear (double render?)

YK: Adding to the routing service seems like a good idea.

RM: Chad is mentoring someone at LinkedIn, but then the work got re-prioritized.

RJ: I'll pester Chad to make sure the work gets public.

GC: The problem with the API is that we leak the root view object. The API is private but is used by Fastboot.

YK: So we can just remove the argument.

GC: I think noone except us use this hook.

RJ: I'm fine with just removing the arg. Then is it public?

YK: I think I'm only saying we can remove the argument, then work on the routing service API for the real public API.

GC: I got stuck b/c I didn't have a path forward, but if we have one...

RJ: Let's remove the argument and see if there is any unexpected usage. We can go back and deprecate if needed.

GC: I'll check in with RJ on this sometimes then.

(discussion Ember.K)

GC: lifecycle hooks deprecation in progress. YK is writing replies? The context was that we realized at F2F we have a few weeks before LTS, so we can land important things before then.

YK: I don't want to claim we have consensus. We had F2F consensus, but not core or even community yet. So: Churn cuts both ways. Either you change a poor API and users feel churn, or if you leave it around and people use it and later you remove it anyway, then more people feel that same churn. So you're just kicking the can down the road.

YK: The timing of when to remove the intimate API deprecated by an RFC, we still get to choose when to do the removal. We can deprecate and not yet remove. We can keep it as long as we want to. I am frustrated we don't have svelte yet, since that would make the removal timing less important.

RJ: a) I've got some hesitation to change any of these APIs since it has been painful in the past. That might not be rational b) I think it is not ideal to have a function where the function is public but the arguments are not.

MB: There are also routing hooks where we have public API hooks and private/intimate arguments.

GC: I think everyone agrees that public hook, private argument is not good. We would not do it this way again.

RJ: I believe we should wait until the Glimmer component RFC and know what the future hooks are before we change the current system.

YK: I think EF's work on glimmer components has revealed that there may not be a simple mechanical transition between curly components and glimmer components.

(discussion)

RJ: Crux of my concern is that we're actively designing this in the glimmer world, it seems bad to change curly hooks which is basically design for glimmer hooks as well.

YK: I don't think we're interested in adding features to curly components though. The aim here is solidifying that API, not designing glimmer components. We have some consensus that we don't want to pass old attributes to hook.

(discussion)

#### Glimmer Refactors

YK: I have some work from many branches I'm trying to bring together. and trying to keep the tests passing as I move along. I'm working on getting rid of syntax objects entirely, and generate opcodes directly from the wire format.

#### lookupFactory

GC: Checking in, has this landed

MB: No not yet, we have a very specific list of things to complete before we ship
