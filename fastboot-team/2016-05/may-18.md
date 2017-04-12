# FastBoot Meeting Notes 2016-05-18
## Attendees
_Please add yourself._
Tom Dale, Dan McClain, Arjan Singh, Hassan, Patrick Fisher, Ron White
## Agenda
- [x] Last Week's Action Items
  - [x] @tomdale to audit GitHub and npm packages  and make sure @danmcclain has access
- [x] Shoebox
- [x] Caching
- [x] Redirection - handling `intermediateTransitionTo`, deleting `html` on 3xx responses
## Notes
- Shoebox
  - Takes state from the server side and stores it in the DOM via `<script>` tags that is available to the browser side via `fastboot` service
  - Released in 1.0.0-beta.2
  - Docs in ember-cli-fastboot repo
  - Could be used to store models from routes (if you can serialize the object)
  - Ember data a target to take advantage of shoebox now
  - RJ: Consideration: Should controller state end up in the shoebox
    - TD: We utilize Query Params to maintain controller state
- Fastboot-app-server
  - gained support for caching via redis
  - does not cache status code or headers
  - Massive performance increase (300-1000ms down to 30ms)
  - inbound request available to bust cache in needed
- Fastboot, fastboot-app-server, ember-cli-fastboot in 1.0 beta
  - ember-fastboot-server deprecated
  - heroku buildpack was accidentally broken, TD has been working on fix
- Redirection
  - `replaceWith/transitionTo` work
  - `intermediateTransitionTo` :boom:, does not render the new page content (keeping the old content before `intermediateTransitionTo`) aka not actually transitioning
  - RJ: Likely an Ember bug (based on AS's PR)
  - AS: thinks it has to do with how router handles intermediate transitions
    - RJ: will try to take time to reproduce in browser land this weekend
    - AS: to double check for steps to reproduce
  - Current response renders the body
    - Potential for data leakage
  - Aborting rendering: Yay/Nay - Nay
    - Would cause multiple redirection responses if you had multiple `transitionTo` 
    - Better experience to follow the thread of redirects (less requests)
    - When chaining down redirects, if you lose state, you could not hit the same routes based on new requests
  - `NoneLocation` should not be hardcoded (separate, future PR)
- Ember-cli-head and Ember-cli - RJ has to write up the path forward
## Action Items
- [ ] AS/RJ will investigate issues around `intermediateTransitionTo` to determine if it is a Ember or FastBoot issue
- [ ] RJ to write up proposal of path foward for ember-cli and ember-cli-head integration