Meeting: Octane Strike Team 2019/01/08

Overview
Location

BlueJeans: https://bluejeans.com/236115101
WebRTC: https://bluejeans.com/236115101/webrtc
#st-octane on Discord

## Attendees
- [x] Chris Garrett (CG)
- [ ] Jen Weber (JW)
- [x] Melanie Sumner (MS)
- [x] NullVoxPopuli (NVP)
- [x] Robert Jackson (RJ)
- [x] Tom Dale (TD)
- [x] Stefan Penner (SP)
- [ ] Izel Nakri (IN)
- [x] Yehuda Katz (YK)
- [ ] Ricardo Mendes (RM)
- [x] Mike North (MN)

## Agenda

Last week’s agenda: +Meeting: Octane Strike Team 2019/01/01
Actual last meeting agenda: +Meeting: Octane Strike Team 2018/12/18


- [ ] Review last week’s action items
    - [ ] @Tom D to write issues describing needed RFCs for
        - [ ] Rehydration
        - [ ] Incremental rendering
    - [x] @Tom D to review Mini Guide’s open questions
    - [x] @Michael N to organize “someone without context” to review docs
    - [ ] @Chris G work on codemod/documentation
       - [ ] https://github.com/scalvert/ember-es6-class-codemod/issues/46
    - [x] @NullVox P proof of concept for decorators
       - [ ] https://github.com/emberjs/ember.js/pull/17226
    - [x] @Tom D to update Decorators RFC to describe plan to wait for possible Stage 3 at next TC39
    - [ ] @Tom D to find someone to work on router helpers RFC implementation
    - [x] @Tom D first pass update of Editions RFC
- [x] Updates on Octane RFCs
- [ ] @Robert J please review/clarify: https://github.com/emberjs/ember.js/issues/17234#issuecomment-450977709

## Action Items

- [ ] Document SSR rehydration gotchas in FastBoot documentation
   - [ ] @Robert J to file an issue on FastBoot repo with list of known gotchas
   - [ ] @Tom D to talk with Learning team to figure out plan for SSR
- [ ] @Michael N to send out initial “welcome email” to Octane Focus Group™
- [ ] Check in on native classes code mod documentation
- [ ] @NullVox P Computed w/ Decorators PR: https://github.com/emberjs/ember.js/pull/17226
- [ ] @Tom D to write a tracking issue for the Router Helpers RFC
- [ ] @Tom D to make further additions to Editions RFC
- [ ] @Tom D to figure out how to publicly communicate at template imports

## Notes

Octane RFC Update
@Chris G

CG: Tracked properties RFC is in FCP. Most discussion was about lifecycle element modifiers RFC. No clear consensus on this. Will change to propose that we have an official addon that uses modifier manager primitive to experiment with solutions to lifecycle hooks/DOM access. Leaves room for the community to experiment with different solutions.

CG: For Glimmer components, want to break down and explain why lifecycle hooks are problematic in general, why React and other libraries seem to be moving away from it, etc. Hope to update these in the next couple days.
