# ember-data-weekly-call-2016-06-29

# Attendees

- bmac
- igor
- pangratz
- heroiceric

# Agenda

### Documentation of features for the next release

##### Summary

- feature added in [PR #3099](https://github.com/emberjs/data/pull/3099)

##### Resolution

- Test if `ajax` or `ajaxOptions` has been overridden and if they have then we
  should fallback and log a deprecation warning.
- pangratz will be trying to work on the guides for this one next week

---

### [FEATURE ds-adapter-jqxhr] Enable adapter to have access to full jqXHR in response

##### Summary

- [PR #4406](https://github.com/emberjs/data/pull/4406)

##### Resolution

- Lets try and figure out what properties from the jqhxr users need but are not
  exposed.
- Think about exposing the concept of the request/response in the adapter
  lifecycle.

---

### [BUGFIX beta] Use lower-case header fields #4400

##### Summary

- [PR #4400](https://github.com/emberjs/data/pull/4400)
- [PR implementing the Headers
  approach](https://github.com/emberjs/data/pull/4456) mentioned below

##### Resolution

- Get some more input from the Ember Core team to see if we should also be
  using a Headers instance when building the request.
