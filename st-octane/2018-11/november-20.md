# Meeting: Octane Strike Team 2018/11/20

# Overview
# st-octane on Discord

## Attendees
[x] Chris Garrett (CG)
[ ] Jen Weber (JW)
[x] Melanie Sumner (MS)
[x] Preston Sego - NullVoxPopuli (NVP)
[x] Robert Jackson (RJ)
[x] Tom Dale (TD)
[ ] Yehuda Katz (YK)

## Agenda
[x] Review last week’s action items (TD)
[ ] Weekly milestones/deliverables from now to EmberConf (TD)
  [ ] Ember Octane Timeline
  [ ] https://github.com/emberjs/rfcs/pull/364
[ ] Scope realistic feature set based on remaining time (TD)
[ ] Discuss next steps for Editions RFC (TD)

## Action Items
[ ] @NullVoxPopuli
  [ ] Make Octane Blueprint addon
  [ ] Make decorators RFC
    [ ] Try implementing partially in @ember/object
[ ] @Tom D
  [ ] Make consolidated list / project of Octane tasks
[ ]  @Robert J
  [ ] RFC - removing synchronous rendering from tests
[ ] @Chris G
  [ ] @tracked RFC
  [ ] Glimmer Component RFC
  [ ] Help @NullVoxPopuli with Decorators RFC

## Notes


- MS we don’t want to be shipping last minute (we need time to prep for EmberConf)
- RJ we want to be specific about what we’re really shipping
- TD how will this work with docs? let’s talk about infra
- RJ - we will always need some sort of runloop knowledge
- TD - yes we will always need async
- RJ - new Octane blueprint addon
  - pull MU blueprint in
  - may contain minor revs, hashes, other breaking things
  - @NullVoxPopuli will make addon


# Ember Octane Timeline
*Plans are worthless, but planning is everything.* —Dwight D. Eisenhower

2018 Roadmap RFC: https://github.com/emberjs/rfcs/pull/364

**High Level Goals**

- Edition-specific guides
- Release timeline (no big bang release night of EmberConf)
- Editions RFC

**Octane Feature Set**

- **Shipped**
  - Broccoli 2.0 implementation
  - No jQuery
  - No application-div wrapper
- **Imminent**
  - Native JS classes @Chris G
    - “Decorators is the weird part”
    - Migration codemod for existing users
    - decorator RFC @NullVox P
  - Incremental rendering and rehydration
  - Eliminating the runloop from user-facing API
    - implementation [SHIPPED]
    - RFC - removing synchronous rendering from tests @Robert J
- **High Risk**
  - Broccoli documentation/evangelism
  - [2] Module Unification as default file system layout [HIGH RISK]
    - Migration tool for existing users
  - [2] Glimmer Components as default component API
    - needs RFC
    - tracked RFC (must exist first)
    - documentation (project already exists in Learning Team)
  - [1] Native JS modules [HIGH RISK]
    - Exposing modules in build pipeline, integration w/ Parcel, Rollup or Webpack
    - Publishing Ember as npm packages
    - Importing from npm with zero config
    - Treeshaking
    - Documentation (still needs audit)
  - Svelte builds (deprecated features stripped out)
    - needs RFC
  - Routing cleanup
    - @Tom D get more info from Chad
  - Documentation
    - Octane migration guide

**How do you get Octane?**

1. Post-Octane release, with `ember new`
2. How do you try out Octane before release?
3. How do existing apps “upgrade” to Octane?


- RJ: We should embed which generator was used in the `.ember-cli` file.
