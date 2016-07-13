# ember-cli Meeting Notes - 2016-07-07

## Attendees

- Nathan Hammond
- Kelly Selden
- Katie Gengler
- Jake Bixby

## Actions

- [ ] Nathan - Add color to broccoli-asset-rev bug.
- [ ] Kelly - Update [RFC regarding splitting of templates](https://github.com/ember-cli/rfcs/pull/59).

## Updates

- [Ember CLI 2.7 final is unblocked.](https://github.com/ember-cli/ember-cli/pull/6043)
- We should try to be helpful when people `sudo` install things. Right now it fails silently on the `npm install` behind `ember new`.
- @tbieniek has this PR which we want: https://github.com/krisselden/fast-source-map/pull/13
- broccoli-asset-rev not going leaf-to-root when analyzing files bit two people this week for same-fingerprint but different asset paths. Document bug for now, suspecting that this will be more common in the 2.7 world (https://github.com/rickharrison/broccoli-asset-rev/issues/29).
- Co-custodial bors-as-a-service/homu project has kicked off with @locks representing us in that community.
