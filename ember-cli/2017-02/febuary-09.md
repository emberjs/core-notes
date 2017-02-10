# ember-cli Meeting Notes - 2017-02-09

## Attendees

- Kelly Selden
- Sam Selikoff
- Tobias Bieniek
- Katie Gengler
- Chad Hietala
- Gaston Silva
- Robert Jackson
- Stefan Penner
- David Hamilton
- Jake Bixby

## Agenda

- [#6738](https://github.com/ember-cli/ember-cli/issues/6738) ~ constraint for `ember-cli`
- [RFC #96](https://github.com/ember-cli/rfcs/pull/96) (yarn)
  - move to FCP?
  - how to handle `npm install` during `ember init` when **updating** a project
- [RFC #95](https://github.com/ember-cli/rfcs/pull/95) (targets)

## Discussion Notes

- #6738
  - SP: tilde is fine, caret not yet
  - KS: blueprint changes won't be applied
    - RJ: that seems okay as things don't get worse than before
  - RJ: should we track the last CLI version that generated the files and warn if a newer CLI version is used with updated blueprints?
  - RJ: "tilde provides more value than it hurts"
- RFC #96 (yarn)
  - RFC matches implementation
  - `ember init` should detect `yarn.lock` too
  - evaluate user feedback before potentially making it the default behavior
  - SP is contacting YK about yarn support policy
  - ember-try will continue to work with NPM, but yarn support has an open PR too (does not need to be part of the RFC)
  - moving to FCP, no objections
- RFC #95 (targets)
  - specificity: AND
  - targets in `config/targets.js`
  - should be forward compatible with grouping build targets at some point
  - KS: default in `app` blueprint?
    - RW: default in `ember-source`?
    - Maintaining seems easier in `ember-cli` for now, can still be moved if transition would get easier for major bumps