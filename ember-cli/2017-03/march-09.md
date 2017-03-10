# ember-cli Meeting Notes - 2017-03-09

## Attendees

- Chad Hietala
- Katie Gengler
- Robert Jackson
- Gaston Silva
- Kelly Selden
- Jake Bixby
- David Hamilton
- Tobias Bieniek

## Agenda

- Do we need calendar invitations again?
- Babel 6 Update
- v2.12 release blog post
- use `yarn install --no-lockfile` in addon CI?
- ["Needs Team Discussion" issues and PRs](https://github.com/ember-cli/ember-cli/labels/Needs%20Team%20Discussion)
  - [#6833](https://github.com/ember-cli/ember-cli/issues/6833) Installing addon from GitHub branch can't find default blueprint
  - [#6687](https://github.com/ember-cli/ember-cli/issues/6687) Not doing double-transpile makes writing tooling unhappy
  - [#6656](https://github.com/ember-cli/ember-cli/issues/6656) Change `EmberApp#tests` visibility to public
  - [#6294](https://github.com/ember-cli/ember-cli/issues/6294) Remove "ember-export-application-global" from the default app blueprint 
- ["Needs Team Response" issues and PRs](https://github.com/ember-cli/ember-cli/labels/Needs%20Team%20Response)
  - [#6812](https://github.com/ember-cli/ember-cli/pull/6812) Support CommonJS loaders

## Discussion Notes

- RJ: we should continue to send out calendar invites for the weekly calls
- RJ: Babel 6
  - mostly unblocked
  - added feature to Babel 6 AMD transpiler (for module interop)
  - not released yet (7.0.0-alpha.2 is out though)
  - ember-cli-babel 6 will contain compat code for babel 5 options
  - tl;dr "lots of good progress"
- TB: release blog post
  - bullet points gathered
  - @locks will convert them to text
- using `--no-lockfile` in addon blueprint
  - KG: handled by ember-try already?
  - RJ: only for deps handled by ember-try config
  - DH: should use greenkeeper
  - RJ: doesn't help for transitive deps
- `ember-export-application-global` addon
  - RJ: in favor of removal
  - DH: useful for debugging
  - RJ: variable is not "promoted" anywhere
  - RJ: ember-inspector UX is "slower" then console
  - RJ: adding another initializer is "bad"
  - RJ: not dev/prod aware
  - KS: subset of power users that know how to use it would be able to go the other route too
  - RJ: can the inspector export it automatically?
  - RJ: no final decision this week, will think about it
  - DH: use bookmark to inject variables on the `window`?
- `tests` public
  - RJ: in favor of making it public, but not with that name
  - RJ: `includesTests` might be better?
  - RJ: should we deprecate `tests`? 
  - yes, we should deprecate
- double transpile
  - RJ: feeling strongly about being flexible about module format
  - RJ treeForAddon hook
  - RJ: figure out how to have vendor shims not have that problem
  - TB: method on `EmberApp` to generate vendor shims?
- `ember install` via git
  - TB: `npm install git://foo/bar` does not tell us where npm installed the module
  - TB: impossible to reliably determine blueprint name from that
  - TB: proposal: parse repository name from URL and try if a npm package with that name exists
- CommonJS PR
  - simple case to support `module.exports`