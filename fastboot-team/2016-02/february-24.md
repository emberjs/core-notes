# FastBoot Meeting Notes 2016-02-24

## Attendees

Ivan Kobza, Tom Dale, Ron White, Dan McClain, Miguel Camba, Terence Lee

## Agenda

- [x] Last week AI recap
  - [x] @cibernox to contact @krisselden on es6 support
  - [x] @ronco to continue working on fastboot filtering
  - [x] @cibernox Decide if `ember-fastboot-test-helpers` should be framework agnostic (like `ember-test-helpers`) and have `ember-fastboot-qunit` and `ember-fastboot-mocha` with specific flavours. Right now focusing only on qunit.
  - [x] @tomdale to expose `_request` on FastBoot
  - [x] @ef4 to design API for "session" service that uses cookies to sync stateful info across browser and FastBoot server
  - [x] @ronco to add automated testing for `ember-cli-head`
  - [x] @cibernox will try to create generic harness for FastBoot extracted from ember-power-select
  - [x] @krati to update sandbox adapter PR
- [x] Mode specific initializers
- [x] Heroku

## Notes

RW: Can't automatically filter `treeForApp` because it's scoped per addon. I will continue working on an exported Broccoli filter.

MC: I have a proof of concept working. See http://quick.as/qa5rc9zkk for an example screencast. `ember fastboot:test` starts a server, calls the build task to build tests, and calls a runner file that requires all of the individual tests.

MC: I am just focusing on QUnit. Will keep other testing libraries in mind.

TD: https://github.com/tildeio/ember-cli-fastboot/pull/121

https://github.com/ember-fastboot/ember-fastboot-server/pull/19

MC: WIP PR of the test harness: https://github.com/cibernox/ember-cli-fastboot/pull/1

EF: We need some way to put placeholders for ads since we'll never be able to render those in FastBoot (probably).

## Action Items

- [ ] @ronco to keep working on initializer filtering
- [ ] @ef4 to design session service API, @tomdale will help
- [ ] @tomdale will merge cookie PR and release new version
- [ ] @tomdale will add "set cookie" API
- [ ] @tomdale to provide @hone02 with people that have sample FastBoot apps
- [ ] Jeff, @hone02, @ronco and others to help us fill out https://github.com/tildeio/ember-cli-fastboot/issues/100
- [ ] Design API for deferring FastBoot flush to the server (via pushing promises to the service, or something else)
  - [ ] Take into account that you should probably wait for the next render after the asynchrony
