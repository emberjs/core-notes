# ember-cli Meeting Notes - 2016-10-13

## Attendees

- Nathan Hammond
- Stefan Penner
- David Hamilton
- Kelly Selden
- Tobias Bieniek
- Jake Bixby

## Actions

- [x] Nathan - Notation in the 2.10 beta release for ember source on Monday.
- [ ] Nathan - Draft blog post for ember-source.
- [ ] Kelly, Tobias - Rework issue template and adopt the good parts of Yarn? e.g. comments.
- [ ] David - Increase Windows exposure on this team.

## Discussion Notes

### Yarn

- Intriguing and worth exploring.
- Continue to monitor closely.
- [Unable to adopt based upon its current lack of LTS strategy.](https://github.com/yarnpkg/rfcs/pull/1)

### Quick Topics

- [npm `devDependencies` issue for awareness.](https://github.com/npm/npm/issues/13974)
- Ship [#6344](https://github.com/ember-cli/ember-cli/pull/6344).
- Ship [#5994](https://github.com/ember-cli/ember-cli/pull/5994).

### ember-source

- Take a conservative approach to ensure that we're ready to move the community.
- Switching gains us very little in the short term but we still need to do it.
- Aim to make it possible inside of 2.10 without hacking Ember CLI itself.
- If it appears to be stable move the default blueprint to be `ember-source` for 2.11.

#### Related Issues:

- [ ] [ember-try#91](https://github.com/ember-cli/ember-try/issues/91)
- [ ] [ember-cli#6324](https://github.com/ember-cli/ember-cli/pull/6324)
- [ ] [ember.js#14457](https://github.com/emberjs/ember.js/pull/14457)
- [x] [ember-cli#6333](https://github.com/ember-cli/ember-cli/pull/6333)
- [x] [ember-cli#6339](https://github.com/ember-cli/ember-cli/pull/6339)
- [x] [ember-cli-legacy-blueprints#62](https://github.com/ember-cli/ember-cli-legacy-blueprints/pull/62)
- [x] [ember.js#13022](https://github.com/emberjs/ember.js/pull/13022)
- [x] [ember.js#14396](https://github.com/emberjs/ember.js/pull/14396)

### GitHub Issue Template

- We should take time to improve our template.
- Adopt the [yarn template](https://github.com/yarnpkg/yarn/blob/master/.github/ISSUE_TEMPLATE.md)?

### Engines Build Exploration

- Identify additional configuration needed.
- Adopt something like `yarn --flat` for Ember addons?
- `ember-cli-dependency-checker` could be our tool to help move the community.

### Windows 10 + portfinder

- Turns out finding an open port is *hard*.
- We have a few other pieces of Ember CLI that have similar characteristics (watcher).
- Maybe adopt a "expected potential failure" approach to port detection?
    - Try to do the right thing, but if it fails don't hard error.
    - Treat the exception as non-exceptional.
- Erik Trom investigating.