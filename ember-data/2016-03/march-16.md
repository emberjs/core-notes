# ember-data-weekly-call 2016-03-16

# Attendees

- Tom @tomdale
- Brendan @bmac
- Clemens @pangratz

# Agenda

### `normalizeHash`

##### Summary

- deprecated in [1.13](https://github.com/emberjs/data/blob/v1.13.16/packages/ember-data/lib/serializers/rest-serializer.js#L199-L202)
- removed in [2.x](https://github.com/emberjs/data/blob/v2.0.0/packages/ember-data/lib/serializers/rest-serializer.js#L124-L126)
- but still [used within `normalize`](https://github.com/emberjs/data/blob/v2.4.0/addon/serializers/rest.js#L158-L160)

##### Resolution

- lets re-deprecate in 3.0 (tackled in [#4258](https://github.com/emberjs/data/pull/4258))

---

### Should there be a warning when using `EmbeddedRecordsMixin` with `JSONAPISerializer`?

##### Summary

- People are falling over it and it seems that JSONAPI has no spec for it at the moment
- Issues: [#4212](https://github.com/emberjs/data/issues/4212) and [#3720](https://github.com/emberjs/data/issues/3720)
- use in combination with JSON-API [discouraged here](https://github.com/emberjs/data/issues/3720#issuecomment-137176580) 

##### Discussion

- discussion about embedded records still open in [json-api](https://github.com/json-api/json-api/issues/795)

##### Resolution

- have a warning for now when used with JSON-API serializer (tackled in [#4259](https://github.com/emberjs/data/pull/4259))

---

### regression in `queryRecord`

##### Summary

- reports that `{ data: null }` doesn't work with `queryRecord` anymore (because of assertion)
- [Issue #4219](https://github.com/emberjs/data/issues/4219)
- should `{ data: [{}] }` work with `queryRecord`?
  - [#4227](https://github.com/emberjs/data/issues/4227) reports that it doesn't work with it
  - [last comment here](https://github.com/emberjs/data/issues/3977#issuecomment-163163862) indicates that this might have worked sometimes (first item of array is used)
  - urlForQueryRecord builds like urlForQuery so it's difficult on backend to shape response

##### Resolution

- We should warn if queryRecord returns an array and suggest people use query and firstObject

---

### `modelNameFromPayloadKey` controversy

##### Summary

- `modelNameFromPayloadKey` / `payloadKeyFromModelName` used for "value" too (not just key) in json serializer
- brought up in [#4194](https://github.com/emberjs/data/pull/4194) and [#3801](https://github.com/emberjs/data/issues/3801)
- should there be a `modelNameFromPayloadType` / `payloadTypeFromModelName` (bikeshedding the name)?

##### Discussion

Consider the following code: 

``` javascript
{
  "blog/post": {
    "type": "Api::V1::Docs::Post"
  }
}
```

then the following hooks are invoked:

``` javascript
modelNameFromPayloadKey("blog/post") === "post"
// payloadKeyFromModelName("post") === "blog/post"

modelNameFromPayloadKey("Api::V1::Docs::Post")
```

Proposal of new hooks:

``` javascript
modelNameFromPayloadType("Api::V1::Docs::Post") == "post"
payloadTypeFromModelName("post") == "Api::V1::Docs::Post"
```

##### Resolution

- use new hooks as described above

---

# Issues for tomhuda

- [PR #3099](https://github.com/emberjs/data/pull/3099) `[FEATURE ds-improved-ajax]`
  - Summary: Finer control over customizing a request worth pursuing now that ember-ajax will be used sometimes in the future?
  - Resoltion: squash commits and give this a go
