# ember-cli Meeting Notes - 2016-06-16

## Attendees

- Nathan Hammond
- Katie Gengler
- Tobias Bieniek
- Robert Jackson
- Jake Bixby

## Actions

- [ ] Stef - Write something more formal for release day stuff.
  - [ ] - OR - Brain dump to Nathan.
- [ ] Katie - Release 2.7.0-beta.3 on Monday 6/20.
- [ ] Robert - [Migrate ember-module-migrator](https://github.com/rwjblue/ember-module-migrator) to [ember-cli](https://github.com/ember-cli/).
- [ ] Robert - Discuss migration of [Switchfly-sponsored projects](https://github.com/switchfly) to [ember-cli](https://github.com/ember-cli/).
- [ ] Tobias - Test a different version of ember-cli-babel for child addons.

## Discussion Notes

### "Release Day" + coordination.

- +1 at the face-to-face.
- 11am Pacific Mondays has been the release "call." More of a support group.
- Eventually some "meta" package will be valuable to alleviate coordination efforts.

### Face-to-face Updates

- RFC ripening period. Change the language around RFC approval to make sure that after we believe it's good we'll socialize with the larger Ember community to ensure an end-to-end cohesive experience. 
- Module and testing RFC implementation progress. Move toward to active implementation.
- Ember CLI needs a representative to Ember.js security team.

### Babel 5/6

- [#5015](https://github.com/ember-cli/ember-cli/issues/5015)
- Should allow the child addons to be able to use a different babel.
- Every addon can have its own dependency to allow the children to do the right thing.
- We traverse with `require` right now, hopefully "just works."
- Badly behaved addons could still go grab Babel options from the host app.