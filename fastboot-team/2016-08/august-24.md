# FastBoot Meeting Notes 2016-08-24
*Please add yourself.* 
Tom Dale, Arjan Singh, Dan McClain
## Agendas
- [x] Last Week's Action Items
  - [x] Further discussion upon ember-data and fastboot (Tom, ef4, ...)
- [x] Error handling in express middleware (https://github.com/ember-fastboot/fastboot-express-middleware/pull/11 OR https://github.com/ember-fastboot/fastboot-express-middleware/pull/4)
- [ ] FastBoot 1.0 Update
## Notes
- Discussion with Ember-Data team
  - Create Snapshot could be utilized to store shallow records for queries
- Error handling in express middleware
  - resilent mode swallows all errors
  - make sure that default case of resilent mode doesn't crash, but also allow users to log errors
- FastBoot 1.0 update
  - Core team members wanted to push back 1.0 release to fix `npm` issue with `directory not empty`
  - Core team wants ember development experience to remain fast, concerned about rebuild times with fastboot
    - Plan to improve speed: single build of the app before doing node/browser build
    - Stef volunteered to spearhead the effort, but has been swamped
    - Touch base with Stef during upcoming core team meeting
## Action Items
- [ ] Ember Data needs to expose way to create snapshot for `this.store.query` 
  - [ ] We may want to have a semi-rfc for this prior
  - [ ] Arjah may have time next week to tackle
- [ ] Tom & Dan to review https://github.com/ember-fastboot/fastboot-express-middleware/pull/11 regarding error handling in fastboot middleware
- [ ] Tom to discuss FastBoot at Ember Core team meeting