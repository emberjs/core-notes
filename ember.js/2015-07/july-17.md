# Ember Meeting Agenda 2015-07-17

### Attendees

Robert, Trek, Stefan, Leah, Erik, Martin, Igor, Alex

### Minutes

SP: Awesome progress on ember-twiddle.com.

LS: Updates on next F2F meeting in September.

LS: updates for ember conf, and other potential future events.

RJ: can we schedule F2F further out, so planning is easier.

LS: Yup, lets doit by/during the next F2F

TG: Docs sub-team has been meeting for a couple weeks, and the effort seems to be progressing well.

TG: The docs team is trying to determine what to use for data persistence at the very early stages (use Ember Data, Something else, etc...). `$.ajax` is not good enough.

<aside> 

EB: Is there an issue in ember-cli that requires python?

RJ: Yes, node-gyp was used for compiling native extension for socket.io.

RJ: Stef updated ember-cli in https://github.com/ember-cli/ember-cli/pull/4466 to prevent bundling optional dependencies.

</aside>

TG: Discussed the new folder structure 

RJ: Ember 2.0.0 beta status: currently on beta.2 should release beta.3 in the next couple days.

KS: We should ensure that we release 5 betas.

RJ: Sounds good, that would put us at 2015-07-31 for final release.

EB: There seem to be a few regressions still present in 1.13 that we need to address.

RJ: Lets discuss https://github.com/emberjs/ember.js/issues/11759 and https://github.com/emberjs/ember.js/issues/11760.

AM / MM: `this.routeName` should definitely be public.

RJ: What about `this.currentModel`?

MM: Folks should likely use `this.modelFor` or `this.get('controller.model')` to get the model instead of relying on `currentModel`. 

RJ will comment on issues and get PR's to update the documentation.
