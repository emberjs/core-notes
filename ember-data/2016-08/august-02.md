# ember-data-weekly-call-2016-08-02

# Attendees

- pangratz
- heroiceric
- igorT

# Agenda

### `ds-pushpayload-return`

##### Summary

- [Issue #3576](https://github.com/emberjs/data/issues/3576)
- [PR #4110](https://github.com/emberjs/data/pull/4110)
- Feature has been in the pipeline for a while now
- Concerns raised by core team
  - API lock in for `store.pushPayload` to always return `DS.Model`s
  - performance concerns since we can't refactor in the future to not return materialized models


##### Discussion / Resolution

- pangratz: I've opened [RFC#161](https://github.com/emberjs/rfcs/pull/161) to
  get discussion going on how we can solve for different use cases
- possible drawback: references leaking into user space (might get stored in
  variables and stuff, which is not the intended usage of references)

---

### Bug when `store.findRecord("model", id)` returns different id in response

##### Summary

- [Issue #4414](https://github.com/emberjs/data/issues/4414)
- Problem is that initially requested model stays in `loading` state
- Basic problem is that ember-data doesn't support slugs out of the box

##### Discussion / Resolution

- pangratz: `assert` that returned id is the same as the requested one? Would
  be a breaking change
  - [`findMany`
    warns](https://github.com/emberjs/data/blob/v2.7.0/addon/-private/system/store.js#L763-L765)
    when a requested `id` is not in the response
  - should we support this use case? what can go wrong?
  - `warn` when this is the case, and provide link to add-on which adds
    `slug` support?
    - [bmac/ember-data-query-path](https://github.com/bmac/ember-data-query-path)
    - [ember twiddle which showcases `findRecord` having slug
      support](https://ember-twiddle.com/ccfd163ccc045dda50b71976240aa883?fileTreeShown=false&numColumns=3&openFiles=services.store.js%2Cadapters.application.js%2Croutes.application.js)
- start working on an add-on to support the slug use case

---

### [`features.json`](https://github.com/emberjs/data/blob/master/cofig/features.json) && [`FEATURES.md`](https://github.com/emberjs/data/blob/master/FEATURES.md)

- `ds-reset-attribute`
  - pangratz: enable for `2.8.0-beta.2`?
    - ping rwjblue and bmac about if a feature can be enabled during beta cycle
      (and not just at beginning), and bring this up in next meeting
