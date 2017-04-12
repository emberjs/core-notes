# FastBoot Meeting Notes 2016-09-21
*Please add yourself.* 
Dan McClain, Tom Dale, Arjan Singh
## Agendas
- [ ] "Last" Week's Action Items
  - [x] Arjan to update the readme and PR#11
  - [x] Arjan to follow up PR#11 with handling 404 in location none
  - [x] To be addressed next week:
    - [x] Ember Data needs to expose way to create snapshot for `this.store.query`
      - [x] We may want to have a semi-rfc for this prior
      - [x] Arjan may have time this week or next week to tackle
      - [x] Tom can put Arjan in touch with someone on ED when work starts
- [ ] [FastBoot only context config](https://github.com/ember-fastboot/ember-cli-fastboot/issues/254)
- [x] `--watch` pains right now
- [ ] [Express Middleware Issue #13 (cut RC-4)](https://github.com/ember-fastboot/fastboot-express-middleware/issues/13) >> [fastboot-app-server #24 (middleware hooks)](https://github.com/ember-fastboot/fastboot-app-server/pull/24)
- [ ] [ember-cli-fastboot #262 (fingerprinted asset maps)](https://github.com/ember-fastboot/ember-cli-fastboot/pull/262)
## Notes
- 404s
  - The current router would require us to do a try catch for a route miss if we wanted to have `location: none` handle this case
  - Router Service RFC - Would be a good place to start the discussion for router misses and being able to listen to it
- Watch pains
  - Should we revert watch for the time being?
    - We should be able to remove the `npm install` from development (since ember-cli-fastboot)
- FastBoot only context config
  - Targets should address this concern
  - We need to make sure targets/environments are completely configurable
    - What if you need to target FastBoot for a certain thing, and don't want to leak that information to Browser
- Middleware hooks
  - fastboot-app-server is meant to be straightforward and generic
    - TD: should it be a lower level of abstraction and not be coupled to fastboot?
  - does everyone just roll their own?
  - Is it possible to add hooks before and after we inject the middleware so that we can pass a function so that we are able to do more than just inject middlewares?
    - Yield the app to the hook functions
## Action Items
- [ ] Tom: Corner Stef at F2F
- [x] Arjan: Try to identify a hook for router misses to be added to the [Router Service RFC](https://github.com/emberjs/rfcs/pull/95)
- [ ] Dan: Remove the npm install from the ember-cli-fastboot rebuild cycle
- [ ] Tom: comment on [FastBoot only context config](https://github.com/ember-fastboot/ember-cli-fastboot/issues/254) to give potential roadmap and create stub ticket in FastBoot repo with regards to the Targets RFC work, linking to this issue and our RFC braindump in canvas
- [ ] Tom: Sync up with Ember-Data folks with regards to `this.store.query`
- [x] Arjan: Look at updating [fastboot-app-server #24 (middleware hooks)](https://github.com/ember-fastboot/fastboot-app-server/pull/24) per the notes.
- [x] Arjan: Modify `fastboot-build.js` to store `~assetrev.options.enabled` and log the `catch` warning based on whether it is enabled for [ember-cli-fastboot #262 (fingerprinted asset maps)](https://github.com/ember-fastboot/ember-cli-fastboot/pull/262).
## 