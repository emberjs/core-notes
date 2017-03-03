# ember-cli Meeting Notes - 2017-03-02

## Attendees

- Jake Bixby
- Stefan Penner
- David Hamilton
- Katie Gengler
- Robert Jackson
- Kelly Selden
- Chad Hietala
- Tobias Bieniek
- Gaston Silva
- Miguel Madero

## Agenda

- TB: transpiling async/await with babel for the `tests` folder

## Discussion Notes

- SP: RFC champions proposal
  - feedback in the PR is mostly good
  - question was raised on how to find champions
  - champions can be found on slack in the `#dev-ember-cli` channel and on the [Ember.js team page](http://emberjs.com/team/)?
- SP: `ember` npm module on is a thing now
  - placeholder that tells you to install `ember-cli` or `ember-source` instead
- RJ: work on file system abstraction for broccoli has been going on inside LinkedIn
  - broccoli should have a "fake" file system
  - initial test results are good
  - 50% time reduction for cold builds
  - contents are **not** in-memory
  - identical files are no longer symlinked, but use "virtual symlinks"
  - potential future optimization: if file is under a certain size we could keep it in-memory too
- RJ: Babel 6
  - working on an MVP implementation
  - hopefully part of Ember CLI 2.13
  - taking advantage of new `targets` property and `babel-preset-env`
- SP: experimenting with prebuilt addons to reduce build times
  - prebuilt addons are built with "default" settings
  - otherwise we build lazily/on-demand
  - future RFC will be written if the experiment is successful
- TB: async/await transpilation for tests via Babel 6
  - RJ: learning curve for lib and tests using different JS features
  - TB: tests can still be written with promises
  - SP: stack traces will be wrong
  - KS: any increased debugging difficulty in node is not good
  - TB: we can use `babel-preset-env` to no-op on latest node
  - +1 if using preset-env so that node 7 is not transpiling (stack traces + debugging wins)
- CH: packager/linker work resurrected
