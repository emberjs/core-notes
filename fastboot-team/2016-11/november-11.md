# FastBoot Meeting Notes 2016-11-11
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Arjan Singh, Kelly Selden, Rob Jackson
## Agenda
- [ ] Last Week's Action Items
  - [ ] Tom: Review PRs (links)
    - [ ] https://github.com/ember-cli/ember-cli/pull/6395 
    - [ ] https://github.com/ember-cli/rfcs/pull/75
    - [ ] https://github.com/ember-fastboot/fastboot/pull/93
  - [x] Tom/Rob/Krati/Dan Geb/Stef/Dan McClain: Get in a room (hangout) and discuss concerns
  - [x] Rob/Dan cut a release of fastboot and ember-cli-fastboot
- [x] Memory sieve
- [x] FastBoot Ember-CLI changes meeting (ping Rob if interested; read ember-cli RFC #77)
## Notes
- Ultimate plan for `ember fastboot` command
- Krati's list of all the things for ember-cli  for FastBoot: https://gist.github.com/kratiahuja/e8f7c80a49deebc86a6b7130ef6d4764 
- Memory sieve
  - RJ: Emblem output *could* be the culprit with the memory leak
  - AS: Not using emblem, doing "random stuff", still seeing leak when smashing F5
  - KA: Seen weird memory patterns, forced GC to clean up
  - Seems like there is definitely a leak
  - Some things are on Application rather than App instance
  - RJ: Better tooling for post-1.0 debugging
    - DM: `ember perf` would be nice where it could launch the app and make concurrent requests
      - KA: could release some of LinkedIn's tools to help with memory debugging
    - KA: would be useful to have metric hooks for fastboot
- RJ: Need to talk to Dan Geb about what happens with Module RFC + new FastBoot organization

## Action Items
- [ ] Krati: Update the gist with short term v/s long term RFCs and/or fixes
- [ ] https://github.com/ember-fastboot/ember-cli-fastboot/issues/289
- [ ] Rob: Talk to Dan Geb about module RFC related concerns