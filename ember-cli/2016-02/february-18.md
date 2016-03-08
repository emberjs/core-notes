# ember-cli Meeting Notes - 2016-02-18

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Stefan Penner
- Robert Jackson
- Katie Gengler
- Jake Bixby
- Martin Muñoz
- Kelly Selden

## Actions

### RFC Review

Each week we will specify the RFCs we'll review in the following meeting. These two RFCs will be reviewed next week.

- [https://github.com/ember-cli/rfcs/pull/4](https://github.com/ember-cli/rfcs/pull/4)
- [https://github.com/ember-cli/rfcs/pull/35](https://github.com/ember-cli/rfcs/pull/35)

### Jake

- Fix [ember-cli-blueprint-test-helpers #19](https://github.com/ember-cli/ember-cli-blueprint-test-helpers/issues/19) and release 0.8.2.

## Discussion Notes

### 2.3.0 Released

- Hooray!
- We were holding this back because we wanted to protect "lockstep SemVer."
- Not releasing was creating more confusion, so we'll deal with a Major version bump if necessary.
- Most likely culprit is getting rid of Bower which would result in 3.X bump.

### `ember i `

- Fix `ember i` to mean `ember install` not `ember init`.
- Nathan filed a [bug](https://github.com/ember-cli/ember-cli/issues/5489).

### ESLint

- Internal to ember-cli we have mostly replaced JSHint/JSCS with ESLint.
- Custom ESLint rule has already found a few broken test cases, working to fix those.
- This applies only to ember-cli itself, tooling doesn't currently support ESLint for app side code.
- ESLint is the future, too hard to get necessary changes into JSHint upstream.
  - Decision did account for the cost of moving all of our users compared to trying to get `async`/`await` support (and other future features) into JSHint.

### `ember init` TreeMerge

- Based upon the TreeMerge stuff that Stef did for Broccoli.
- Presents a three-way merge.
- Solves one of the most painful processes in ember-cli with upgrading.
- Robert is working on this.

### Blueprint Hooks

- Nathan created an issue on RFCs repo which covers the details we discussed:  [Blueprint Hooks](https://github.com/ember-cli/rfcs/issues/36)
- Well-positioned with extracted blueprints.

### ember-data test blueprints

- extract logic back up into the blueprint model (or separate package for backwards compat)
- Jake needs to fix [ember-cli-blueprint-test-helpers #19](https://github.com/ember-cli/ember-cli-blueprint-test-helpers/issues/19) and release 0.8.2

### Uninstall Command

- Should we stub uninstall command
- We very much want this, but it needs to be paired with a full envisioning of what the installation story should be.
- Our current approach should be shored up with what we know now.
- [https://github.com/ember-cli/rfcs/issues/34](https://github.com/ember-cli/rfcs/issues/34)

### ember-try

- Katie and Rob continue chatting.
- Progress is happening to run `ember try` within Docker containers
- Also desire to be able to pass flags to npm and bower.
- Interest in running tests without separate scenarios.

### Miscellany

- RFC for precompiling router.js, accounting for engines.
- ember-data test blueprints need to extract logic back up into the blueprint model (or maybe a separate package for backwards compat)