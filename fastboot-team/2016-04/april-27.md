# FastBoot Meeting Notes 2016-04-27

## Attendees

_Please add yourself._

Tom Dale, Ron White, Dan McClain, Krati Ahuja, Arjan Singh

## Agenda

- [x] Last Week's Action Items
  - [x] @tomdale will review, @danmcclain will write tests to verify with async component
  - [x] @pwfisher will work on FastBoot watching
  - [x] @arjansingh will work on adding the server response to the FastBoot service
- [x] High Priority Pre-1.0 Items
  - [x] simple-dom/browser attribute unification
    - [x] e.g. https://github.com/ember-fastboot/ember-cli-fastboot/issues/161
  - [x] Allow `configInMeta`
    - [x] https://github.com/ember-fastboot/ember-cli-fastboot/issues/160
  - [x] Performance/Memory Issues
    - [x] https://github.com/ember-fastboot/ember-cli-fastboot/issues/159
  - [x] Unified app build
  - [x] Cut a beta
- [x] Undefined attribute bindings fix in htmlbars (+glimmer?)
  - [x] [PR](https://github.com/tildeio/htmlbars/pull/455)

## Notes

- Boolean attributes causing problems with fastboot
  - FastBoot can potentially produce invalid HTML (`<div>` inside `<p>`)

## Action Items

- [ ] @tomdale to leave a comment on https://github.com/ember-fastboot/ember-cli-fastboot/pull/169 re: whether `deferRendering` should take a non-thennable, @danmcclain will add a better error message if a non-thennable is passed
- [ ] Review watcher PR https://github.com/ember-fastboot/ember-fastboot-server/pull/46/files
- [ ] @tomdale to review `FastBootResponse` PR
  - [ ] https://github.com/ember-fastboot/ember-fastboot-server/pull/47
- [ ] @arjansingh to write http redirection code RFC
- [ ] @tomdale to review Krati's onerror pull request
- [ ] @tomdale to cut a new release with https://github.com/tildeio/htmlbars/pull/455
