# ember-cli Meeting Notes - 2017-02-16

## Attendees

- Robert Jackson
- David Hamilton
- Katie Gengler
- Tobias Bieniek
- Jake Bixby
- Chad Hietala
- Stefan Penner

## Agenda

- [#6724](https://github.com/ember-cli/ember-cli/pull/6724) remove ember-cli-sri and ember-cli-uglify from addons
- [RFC #96](https://github.com/ember-cli/rfcs/pull/96) and [PR #6748](https://github.com/ember-cli/ember-cli/pull/6748) (yarn support)
- [PR #6772](https://github.com/ember-cli/ember-cli/pull/6772) (`ember new` with blueprint from NPM)
  - important for standalone glimmer apps
- [Module Unification RFC](https://github.com/emberjs/rfcs/blob/master/text/0143-module-unification.md)
  - Quest issue: [emberjs/ember.js#14882](https://github.com/emberjs/ember.js/issues/14882)
  - `src/ui/index.html` needs to be supported
  - `src/ui/styles/app.css` needs to be supported
  - `app/app.js` and `app/resolver.js` are currently mandatory
  - how do we want to support the RFC?
    - replace/modify `EmberApp`?

## Discussion Notes

- [RFC #95](https://github.com/ember-cli/rfcs/pull/95) (build targets aka. browsers)
  - @cibernox has opened a spike PR
  - SP: we should focus on browsers for now, maybe add `node` or `fastboot` keys later
  - SP: it should use an experimentation flag for now
- [RFC #96](https://github.com/ember-cli/rfcs/pull/96) (yarn support)
  - TravisCI config in `app` and `addon` blueprints has been updated to use yarn if `ember new --yarn` was run
  - RFC and PR will be merged (no objections)
- [#6724](https://github.com/ember-cli/ember-cli/pull/6724) (remove sri and uglify from addons)
  - This would create churn for addon authors without a big benefit
  - Will be discussed next time when Kelly Selden is in the meeting
- [PR #6772](https://github.com/ember-cli/ember-cli/pull/6772) (`ember new` with blueprint from NPM)
  - Using a `npm:` prefix for `ember new` seems unnecessary since `app` and `addon` are the only conflicting names right now and it seems unlikely that we will introduce other conflicts
  - The implementation currently seems to allow NPM package blueprints for `ember install` too which would be undesired
  - Unit tests are still missing from the PR
  - `package.json` should contain a `ember-blueprint` keyword
    - Ember CLI will only accept NPM packages with that keyword
    - Ember Observer can discover those packages more easily
- SP: Do RFCs need a core team champion?
  - Discussion is moved to the next week
- [Module Unification RFC](https://github.com/emberjs/rfcs/blob/master/text/0143-module-unification.md)
  - Discussion is moved to a separate meeting between RJ and TB