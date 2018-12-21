# Meeting: Ember Core Team 2018/10/05

## Agenda
  
- RFC Roundup
  - RFC → FCP
    - Element Modifier Manager
    - Deprecated Computed `.property()`
    - Deprecate Computed Overrideability and `.readOnly()`
  - FCP → Merge
    - Deprecate `computed().volatile()`
- Router Service Update
  - https://github.com/emberjs/ember.js/issues/17027 Meta Tracking Issue
- `setComponentManager` clarifying question
  - Is this now a non-injectable type via DI system?
    - relevant section from the original RFC, which would be changing
- Status / Next  Steps for `{{use` ? 
- (if we have time, A11y roadmap)

## Attendees

[ ] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[ ] Matthew Beale
[ ] Edward Faulkner
[ ] Martin Muñoz
[x] Dan Gebhardt
[ ] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### Computed Overriding and `readOnly`

RJ: more fleshed out transition plan

RJ: optional feature to opt in to more strictness

RJ: svelte out the guards around clobber support code paths

TD: why optional feature?

(scribe got distracted)

RJ: it’s a 2 word change in the RFC

RJ: with that change do we FCP?

### Deprecate `computed().volatile()`

RJ: Move forward on FCP? no new comments or changes to the RFCP and TD put a ribbon on it

(scribe: Dan just volunteered for something. RIP)

### Router Service

CH: all X of the RFC are done

CH: the deprecation guides need to be reviewed by someone that owns the deprecations guide

CH: HandlerInfo are now deprecated and there are lots of places where they bleed through

CH: Transition has always been marked private. RJ says that the interface is public but the class is private, but YUIDoc does not have a way to annotate that.

CH: two properties should not be public `.promise`, `followsRedirects`. does `followsRedirects` have a use case for it?

CH: I moved some state to RouterService

CH: `didTransition`, etc events are deprecated

CH: there’s a tracking issue

(please pull CH up from this rabbit hole)

CH: Transitions are mostly immutable except query params, should be easier to do clean up

RJ: now that you know all the things, can you write a RouteInfo polyfill for old Ember?

CH: maybe?
