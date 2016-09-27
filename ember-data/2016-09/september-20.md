# ember-data-weekly-call 2016-09-20

# Attendees

- bmac
- pangratz
- heroiceric
- igor
 
# Agenda

[Ember Data should not swallow exceptions from the run loop](https://github.com/emberjs/data/pull/4537)

##### Summary

- Should this be a bugfix release?
- Can someone besides bmac review this pr?
 
##### Discussion

-
 
##### Action

- make this a release bugfix
 
---

### Heimdall instrumentation

##### Summary

- [PR #4510](https://github.com/emberjs/data/pull/4510)
- Is everyone happy with merging this once Stanly's comments have been addressed?
 
##### Discussion

- Igor met with runspired in person to review this pr.
 
##### Action

- Ready to merge once Stanly's comments have been addressed.
- ping @stefanpenner for sanity check
 
---

### [FEATURE ds-adapter-jqxhr] Enable adapter to have access to full jqXHR in response

##### Summary

## - [PR #4406](https://github.com/emberjs/data/pull/4406)

##### Discussion

- Igor wants Tom's opinion on how this change would impact fastboot.
- Igor is skeptical of using jqXHR
 
##### Action

- Bmac will comment on the issue and solicit Tom's opinion.
 
---

### `ds-improved-ajax` Champion

##### Summary

- ds-improved-ajax has been stalled for 2 releases because of concerns around users overriding `adapter.ajax`. What can we do to move this forward?
 
##### Discussion

- this should go through RFC process (even though feature has already been implemented, but since it's still behind feature flag that's ok).
 
##### Action

- Pangratz to write an RFC
 
---

### Roll back relationship champion

##### Summary

- Rollback relationships needs a champion to push is forward. Does anyone have the capacity?
 
##### Discussion

-
 
##### Action

- Igor to contact arenoir
 
---

### Runspired speed improvements

##### Summary

Runspired is working fulltime to make ED faster,

##### Discussion

Action

# [`features.json`](https://github.com/emberjs/data/blob/master/config/features.json)

Check state of following feature flags, should they be go'ed? What still needs to be done?

### `ds-improved-ajax` [#3099](https://github.com/emberjs/data/pull/3099)

- needs to be RFC'd first
 
### `ds-pushpayload-return` [#4110](https://github.com/emberjs/data/pull/4110) [RFC #161](https://github.com/emberjs/rfcs/pull/161)

- RFC should be tackled
 
### `ds-extended-errors` [#3586](https://github.com/emberjs/data/pull/3586) [#4287](https://github.com/emberjs/data/pull/4287)

- needs documentation before this can be go'ed
 
