# ember-cli Meeting Notes - 2016-04-07

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Chad Hietala
- Kelly Selden
- Katie Gengler
- Jake Bixby

## Actions

- [ ] Nathan - Respond to 5707.
- [ ] Tobias - bring home update-notifier
- [ ] Katie - Plain statement regarding LTS
- [ ] Kelly - Bundling node comment
- [ ] Kelly - Run tests on current master

## Discussion Notes

### [update-notifier](https://github.com/ember-cli/ember-cli/pull/5661) PR

- Went over the checklist to land, updated the issue inline.
- Need to confirm that it plays nicely with `--json` support.

### [Issue Template](https://github.com/ember-cli/ember-cli/pull/5707)

- Wrap as much information as possible into `ember -v`
- Here's a bit more information just in time to make sure you're best able to help us, but not a step-by-step guide.
- https://www.talater.com/open-source-templates/ might have some more inspiration

## RFCs

#### Node Support Policy

- https://github.com/ember-cli/rfcs/pull/47
- Will add a bit more to the conversation and let it stew.
- Delay decisions until next week.

#### master => canary

- https://github.com/ember-cli/rfcs/pull/48
- Referendum complete: 50/50. With a split community reaction we'll approach it as "use your best judgment" internally.

#### Production Code Stripping

- https://github.com/ember-cli/rfcs/pull/50
- We want this. Let the RFC ripen a bit before making a decision.

### `ember-cli-jshint`

- `ember-cli-jshint` ownership on [npm](https://www.npmjs.com/package/ember-cli-jshint) transfered to ember-cli
- TB extracted [ember-cli-jshint](https://github.com/Turbo87/ember-cli-jshint) addon from [ember-cli-qunit](https://github.com/ember-cli/ember-cli-qunit)
- enables easier migration to ESLint
- release `ember-cli-jshint@1.0.0`?
- add `ember-cli-jshint@1.0.0` to app/addon blueprints?
- Removes JSHint from `ember-cli-qunit/mocha`?
- Universal in favor.