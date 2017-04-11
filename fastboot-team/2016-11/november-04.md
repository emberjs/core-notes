# FastBoot Meeting Notes 2016-11-04
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Tom Dale, Arjan Singh, Ryan Cruz, Robert Jackson
## Agenda
- [ ] Last Week's Action Items
  - [ ] Krati to push WIP branch of restructure proposal
  - [ ] Tom: Tell Core team the plan for FB structure going forward to get approval
  - [ ] Dan: Cut a new beta with the fixed `--watch` command within the next day, land better fix ASAP and release
  - [ ] Review and merge https://github.com/ember-fastboot/fastboot/pull/75 and https://github.com/ember-fastboot/ember-cli-fastboot/pull/245 and then see if needs https://github.com/ember-fastboot/ember-cli-fastboot/pull/280 needs to come in -
- [ ] Krati's refactoring
- [ ] Build Process
## Notes
- Krati has a WIP build PR https://github.com/ember-cli/ember-cli/pull/6395
  - Krati opened an Targets RFC for generic build process
    - RJ: Discussion in ember-cli meeting yesterday
      - This touches a lot of things, could entangle many existing RFCs
      - Land FastBoot functionality first so that it doesn't entangle everything right off the bat
    - RJ: After RFC lands, what is public/private
    - RFC is tracking the desired outcome, will likely land in stages
      - ie Stage 1 fastboot, Stage 2 more things
    - Focus on actually functioning and prototype rather than the solve everything solution
    - Ember-cli team needs to determine Module RFC impact on fastboot structures
    - Additional targets add another wrinkle in terms of directory structure
    - Engines as well, but RJ doesn't think the impact 
    - FastBoot directory should be pretty thin
    - If we add a sigil for arbitrary targets, we prevent the use of that sigil in the future
  - We've blocked FastBoot 1.0 with this need
  - Having the same browser and fastboot app (append only), there is a benefit with debugging, deploying etc - Stef
  - Polymer: Does both rollup build + splat files to take advantage of HTTP2
- [Ember-cli-fastboot Issue #270](https://github.com/ember-fastboot/ember-cli-fastboot/issues/270)
  - Loading addition assets into the sandbox
  - TD: This makes me nervous
    - Arbitrarily bringing in payloads is essentially a black box
      - Prevents treeshaking
      - Could be accessing Globals
      - Footgun/Prevents optimizations
    - We want to have a smarter server so that we can serve sections of the app needed, rather than everything
    - If we allow this, we need to be able to get insights from additional files so that we can use the tree shaking and other optimazations in the future
  - Example need: i18n and locales
    - Preload all localizations, handle it on a request basis
  - RJ: What if we make vendor an array
- [FastBoot PR #93](https://github.com/ember-fastboot/fastboot/pull/93)
  - Related issue: https://github.com/ember-fastboot/fastboot/issues/94
  - Scheduled functions could trigger after destruction (runloop executing after destruction)
  - ember-lifeline: entangles runloop operations with originating object
  - How does this work without sandbox: https://github.com/emberjs/ember.js/blob/master/packages/ember-application/lib/system/application-instance.js#L249
    - Ember is eval'd outside of sandbox
    - FastBoot code that is executed outside of sandbox when calling `visit`
      - https://github.com/ember-fastboot/fastboot/blob/master/src/ember-app.js#L226
    - Code called in one realm stays in that realm
      - Pulling something out of a realm and calling the runloop action still occur in the original realm
    - TD: Agrees that anything significant should happen inside the sandbox/realm
      - Only things that call into the sandbox should be things that pass state
  - run.later's will continue after destruction since the runloop does not track
    - runloop queue should live on instance container
    - Ember needs a better API for runloop, not ultimately FB problem

## Action Items
- [ ] Tom: Review PRs (links)
  - [ ] https://github.com/ember-cli/ember-cli/pull/6395 
  - [ ] https://github.com/ember-cli/rfcs/pull/75
  - [ ] https://github.com/ember-fastboot/fastboot/pull/93
- [ ] Tom/Rob/Krati/Dan Geb/Stef/Dan McClain: Get in a room (hangout) and discuss concerns
- [ ] Rob/Dan cut a release of fastboot and ember-cli-fastboot