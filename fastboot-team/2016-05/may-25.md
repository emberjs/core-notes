# FastBoot Meeting Notes 2016-05-25

## Attendees

*Please add yourself.*

Tom Dale, Arjan Singh, Dan McClain, Hassan Abdel-Rahman, Patrick Fisher, Jason Mitchell

## Agenda

- [ ] Last Week's Action Items
    - [x] AS/RJ will investigate issues around `intermediateTransitionTo` to determine if it is a Ember or FastBoot issue
    - [ ] RJ to write up proposal of path forward for ember-cli and ember-cli-head integration
 
- [x] Wrongly-serialized attributes
- [x] Gzip/deflate support in najax
- [x] ember fastboot --watch
- [x] npm requires do not have prototype extensions (e.g. Array.prototype.sortBy)
 
## Notes

- intermediateTransitionTo
    - AS created an app that had the issue, ping @rwjblue with it, hasn't heard back from @rwjblue
             - AS: Traced to tildeio/router issue
                      - Semi-related: router.js may be moving to TypeScript, many errors in router.js seem to be type errors
 
 
    - Next Steps:
             - Tildeio/router issue: is this generally broken (waiting for Rob to confirm)
 
 
- PSA: Action on dom element: Renders the function.toString into the html (`
`)
    - Fixed on Canary Ember, update to Canary if you see this issue
 
     - Gzip/deflate support in najax
             - najax does not support gzip/deflate (blows up Ember-Data when response is compressed)
             - AS: [PR outstanding on najax](https://github.com/najaxjs/najax/pull/38)
 
     - ember fastboot --watch
             - Needs team review: https://github.com/ember-fastboot/ember-cli-fastboot/pull/200
             - Agreement on `ember fastboot` should watch by default
 
    - Ember-cli-fastboot should eventually hook into `ember serve`
    - Ember 2.6 just dropped, which means ember fastboot 1.0 has 6 weeks left before release
    - FastBoot got press at Google IO: https://www.youtube.com/watch?v=srdKq0DckXQ
    - Ember Prototype extensions weren't available in an array created by an najax response
             - npm packages that are required are from the root node VM, which creates new realms and prevents requirements from being extended by Ember
             - Potential fix: create your own require that is with a known realm
             - This will bite people in the future (who are using prototype extensions)
             - Looks like a heisenbug: Extensions will only be available some of the time, depending on the origination of the object/array

## Action Items

    - [ ]
