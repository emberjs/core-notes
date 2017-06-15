# ember-cli Meeting Notes - 2017-06-15

## Attendees

- @hjdivad dh David Hamilton
- @kratiahuja ka Krati Ahuja
- @rwjblue rj Robert Jackson
- @stefanpenner sp Stefan Penner
- @turbo87 tb Tobias Bieniek
- @kellyselden ks Kelly Selden

## Agenda

- ember-cli-shims v1.2.0
- testing
  - deprecate restricted resolver
  - new testing API
- ember-cli-fastboot@rc.4 after fingerprinting is merged
- npm v5 / node8
- shutdown code
- better errors
- hydration updates

## Discussion Notes

### ember-cli-shims v1.2.0

- tb: ember-cli-shims 1.2.0 supports new format.  Master of ember-cli is using 1.2.0-beta.
- rj: don't think beta is using 1.2.0.  Let master flow to beta
- sp: the shims in beta are 1.1.  In master they are the beta version.
- rj: when master rolls to beta the new beta will include the version that has the deprecations.  The deprecation message doesn't make it clear where it's being imported from.  Should we add an API to loader.js to expose the importing module?
- sp: something like `__dirname`?
- ka: i think the loader might already do something similar to this
- dh: to confirm the goal is just to make the deprecation message more actionable?
- rj: confirm
- sp: what do we call this?  module name?
- rj: module id?
- sp: modules already have an id
- rj: we have generally been calling these things module ids.
- sp: i don't mind renaming it, we should just do it uniformly within loader.js
- sp: okay what should we call it?
- rj: moduleId
- rj: the ecma proposal for the import function has a way of knowing this as well.
- tb: what do addons do?
- rj: i think the short answer is that addons don't use the shims.  Someone should make an addon babel plugin to convert to the globals API.  Addons can't guarantee the version of shims it will be used with.
- rj: we'll conditionally add that plugin based on the version of ember-cli-shims.  Essentially a polyfill.

### testing API resolver / new API

- rj: rfc for changing the use of the restricted resolver.  Much of the work is already done and is a stepping stone towards the grand unified testing rfc.
- sp: the only thing i don't like is `hooks` as public API.
- rj: i have a PR to qunit to address this
- tb: what is the problem with hooks?
- rj: it is more difficult to explain why a magical argument is necessary if you're not familiar with the qunit api
- sp: there is a problem with dealing with this binding
- rj: people want to use arrow functions here
- sp: arrow functions are just wrong here: context is explicitly not supposed to be preserved
- dh: some people want arrow functions just to have concise function definitions
- *sidebar discussion re arrow functions*


### ember-cli-fastboot@rc.4 after fingerprint fix

_ ka: today there is some explicit work people need to do; i have a fix and would like to release when it's done
_ rj: seems very good
_ sp: :+1:
_ ka: also re addon migration we have about 6 addons left to migrate, working off a list of the most popular addons from @kategengler
_ sp: anything else stand out?
_ rj: what about transforms?
_ ka: still need to do the rfc for that


### npm v5 / node 8

- sp: this is still outstanding
- dh: to confirm, stuff may well work, it's just that tests are red due to a bad symlink
- rj: has anybody looked at using npm 5, besides the tests issue?
- sp: it's slightly slower but much better


### shutdown

- sp: seem to have a lot of churn in the shutdown code.  Do we need to put together a doc or rfc to describe things?
- rj: a general architecture doc around shutdown would be good
- dh: should this doc cover capture-exit stuff as well as command/task stuff?
- rj: yes
- sp: okay don't want to derail, but it seems we agree that a doc to cover this stuff would help
- dh: yes
- rj: yes

### better errors

sp: @twokul has been doing some work on improving error messages by putting them in a common format.  This will give us scope in the future to properly propagate ember-cli verion and so on.  If you have a chance to check it out on master, give it a whirl.
ka: is this exposed for other addons to use?
rj: it's documented
sp: but i think the question is how do addons add arbitrary stuff to these errors.  There isn't a pattern for this yet.  Maybe we'll read from some well-known global or something
ka: this would be helpful for fastboot.
sp: what are some concrete examples for fastboot?
ka: eg using some jquery API not exposed in the sandbox won't show up in the console
sp: shouldn't development be in a mode where we do crash and show the error page?
ka: yes but that's not there yet.  This interface will help us with broccoli-middleware

### hydration updates

ks: rob you had mentioned hydration earlier, is there anything we need to be aware of?
rj: it doesn't substantially affect us right now.  It will probably land behind an ember feature flag, but we don't really need to make large changes to the infrastructure.  We pretty much just have to put glimmer in a special mode
sp: although ember-cli likely doesn't have to make changes, what about fastboot?
rj: the ember visit api will need to support a serialize flag that fastboot will take advantage of
sp: okay so fastboot will need to put glimmer into a particular mode and remove the code to delete the dom before starting the app?
rj: yes, those two things

### ember-console

sp: has anybody had a chance to use ember-console
ka: yes it works really well
sp: it works even better with ember master.  I bring it up because I'd love to get to a point where we can include fastboot and something like ember-console by default

