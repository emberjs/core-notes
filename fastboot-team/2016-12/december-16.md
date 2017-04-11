# FastBoot Meeting Notes 2016-12-16
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Arjan Singh, Ryan Cruz, Tom Dale
## Agenda
- [ ] Last Week's Action Items
  - [ ] Tom please review:
    - [ ] [Make Express Static configurable](https://github.com/ember-fastboot/fastboot-app-server/pull/35)
    - [x] [Minimize references to the ApplicationInstance](https://github.com/ember-fastboot/fastboot/pull/100)
    - [x] https://github.com/ember-fastboot/fastboot/pull/102
      - [x] Dan merged and released new version
- [ ] Needs team discussion: https://github.com/ember-fastboot/fastboot/issues/103
- [ ] Outstanding PRs
  - [ ] Ember CLI FastBoot
    - [ ] [Better Shoebox API by ef4](https://github.com/ember-fastboot/ember-cli-fastboot/pull/250)
    - [ ] [Start immediately on --build=false](https://github.com/ember-fastboot/ember-cli-fastboot/pull/257)
    - [ ] [Serve assets from RootURL path (2.7+ deprecation of baseURL)](https://github.com/ember-fastboot/ember-cli-fastboot/pull/273)
    - [ ] [Version Logging](https://github.com/ember-fastboot/ember-cli-fastboot/pull/300)
    - [ ] [Remove `npm install` from `ember fastboot` command](https://github.com/ember-fastboot/ember-cli-fastboot/pull/269)
  - [ ] FastBoot App Server
    - [ ] [Build only CJS](https://github.com/ember-fastboot/fastboot-app-server/pull/39)
    - [ ] [Basic Auth](https://github.com/ember-fastboot/fastboot-app-server/pull/26)
      - [ ] Do we want to keep bringing in features like this? (This one may be there already)
  - [ ] FastBoot Express Middleware
    - [ ] [UnrecognizedURLError => 404](https://github.com/ember-fastboot/fastboot-express-middleware/pull/15)
    - [ ] [onFailure callback](https://github.com/ember-fastboot/fastboot-express-middleware/pull/4)
      - [ ] We previously thought that we could close this when Arjan updated error handling, submitter has counter point
  - [ ] Discuss [issue](https://github.com/ember-fastboot/fastboot/issues/103)
## Notes
- Minimize references to AppInstance
  - TD: If this is causing the memory issue, we should see before and after usage changes
  - AS: Naive app & benchmarking approach: ran simple test app with 1500ish nodes, refreshing the page eventually cause FB to run out of memory
    - AS: guess is we are leaking the result with each instance
    - No shared app, no memory leak
    - Next step: Maybe a leaking reference, look for places we are keeping references to AppInstances and remove them
      - If avoid Instance on result and EmberApp, this approach has memory usafe settle after a period of time
    - KA: Did you test with concurrent requests
      - Yes, (missed numbers) 
    - TD: Need a more representative test case, trivial test cases highlight the wrong issue
      - Backburner example (paraphrased): Having putting 1000 items into an array is slow compared to link list, massive refactor, then BB only ever has about 5 items
- Make Express Static configurable
  - Passes through options to Express middleware regarding static files
  - TD: reservations for exposing the express sever as public API for FastBoot-App-Server
    - In a better world, we'd have a clear boundry
  - AS: Tightly coupled to Express now, we'd need to release a 2.0 that inverts the server requirement
- Start immediately on --build=false
  - Prefer to wait until Ember CLI improvements land (Specifically this RFC: https://github.com/ember-cli/rfcs/pull/80)
- Remove NPM install
  - PostBuild vs OutputReady
    - PostBuild: called when broc tree is pushed to tmp
    - OutputReady: called when tmp is copied to dist
  - Since ember-cli-fastboot serves from `dist` (for now), OutputReady is more correct
## Action Items
- [ ] Cut new version of FastBoot App Server & FastBoot Express Middleware
  - [ ] Fixes alchemist configuration
- [ ] Tom to fix node-debug with fastboot (as reports are it's broken)
- [ ] [Make Express Static configurable](https://github.com/ember-fastboot/fastboot-app-server/pull/35) to be merged on Jan 1st
- [ ] Add more example to fastboot-app-server readme to point slack users at
- [ ] Tom to comment on https://github.com/ember-fastboot/ember-cli-fastboot/pull/257 about waiting until Ember CLI improvements land
- [ ] Consider removing `--no-build` as no other command has a --no-build
- [ ] Dan to comment on const vs let on BaseURL PR