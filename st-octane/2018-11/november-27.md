# Meeting: Octane Strike Team 2018/11/27

# Overview

## Attendees
- [x] Chris Garrett (CG)
- [x] Jen Weber (JW)
- [x] Melanie Sumner (MS)
- [x] NullVoxPopuli (NVP)
- [ ] Robert Jackson (RJ)
- [x] Tom Dale (TD)
- [x] Stefan Penner (SP)
- [x] Izel Nakri (IN)
- [ ] Yehuda Katz (YK)
- [x] Ricardo Mendes (RM)

## Agenda
- [ ] Review last week’s action items (TD)
- [ ] Weekly milestones/deliverables from now to EmberConf (TD)
  - [ ] [+Ember Octane Timeline](https://paper.dropbox.com/doc/Ember-Octane-Timeline-tPdhNmu4Z8LbLeDy20SS2) 
  - [ ] https://github.com/emberjs/rfcs/pull/364
- [ ] Scope realistic feature set based on remaining time (TD)
- [ ] Discuss next steps for Editions RFC (TD)
- [ ] Plan for the Guides 
- [ ] Mini Guide/one pager that shows using Octane
## Action Items
- [ ] Stefan Penner
  - [ ] Set up broccoli.builds domain with GitHub Pages
- [ ] @NullVox P 
  - [ ] Make Octane Blueprint addon
    - ember-cli-create does a better job :)
    - Note: maybe needs to be a published package
    - [ ] @Tom D and @Ricardo M will help bring context and w/blockers
  - [ ] Make decorators RFC
    - [ ] [In-Progress RFC](https://github.com/NullVoxPopuli/rfcs/blob/decorators/text/0000-decorators.md)
    - [ ] Try implementing partially in @ember/object
      - (kinda) blocked by non-babel7 usage in ember.js repo
[](https://github.com/emberjs/ember.js/pull/16987)        - [try using babel 7 branch in ember](https://github.com/emberjs/ember.js/pull/16987)
- [ ] @Tom D 
  - [x] Make consolidated list / project of Octane tasks @Melanie S
- [ ]  @Robert J 
  [ ] RFC - removing synchronous rendering from tests
- [ ] @Chris G 
  - [ ] @tracked RFC
  - [ ] Glimmer Component RFC
  - [ ] Help @NullVox P with Decorators RFC
  
## Notes
- (NVP) ran into some blockers with blueprint 
  - (TD) need a blueprint (maybe ember-cli-create could use it)
  - Blocker was that blueprint was never running - @Ricardo M is willing to help 
    - [Message log in discord about issues / what was attempted](https://discordapp.com/channels/480462759797063690/480501885837770763/515569891215015957)
  - `ember new my-octane-app -b ember-octane-blueprint`
- (CG) Decorators RFC- ready for final review, but Stef and Chris will do a final review today (11/27)
  - https://github.com/NullVoxPopuli/rfcs/blob/decorators/text/0000-decorators.md
  - (NVP) PoC: https://github.com/emberjs/ember.js/pull/17226
    - (SP) there’s a Babel 7 ember-cli, we should try it
      - https://github.com/emberjs/ember.js/pull/16987
- (TD) Github projects lack of cross-org support seems to be an issue, Mel will implement this and resolve as PM
- (CG) RFCs-
  - tracked RFC ready for wider review
    - https://github.com/pzuraq/emberjs-rfcs/blob/tracked-properties/text/0000-tracked-properties.md
  - Glimmer component RFC will start writing today
  - decorators RFC is ready for wider review
    - https://github.com/pzuraq/emberjs-rfcs/blob/decorators/text/0000-decorators.md
- (SP) let’s go back to the ember-cli-create thing- maybe we need to make ember wizard a thing and that has those kinds of options. There were reasons we didn’t do it before. So the blueprint should work 
- (MS) where we go next: we need to prioritize items on the timeline. 
- (TD) let’s go look at that
- (TD) I think we should de-scope svelte builds from Octane. There aren’t a lot of deprecations in Ember 3.0 because we’ve kept it clean. Therefore I don’t think it would deliver a lot of value.
