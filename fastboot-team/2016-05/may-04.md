# FastBoot Meeting Notes 2016-05-04

## Attendees

*Please add yourself.*

Tom Dale, Krati Ahuja, Marco Otte-Witte, Patrick Fisher, Ron White,
Arjan Singh, Edward Faulkner, Dan McClain, Robert Jackson, Ricardo
Mendes

## Agenda

- [x] Node version support at 1.0 launch
    - [x] I want to say v4.2 because we have a loooooot of promises and
      fat arrows make that 100x nicer
 
- [x] `fastboot`/`ember-fastboot-server`/`fastboot-app-server`
    - [x] Been doing a lot of work in terms of cleaning up the
      architecture before we cut 1.0
    - [x] See WIP at
      https://github.com/ember-fastboot/ember-fastboot-server/tree/fastboot-rename
 
- [x] @tomdale to leave a comment on
  https://github.com/ember-fastboot/ember-cli-fastboot/pull/169 re:
whether `deferRendering` should take a non-thennable, @danmcclain will
add a better error message if a non-thennable is passed
- [x] Review watcher PR
  https://github.com/ember-fastboot/ember-fastboot-server/pull/46/files
- [x] @tomdale to review `FastBootResponse` PR
    - [x]
      https://github.com/ember-fastboot/ember-fastboot-server/pull/47
 
- [x] @arjansingh to write http redirection code RFC
    - [x]
      https://github.com/ember-fastboot/ember-fastboot-server/issues/54
 
- [x] @tomdale to review Krati's onerror pull request
- [x] @tomdale to cut a new release with
  https://github.com/tildeio/htmlbars/pull/455
- [x] Deprecate `doc.title` - @danmcclain
 
## Notes

- Since we are pre-1.0, we have the opportunity to "break" support for
  0.12
    - Dropping 0.12 allows for use of promise/fat arrows/`let`/`const`
 
- `ember-fastboot-server` was a lot more than just a server
    - cli/server/sandboxing all mixed in
    - `fastboot-app-server` is an infrastructure rewrite of what
      `ember-fastboot-server` should have been
    - discussed renaming `ember-fastboot-server` to
      `ember-fastboot-middleware` (pre-discover of name `fastboot`)
    - `fastboot` will be refactored for spinning up the ember app,
      setting up dist, etc in node
    - `fastboot-express-middleware` package wraps `fastboot` for being
      served as a middleware for Express
    - Refactor *will* cause breaking changes - Let @tomdale know when
      your addon breaks if it access `fastboot`
 
- RJ: If we author in ES6 and want to target Node 0.12 via a Babel
  compile, let's make sure we do it as a prepublish step rather than a
runtime compile
- RJ: Ember CLI has made a decision to support all Node LTS releases,
  including Node 0.10
- Watcher closed per refactor of `fastboot`
- Redirection RFC
    - Some patching of ember is needed to work in the end
    - bugs with `replaceWith` exist in Ember
    - RJ: ~50% of people that use `replaceWith` are using it wrong in
      his experience (consider it a footgun)
    - TD: Forcing `replaceWith` for FastBoot is a high bar without a
      signficant reason
    - Redirecting will abort rendering immediately
             - Call to transition/replace stops rendering, sets headers
             - server sends redirect response
 
    - Potential implementations
             - AS: reopen router
             - RJ: Custom location for FastBoot (avoids reopening
               router)
 
 
- RJ: I'd like to move ember-cli-head to either `ember-fastboot` or
  `ember-cli`
- Consensus reached on deprecating `doc.title`
 
## Action Items

- [ ] @kratiahuja to report on whether there is a significant
  performance regression 0.12 -> Node 4
- [ ] @tomdale to cut a new release with
  https://github.com/tildeio/htmlbars/pull/455
- [ ] @tomdale to audit GitHub and npm packages and make sure
  @danmcclain has access
- [ ] @rwjblue to write up constraints around steps to integrate
  `ember-cli-head` into `ember-cli`
- [ ] @danmcclain to deprecate `doc.title` prior to betas
 
