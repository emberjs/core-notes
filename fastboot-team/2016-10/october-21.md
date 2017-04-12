# FastBoot Meeting Notes 2016-10-21
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Arjan Singh, Tom Dale, Kelly Selden
## Agenda
- [ ] Last Week's Action Items
- [x] Ember-FastBoot restructure
## Notes
- Ember-FastBoot Restructure
  - Namespace FastBoot
  - Turning FastBoot into a first-class Ember-CLI member
    - May not be built in, but all changes necessary for ember-cli will exist
    - Will tie into the system of `ember serve`
    - TD: reservations of tying into `ember-cli`
      - We are not able to iterate as fast as not being a part of ember cli, as we don't need to RFC and wait for approval
    - Ensure that the hooks that we need get included so that we are decoupled as long as possible
    - KS: Other teams are running into hook issues, CLI team is considering expanding hooks to accommodate
      - Make the hooks general purpose so that codorva and electron can benefit as well
    - TD: Phase 1 of Targets - Hardcode the first class FB ones, Phase 2 - Identify other needs then make a public API that others can consume
    - KA: Will push a WIP branch on Monday 10/24 for others to review
  - This is the last major blocker as it is not additive before 1.0
- DSC has 1 prod FB app currently
  - TD: would like to generate a story around compatiblity with current apps
    - Ember Watson migrator would be ideal, compatiblity layer is alternative option
    - Ultimately blocked by the new build process, but still urgent
- FastBoot intends to adopt an RFC process post-1.0
- Watch should be fixed prior Dan's proper fix, release to be cut
- Ember-Data: https://github.com/kellyselden/ember-data-fetch-support
  - One line patch to replace $.ajax with fetch API
  - TD: A surprising number of Ember Apps use jQuery prefilters to add authentication
    - Probably the biggest blocker for ED to adopt fetch
    - Also disappointing there is not a jQuery AJAX transport for Node prior
- KA: Where does `npm install` for production builds in the `dist` directory happen?
  - TD: this is manually done right now
- KA: Should FastBoot support doing anything other than `GET` request?
  - TD: No, we want to reserve the ability to support `POST` and other requests in the future without breaking public API
    - It is possible to have say a search form that works without JS by adding a HTML form that POSTs to an endpoint and does the work before redirecting
    - For now, we should 404 on POST and just allow GET requests.
- KS: Metadata PR, and seeding the shoebox
  - Both push data into the Ember app in different spots
  - Useful when porting an existing Express app
  - TD: Reluctant with this type of addition, as it expands the surface area of the API
    - Limited window of how long this will remain useful for passing into the shoebox
- There are now multiple PRs adding options to `visit`

## Action Items
- [ ] Krati to push WIP branch of restructure proposal
- [ ] Tom: Tell Core team the plan for FB structure going forward to get approval
- [ ] Dan: Cut a new beta with the fixed `--watch` command within the next day, land better fix ASAP and release
- [ ] Review and merge https://github.com/ember-fastboot/fastboot/pull/75 and https://github.com/ember-fastboot/ember-cli-fastboot/pull/245 and then see if needs https://github.com/ember-fastboot/ember-cli-fastboot/pull/280 needs to come in -