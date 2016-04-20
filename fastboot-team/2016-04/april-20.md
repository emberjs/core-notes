# FastBoot Meeting Notes 2016-04-20

## Attendees

*Please add yourself.*

Tom Dale, Dan McClain, Ron White, Patrick Fisher, Arjan Singh, Krati
Ahuja

## Agenda

- [x] Last Week's Action Items
    - [x] @tomdale to deprecate Node 0.10 support by removing from
      Travis build matrix
    - [x] @danmcclain will push PR for deferring rendering via promise
      chain
    - [x] @danmcclain will update FastBootRequest PR to implement get
      for headers so users don't have to call `toLowerCase` on headers
    - [x] @danmcclain will submit PR to update FastBoot service to
      deprecate old access to request details
    - [ ] @kratiahuja will add error handling via `Ember.onerror` and
      other mechanisms to avoid crashing the process
    - [ ] @tomdale will sync up with @fivetanley to merge in build
      refactor
 
- [ ] FastBoot App Server:
  [https://gist.github.com/tomdale/4b44d83172877c49747f2a5894dec05e](https://gist.github.com/tomdale/4b44d83172877c49747f2a5894dec05e)
- [ ] FastBoot Server -> FastBoot Middleware
 
## Notes

- Amazon EBS server used to require application reboot to update assets,
  @tomdale rewrote the server to abstract
downloading/notifying/reloading assets for FastBoot
    - S3Downloader and Notifier built right now
 
- @tomdale proposed converting the ember-fastboot-server ->
  ember-fastboot-middleware
    - Remove the server bits from ember-fastboot-server
 
- @kratiahuja will submit a PR today with onerror fix
 
## Action Items

- [ ] @tomdale will review deferred rendering PR, @danmcclain will write tests to verify with
  async component
- [ ] @pwfisher will work on FastBoot watching
- [ ] @arjansingh will work on adding the server response to the
  FastBoot service
 
