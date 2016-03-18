# ember-cli Meeting Notes - 2016-03-17

## Attendees

- Nathan Hammond
- Kelly Selden
- Jake Bixby
- Stefan Penner

## Actions

- (All) [Update the migration of Ember to npm issue](https://github.com/ember-cli/ember-cli/issues/4546).
- (Nathan) Create a quest issue for removing default bower dependencies.
- (Nathan) Issue on RFCs for migration plan off of Bower.
- (Kelly & Nathan) "Theme" todo-list.
- (Kelly) Provide feedback about SemVer.
- (Nathan) Plan ember-cli face-to-face.

## Discussion Notes

### Publish our project plan before EmberConf

- Turn our project plan into themes.
  - Identify a primary goal.
  - Identify consituent tasks.
  - Address this theme in all areas simultaneously: code, documentation, tech debt...
  - Invest in an area enough that shelving it for a while still leaves it in excellent shape.
- Prioritize themes.
- Useful for community to know what core contributors will be paying the most attention to.
- Hopefully this work creates manageable chunks for external groups to leverage.
- Kelly & Nathan to own and present our work back to the group next week.

### Face-to-face at EmberConf

- Setting something up for Friday.
- Lunch, conversation.
- Team member opinions and community well-enough aligned that this can be a more practical session.
- Conversation for high bandwidth topics:
  - API improvement for commands and tasks.
  - What technical debt do we need to pay down?
- Latter half of the day open to broader community for pairing, more technical implementation.
- Nathan to plan day.

### [ember-cli tab completion](https://github.com/ember-cli/ember-cli/pull/4709) PR

- We want tab completion.
- We've been adding JSON interfaces to our help command, but they've been ad hoc.
- Communicate that the JSON interface is experimental.
- Work closely with consumers to identify their needs.
- Investigate caching output vs. just making the underlying work faster.
  - Caching `ember help --json` output in `app-folder/node_modules/ember-cli/help.json` or similar?
  - tab completion should use the `ember help --json` output instead of adding another JSON format/file
  - If caching need to identify what results in invalidations.
- Lock to SemVer once it becomes stabilized.

### [Remaining work to npm'ize ember](https://github.com/ember-cli/ember-cli/issues/4546)

- This will probably be a theme we undertake.
- Ongoing required work for this per Jake (plus more):
  - Finish adding remaining blueprints (ember-data, `-test` blueprints) to `ember-cli-legacy-blueprints`
  - Bring `ember-cli-legacy-blueprints` into ember-cli, and remove blueprints and tests that are covered by it.
- Update the [quest issue](https://github.com/ember-cli/ember-cli/issues/4546) to make sure that we actually have identified all of the necessary tasks to turn it into a burndown.

### Remaining work to kill bower by default

- We need to identify a transition story for the community.
- Addons should still be able to install bower packages.
- Support existing workflow so as not to require a major version bump.
- Attempting to install a bower package via install hook triggers a command that installs a "use bower" addon.
  - Raise, warn, or auto-install compat addon?
- Handle bower's installation "just in time."
- Install our own version of bower so we can control it.
- Can probably detect known likely failures:
  - ember init and blueprint depends on bower
  - ember install and a dep has bower.
