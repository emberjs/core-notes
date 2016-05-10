# ember-data-weekly-call 2016-04-20

# Attendees

- pangratz
- wecc
- igorT

# Agenda

### Open from last meeting: Possible to create duplicate records in the store

##### Summary

- As outlined in [#4262](https://github.com/emberjs/data/issues/4262) is it possible that there are duplicate records in the store, by creating a record and `store.push()` a record with same id while the `createRecord` request is made
- Showcase via [this ember-twiddle](https://ember-twiddle.com/97ddeca43d6e405ffb5a4356303ade51?fileTreeShown=false&numColumns=2&openFiles=routes.application.js%2Ctemplates.application.hbs)

##### Discussion

- we don't know how to fix this at the moment for the case when a record will be created and is pushed in the meantime

##### Action

- ping brains of tom and yehuda about this

---

### The `{ reload, backgroundReload }` situation

##### Summary

- Many stumbled over this because combination of both is surprising and not easy to see through: [#4162](https://github.com/emberjs/data/issues/4162), [#4148](https://github.com/emberjs/data/issues/4148), [#3657](https://github.com/emberjs/data/issues/3657), [#3483](https://github.com/emberjs/data/issues/3483)
- Currently the `backgroundReload` passed to `findRecord` and `findAll` is not considered, [#3772 opened for adding such a behavior](https://github.com/emberjs/data/issues/3772)
- has only been announced in [blog post for `1.13`](http://emberjs.com/blog/2015/06/18/ember-data-1-13-released.html#toc_better-caching-defaults-for-code-findall-code-and-code-findrecord-code) but docs haven't been updated extensively

##### Discussion

pangratz: Should we add basic logging? Something like:

- `findRecord will return a promise which resolves with cached record from store, background reload will update record once complete`
- `started background reload for "person", resolve promise with currently available data and update RecordArray with updated data from adapter once the data comes back`

pangratz: Explicitly passing `{ reload: false }` doesn't overwrite `adapter.shouldReloadRecord` and `adapter.shouldReloadAll`, should this work? Same for background reload...

pangratz: do we want flags indicating the reload / backgroundReload state (`isBackgroundReloading`, ...)?

##### Action

- `{ reload: false }` and `{ backgroundReload: true|false }` should work as expected
- maybe add `isBackgroundReloading` flag ...

---

### Improve situation for unused keys in payload

##### Summary

- Folks run into issues where payload doesn't look like what ember-data expects
- Some issues around this: [#4340](https://github.com/emberjs/data/issues/4340), [#4253](https://github.com/emberjs/data/issues/4253), [#3455](https://github.com/emberjs/data/issues/3455)
- Currently `DS_WARN_ON_UNUSED_KEYS` only warns on `store.push`, is not enabled by default and there is no documentation for it

##### Discussion

pangratz: do we want more logging using `console.group()`? Especially for the serializers?

##### Action

- think about moving logic for `DS_WARN_ON_UNUSED_KEYS` to serializers
- maybe we can be smart about keys in the payload which are not the way the serializer expects them (check if they are camelCased, though they should be dasherized in JSON-API for example)
