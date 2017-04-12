# FastBoot Meeting Notes 2016-06-15
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Arjan Singh, Patrick Fisher, Ron White, Tom Dale, Edward Faulkner
## Agenda
- [x] Last Week's Action Items
  - [x] Review watch PR: https://github.com/ember-fastboot/ember-cli-fastboot/pull/200/files
  - [x] Review PR (Arjan): https://github.com/ember-fastboot/fastboot/pull/65
  - [ ] Tom to review/refresh path to 1.0 doc to allow people to track progress/contributen
  - [ ] RJ to write up proposal of path forward for ember-cli and ember-cli-head integration
  - [x] DM to release new betas
  - [ ] https://github.com/ember-fastboot/ember-cli-fastboot/issues/56 - Someone will attempt to pick it up
- [x] Revisit Release Date readiness: [Roadmap 1.0](https://github.com/ember-fastboot/ember-cli-fastboot/issues/98)
- [x] [Watcher PR to ember-cli-fastboot](https://github.com/ember-fastboot/ember-cli-fastboot/pull/200/files)
- [x] `concatFiles` deprecation, related to [PR #217](https://github.com/ember-fastboot/ember-cli-fastboot/pull/217#issuecomment-226207533)
  - [ ] Deprecations in general
- [ ] Website vs Readmes: Outdated & Missing docs
  - [ ] Disabling Imports ([issue](https://github.com/ember-fastboot/ember-cli-fastboot/issues/57) @danmcclain to address)
  - [x] Scheduling afterRender inside of DidInsertElement ([related issue](https://github.com/ember-fastboot/ember-cli-fastboot/issues/207))
- [x] 38 issues: We should triage
## Notes
- Discussion of whether `afterRender` should be invoked in FastBoot
- Anything that touches the DOM in `afterRender` should only be scheduled from inside a DOM-only hook (like `didInsertElement`)
- [Watcher PR](https://github.com/ember-fastboot/ember-cli-fastboot/pull/200)
  - DM: There's been some review of the Watcher PR. Rob had made some comments on it. Most of the comments are around using the existing server `reload` mechanism. We also noticed that every time you reload the app, it does an `npm install`. If you're going to be modifying your `package.json` we should probably have people manually restart.
  - RJ: In Ember CLI in general, `package.json` changes require a server restart anyway.
  - PF: That was an intentional decision to make sure `FastBoot.require()`d dependencies were available.
  - TD: Broccoli is perfect for caching node_modules when the package.json changes, we could build a broccoli task to handle the npm install, rather than explicitly calling npm install
  - EF: Browserify could be a viable alternative rather than our somewhat hacky solution of calling npm install. Need to build a stable plug (rather than calling npm install on build OR deployment). npm could change between building and deploying, killing your app in prod
  - RJ: We expect dist/fastboot/node_modules to be present, this will be killed by broccoli rebuild. 
  - PF: Can we treat these optimizations as a separate task?
  - Let's bring in Ember-suave
  - Land this as is, then suave-ize ember-cli-fastboot
- 1.0 readiness
  - No tasks are blockers for 1.0
  - testing for addons
    - First pass: Does the app boot with the addon
    - ember-try is more configurable to allow customized testing
    - TD: Hold off until the grand test unification RFC lands
      - RJ: willing to add FastBoot related primatives
    - TD: Do we want to us another driver to test fastboot or do we want to implement our own subset of a browser so that we can run some tests against the response
    - EF: extract the URLs that are hit in your existing tests then make sure those don't blow up against FastBoot
    - TD: At the end of the day: people can run selenium tests if they need them
  - performance regressions
    - AS: feels like 2x the regular build time (which would likely be a minimum increase)
    - RJ: We should be able to reduce the number of things we are doing twice
    - TD: Tree shaking is a good time to address this
    - Separate vendor files for Browser vs Node
      - `app.import` could be fastboot aware
      - TD: wants to write an RFC to introduce build targets in ember-cli
- `concatFiles` has been deprecated
  - ember-cli will remove this in the future
  - RJ: we use it for stripping out initializers
- Documentation
  - Policy RE public vs private
  - Inline code doc: YUIDoc and doc blocking
- We should triage our issues
  - RJ: We should be better at labelling issues
## Action Items
- [ ] Land watcher PR as is
- [ ] Suave ember-cli-fastboot
- [ ] RJ to write up proposal of path forward for ember-cli and ember-cli-head integration
  - [ ] Brain dump with someone to write this up so that RJ is not blocking
- [ ] Tom to review/refresh path to 1.0 doc to allow people to track progress/contribute
- [ ] Tom to RFC ember-cli RE: `concatFiles`