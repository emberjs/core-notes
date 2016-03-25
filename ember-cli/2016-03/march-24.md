# ember-cli Meeting Notes - 2016-03-24

## Attendees

- Nathan Hammond
- Chad Hietala
- Kelly Selden
- Katie Gengler
- Tobias Bieniek
- Robert Jackson
- Stefan Penner
- Jake Bixby
 
## Actions

- (Nathan) - Continue planning ember-cli team face-to-face.
- (Nathan) - Close [#5591](https://github.com/ember-cli/ember-cli/pull/5591).
- (Nathan) - Release 2.4.3.
- (Nathan) - Confirm apps work with new core-object
- (Stefan) Rebase core-object + update some `super` usage.
- (Nathan, Rob to review) - Release branch story.
- (Nathan) - Feedback on performance RFC.
- (Chad) Look at tests to make sure we're doing enough, but not too much.
 
## Discussion Notes

### [Overridable Commands](https://github.com/ember-cli/rfcs/pull/40)

- Would be a breaking change.
- Make sure help function is working correctly for overridden commands.
- API decisions based on performance feels bad.
 
### pnpm & [npm v3](https://github.com/ember-cli/ember-cli/pull/5677)

- Works but tests don't pass.
- We need to reduce our `npm install` hacks.
- Slow tests are important, but *SLOW*
    - Minimize and do more for sharing.
 
 
### ember-conf Talk

- Elided from notes.
 
### Core Object

- Would love to see this land soonish, as rebases are hefty.
- Encourage not using naked `super`.
- Test in your apps!
 
### Next Release

- [Blocking bug.](https://github.com/ember-cli/ember-cli/pull/5591)
- Addon template the same name as your app, app should win, missed `overwrite: true;`
- We'll release a 2.4.3
- Aim to release 2.5.0 in ~two weeks.
 