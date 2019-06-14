# Meeting: Ember Core Team 2019/05/31

## Agenda

- (public) (**2 min)** Determine note taker - JW
- (public) RFCs
    - → FCP
    - FCP → Merge
        - [Deprecate disconnectOutlet](https://github.com/emberjs/rfcs/pull/491) 
        - [Co-located Component Templates](https://github.com/emberjs/rfcs/pull/481)
    - → FCP to Close
    - FCP to Close → Close
    - Promote
- (public) ISSUE REVIEW - please help decide if there’s intent to tackle them, and assign the respective champions
    - (**10min**) https://github.com/emberjs/ember.js/issues/15501
    - (**5min**) https://github.com/emberjs/ember.js/issues/15248
    - (**5min**) https://github.com/emberjs/ember.js/issues/11152
    - (**5min**) https://github.com/emberjs/ember.js/issues/5210
    - (**5min**) https://github.com/emberjs/ember.js/issues/12853
    - (**5min**) https://github.com/emberjs/ember.js/issues/11255
    - (**5min**) https://github.com/emberjs/ember.js/issues/13840
    - (**5min**) https://github.com/emberjs/ember.js/issues/14712
    - (**1min**) https://github.com/emberjs/ember.js/issues/15635
    - (**1min**) https://github.com/emberjs/ember.js/issues/14747
- (public) (10 min) [Async Observers](https://github.com/emberjs/rfcs/pull/494)
- (public) (5mins) built-in helpers RFC


## Action Items
- [ ] Put a cap on co-location RFC discussion - Yehuda will draft a closing comment. @Robert J @Godfrey C 
- [x] Open a PR to add close qualifications to the RFC readme @Jennifer W  https://github.com/emberjs/rfcs/pull/495
- [ ] https://github.com/emberjs/ember.js/issues/11152 follow up with failing test @Ricardo M
- [ ] https://github.com/emberjs/ember.js/issues/5210 close up issue @Edward F
- [ ] https://github.com/emberjs/ember.js/issues/11255 set up a time to fix it @Robert J @Ricardo M
- [ ] set up an every other week triaging meeting @Ricardo M

## Minutes

**RFCs**

[Deprecate disconnectOutlet](https://github.com/emberjs/rfcs/pull/491) 

- No objections, merging

[Co-located Component Templates](https://github.com/emberjs/rfcs/pull/481)

- RJ - we need to compose something to respond to Dave Wasmer’s concerns
- YK - Gavin’s explanation is good. Is that enough?
- RJ - We should still summarize better than “ok, merged!”
- YK - I will try to draft a reply and merge


## RFC Review

- RJ - is it ok how I went through and closed out some RFCs/Issues superceded by new things? How should we do these?
- YK - If a merged RFC says it supercedes another RFC, it’s closeable
- RJ - so it’s good bookkeeping?
- YK - Seems fine as long as we have a good comment
- TD - any reason to not FCP to close?
- RJ/YK - better for us to focus on things that need our active attention.
- YK - premature to close superceded RFCs until the new RFC is merged. Good to cross-reference them so we remember to close them
- YK - the problem is that superceded RFCs composed by other community members, replaced by our own RFC, should be withdrawn, not closed by us.

Consensus on closing RFCs - original author can close, we can FCP to close, or we can close when the new RFC is merged. We should not close RFCs ourselves outside these processes.

Consensus on closing Issues - we should just do it and be nice about it, whenever an issue is clearly out of date


- JW - where should this conclusion go?
- RJ/YK - the README
- JW - I will PR this to the README

## Issue Review

- RM - goal of this segment is to determine who will handle these issues and when

(discussion to take on Issues)


- (10min) https://github.com/emberjs/ember.js/issues/15501
    - RJ - challenging to sign up for any before Octane is out, will comment
- (5min) https://github.com/emberjs/ember.js/issues/15248
    - RJ - need a failing test case first, will comment
- (5min) https://github.com/emberjs/ember.js/issues/11152
- (5min) https://github.com/emberjs/ember.js/issues/5210
    - Closed, asked the latest reporter to open a new issue with a repro, since the original issue has possibly been fixed
- (5min) https://github.com/emberjs/ember.js/issues/12853
    - Should not go in the Guides
- (5min) https://github.com/emberjs/ember.js/issues/11255
- (5min) https://github.com/emberjs/ember.js/issues/13840
- (5min) https://github.com/emberjs/ember.js/issues/14712
- (1min) https://github.com/emberjs/ember.js/issues/15635
- (1min) https://github.com/emberjs/ember.js/issues/14747

