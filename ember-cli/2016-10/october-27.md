# ember-cli Meeting Notes - 2016-10-27

## Attendees

- Nathan Hammond
- Katie Gengler
- Robert Jackson
- Kelly Selden
- Jake Bixby

## Actions

- [ ] Rob to release `2.10.0-alpha.2`.
- [ ] Nathan to open issue for ember-source build stuff.
- [ ] Nathan to track down Sebastian McKenzie and James Kyle regarding Yarn.

## Discussion Notes

### Ember Try + `ember-source`

- Ability to remove bower version?
  - Rework the version for npm for bower.
  - Opt for `null` possibly.
- release/beta/canary support?
- Don't have a release strategy for beta/canary at this time.
  - Would be a build of Ember _per_ addon, _per matrix_.
  - Ember's build is ~one minute.
- Support `yarn`, figure out how to "ignore" the lock file.

### ember-source

- Make the build work client side if no `dist` folder to support "channels."
- Need to review `dependencies` (build) vs. `devDependencies` (test).

### Use of ambient `yarn`?

- Possibly use this instead of the bundled `npm`.
- `ember install` doesn't play nicely presently.

### ember-data removal in addon `package.json`

- Package caching in tests is trolling us.
- Only `app` or `addon` wins, they're mutually exclusive.
- Rework caching strategy.
- In our layer, not a CI-related issue.
- Maybe `require` cache?
- Rob + Jake to pair on solution.

### broccoli-funnel

`broccoli-funnel` now actively catches and notifies people of errors in their configuration regarding `allowEmpty`. There are _likely_ a lot of misconfigured usages of `broccoli-funnel` in the wild since it has (in different versions) silently worked or failed–until today's 1.0.8 release. 1.0.0 && 1.0.7 it silently failed on first build and failed with a hard error on rebuild. 1.0.2 - 1.0.6 it silently did the wrong thing in all scenarios. 1.0.8 notices the failure case during the first build and asserts with a human-readable error.

If you review the stack trace it will identify _exactly_ which line needs updating:

- [Example error message.](https://travis-ci.org/dgeb/ember-engines/jobs/171189107#L327)
- [Offending line of code.](https://travis-ci.org/dgeb/ember-engines/jobs/171189107#L340)