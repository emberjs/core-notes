# Meeting: Ember Core Team 2018/10/26

## Agenda

- RFC Round Up
  - FCP
    - Deprecate `setComponentManager` string lookup
  - FCP → Merged
  - Clarifying Questions
    - Router Service RFC
      - What are the runtime semantics of `{{with-route-info}}`  and `{{get-route-info}}`?
      - Topic: It seems weird that `{{with-route-info}}` does not use block params
    - Route Helpers & Modifiers
      - Should there be a helper version of `{{transition-to}}`? Currently spec’d as just a modifier
  - Carry Over
    - wycats needs to respond https://github.com/emberjs/rfcs/pull/298
    - tomdale needs to merge https://github.com/emberjs/rfcs/pull/364
- dynamic element (GC)
- helper helper (GC)
- Sync queue removal regression
  - Issue: https://github.com/emberjs/ember.js/issues/17150
- jQuery “off” by default

## Attendees

[x] Yehuda Katz
[ ] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[ ] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[ ] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner
