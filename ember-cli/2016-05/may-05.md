# ember-cli Meeting Notes - 2016-05-05

## Attendees

- Nathan Hammond
- Jake Bixby
- Kelly Selden
- Tobias Bieniek
- Katie Gengler
- Stefan Penner
- Chad Hietala

## Actions

- [ ] Stef - core-object fixes. Likely possible to fix all issues inside of core-object.
- [ ] Stef - Land ember-core in ember-cli via npm.
- [ ] Jake - Release new version of ember-cli-legacy-blueprints.
- [ ] Tobias - Document milestones for PRs/issues in CONTRIBUTING.md
- [ ] Nathan - Schedule call for external contributors. (e.g. ang-cli)
- [ ] Chad - (later) - Outline issues with services inside of engines.

## Discussion Notes

### Fast Tracking Features

- Requires a champion who wants a feature badly and willing to steward it into existence..
- Requires core maintainers to review that it is worth the risk.
- Aim to be exceptionally rare.
- The idea behind the release train schedule is that you don't worry about missing, next version is only six weeks away.

### core-object Update

- [Bug found, blocking 2.6 release.](https://github.com/ember-cli/core-object/pull/32)
- Enforces `super` even if no `super` called.
- There are two types of `super`, with and without arguments.
- `super` with arguments and copy the properties onto the instance.
- Bug is an accidental confusion one invocation type with the other.
- Should always make sure we call it with one object and a pojo.
- Stef will update the PR with a complete description of the issues and resolution.
- Noticed issue fixed, but (likely) more similar types of problems.

### npm ember-core

- Publish ember as a node module: ember-core
- Start building support for this inside of ember-cli.
- Stays in the canaries.
- Probably need feature flag support.

### Test Suite Times

- Feel empowered to delete and combine tests.
- Find tests that are slow, move to unit tests and fewer slow tests.
- Sacrifice some bug coverage to improve dev experience.
- e.g. Test up to the boundary of testem.

### Improve visibility into feature/PR state and progress

- How do we know what features are at what stage?
- Make better use of milestones inside of GitHub.
- Infer channel status from version number.
- Need to spend time triaging existing issues.

### Decouple ember-cli from ember

- e.g. Removing bower, removing blueprints
- Extract to core-cli/lib-cli.
- Some subgroup of people who are willing to work with external communities (e.g. Justin Searls, ang-cli team)
- Some of this will just be refactoring, but also some work is just to meet other peoples' needs.
- Nathan to schedule a call for kickoff.

### Packager/Linker

- Chad is revisiting.
- Concept of fileEntries helping maintain a graph.
- Keep the modules in some module class.
- Possibly rewrite things similar to rollup.
- Dead code elimination at the module level is possible.
- Later: inspect runtime dependency injection for module shaking.
- We should use our learnings here to dictate some limits on engines with regards to boundaries.
- Iterating toward Ember's use case.