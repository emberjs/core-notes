# ember-cli Meeting Notes - 2016-06-23

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Katie Gengler
- Kelly Selden
- Tracy Lee

## Actions

- [ ] All - Think about notification process for first boot perf.
- [x] Tobias - Improve release/branching instructions
- [ ] Nathan - Get Stef's brain dump on release day coordination.
- [x] Nathan - Confirm 2.7.0 target release date 
- [x] Kelly - Port addon output scripts into ember-cli/dev and update docs.
- [x] Nathan - Ask Yehuda about Ember adopting Rust's Homu fork.
- [ ] Katie - On point for lcov, ask clarifying questions on thread.

## Discussion Notes

### First-boot Perf

- Stef got a new 12" MacBook.
- "Addon slow" alerts.
  - Optional "which addons are slow, as opposed to always.
  - Only output on Canary/Beta?
  - Track it using analytics stuff.
  - Make a command that scores it; could appear on Ember Observer.
- lodash fork
  - Easy to back out of.
  - Fine for now.

### Release Day Coordination

- Katie's thoughts on release process. "Simple, easy-to-follow, but branching information was a bit hairy."
- Need to identify target date for 2.7.0

### this.import() Updates - 2.7 blocker

- https://github.com/ember-cli/ember-cli/issues/5990

### lcov Code Coverage

- How does this fit into ember-cli-code-coverage?
- blanket: does instrumentation at runtime
  - does crazy things at runtime.
- Istanbul is meant to run in Node.
  - better hooks.
- ember-cli-code-coverage does instrumentation at build time
  - coverage info is done at runtime
- Target of lcov is to run against production build.
- Code coverage work with Ember Exam.
- Wants to run tests against a prod build.
  - Katie to ask clarifying question about test approach from Stef.

### Homu

- Unstable recently.
- [maintainer](https://github.com/barosl) seems to be missing
- Can we do anything to improve?
  - Get commit privs?
  - Run our own instance?
  - Assist with their instance?
  - Adopt Rust's version?