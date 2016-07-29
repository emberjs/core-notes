# ember-data-weekly-call-2016-06-20

# Attendees

- Clemens @pangratz
- Tom @tomdale
- Eric @heroiceric
- Brendan @bmac

# Agenda

### Should `ds-improved-ajax` call `ajax` if it is overridden?

##### Summary

- feature added in [PR #3099](https://github.com/emberjs/data/pull/3099)

##### Resolution

- Test if `ajax` or `ajaxOptions` has been overridden and if they have then we
  should fallback and log a deprecation warning.

---

### [FEATURE ds-adapter-jqxhr] Enable adapter to have access to full jqXHR in response

##### Summary

- [PR #4406](https://github.com/emberjs/data/pull/4406)

##### Resolution

- Lets wait for Igor and Stanly to argue this case.

---

### [BUGFIX beta] Use lower-case header fields #4400

##### Summary

- [PR #4400](https://github.com/emberjs/data/pull/4400)

##### Resolution

- Implement something similar to how it is done [in
  ember-fastboot](https://github.com/ember-fastboot/fastboot/blob/master/lib/fastboot-headers.js),
  where a custom `Headers` object is used instead (see
  [Headers](https://developer.mozilla.org/en-US/docs/Web/API/Headers)), which
  has the headers set as keys to keep the current behavior
