# ember-cli Meeting Notes - 2016-07-28

## Attendees

- Nathan Hammond
- Kelly Selden
- Katie Gengler
- Jake Bixby
- Chad Hietala
- Alex Navasardyan
- David Hamilton

## Actions

- [ ] Nathan - Release Ember CLI 2.8.0-beta.1

## Discussion Notes

### JSON file blueprint merging (RFC #61)

- [Link to RFC.](https://github.com/ember-cli/rfcs/pull/61)
- [Review notes.](https://github.com/ember-cli/rfcs/pull/61#issuecomment-236009672)
- Nathan will be gatekeeper for moving to Final Comment Period given the feedback we've provided or will bring back in front of this group if it diverges from conversation already had.

### Module Unification

- [ember-resolver](https://github.com/danmcclain/ember-resolver/tree/new-resolver) work is ongoing.
- Effort inside of Ember CLI should being as we're closing in on a working resolver.
- Opportunity to refactor `lib/broccoli/ember-app.js`.
- Constraints
  - Ensure that we're not painting ourselves into a corner for linker/packager.
  - Needs to support having multiple "rootes" and processing them individually.
  - Keep everything separate as long as possible to prevent invalidating the world.
- Should keep moving forward on the pod module migrator. [Issue](https://github.com/rwjblue/ember-module-migrator/issues/3)
- @chadhietala built an underlying tool for comparing dep graphs: [fs-graph-diff](https://github.com/chadhietala/fs-graph-diff)
- Nathan will create a quest issue after current priorities subside.