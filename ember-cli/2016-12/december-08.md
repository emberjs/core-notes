# ember-cli Meeting Notes - 2016-12-08

## Attendees

- Nathan Hammond
- Kelly Selden
- Tobias Bieniek
- Chad Hietala
- David Hamilton
- Stefan Penner
- Katie Gengler
- Robert Jackson
- Jake Bixby
- Miguel Madero
- Alex Navasardyan
- Ricardo Mendes

## Actions

- [ ] Rob - RFC for cache keys for addon builds.
- [ ] Kelly - RFC for blueprint migrations

## Discussion Notes

### 2.10.1/2.11.0-beta.2 Updates

- 2.10.1
  - Travis `PATH` updates
  - `capture-exit` fixes
  - Phantom global
  - `Ember.assign` revert, again.
- 2.11.0-beta.2
  - Add `ember-cli-shims` back into config.
  - `npm` via `execa`
  - Support `ember-cli-babel` config changes.

### `ember-cli-babel`

- Cooperative config?
- A way of allowing the App to "generally" control what happens.
- Intend to land Babel 6 first.
- Support for `ember-cli-babel` at `babel@6`.
- Minimum CLI version inside of the addon.
  - Addon is required to move to the newest version of Ember CLI to adopt `babel@6`.

### Babel 6

- `.babelrc` something we support, but lands _after_ Babel 6.
- Upcoming release highlight feature.

### Nested Addon Story

- [Nested Invocation](https://github.com/ember-cli/ember-cli/pull/6516)
  - Open PR which calls correct pre/post hook at each level.
  - Doesn't add additional layers to the tree unless there is stuff to do.
- Same addon at multiple levels doesn't have to build multiple times.
  - "100% safe" version can land without RFC and symbol/private API. Any `treeFor` we do the most conservative same behavior, ratchet forward as we are best able to identify safety.
  - Addon controls its caching with some sort of cache key.

### ESLint

- Dropped JSHint!
- Now using `npm` via `execa` so that we could late-install `ember-cli-jshint`.
- Doesn't install `jshint` stuff, delegates to the addon.
- [Removing `jshint` traces from blueprints.](https://github.com/ember-cli/ember-cli/pull/6540)
  - Will add a lot of noise to `ember init`.
  - Maybe some sort of version checker in blueprint's `index.js` to reduce churn.
  - Re-`init` is a pain either way.

### `ember init` deleting files

- https://github.com/ember-cli/ember-cli/pull/6472
- just a go/no go for RFC to not waste time. (GO)
- => blprnt

### blprnt

- Split out all blueprint code
- Backfilling a ton of testing.
- Fix bugs.
- Then wiring back into Ember CLI.