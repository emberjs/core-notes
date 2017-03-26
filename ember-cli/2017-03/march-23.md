# ember-cli Meeting Notes - 2017-03-23

## Attendees

- Kelly Selden
- Tobias Bieniek
- Gaston Silva
- Jake Bixby
- Miguel Madero
- Chad Hietala
- David Hamilton

## Agenda

- https://github.com/ember-cli/ember-cli/pull/6868
- https://github.com/ember-cli/ember-cli/pull/6812

## Discussion Notes

- `--no-welcome` option for `ember new`
  - ALL: no objections
- `app.import('node_modules/foo/bar.js')`
  - do we want to support single file import or bundling?
  - CH: this might make our dep graph/tree shaking more difficult
  - discussion tabled until EmberConf