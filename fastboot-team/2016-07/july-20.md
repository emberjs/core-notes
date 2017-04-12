# FastBoot Meeting Notes 2016-07-20
Please add yourself.*
Dan McClain, Jason Mitchell, Tom Dale, Marco Otte-Witte
## Agenda
- [ ] Last Week's  Action Items
  - [ ] @danmcclain will suave ember-cli-fastboot
  - [ ] Tom to review/refresh path to 1.0 doc to allow people to track progress/contribute
  - [ ] Tom to RFC ember-cli RE: `concatFiles`
  - [x] Tom to write transpilation for Node (back to 0.12)
- [x] Figure out how to properly check for FastBoot within addons (service unavailable if addon is not present)
- [x] Node vs Ember context yields different things (IE Array.contains (ember) vs Array.includes (ES2016))
- [x] using HTTP 2.0 Server Push to speed initial load times up?
## Notes
- We should document in the `Known Limitations` section the fact that prototype extensions differ based on the context in which the object is created
  - There could be a way to have Node's `require` run inside a different context
    - We pass the `require` into a new realm (via `FastBoot.require`), but the `require` we pass to FastBoot maintains the NPM context
- There was a discussion in #-fastboot slack around optionally injecting the `fastboot` service so that your addon doesn't need to require `ember-cli-fastboot`
  - Tom to write an RFC around optional service injections
- HTTP 2.0 Server Push
  - Push assets together to speed up initial response
  - How is support in Node? (Unknown)
  - Does it make sense?
    - May consume extra bandwidth by always forcing the assets down when they may be cached (We'd have to be smart around the way this happens)
  - Will experiment to see if this makes sense to introduce by Marco
    - Stef Penner has been working on optimally loading Ember
- Unification on Build system by Tom
  - the node transpilation work has been held up slightly by this, but Tom has PRs starting to roll out ([Fastboot PR](https://github.com/ember-fastboot/fastboot/pull/74))
  - Transpile only happens at distribution time
  - Related RFC: https://github.com/emberjs/rfcs/pull/155
- Ready to ship 1.0 for Ember 2.7 (next week)
## Action Items
- [ ] @danmcclain will suave ember-cli-fastboot
  - [ ] Dan has to check something with rob around testing all the files
- [ ] Tom to review/refresh path to 1.0 doc to allow people to track progress/contribute
- [ ] Tom to RFC ember-cli RE: `concatFiles`
- [ ] Tom - RFC for optional service injection (for addons that want to support FastBoot *if* the user has added it to their app)
- [ ] Dan to review FastBoot PR about Transpilation work
- [ ] @arjansingh help out on documentation
- [ ] Outstanding documentation
- [ ] Marco to check with Stef Penner about his finding, spike up sth.