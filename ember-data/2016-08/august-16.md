# ember-data-weekly-call-2016-08-16

# Attendees

- pangratz
- heroiceric
- fivetanley

# Agenda

### `modelName` on instance as well?

##### Summary

- [Issue #4459](https://github.com/emberjs/data/issues/4459)
- [PR #4498](https://github.com/emberjs/data/pull/4498)

##### Discussion

- should `record.modelName` be proxied to `record.constructor.modelName`?

##### Resolution

- add this behind a feature flag and see if this might interfere with other
  stuff

---

### `resetAttribute` or `rollbackAttribute`

##### Summary

- [Issue #3705](https://github.com/emberjs/data/issues/3705)
- [PR #4246](https://github.com/emberjs/data/pull/4246)

##### Discussion

- `ds-reset-attribute` is ready to be enabled in `beta`
- concern that `resetAttribute` might actually not be the best name has been
  raised in meeting last week
- introduces new `reset` verb
- [previous discussion](https://git.io/v6cHg)
  in a weekly meeting resulted in favor of `resetAttribute`
- do we want `rollbackAttribute` instead?


##### Resolution

- Ping tomhuda about bikeshedding the name

---

### adapterOptions not usable for `query` and `queryRecord`

#### Summary

[Issue #4497](https://github.com/emberjs/data/issues/4497)

If you pass `adapterOptions` to `query` and `queryRecord`, they get serialized
as queryParams to the server. The point of `adapterOptions` was to be a
namespace for handling stuff in the adapter. Should we serialize that to the
server?

@JackCA had a suggestion to pass a third argument where you could put in
`adapterOptions` in an additional hash. This seems inconsistent with using
`adapterOptions` in [findRecord](http://emberjs.com/api/data/classes/DS.Store.html#method_findRecord).

#### Resolution

Needs weigh in from the rest of the gang

---

### Community Survey

Think of questions to ask people so we have a better idea of how people use
Ember Data and needs that aren't being met.

fivetanley: I really like the Ember Community Survey, let's take ideas from that.

Stuff like:

- What version are you using?
- How long do you wait until upgrading?
- What kind of API do you have?
- What backend do you use?
- Do you use WebSockets?
