# ember-cli Meeting Notes - 2016-08-04

## Attendees

- Nathan Hammond
- David Hamilton
- Tobias Bieniek
- Jake Bixby
- Stefan Penner
- Chad Hietala

## Actions

- [ ] Nathan - `EmberModulesApp` broccoli-fixturify spec.
- [ ] Tobias - Add CI to output repos.

## Discussion Notes

### Heimdall Landing

- [Repo.](https://github.com/heimdalljs/heimdalljs-lib)
- Functionality: In the ecosystem projects, but hasn't landed in Ember CLI yet.
- Don't want to check compat against a global version.
- Landing the improved compat check today-ish.

### ember-engines build

- Had to hack most of `lib/broccoli/ember-app.js` to pieces.
- Tons of pain.
- `EmberModulesApp` and then fold back-compat into it?
- Make sure that the boundaries in which we pass items from the next steps.
- Make it possible to work with linker/packager.
- Need clear boundaries.
- `broccoli-fixturify` all the things in advance.

### Broccoli Pit of Success

- Starting place for broccoli plugins which include example tests.
  - Include rebuild tests that monitor stability.
- Test it in our community-owned addons first and then extract out into community tools.
- Flesh out a few common scenarios.
- Start in on documentation afterward.

### File Count

- Capture in Ember Observer for addons?
- Tie it into CI, possibly in shell.
- Looking for community support in this endeavor.

### `ember-(new|addon)-output `

- Enable CI for these.
- Enable Greenkeeper to help us keep our blueprints up-to-date.