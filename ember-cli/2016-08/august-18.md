# ember-cli Meeting Notes - 2016-08-18

## Attendees

- Nathan Hammond
- Stefan Penner
- Tobias Bieniek
- David Hamilton
- Chad Hietala
- Katie Gengler
- Kelly Selden
- Chris Thoburn

## Actions

- [ ] Nathan - Monday release.
- [ ] All - Provide feedback on [broccoli starting point](https://github.com/stefanpenner/broccoli-rollup).

## Discussion Notes

### rootURL

- Transition appears to have gone well.
- Not a tremendous change in support requests, just typical learning issues.
- Ongoing conversations about the support of esoteric scenarios will be focused on solving one-off instead of holistically.
  - If we begin to notice a pattern we should go through the RFC process.
- Warn if the combination of settings are incompatible with Ember CLI.
  - @kanongil to update [#6186](https://github.com/ember-cli/ember-cli/pull/6186) to fail if detecting incompatible combinations.

### New testing API for ember-mocha

- See [ember-mocha#84](https://github.com/switchfly/ember-mocha/pull/84)
- Confirm that this matches ember-qunit's future story 1:1.

### Broccoli Starting Point

- Building this as part of the [broccoli-rollup plugin](https://github.com/stefanpenner/broccoli-rollup).
- Trying to make this a pit of success.
- Would love feedback.

### Whitelist vs. Blacklist in blueprint

- In favor of changing the default blueprint for `ember addon` to use `files` in `package.json` to specify a whitelist of exported files instead of relying on `.npmignore` to blacklist known bad files.
