# ember-cli Meeting Notes - 2016-09-15

## Attendees

- Nathan Hammond
- Chad Hietala
- Stefan Penner
- David Hamilton
- Kelly Selden
- Tobias Bieniek
- Jake Bixby
 
## Actions

Captured in individual bullets for notes.
 
## Discussion Notes

### Open PRs

- [#5874](https://github.com/ember-cli/ember-cli/pull/5874) "Don't process CSS imports by default" by Peter Wagenet
    - Intend to ship.
    - Default isn't the behavior we want.
    - This will possibly break things.
    - Treat as [BUGFIX beta] to move more quickly.
    - Address in release notes.
    - Nathan: land.
 
- [#6081](https://github.com/ember-cli/ember-cli/pull/6081) "[BUGFIX] Header files import concat" by Stefan Penner
    - Intend to ship.
    - Concat order is presently stable but `undefined`.
    - We used the wrong property to pass in the files.
    - Fixing is a "breaking" change as people in practice depend on existing order.
    - Tests should ensure that we give files in random order we get an ordered output.
    - UNDEFINED: write tests to ensure that this is consistent.
 
- [#6090](https://github.com/ember-cli/ember-cli/pull/6090) "Enable long stack stitching" by Stefan Penner
    - Intend to ship.
    - Will investigate why tests are failing.
    - Nathan: rebase.
    - Stef: debug open issues on CI.
 
- [#6096](https://github.com/ember-cli/ember-cli/pull/6096) "Fix and improve Watcher.detectWatcher" by Stefan Penner
    - Intend to ship.
    - Stef: rebase.
    - Get Yehuda to test.
 
- [#6119](https://github.com/ember-cli/ember-cli/pull/6119) "Allow tests to be passed into moduleForAcceptance"
    - Intend to close.
    - Freeze existing API.
    - Identify where this should live. (`ember-test-helpers`?)
    - Tobias: investigate where this should live.
    - UNDEFINED: write RFC for the change in behavior.
    - Ensure that we have a place to specify how to get new test helpers.
    - Make sure we don't break the testing unification RFC.
 
- [#6241](https://github.com/ember-cli/ember-cli/pull/6241#issuecomment-246085678) "destroy deletes empty folders"
    - Intend to ship.
    - Kelly: Add a few more tests to make sure we don't actually screw things up.