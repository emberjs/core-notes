# ember-cli Meeting Notes - 2016-09-29

## Attendees

- Nathan Hammond
- Robert Jackson
- Kelly Selden
- Tobias Bieniek
- Katie Gengler
- Kris Selden
- Jake Bixby

## Actions

- [x] Nathan - Check and update warning message for Node versions.

## Discussion Notes

### Node.js 0.10 Removal of Support

- [13% of npm users still on Node.js 0.10.](https://twitter.com/seldo/status/781258069678391296)
- Continuing with [plan of record](http://emberjs.com/blog/2016/09/07/ember-node-lts-support.html).
- Official position is that 2.9 supports 0.12+.
- Keep beta branch as is (currently tests against 0.10).
- Therefore 2.9.0 should run on 0.10 but no guarantees for point versions because they'll be backports.
- Ember executable wrapper itself will remain compatible with 0.10.

### Parsing Hints

We want to be able to do a better job optimizing the behavior of JavaScript parsing as a build construct. We can construct modules and functions which are either eagerly parsed or lazily parsed based upon their usage pattern for performance benefits.

However, to do this well, it needs to change behavior in Ember CLI. There is a Broccoli plugin to do this now, [broccoli-optimize-js](https://github.com/krisselden/broccoli-optimize-js), and we want to explore adoption of it.

This must run before concatenation per module, and must be responsible for the uglification of the code. This has implications for:

- ember-cli-uglify, currently done on the concatenated file.
- gzip, possibly better, possibly worse.
- "Binary diffs" per module.
- Change of what you get at different tree hook boundaries.

Path forward, since we want for this to become the default behavior:

- [ ] Implement as an addon.
- [ ] Identify missing hooks (preconcat + config)
- [ ] Open RFC.

During the time the RFC is open we will be able to test breakage in the community by attempting to adopt. The RFC should specify:

- Hooks and ordering required to implement this as an addon.
- Any changes required upstream (e.g. removal of ember-cli-uglify) that are necessary to support the change.

During the exploration period we want to come up with a more-general architecture proposal for the addon:

- A way to configure modules for parse hinting inside every app and addon.
- A reasonable set of defaults (e.g. for initializers).
- Definition of what happens when included in the root application.
- Definition of what happens when included in a nested addon.
- Definition of what happens when not included.
- How to work with `app.import` and `legacyFilesToInclude`.
- How to work with Ember Engines.