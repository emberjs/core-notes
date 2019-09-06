# Meeting: Ember Core Team - Aug 23, 2019 

## Agenda

- (**2 min)** Determine note taker
- (**2 min**) Determine person to upload notes
- RFCs
    - → FCP
        - [@model](https://github.com/emberjs/rfcs/pull/523) (?)
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable

## Attendees

- [ ]  Yehuda Katz
- [ ]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [ ]  Igor Terzic
- [x]  Matthew Beale
- [x]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [ ]  Ricardo Mendes
- [x]  Chad Hietala
- [x]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber
- [x]  Chris Garrett

## Action Items

- [ ]  To-do...

## Minutes

### Model RFC

Recap from the breakout meeting was cautiously positive. Concerns mostly addressed.

People talked about moving directly to a new `args()` hook, but ultimately agreed that is further away and this is worthwhile and does not introduce future risk.

Consensus to FCP.

`this.model` could still be documented as a property that exists on Controller, but we would eliminate it from all examples in favor of `@model`.

GC: Clarifying: this is not part of octane in any way. It can go in octane or not. 

### Query Param RFC

Discussed whether we should move ahead on this without knowing where the rest of the router redesign might go. Rough consensus was in favor of making the incremental improvement that would allow dropping Controllers from the mental model.

### Strict Mode RFC

Discussion around whether we should bundle more things into strict mode: white-space changes or props-vs-attrs change.
