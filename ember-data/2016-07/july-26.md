# ember-data-weekly-call-2016-07-26

# Attendees

- pangratz
- heroiceric
- wecc
- tomdale
- fivetanley

# Agenda

### `rolledBack` event not triggering

##### Summary

- [Issue #4395](https://github.com/emberjs/data/issues/4395) raised
  `rolledBack` event not triggered
- has been mistakenly documented as public event
- never really worked
- [PR #4468](https://github.com/emberjs/data/pull/4468) proposed to fix that

##### Discussion / Resolution

- let's get some use cases for this on how this would be used

---

### Implement dirty tracking and rollback of relationships.

##### Summary

- Long running [PR #3698](https://github.com/emberjs/data/pull/3698)
- Newer [PR #4361](https://github.com/emberjs/data/pull/4361)

##### Discussion / Resolution

- write RFC
  - enumerate use cases and edge cases

- create draft
  - use cases should be posted there

---

### Support all use cases for not overwriting `ajax()` / `makeRequest()`

##### Summary

- currently not all use cases are supported with `ds-improved-ajax`, that's why
  it's not included in `2.7`
- e.g. how can we support `xhr.setRequestHeader` after we got credentials

``` js
hash.beforeSend = (xhr) => {
  this.get("session").authorize(authorizer, hash => {
    Object.keys(hash).forEach((key) => {
      xhr.setRequestHeader(key, hash[key]);
    });
  })
}
```

##### Discussion / Resolution

- similar to rollback, let's flesh out use cases on what is not supported with
  `ds-improved-ajax` at the moment
- maybe let the `ds-improved-ajax` hooks be promise aware?
