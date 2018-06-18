# Meeting: Ember Core Team 2018/02/09

## Agenda

- IT’S THE FINAL 3.0 COUNTDOWN
  - 3.0 and ember-twiddle support
  - https://media.giphy.com/media/SjInxhAJTzU7S/giphy.gif
- RFC Review
  - [Deprecate Ember.Logger](https://github.com/emberjs/rfcs/pull/297) (RJ)
  - [Deprecate Component Lifecycle Events](https://github.com/emberjs/rfcs/pull/298) (RJ)
- Transition became private (YK)
  - Just a heads-up, working in the Learning Team
  - What about Namespace?
  - General question about “legacy stuff” in the default docs
- “Go” (enable by default) named args feature flag (RJ/TD)
- Object Model (YK)
  - I’d like to discuss this at a somewhat high level and overtly avoid getting in the weeds
- --- meeting end ---

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [x] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler

## Minutes

### 3.0 & Twiddle

(discussion)

YK: There in an agreed upon constraint that a Twiddle should not be slow.

RJ: Twiddle should continue to build addons, and ember-source is just an addon. We can perhaps do something where builds of the Ember addon are pre-published. I also don’t expect that this is actually very slow right now, since Ember is effectively always pre-built.

YK: We should get Twiddle under the learning team to try and grow the contribution base.

TD: We should start by trying to get performance numbers.

RJ: I think there are some technical things that need to be thought through regardless. I would like to get someone who is interested in moving this forward to be involved.

### RFC: Deprecate Ember.Logger

RJ: (summary). I am advocating to move this to FCP.

YK, TD: No objections!

RJ: This is just a nice cleanup. There isn’t any reason we need this. It could always be moved out to an addon as well.

### RFC: Deprecate component lifecycle events

RJ: The only opposition here was mixin’s wanting to add hooks and not wanting to need the subclasses to call super.

YK: I’m ok this this as long as that case is agreed upon.

TD: Do we want to do this if we want to move to the glimmer component API anyway? Is this just churn of something that will be legacy.

TD: I guess the counter-argument is this change would make it easier for you to use these later on.

YK: GC thinks doing the work should have a proportional payoff. The mixin case is problematic. Perhaps we can lint that super is called in all hooks? What is the problem with the current system?

RJ: In a complex component it is hard to know the order of hooks, and to debug or step through them.

TD: I don’t think there is cruft we want to get rid of, we want to get rid of this because it is an anti-pattern. People know not to do this.

YK: I think the “I forgot to call super” issue is a real one.

(discussion)

YK: We should have the RFC require a codemod to add super to all lifecycle hooks and add a linter that expects that super should be there.

(discussion, concerns re: addons and their transition path)

RJ: We should have more of this conversion on the RFC, this is helpful.

DG: I will leave a note.

TD: So consensus is that we punt on this after Emberconf.

### Transition became private

YK: There isn’t a good regression checking system here. We don’t catch when things like docs fall off unexpectedly. Learning team is working on this.

YK: We also talked about Ember.Namespace. Should we have things like this in the docs still? They take up space etc.

RJ: Or we should simply push to deprecate.

YK: If we think we can deprecate it that seems fine. Anyway, I will punt this until next week. I’m also having conversations about documenting interfaces.

### named args feature flag

Good to go. :shrug:

### Object Model

YK: I think we need to make a decision philosophically what the migration looks like. There is one direction where we make it mechanical and automated and work hard to make it work. The other model is that you do the React thing and opt-in to one or the other for parts of the app. It is unfortunate for the steady migration path that you might confuse how es6 classes work. I’m not sure how to start this conversation without getting into the weeds. I don’t want to wait on the conversation, but it is hard to do remotely / async.

KS: We discussed supporting the old world but coming up with a new pattern that works well with es6 classes. But it leaves addons that need to support the old world stuck using the legacy classes. Supporting going to ES6 and doing an extends( off that is very hard.

YK: That is one question, can we support the interop of extending downstream.

KS: Getting es6 extends to work from Ember classes is very possible. And I think there is a benefit to having the es6 support in apps.

YK: We could try to identify the hard features that block subclassing. For example we could easily support subclassing for services, but not permit it for components until much later on.

RJ: I agree… you and I have chatted a lot about it. It is a different decision to say in the native class you can or cannot use observers or CPS. I don’t think we would disagree. But if we say you cannot use the class syntax at all that is troubling since you could already do it before this RFC.

YK: Saying it does work is problematic…

KS: No it works. I’ve done a whole app with it. You can’t use a lot of features.

YK: GC’s proposal is to say that… to make the failure modes assertions instead of making it uneligable to subclass.

YK: My general sense is that we could assert things on es6 that are impossible. For certain things on the subclass like clobbering the observer we can do that from es5.

RJ: Roughly start conservatively then relax the restrictions.

YK: Yes. I think people just shouldn’t do lots of refactoring at the beginning.

RJ: I think we need to do a better job of listing the cases so we don’t miss something on the incremental path.

KS: I think the biggest footgun and is difficult for browser vendors with our object model is that every browser does the hidden class thing the same. they expect that way you define properties to be in that same order from the base class to the parent class. But out idea of the parent class sending the injections down and setting them at the base is super trolly. I’m more concerned with injections and owner and trying to align with what the browers expect from the constructor.

YK: RJ is very strongly concerned about that approach (addons earlier or later).

YK: I think this needs to be gone over later. I think there is a question that should we ever get es5 classes to be aligned with the browser model.

(discussion)
