# Meeting: Ember Core Team 2017/07/07

### Agenda

- Visioneering F2F format Retrospective
  - (punted from last week to wait on ebryn and wycats)
- Who has admin permissions on the Ember extension on the Chrome Web Store?
- default `ember build`  environment (RM)
- +Deprecation Candidates (RM)
- https://github.com/emberjs/ember.js/pull/13044 (RM)
- Missing public APIs from emberjs/rfcs#176 see here for proposal (RJ)

### Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

### Minutes

#### Who has admin permissions on the Ember extension on the Chrome Web Store?
YK: ping me and leah

#### default env for `ember build`
RJ: link to addy osmani issue 
YK: “we speculate majority of people will run dev”
KS: we also got dinged by security research that did the same
YK: RJ, are you opposed
RJ: no, we’ve changed. I think we should go further
RJ: non-interactive commands should default to prod
👍 👍 
RJ: RFC?
RJ: ember-cli blueprints already do this
YK: bugfix unless we get a lot of push back
RJ: I’m not concerned about semver
MB: `ember build` `--``watch`
YK: why do people do this?
RJ: using nginx or similar, just want build output to update

#### deprecation candidates
RM: read through, annotate controversial or not

#### classify

> discussion, discussion

RJ: deprecation rfc

- who uses it
- extract into addon

#### missing exports for new imports

> one-by-one analysis of cibernox list
