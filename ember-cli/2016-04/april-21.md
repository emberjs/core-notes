# ember-cli Meeting Notes - 2016-04-21

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Katie Gengler
- Kelly Selden
- Jake Bixby
- Stefan Penner
- David Hamilton

## Actions

- [ ] Nathan - Cherry-pick core-object over to beta branch.
- [ ] Stefan - Release new 2.6-beta
- [ ] Stefan - Core team meeting: ember cli betas bundle release or beta channel.
- [ ] Stefan - Review `base` tag PR
- [ ] Tobias - Publish YUIDocs to ember-cli.com/api
- [ ] Jake - Refocus on slow tests. npm fixes first.
- [ ] Stefan - push npm module for ember to completion (could use help)

## Discussion Notes

### ember module migrator

- [https://github.com/rwjblue/ember-module-migrator](https://github.com/rwjblue/ember-module-migrator)
- Single purpose, migrates from existing structures to new modules structure
- Currently only does file-rename for classic structure.
- Working on pod structure, and mixed structure.

### Updates on base (Tobias)

- Mostly ready to be merged.
- Seems like it works.
- Push into Canary (2.7) and see what happens.

### Private pre-concat hook(s) (Nathan)

- Open RFC
- Multiple times vs. one time, which trees, and more.
- Possibly slow to expose.

## Beta release

- ember-cli betas, do they include stable ember by default, or also ember betas? 
  - general seems to believe we should stick to stable releases of ember.
  - release final ember-cli beta with new stable releases of ember and ember-data?

### YUIDoc output

- Publish the YUIDocs to ember-cli.com/api? **Yes.**
- Versioned docs will come later–one step at  a time.
  - Can we rope in the learning team?
- We should start to enforce clearer documentation of things in PRs.
- No need to link them at first, let's start by getting them published at all.

### emberobserver.com running top 100 addons against Ember Canary nightly.

- Some addons just break the process.
- Once it's more resilient then we can push it to a dashboard.
- Alert email to core@ if things start failing.