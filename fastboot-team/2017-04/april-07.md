# FastBoot Meeting Notes 2017-04-07

## Attendees
*Please add yourself.*
- Dan McClain
- Arjan Singh
- Krati Ahuja
- Ryan Cruz
## Agenda
- [ ] Krati's update (See below)
- [ ] [ember-browserify related issue](https://github.com/ember-fastboot/ember-cli-fastboot/issues/370)
- [x] [tagName.toUpperCase issue](https://github.com/ember-fastboot/ember-cli-fastboot/issues/365)
- [x] [node locale related issue](https://github.com/ember-fastboot/ember-cli-fastboot/issues/361)
- [x] NPM Org
1. Krati's update:
1. The serve PR is merged in. Let’s hold off releasing till I fix : https://github.com/ember-fastboot/ember-cli-fastboot/issues/358
1. I’ll send the PR for https://github.com/ember-fastboot/ember-cli-fastboot/issues/358 tonight.
1. Put out the WIP build PR too. If I have cycles this weekend, will continue to work on it. I have also asked Ryan to ramp up and pick up the TODO tasks in there if possible. Would like some early feedback on the PR too if possible from Rob/Tom/Dan/Arjan.
## Notes
- Krati's updates re ember serve and ember build
  - when using ember 2.12 and up, ember-cli-fastboot will serve when using `ember serve`
  - deprecation warning for `ember fastboot`
  - ember build
    - [WIP PR](https://github.com/ember-fastboot/ember-cli-fastboot/pull/369)
    - naive measurements: faster than old build process
    - Detecting if you use the old structure and point you to the new structure
    - We need to pitch the new changes to see response (re structure and dealing with app.import)
    - TD: Nervous about addon authors, want to support multiple versions of APIs
      - KA: will be hard to support both, there are 95 addons using app.import
    - TD: 2 cases: Some that rely on 2 build passes with the env variable. Others rely on the old initializers structure
      - We could detect when addons use the old initializer structure and inject additional
    - TD: Check for access to EMBER_CLI_FASTBOOT, have a deprecation warning, release a version and wait for an amount of time
- TD: Pitch an aggregator blog at the core team meeting
  - DM: Should we have a blog on ember-fastboot
## Action Items
- [ ] Dan to PR meeting notes
- [ ] Dan to add issue templates (include security guidelines)
- [ ] Let's discuss more around the ember build pain points
- [ ] Dan to condense ember-fastboot under a single org (after tom verifies with the core team)
- [ ] Think about how we potentially handle the unified packages
- [ ] Think about mutable vs immutable dom (performance)