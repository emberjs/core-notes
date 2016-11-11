# ember-data-weekly-call-2016-08-23

# Attendees

- bmac
- fivetanley
- pangratz
- tomdale
- heroiceric
- igorT
 
# Agenda

### JSON-API: Serialized ID(s) on relationships with new records

##### Summary

- [Issue #4426](https://github.com/emberjs/data/issues/4426)
- [ember-twiddle](https://ember-twiddle.com/a27a8e9da784895c266ddd3e0b39bb1f?openFiles=templates.application.hbs%2C) by [@cristinawithout](https://github.com/cristinawithout)
- [PR #4500](https://github.com/emberjs/data/pull/4500)
 
``` js
let book = store.peekRecord("book", 1);
let author = store.createRecord("author");
book.set("author", author);

book.serialize() === {
  data: {
    type: "book",
    id: 1,
    relationships: {
      author: {
        data: {
          type: "author",
          id: null
        }
      }
    }
  }
}
```
##### Discussion

- JSON/REST serializer [checks belongsTo for `isNone(id)`](https://github.com/emberjs/data/blob/v2.7.0/addon/serializers/json.js#L1193-L1198)
- Should relationship be serialized as `{ data: null }`?
- What about new records in a hasMany relationship? Should new ones be omitted?
- just checking for if the record of the relationship is new won't work for client side generated id(s)
- Should Ember Data throw an error if trying to serialize a record with no id?
 
##### Resolution

---

### resetAttribute or rollbackAttribute

##### Summary

- [Issue #3705](https://github.com/emberjs/data/issues/3705)
- [PR #4246](https://github.com/emberjs/data/pull/4246)
- `ds-reset-attribute` is ready to be enabled in beta
- concern that `resetAttribute` might actually not be the best name has been raised in meeting last week
- introduces new reset verb
- previous discussion in a weekly meeting resulted in favor of `resetAttribute`
- do we want `rollbackAttribute` instead?
- Resolution from last weeks meeting
    - ping tomhuda about this
 
 
##### Discussion

- reset is now useful do we want `rollbackAttribute` or `rollback('propname')`?
 
##### Resolution

- rename `resetAttribute` to `rollbackAttribute`
- ping Yehuda to see if he had any arguments for `resetAttribute` that we forgot
 
---

### adapterOptions not usable for query and queryRecord

##### Summary

- [Issue #4497](https://github.com/emberjs/data/issues/4497)
 
##### Discussion

- If you pass adapterOptions to `query` and `queryRecord`, they get serialized as queryParams to the server
- The point of adapterOptions was to be a namespace for handling stuff in the adapter. Should we serialize that to the server?
- @JackCA had a suggestion to pass a third argument where you could put in adapterOptions in an additional hash. This seems inconsistent with using adapterOptions in [findRecord](http://emberjs.com/api/data/classes/DS.Store.html#method_findRecord).
- We could strip `adapterOptions` form the url query params when present
- For fastboot ember data needs a way to serialize queries
 
##### Resolution

- Strip out `adapterOptions` when serializing query prarams.
 
