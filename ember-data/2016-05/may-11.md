# ember-data-weekly-call 2016-05-11

# Attendees

- pangratz
- bmac
- igorT
- fivetanley

# Agenda

### make `shouldSerializeHasMany` public

##### Summary

- [Issue #2494](https://github.com/emberjs/data/issues/2494)
- [PR #4279](https://github.com/emberjs/data/pull/4279)
- Make `_shouldSerializeHasMany` public, so it is possible to specify which
  `hasMany` relationship should be serialized
- Open question on specific path for making method `@public`

##### Discussion

- PR should also add `shouldSerializeBelongsTo`
- Looks good otherwise

##### Action

- Ask author of the PR to implement `shouldSerializeBelongsTo` and use a
  feature flag.
- Ask author of the PR to change the wording of the deprecation message to
  indicate that the method has been made public.
- Ask author to use
  [Ember.deprecateFunc](http://emberjs.com/api/classes/Ember.html#method_deprecateFunc)
  so `_super` usage doesn't break

---

### should there be a `store.hasModelFor`?

##### Summary

- [Issue #4377](https://github.com/emberjs/data/issues/4377)
- API returns types in payload, which might not exist in `ember-data`
- Currently no public way to check if type exists, `store._hasModelFor` is
  private

##### Discussion

- basically seems fine to make `store.hasModelFor` public

##### Action

- investigate if this might be problematic with lazily loaded stuff on
  container

---

### support for `save({ include: "abc" })`

##### Summary

- [PR #4354](https://github.com/emberjs/data/pull/4354)
- Adds support for `record.save({ include: "author" })`

##### Discussion

- Is this a bugfix for `ds-finder-include` or new feature?
- Do we want an explicit hook for building query params, or should this be part
  of `buildURL`?
- Seeing `record.save({ include: "author" })` might be confusing to people as
  it looks like an API for saying "include xxx for the save"

##### Action

- ping tomhuda about ideas for the naming situation

---

### Support other `dataType`s for ajax options

##### Summary

- [PR #4357](https://github.com/emberjs/data/pull/4357) adds overridable option
  `dataType` to private `ajaxMethods`
- [Issue #2735](https://github.com/emberjs/data/issues/2735) asked for support
  of `JSONP`
- In the past `ember-data` team reluctant to expose ajax options

##### Discussion

- Having the transition to `ember-ajax` in mind, (how) should this be possible?

##### Action

- check with author of PR for specific use case and suggest `ember-ajax`

---

### customizing errors payload

##### Summary

- Currently `handleResponse` needs to be overwritten when errors payload
  doesn't contain root level `errors` key
- [PR #4373](https://github.com/emberjs/data/pull/4373) introduces key to
  customize that via `errorKey` on adapter

##### Discussion

- Should such customizations be handled in `ember-data` or in `ember-ajax`?
- `ember-data` will move to `ember-ajax` soon(ish), so added hooks in
  `ember-data` might then be deprecated so adding them now doesn't make too
  much sense?

##### Action

- ping tchak about this
