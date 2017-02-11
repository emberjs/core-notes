# ember-cli Meeting Notes - 2016-12-22

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Stefan Penner
- David Hamilton
- Katie Gengler
- Kelly Selden
- Alex Navasardyan

## Actions

- [ ] Homework:
  - [ ] [RFC #91: Promote Instrumentation Experiment](https://github.com/ember-cli/rfcs/pull/91)
  - [ ] [RFC #92: Blueprint old file removal](https://github.com/ember-cli/rfcs/pull/92)
- [X] Nathan: Add `experiments` caveat to `RELEASE.md`

## Discussion Notes

### Babel@6 Strike Team Report

- Tobias, Miguel, Stef, Rob
- Try to combine both Babel@6 and global configuration in one step
- Trying to turn the global version into the clear target version.
  - babel-preset-env is something we intend to adopt.
  - addons will "do what they want" but should abide by top-level rules.
- New ember-cli-babel will have "less" flexibility.
  - Abide by global setting based by targets.
  - + run your own plugins.

### Moving forward with Node 4 support

- Options
  - Policy per file?
  - Encourage using new features? + lint
  - Upgrade everything you can find!
    - Structural changes _must_ have a test.
- Make `lib/ember/cli.js` break on line 1.
- `bin` must be 0.X safe
- Make sure we have a lockfile for release cutovers.
- Dropping `core-object` as an "ember-cli experiment"

### [RFC #88: Use global package managers](https://github.com/ember-cli/rfcs/pull/88)

- Move to FCP?
- Need a few tweaks in language, may be possible to do in a backwards-compatible manner.
- Need to revisit as we get closer.

### Experiments

- Need to prevent trolling ourselves on release.
- https://github.com/ember-cli/ember-cli/pull/6584

### Weekly Tags

- Not going to add published weekly tags to Ember CLI.