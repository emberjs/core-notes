# ember-data-weekly-call 2016-04-06

# Attendees

- pangratz
- bmac
- wycats
- fivetanley

# Agenda

### `queryRecord` inconsistencies as discussed in last meeting PR

##### Summary

- [PR #4300](https://github.com/emberjs/data/pull/4300)
- Issues: [#4227](https://github.com/emberjs/data/issues/4227) [#4255](https://github.com/emberjs/data/issues/4255)
- address inconsistencies in `store.queryRecord` as discussed in last meeting
- assert/warn when array is returned as primary data
- deprecates array as result for `queryRecord` in `rest` serializer

##### Discussion

- YK: sounds great to me

##### Resolution:

---

### `backgroundReload` also for `query` 

##### Summary

- [Issue #4261](https://github.com/emberjs/data/issues/4261)
- Summary: caching for `query`
- there is already a `update()` on `DS.AdapterPopulatedRecordArray` which does background reload

##### Discussion

- if `store.query()` should be reloaded, use `update()` on that adapterpopulatrecordarray

##### Resolution

- pangratz: will comment on issue to get further feedback on specific use case

---

### deprecate `Ember.Date.parse`

##### Summary

- [Issue #4089](https://github.com/emberjs/data/issues/4089)
- [PR #4275](https://github.com/emberjs/data/pull/4275)
- Related issues: [#4082](https://github.com/emberjs/data/pull/4082)

##### Summary

- basically no need for `Ember.Date` since only `parse` is used
- `parse` should be available by `ember-data` supported platforms, so it is not needed anymore
- current PR replaces `Ember.Date.parse` with native `Date.parse` and adds a deprecation

##### Discussion


##### Resolution

- Fine as long as we leave around the requirement that you specify a time zone if no time zone is specified in the serialization (as opposed to picking up the local time zone).
- Can probably move any relevant logic into the transform.

---

### `unloadRecord` doesn't remove observers

##### Summary

- [Issue #4126](https://github.com/emberjs/data/issues/4126)
- [PR #4277](https://github.com/emberjs/data/pull/4277)
- Related issues: [#3525](https://github.com/emberjs/data/issues/3525) Automatic unloading of models in long-lived apps (2015-07-10)
- `store.unloadRecord(record)` does not destroy the `DS.Model` instance and hence observers on the record are not torn down
- use case of the issue is models should be destroyed after a given TTL

##### Discussion

- Is there a reason for this?
- Nobody could think of one

##### Resolution

- We should have `unloadRecord` destroy the object (and keep an eye on it to make sure we're not missing something)

---

### `model.rollbackAttribute(name)` - allow rollback of single attribute

##### Summary

- [Issue #3705](https://github.com/emberjs/data/issues/3705)
- [PR #4246](https://github.com/emberjs/data/pull/4246)
- add `rollbackAttribute(name)` to `DS.Model`, which restores to last canonical value

##### Discussion

- `s/canonical/canonical or in flight/`
- we should explore undelete()

##### Resolution

- Seems fine
- pangratz: will respond and take care of this going forward
  - rename to `resetAttribute` rollbackAttributes({ dontDelete: true }) (bikeshed the option)
  - `rollback` is currently called `rollbackAttributes` because we're waiting for real rollback; in the meantime, `resetAttributes` and `rollbackAttributes` would be too confusing, so we're going with the option to `rollbackAttributes` for now
  - `resetAttribute()` is fine
  - `undelete()` is fine?

---

### Don't unnecessarily materialize records

##### Summary

- [PR #4272](https://github.com/emberjs/data/pull/4272)
- add `store._push` which returns `DS.InternalModel`'s instead of materialized `DS.Model`
- this is then used within the various store finders

##### Discussion

- [RFC #57](https://github.com/emberjs/rfcs/blob/master/text/0057-ember-data-reference-unification.md)
- This topic is pretty related to RecordReference; we should consider implementing it soon and see if there's a way to let the public API more explicitly allow you to talk about lazy materialization

##### Resolution

- further explore reference unification

---

### PR's which are good to go

- [#4023](https://github.com/emberjs/data/pull/4023) Enhance blueprints to extend from application adapter / serializer when available
- [#4293](https://github.com/emberjs/data/pull/4293) Transition an invalid created record to the deleted saved state when deleted
