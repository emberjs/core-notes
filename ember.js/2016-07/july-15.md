# Ember Core Team 2016-07-15

### Agenda

- Discuss Enabling Features for 2.8
    - ember-runtime-enumerable-includes - [emberjs/rfcs#136](https://github.com/emberjs/rfcs/blob/master/text/0136-contains-to-includes.md) | [emberjs/ember.js#13553](https://github.com/emberjs/ember.js/pull/13553)
    - ember-string-ishtmlsafe - [emberjs/rfcs#139](https://github.com/emberjs/rfcs/blob/master/text/0139-isHtmlSafe.md) | [emberjs/ember.js#13666](https://github.com/emberjs/ember.js/pull/13666)
    - ember-testing-check-waiters - [emberjs/ember.js#13603](https://github.com/emberjs/ember.js/issues/13603) | [emberjs/ember.js#13716](https://github.com/emberjs/ember.js/pull/13716)
    - [ember-application-engines](https://gist.github.com/dgeb/a8937374f3a985065df205fdc28c655f)
    - ember-container-factory-for - [emberjs/rfcs#150](https://github.com/emberjs/rfcs/pull/150)
- factoryFor stuff (MB, may drop this :-p)
- path to TS definitions of supported part of ember (Stef)
    - interest?
    - what are the criteria?
    - ...?
- Standardized Modules/Build System for ancillary packages ([https://github.com/monegraph/rfcs/pull/1](https://github.com/monegraph/rfcs/pull/1)) (TD)
- Improvements to async decision making (YK)

### Attendees

machty, dgeb, ef4, chancancode, igort, krisselden, wifelette, mixonic, rwjblue, stefanpenner, tomdale, wycats, mmun

### Minutes

RJ: **features!**

RJ: First is array includes -> contains

Action Items for features:

- [ ] `NaN` check and warning to the deprecation message for `includes`
- [ ] "go" includes!
- [ ] Change capitalization of `isHtmlSafe` to `isHTMLSafe`
- [ ] "go" ishtmlsafe!
- [ ] "go" checkWaiters!
- [ ] "go" engines

