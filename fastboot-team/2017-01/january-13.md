# FastBoot Meeting Notes 2017-01-13
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Kelly Selden, Ryan Cruz, Arjan Singh, Robert Jackson, Tom Dale
## Agenda
- [ ] Last Meeting's Action Items
  - [ ] Tom: Remove module alchemist transpilation infrastructure now that 0.12 is unsupported
  - [ ] Ryan: Update debugging instructions on `ember-cli-fastboot`
  - [x] Arjan: PR to remove 0.12 (please do all of them)
  - [ ] Tom: [Merge Express static PR once 0.12 is removed from build matrix](https://github.com/ember-fastboot/fastboot-app-server/pull/35)
  - [ ] Rob to peek at https://github.com/ember-fastboot/ember-cli-fastboot/pull/269
    - [ ] Dan to coordinate with Rob
  - [ ] Rob and Tom to wordsmith response to BaseURL PR on ember-cli-fastboot (PR 273)
  - [x] Rob and Krati to pair up on ember-cli-fastboot manifest schema versioning
  - [ ] Dan to add tests for https://github.com/ember-fastboot/ember-cli-fastboot/pull/250 (probably not for next week)
  - [ ] Tom to look at memory leak issue ([PR: fastboot/103](https://github.com/ember-fastboot/fastboot/pull/93))
  - [ ] Rob to add failing test around AfterModel transition issue
- [x] Header splitting [fastboot/111](https://github.com/ember-fastboot/fastboot/issues/111) and [fastboot/84](https://github.com/ember-fastboot/fastboot/pull/84) 
- [x] Question from Kelly: transitionTo/replaceWith going to localhost
## Notes
- Arjan removed Node 0.12 from build matrices
- Alchemist
  - Node 4 has limited ES2016 support
  - TD: In favor of keeping Alchemist without postInstall hook to enable all ES2016 features
  - RJ: use babel-preset-engine (right name?) to define what we want
- Core team desires a single build pipeline to share throughout projects, meeting on 1/16 regarding this
  - Pipeline for microlibraries (similar to module alchemist but different)
- Debug instruction update by Ryan is in progress
- Base URL
  - Kelly is working on updates, this will supersede existing PR
  - Assets aren't mounted properly in ember-cli-fastboot ATM
  - Fastboot-app-server needs updates for asset hosting with respect to rootURL/baseURL
- Manifest Schema versioning
  - Rob and Krati met and agreed on direction for schema versioning
  - Update to ember-cli-fastboot will do nothing but set manifest to version 1 for current, then version 2 will update for appFiles/vendorFiles arrays
  - Krati to start work this weekend on this
- Header splitting
  - Dan: thought he saw headers comma separated at a time in the past (could be incorrect, probably is)
  - Kelly: Current version of express handles headers correctly
  - Let's merge fix!
  - Value that's a string -> Insert into an array
  - Array -> Just use it
- transitionTo/replaceWith
  - Kelly: Running locally with /etc/hosts url. When replacingWith, using localhost:3000
  - Dan's guess: custom domain is not respected (via header), using the bound url/port
    - Uses the hostWhitelist to check host header
## Action Items
- [ ] Ryan: Continue update debugging instructions on `ember-cli-fastboot`
- [ ] Rob to peek at https://github.com/ember-fastboot/ember-cli-fastboot/pull/269
  - [ ] Dan to coordinate with Rob
- [ ] Dan to add tests for https://github.com/ember-fastboot/ember-cli-fastboot/pull/250 (probably not for next week)
- [ ] Tom to look at memory leak issue ([PR: fastboot/103](https://github.com/ember-fastboot/fastboot/pull/93))
- [ ] Rob to add failing test around AfterModel transition issue
- [ ] Kelly is going to try to repro the redirect issue