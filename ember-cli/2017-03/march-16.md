# ember-cli Meeting Notes - 2017-03-16

## Attendees

- Robert Jackson
- Kelly Selden
- Chad Hietala
- Katie Gengler
- David Hamilton
- Trent Willis
- Tobias Bieniek
- Stefan Penner
- Gaston Silva
- Jake Bixby
- Miguel Madero

## Agenda

- Babel 6 Update
- [RFC Champions](https://github.com/ember-cli/rfcs/pull/97)
- ESLint config in blueprints?
- RFC's to discuss:
  - Prebuild Addons - [ember-cli/rfcs#102](https://github.com/ember-cli/rfcs/pull/102)
  - Support [Stage 3 `import()`](https://github.com/tc39/proposal-dynamic-import) API - [ember-cli/rfcs#98](https://github.com/ember-cli/rfcs/pull/98)
  - Add [ember-cli-dependency-lint](https://github.com/salsify/ember-cli-dependency-lint) to default blueprint - [ember-cli/rfcs#100](https://github.com/ember-cli/rfcs/pull/100)
  - "Better Shims" - [ember-cli/rfcs#99](https://github.com/ember-cli/rfcs/pull/99)

## Discussion Notes

### Babel 6

- App/Addon blueprints were updated to Babel 6 in v2.13.0-beta.1
- Babel 6 support is backward and forward compatible, you can mix
  Babel 5 and 6 in projects
- "loose" mode
  - We would want dev mode with checks, but stripped in production
- Babel 7 works already too
  - We should make Babel 6 stable before thinking too much about Babel 7
  - That gives us a the opportunity to address possible API changes while
    staying in lockstep with Babel itself
- `ember-power-select` and similar addons are already released with Babel 6
  and we have heard no complaints

### RFC champions

- Trent is attending the meeting to represent his RFC
- KS: meetings are open, everyone welcome
- RJ will talk to the learning team about cleaning up the team page

### Prebuilt addons RFC

- This will allow us to:
  - build e.g. `ember-source` on demand with different options
  - skip building for e.g. `ember-data` if the default options are used
- It should be possible to disable usage of the prebuilt code
  (by environment variable or config setting)
- Maybe we should use something like `minimatch` to selectively disable only
  some of the prebuilt addons