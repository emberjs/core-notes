# Meeting: Ember Core Team 2018/01/05

## Agenda

- Promotional Ember 3.0 strategy (RM)
  - emberjs.com posts
  - posts for non-Emberistas?
- Go or No Go™ (GC)
  - @names
    - reserving more names
  - application div wrapper
  - template-only components
  - ES5 getters
- jQuery Removal (RJ/YK)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler

## Minutes

### Promotional Ember 3.0 Strategy

RJ: People treat major version bumps as a big deal, even if we don’t.
EF: We can use our unusual position as a way of getting people’s attention, almost being adversarial about how you’re “doing it wrong” if you treat OSS libraries like corporate, proprietary software and you need to sell an upgrade.
YK: We can learn from how Linux handled 3.0 kernel release.

TD and YK will write blog post outlining the philosophy of Ember 3.0 (separate from the release post which contains technical details).

### Go/No-Go

| **Feature**                 | **Status**                                        |
| --------------------------- | ------------------------------------------------- |
| @names                      | **GO**                                            |
| application `<div>` wrapper | **GO**                                            |
| template-only components    | **NO GO** pending Ember Inspector fix and codemod |
| ES5 getters                 | **NO GO** pending a solution for Ember proxies    |

- @names
  - Need to reserve more names
  - No reported issues in addons, etc.
  - MM: Are we going to update the guides?
  - YK: As of right now, no, not until we have implemented more of a coherent programming model.
  - YK: I think it makes sense to have a document that describes the delta between the “old” model and what has been implemented so far.
  - RJ: I think it’s fine to have a paragraph in the guides describing the syntax as it is.
  - YK: We should link from the status board to in-progress documentation
  - YK: Any objections?
  - *No objections heard*
- Application <div> wrapper and template-only components
  - GC: I want to get permission to make this available outside of Canary
  - YK: What’s the mechanics?
  - RJ: We expose the feature as a pre-1.0 addon that internally enables a flag
  - GC: There’s a problem with this feature relative to the inspector
  - YK: I think it’s a blocker for stabilizing
  - RJ: I think there’s a chicken-and-egg problem
  - KS: We can make an alpha build
  - RJ: Seems good
  - *Some discussion about codemods*
  - YK: We should make sure we have a codemod before shipping
  - RJ: `ember-cli-upgrade` will run it automatically
- ES5 Getters

(notes end here)
