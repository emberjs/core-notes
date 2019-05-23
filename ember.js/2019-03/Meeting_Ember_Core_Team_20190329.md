# Meeting: Ember Core Team 2019/03/29

## Agenda
    
- (**20min**) Issues and PRs
    - ~~https://github.com/emberjs/ember.js/issues/12853~~
    - ~~https://github.com/emberjs/ember.js/issues/15350 MU~~
    - ~~https://github.com/emberjs/ember.js/issues/13840~~
    - ~~https://github.com/emberjs/ember.js/issues/17486~~
    - ~~https://github.com/emberjs/ember.js/issues/16826~~
    - ~~https://github.com/emberjs/ember.js/pull/16966~~ (already merged)
    - ~~https://github.com/emberjs/ember.js/pull/17033~~
    - https://github.com/emberjs/ember.js/pull/15609
    - https://github.com/emberjs/ember.js/pull/16879
    - https://github.com/emberjs/ember.js/pull/16469
    - https://github.com/emberjs/ember.js/pull/17568
- (**10 min**) Enable Decorators canary feature on master (CG)
- (**10 min**) Enable <AngleBracket /> built-in components (GC)
    - Did we already agree to this…?
- RFCs
    - Discuss
        - Dynamic Tag https://github.com/emberjs/rfcs/pull/389 (GC)
    - → FCP
        - Injection Parameter Normalization: https://github.com/emberjs/rfcs/pull/451 (CG)
        - `{{on}}` modifier: https://github.com/emberjs/rfcs/pull/471 (CG)
        - `{{with-args}}` helper: (CG)
            - RFC: [https://github.com/emberjs/rfcs/pull/470](https://github.com/emberjs/rfcs/pull/470)
            - Additional Context: [+Partial Application Helper Breakdown](https://paper.dropbox.com/doc/Partial-Application-Helper-Breakdown-zjXItoLReoF0FvedmE4kl) 
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Promote

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [ ] Robert Jackson
- [x] Igor Terzic
- [ ] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [ ] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

### Misc

- Suggest to Ember Times that they publish on another day/time not so close to the Friday meeting. Perhaps Mondays?
- CG to add documentation about decorators/support (we don’t support TS)

### Issues / PRs triaged

- https://github.com/emberjs/ember.js/issues/12853. - assigned to @Tom D 
- https://github.com/emberjs/ember.js/issues/15350 - closed and linked to MU blog post
- https://github.com/emberjs/ember.js/issues/13840 - seems good to fix - assigned to @Ricardo M @Chris G and @Tom D 
- https://github.com/emberjs/ember.js/issues/17486 - seems like a bug - should be addressed
- https://github.com/emberjs/ember.js/issues/16826 - might be fixed - sync up with @Robert J 
- https://github.com/emberjs/ember.js/pull/17033 - no longer able to reproduce - PR has been closed.
- https://github.com/emberjs/ember.js/pull/15609 - export is typically used only for testing - need to follow up with @Robert J before removing
- https://github.com/emberjs/ember.js/pull/16879 - assigned to @Tom D - comment that we’re not interested in making further changes
- https://github.com/emberjs/ember.js/pull/16469 - assigned to @Robert J - Tom says that Rob will probably be working on the Ember global this quarter
- https://github.com/emberjs/ember.js/pull/17568 - seems overly specific - assigned to @Godfrey C who will follow up

### RFCs

- Injection Parameter Normalization: https://github.com/emberjs/rfcs/pull/451 (CG) - consensus to move to FCP - assigned to @Tom D 
- `{{on}}` modifier: https://github.com/emberjs/rfcs/pull/471 (CG) 
    - @Chris G will update the “How we teach this” section
- Dynamic Tag https://github.com/emberjs/rfcs/pull/389 (GC)
    - Discuss for potential FCP next week

### Features

- Enable <AngleBracket /> built-in components (GC)
    - @Godfrey C will go this feature
    - Bug fixes will be made during beta period
- Enable Decorators
    
## Minutes

GC: I’d like to have a convo with the Ember Times about timing of their releases. They often miss decisions that we’ve just made in the Friday meetings.

YK: Maybe Monday makes more sense.
