# FastBoot Meeting Notes 2016-08-03
*Please add yourself.*
Dan McClain, Marco Otte-Witte, Arjan Singh, Tom Dale
## Agenda
- [ ] Last Week's  Action Items
  - [x] Release an RC of fastboot to make sure transpilation step works properly
  - [x] Tom & Arjan to tag team documentation/website
  - [x] Marco to investigate potential boot time improvements with HTTP 2.0
- [x] 1.0
- [x] User Guide
## Notes
- 1.0
  - Tom released the RC (rc.0), no "reported" problems yet
  - Arjan rewrote the README then extracted that content and created a PR for the fastboot-website: PR-placeholder
  - Tom wrote the Addon author upgrade guide
  - Tom wants to write an *App* upgrade guide
    - Similar to addon, but different enough (you can hardcode more)
- HTTP 2.0
  - Marco talked to Stef
    - Node HTTP 2.0 does not work with express
      - Could use a different server side framework
    - Kris has a nice benchmarking tool
      - Marco wants to turns this into something that is more accessible to others
      - Benchmarking tooling would benefit FastBoot outside of testing HTTP 2.0 improvements - Measure Glimmer update speeds
- RCs of `fastboot`, `fastboot-express-middleware`, `fastboot-app-server`
- Stef asked for a week delay of 1.0 to pair up to try to solve `--watch` issues
  - Merge `ember fastboot` into `ember s` so that users get a better experiences, Just Works™
  - If watch can't be fixed today, 1.0 will be released with watched pulled/disabled by default to be fixed in 1.1
- Glimmer 2
  - Built from the ground up for rehydration use case
  - Wycats thinks it's about a month out from Glimmer 2 final
    - LinkedIn may be throwing resources at this
- Post 1.0 path
  - User story around serializing server state into shoebox for use in client
    - Ember-Data being an example
      - Many hidden complexities
    - LinkedIn is using fastboot for serializing state for client side to reduce # of request for the page
  - Need to suppliment Glimmer 2 annotations with fastboot
    - Empty text node get compressed
## Action Items
- [ ] Tom & Stef to work on watch work, one way or another 1.0 will be released today
- [ ] Tom to review User Guide
- [ ] Tom to write blog post