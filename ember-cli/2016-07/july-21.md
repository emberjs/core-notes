# ember-cli Meeting Notes - 2016-07-21

## Attendees

- Nathan Hammond
- Katie Gengler
- Jake Bixby
- Kelly Selden
- Robert Jackson
- Stefan Penner

## Actions

- [ ] Nathan - Document merging `[BUGFIX master/beta]` back on a timeline.
- [ ] Nathan - 2.7.0 major release, 2.8.0-beta.1 release
  - [ ] Include baseURL post link in CHANGELOG.md.
- [ ] Stef - Fix watcher code for BASH on Ubuntu on Windows.

## Discussion Notes

### AssetGraph

- Played with it for a while.
- Seems like it will do what we want to do.
- Haven't reviewed its speed.
- Builds graph that you need and exposes a mechanism to do depth-first.
- Addon to do build stuff, but we can use it just for graphing and traversing the tree.
- It does have a way to feed in changes about what changed without it having to re-build the world.

### Heimdall

- Existing story for doing instrumenting and logging is poor.
- Instead of ad hoc all of the time combine existing ideas into one library.
- It moves all instrumentation into a library.
- Usable for general things, not just Broccoli. Hoping to embed it in Ember itself.
- Shared tooling for analyzing these pieces can be built around the standardized library.
- Eventually consolidate all of the rules and information into one place.

### 2.7.0

- All systems go!
- Release ember-cli-legacy-blueprints version bump at some point.