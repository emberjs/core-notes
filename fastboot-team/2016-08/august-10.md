# FastBoot Meeting Notes 2016-08-10
*Please add yourself.*
Dan McClain, Arjan Singh, Tom Dale, Patrick Fisher
## Agenda
- [x] Last Week's  Action Items
  - [x] Tom & Stef to work on watch work, one way or another 1.0 will be released today
  - [x] Tom to review User Guide
  - [x] Tom to write blog post
- [x] FastBoot 1.0 Release (TD)
  - [x] Stef and other core team member concerns
  - [x] Work that's happening
- [x] [Boot Errors Swallowed](https://github.com/ember-fastboot/fastboot/issues/76)
- [x] [App Server PRs](https://github.com/ember-fastboot/fastboot-app-server/pulls)
## Notes
- Last Week and shipping 1.0
  - Stef concerned about watch
  - Original plan: If Stef couldn't fix by Fri, we'd ship anyways
    - Things came up for Stef last week
    - Stef is taking some work time this week
  - Stef and Core team nervous about hacks happening (concat files)
  - Ember Core team wants to wait until build time regressions to be addressed
  - Stef wants app to be the same across Node and Browser
  - `fastboot/browser` initializers to be deprecated
  - App code to be considered isomorphic
  - Targets would provide environment specific code
  - Stef is updating ember-cli so we can hook into express middleware in `ember serve`
  - Stef wanted to release an RC now, but Tom wants to wait until we have an actual release candidate
  - Tom: Let's push back to 2.8 instead of 2.7, give us time to fix and test things without rushing out
  - Dist directory to be deprecated
    - `builds` will take its place, so we would have `builds/{browser,fastboot}`
    - for backwards compat, we would sym link `dist` to `builds/browser` 
- Boot Error swallowed
  - When app instance is built, when the boot promise throws an error, the exception is being swallowed instead of the promise getting rejected
  - DSC seeing errors when rendering throws error, that gets rejected properly
  - Tom: It seems like the bug is in ember because visit is not rejecting the error as expected
    - It's possible that async error is not properly being caught and rejecting
- User defined middlewares
  - There is definite utilities for this, but we want to find the proper API for this
  - Arjan: "Group middleware" solves the multiple middleware case
    - group middleware being a single middleware that wraps multiple separates as a single middleware
  - Middleware ordering matters, adding before/after solves this *but* it just makes for brittle infrastructure
  - We're going to hold on this to evaluate options
## Action Items
- [ ] Arjan to continue debugging Boot promise issue
- [ ] Dan to reach out to Stef about Targets work