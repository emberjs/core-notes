# ember-data-weekly-call 2016-04-13

# Attendees

- pangratz
- bmac
- wecc
- fivetanley

# Agenda

### GitHub Issue Template

##### Summary

- We should add template for issue
- Encourage to attach code (ember-twiddle, JSBin, JSFiddle)
- Used versions

##### Discussion

bmac: I like the friendly language of the ember-cli issue template. I don't have very strong opinions but I don't want to see an overwhelming barrier to entry for new contributors.

wecc: what bmac said

pangratz: shouldn't be too much text, only a reminder of what should be included (versions, which adapter) and links to preconfigured twiddle/jsbins

##### Action

let's create PR and get more input on basic template

---

### Possible to create duplicate records in the store

##### Summary

- As outlined in [#4262](https://github.com/emberjs/data/issues/4262) is it possible that there are duplicate records in the store, by creating a record and `store.push()` a record with same id while the `createRecord` request is made
- Showcase via [this ember-twiddle](https://ember-twiddle.com/97ddeca43d6e405ffb5a4356303ade51?fileTreeShown=false&numColumns=2&openFiles=routes.application.js%2Ctemplates.application.hbs)

##### Discussion

bmac: I'm surprised this doesn't error already. This has been a lesser know limitation of Ember Data for a while because Ember Data wants to only have 1 record instance for each  type/id combination.

pangratz: the references RFC might have a solution for this aka `store.push` returns a `RecordReference` and not a `DS.Model`

bmac: I think we should bring back the old assertion for detecting if an id is already in use post save and document this limitation of Ember Data. One work around I've used in the past is to use a `setTimeout` to defer the action of pushing created records so the push happens after the save is resolved [https://github.com/bmac/ember-data-sails-adapter/blob/master/ember-data-sails-adapter.js#L149-L150](https://github.com/bmac/ember-data-sails-adapter/blob/master/ember-data-sails-adapter.js#L149-L150)

##### Action

Add back the assertion and talk about this later when we have Igor, Tom and wycats in the meeting.

---

### Should `DS.StringTransform` etc. be importable via modules?

##### Summary

- The transforms are public since they are available on `DS` namespace, but they aren't importable via ES6 modules.
- In [#4125](https://github.com/emberjs/data/pull/4125) there was an attempt to make them importable modules, but we decided against since it is not likely that they are re-used.
- This might need to be re-considered since:
  - transforms are public via `DS` namespace
    - [#4305](https://github.com/emberjs/data/issues/4305) would be a case where re-using a transform might be needed (though re-implementing `DS.StringTransform` logic would be ok too)

##### Discussion

pangratz: I think it's an inconsistency that they're it available on `DS` but not via modules

bmac: I think its fine to move these to a public module.

##### Action

Move transforms to `addon`, fix references in the codebase, and make them importable.

---

### Custom validation using `DS.Errors`

##### Summary

- [PR #3853](https://github.com/emberjs/data/pull/3853) deprecated transitioning into invalid state when new error is added via `DS.Errors#add()`
- `add()` and `clear()` have been deprecated but with no proposed alternative
- Should there be a public API for adding / clearing errors on `DS.Model`
- In [#4319](https://github.com/emberjs/data/issues/4319) a question is raised on what the replacements for the deprecations are

##### Discussion

bmac: I believe tchak has this same use case.

##### Action

ping tchak about this, since he has more experience with `DS.Errors`

---

### Regression: Assertion for payload from `adapter` not being empty called too eagerly?

##### Summary

- Upgrade from `2.3` to `2.4` throws an assertion when `queryRecord` returns empty payload, reported in [#4310](https://github.com/emberjs/data/issues/4310)
- The assertion has been added in [#3916](https://github.com/emberjs/data/pull/3916) so a more helpful error is thrown very early, instead of the error deep within `store.push` ( You must include an 'id' for undefined in an object passed to 'push')

##### Discussion

pangratz: looks related to [#4300](https://github.com/emberjs/data/pull/4300)

##### Action

pangratz: take a look again at #4300 and maybe address #4310 in the course of #4300

---

### During normalization, use property lookup instead of `hasOwnProperty` checks

##### Summary

- [PR #4313](https://github.com/emberjs/data/pull/4313) replace slow `hasOwnProperty` checks with `obj[key] !== undefined`

##### Discussion

pangratz: check if `undefined` is really never a valid use case from payload (non JSON adapters/serializers maybe?)

##### Action

follow up with stef on the benchmark

research test changes
