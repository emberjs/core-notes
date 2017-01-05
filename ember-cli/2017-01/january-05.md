# ember-cli Meeting Notes - 2017-01-05

## Attendees

- Nathan Hammond
- Stefan Penner
- David Hamilton
- Robert Jackson
- Katie Gengler
- Gastón Silva
- Tobias Bieniek
- Kelly Selden
- Jake Bixby

## Actions

- [ ] Tobias - Open tracking issue to kill `bower`.
- [ ] Homework:
  - [ ] [RFC #90: Caching results of `treeFor` hooks](https://github.com/ember-cli/rfcs/pull/90)
  - [ ] [RFC #92: Blueprint old file removal](https://github.com/ember-cli/rfcs/pull/92)

## Discussion Notes

### ES6, ESLint

- We decided that 2.12 is more likely to need changes than 2.11.
- Ideal is to make merging `beta` into `master` less painful.
- Therefore `master` has been moved to ES6 and has the ESLint changes.
- Aiming to finish landing as much as possible prior to the next branch point.

### Lazy `bower` Install

- `bower` is no longer an explicit dependency!
- We install bower "just-in-time".
- We can hopefully skip `bower-install` in the future.
  - Currently triggered by existence of `bower.json`, which we have, just empty, for compat reasons.
  - Likely need to tweak community addons to address.
  - Need tracking issue for "death of bower."

### Nested Addon Preprocess Invocation

- [We now recursively invoke addons' `preprocessTree` and `postprocessTree` hooks.](https://github.com/ember-cli/ember-cli/pull/6516)
- Treating as a bugfix. Likely won't cause issues in our review of the ecosystem.

### Instrumentation RFC #91

- Using Heimdall 0.2, we do have a plan to move to 0.3, but tangential to the API specified.
- Rob already has a UI for some of this.
- Promote to FCP.

### Core Object

- Core object seems to interop "just fine."
- https://github.com/ember-cli/core-object/pull/44
- Question: support of accessors.
  - CoreObject does not support `super` with `get foo() {}`.
  - We don't consider this to be a blocker.
  - ES5 version of CoreObject will never support accessors.
  - If you want them you'll need to use the ES6 syntax for extending.