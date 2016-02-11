# ember-cli Meeting Notes - 2016-02-11

## Attendees

- Jake Bixby
- Stefan Penner
- Kelly Selden
- Katie Gengler
- Robert Jackson
- Nathan Hammond

## Resolutions

- Decision to use mocha for ember-cli `node` tests.

## Actions

### Unclaimed

- [ ] Upgrade our bundled npm version.

### Katie Gengler

- [ ] Issue/RFC for `package.json` upgrade merge hell on `ember init`.

### Nathan

- [ ] Publicize what's going on with this group..

## Discussion Notes

### Stefan Penner

- Trying to not be the single point of failure for Broccoli plugins. Maintains most of the ecosystem.
- Remove the need for symlink problems.
- Build a baseline that default makes authors fall into a pit of success.
- Pre-cursor for revisiting packager/linker work.

### Kelly Selden

- Mocha test runner for JSCS on commits (one rule for now, just getting the tooling in place).
- Investigating AppVeyor issues appear to be .gitattributes.
- Didn't enable Hound for now, see how JSCS tests go first.
- Brought up the thought of upgrading internal NPM.
- On the lookout for a non-code person/project manager.

### Jake Bixby

- ember-cli-internal-test-helpers => want to land in ember-cli
- blueprint-test-helpers => sounds good. Ready to cut release.
- @mmun has a PR for Qunit test helpers. Defer.

### npm

- We should upgrade our bundled `npm`.
- `ember version` should be clear that it bundles an internal npm.
- Alternative npm clients are popping up, we should follow them closely...

### QUnit or Mocha?

- Test helpers for both, but we're opinionated, so pick one.
- Addon authors want to be able to test `node` stuff.
- Criteria: debuggability, ergonomics, good output on failure.
- Resolution: use Mocha for `node` tests.

### Katie Gengler

- `ember-try` supports `npm`!
- Make it more flexible?
- Different package managers: separate package file for `init` vs. inclusion.

### Robert Jackson

- Submitted an RFC for the testing unification story.
- Big impact is `async`/`await`.
- Requires ESLint, need to identify approach to shepherd the community forward.
- Unified testing structure in Fastboot. Requires babel runtime stuff in node land.

### Nathan Hammond

- Investigating route pre-compilation at build time.
- Investing async router stuff for engines.
- Trent Willis is posting three related RFCs today and tomorrow.
