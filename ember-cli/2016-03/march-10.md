# ember-cli Meeting Notes - 2016-03-10

## Attendees

- Nathan Hammond
- Katie Gengler
- Kelly Selden
- Jake Bixby
- Stefan Penner

## Actions

- (Nathan) - Summarize feedback on ember mv into issue.
- (Stef) - Investigate output size to make sure it looks good.
- (Stef) - Review Jake's PR.
- (Nathan) - Create an issue in RFCs repos for collating extensibility approach.
- (All) - Collect extensibility needs.
- (Stef) - Publish helpers that make it easy for Selenium.
- (All) - Update project plan.
- (Nathan) - Communication plan for our project plans in moving those public.

## Discussion Notes

### X-Forwarded-*

- [Initial change landed.](https://github.com/ember-cli/ember-cli/pull/5524)
- [...but it breaks Symfony.](https://github.com/ember-cli/ember-cli/pull/5599)
- Set a new default, make it configurable.
- Unless somebody can prove that it's "more-correct" one way or another.

### Output Build Sizes

- [PR seems ready.](https://github.com/ember-cli/ember-cli/pull/4358)
- Check it out to make sure, can merge after that.

### `ember mv`

- [Issue](https://github.com/ember-cli/rfcs/issues/38)
- ember-cli-rename
- Calls ember-cli-mv to handle things
- Hit a wall with handlebars and AST processing.
- Not able to reach 100%, by rule (halting problem)
- Need to revisit with some help from someone who understands AST transforms
- Want to move it into ember-watson possibly?

### `.gitignore` & `dist`

- [Issue](https://github.com/ember-cli/rfcs/issues/37)
- People rely on that folder being present.
- Goal is to avoid problems with symlinking since the "reference" would always be there.
- Investigate cordova/electron using --output-path
- If problem exists, output-path + symlink different path?
- Transient folder, always represents the previous build.
- Maybe this is a thing that we need to account for in extensibility?

### ember-cli 2.4 issues

- [`assertThrows` is broken](https://github.com/ember-cli/ember-cli-blueprint-test-helpers/pull/35)
- Review and land.

### Extensibility Primitive

- Tabled for now until we've collected issues.