# ember-cli Meeting Notes - 2016-06-09

## Attendees

- Nathan Hammond
- Kelly Selden
- Jake Bixby
- Katie Gengler
- Tracy Lee
- Chad Hietala
- Stefan Penner

## Actions

- [x] Nathan - Release 2.6.0
- [ ] Stef => Core - Coordinate releases?
- [x] Stef - Slack release channel.
- [ ] David - Investigate ecosystem just before release of fs-tree-diff
- [x] Nathan => @kimroen - Flags for passing to blueprints

## Discussion Notes

### Lag Release Thoughts

- Doesn't necessarily need to be tightly coupled. 
- We could solve with communication.
- Releasing in sync couples everything and we don't necessarily know that all things aren't broken.
- But blog & docs should wait on Ember CLI regardless.
- Target a consistent release window?
- Proposed order: Ember > Data > CLI > Docs > Blog > Twitter
  - SemVer Hat versions for patch versions.

### Broccoli / fs-tree-diff Fixes Updates

- Shorter, faster, less complicated.
- David is cascading through the ecosystem now.
- Land update into Ember CLI with SemVer drift.

### Composable Blueprints

- Figure out how to bundle multiple sets of blueprints for the same type.
- Get RFC written. (kimroen?)