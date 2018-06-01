# ember-cli Meeting Notes - 2018-05-31

## Attendees

- @lennyburdette
- @kategengler
- @ef4
- @jenweber
- @rwjblue
- @kellyselden
- @twokul
- @Turbo87
- @Gaurav0
- @kiwiupover

## Discussion Notes

### Ember CLI docs

- Jen: Siva and I had a look at the CLI docs
- tough to refactor, needs new structure
- prefer start from scratch instead of slowly iterating
- we would start with a new structure on the official guides,
  then pull old content in if viable, otherwise write new/update
- Jen: I want to spike a beginner section
- old content stays up for now while we move to the new guides
- Rob: don't deploy "no content", wait until at least some content exists
- Rob: redirects for old content? not a blocker, if we can, we should
- Jen: preparing CLI docs RFC, review welcome (https://github.com/jenweber/rfcs/pull/1)
- Gaurav: CLI API docs in rough shape, should be integrated in Ember API viewer

### Rollup/Packager

- Kelly: rollup packager works now, package name: ember-cli-rollup-packager
- travis-web and percy-web mostly work out of the box
- users can opt-in via npm package
- running using forked rollup for now, one rollup PR still pending approval
- goal is everything under the sun, first version: treeshake all code, still emit ES modules, node module importing
- just tree shaking for now, no code splitting yet
- Ed: what shakes out in typical ember app?
- Kelly: unused modules like in ember-awesome-macros or lodash
- Rob: please tell us how to use it ;)
- Kelly: want to do a few bugfixes first

### Code Splitting

- Alex: spend several days playing around with ideas
- not gonna work well for classic structure
- Rob: Happy to pair
- where are we with packager experiment?
- Alex: one outstanding bug in CLI, then good to go
- step 2 will be talking with rollup guys about dependency graph
- Rob: simpler thing possible today using basic regular expressions
- Alex: We should fix engines first

### Engines + CLI 3.2 beta

- Rob: there is an issue with engines and CLI 3.2 beta
- probably related to refactorings for delayed transpilation, got reproduction
- this is currently blocking the 3.2 minor release
- we should not do significant work on engines until the packager experiment is enabled by default
- engines currently monkey patch a lot of addon code and recreate the whole build pipeline
- needs to be cleaned up when packager lands

### Delayed transpilation vs. prebuilding addons

- Rob: I need a verification: rollup needs ES6 modules, right?
- Kelly: yes
- Rob: prebuilding means transpiling down for browser targets, but still as ES6 modules
- Kelly: seems good
- Rob: addons are allowed to have multiple prebuild target sets (e.g. with/without IE11)

### CJS transform

- Gaurav: Rollup plugins PR needs review
- Rob: will review, needs docs, likely just some text in the README
- Rob: Lenny also has PR (workspaces and linked deps)
- Lenny: don't understand the caching code yet
- Rob: haven't reviewed Ed's addon yet, but we should add similar caching
