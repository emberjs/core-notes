# ember-cli Meeting Notes - 2016-12-01

## Attendees

- Nathan Hammond
- Jake Bixby
- Tobias Bieniek
- Alex Navasardyan
- Trent Willis
- Gavin Joyce
- Kelly Selden
- Katie Gengler
- Chad Hietala
- David Hamilton
- Robert Jackson
- Miguel Madero
 
## Actions

- [x] Nathan - Land RFC #50.
- [x] Nathan - Get access to ember-cli npm user from Stef.
- [x] Nathan - [Respond on `ember-cli-release`](https://github.com/ember-cli/ember-cli/issues/6462#issuecomment-264322357)
 
## Discussion Notes

### [RFC #50 Production Code Stripping](https://github.com/ember-cli/rfcs/pull/50)

- Given no additional comments in the FCP, this was merged.
- Excited to make it happen.
- Thanks to @gavinjoyce for bringing it home!
 
### 2.11.0-beta.1 Postmortem

- CI was broken for two weeks leading up to the 2.11.0-beta.1 release.
- [This is the fix to what broke us.](https://github.com/stefanpenner/capture-exit/pull/7)
  - We threw away the exit code because we tried to defer exiting after async
    work during process.on('exit'), in which async work is explicitly disallowed.
- When we add new deps that we internally control we should make sure to have multiple owners.
- Release went out on Thursday instead of Monday. Still contains `ember-source`.
- Will port forward the `capture-exit` fix.
 
### NPM publish via CI

- `ember-mocha`, `ember-cli-mocha` and `ember-cli-chai` are now publishing pushed git tags to NPM via TravisCI.
- Example: [ember-mocha#105](https://github.com/emberjs/ember-mocha/pull/105)
- We will adopt this for other `ember-cli` organization libs.
- We will use the `npm` user [`ember-cli`](https://www.npmjs.com/~ember-cli) for this.
- Elected against creating a user for each which would limit scope of damage in
  the event of an issue due to the time/cost/complexity tradeoff. Happy to revisit
  if somebody is willing to drop us $2500/yr.
- Last to migrate will be Ember CLI itself.
 
### Testing (QUnit, Mocha)

- We want to make it possible to set up users for success.
- We will document and present all of our guides as exactly one choice.
- We will support multiple options via escape hatch and core-maintained addons.
 
#### Node-side Tests

- Need a better and more consistent story.
- We currently actively suggest Mocha for CLI.
- Even Trent recommends Mocha for CLI tests.
- [There's an open issue for a CLI tool for QUnit.](https://github.com/qunitjs/qunit/issues/1024)
  - Would allow running tests in both contexts.
- We dislike having two separate testing tools, want to consolidate.
  - Try to get QUnit to play nicely over time.
 
 
### Drop [ember-cli-release](https://github.com/ember-cli/ember-cli/issues/6462) dependency from blueprints?

- [We already suggest using pure NPM.](https://ember-cli.com/extending/#publish-addon)
- Likely that no app needs this. Should not be in app blueprint.
- Addons have used it in the past.
- Has bonus features for things like annotated tags.
- Notations about the changes in changelog.
- All of these things are possible via script.
- We could also add a mention in the addon docs if people seem to still want it.
- What if we wrote improved travis scripts that people could use to auto-publish?