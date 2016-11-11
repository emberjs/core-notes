# ember-data-weekly-call-2016-08-09

# Attendees

- pangratz
- bmac
- igorT
- heroiceric
- fivetanley

# Agenda

- Enable features during beta cycle?
  - basically enabling features during beta cycle seems fine
  - before it is in stable release, the new features should be at least
    mentioned in a blog post though

---

### [`features.json`](https://github.com/emberjs/data/blob/master/config/features.json) && [`FEATURES.md`](https://github.com/emberjs/data/blob/master/FEATURES.md)

- `ds-pushpayload-return` ([#4110](https://github.com/emberjs/data/pull/4110))
  - [RFC#161](https://github.com/emberjs/rfcs/pull/161) to get discussion going

- `ds-extended-errors` ([#3586](https://github.com/emberjs/data/pull/3586) [#4287](https://github.com/emberjs/data/pull/4287))
  - still documentation missing [#4457](https://github.com/emberjs/data/issues/4457)

- `ds-overhaul-references` ([#4398](https://github.com/emberjs/data/pull/4398))
  - update feature so `push()` of the relationship references accept
    `DS.Model`(s)
  - pushing array also seems fine
  - pangratz will update the feature according to this

- `ds-payload-type-hooks` ([#4318](https://github.com/emberjs/data/pull/4318))
  - [Search on GitHub for current uses of `modelNameFormPayloadKey`](https://git.io/v6cHz)
  - [Search on GitHub for current uses of `payloadKeyFromModelName`](https://git.io/v6cHB)
  - since this seems like a renaming, we need to evaluate if possible trouble
    for `ember-data` users is justified (maybe via `ember-watson` transform)

- `ds-check-should-serialize-relationships` ([#4279](https://github.com/emberjs/data/pull/4279))
  - :white_check_mark: go'ed

- `ds-reset-attribute` ([#4246](https://github.com/emberjs/data/pull/4246))
  - [previous discussion](https://git.io/v6cHg)
  - even decided otherwise before, actually `rollbackAttribute` might be a
    better name, since `resetAttribute` introduces the `reset` verb for the
    first time and it is not immediately clear what it does
  - let's discuss again next week
