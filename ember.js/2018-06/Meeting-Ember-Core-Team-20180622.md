# Meeting: Ember Core Team 2018/06/22

## Agenda
- Feature Review (RJ)
  - Features to “enable by default”:
    - Custom Components
  - RFC’s to Merge
    - [Deprecate Component#sendAction](https://github.com/emberjs/rfcs/pull/335)
    - [Promote](https://github.com/emberjs/rfcs/pull/287) `[{{in-element}}](https://github.com/emberjs/rfcs/pull/287)` [to public API](https://github.com/emberjs/rfcs/pull/287)
    - [Deprecate Globals Resolver](https://github.com/emberjs/rfcs/pull/331)
    - [Deprecate](https://github.com/emberjs/rfcs/pull/324) `[Component#isVisible](https://github.com/emberjs/rfcs/pull/324)`
    - [Transition from Property Fallback Behavior](https://github.com/emberjs/rfcs/pull/308)
  - RFC’s to FCP
    - [Native Class Constructor Update](https://github.com/emberjs/rfcs/pull/337)
  - RFC’s needing core feedback
    - [Deprecate Component Lifecycle Events](https://github.com/emberjs/rfcs/pull/298)
    - [Deprecate](https://github.com/emberjs/rfcs/pull/334) `[isBlank](https://github.com/emberjs/rfcs/pull/334)`[,](https://github.com/emberjs/rfcs/pull/334) `[isEmpty](https://github.com/emberjs/rfcs/pull/334)`[,](https://github.com/emberjs/rfcs/pull/334) `[isNone](https://github.com/emberjs/rfcs/pull/334)`[,](https://github.com/emberjs/rfcs/pull/334)`[isPresent](https://github.com/emberjs/rfcs/pull/334)`
- CoreObject interop with native ES (RJ)
- Roadmap RFC creation
- 3.2 release

## Attendees
[x] Yehuda Katz
[ ] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala 🛩️
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### Custom components

RJ: This is in canary behind a flag, I would like to enable it by default and  let it roll into beta. (no disagreements).

### FCP period merges

RJ: These next things we don’t have any pushback on and seem ready to go.

RJ: The `sendAction` one https://github.com/emberjs/rfcs/pull/335 already has a PR with a deprecation etc. Anyone blocking? No? Ok.

RJ: Next is https://github.com/emberjs/rfcs/pull/287

GC: I wish the RFC was more clear about: “This rfc is not about replacing what you are already using, it is about making things you already use rely on public API”. The last comment even is still confused about this.

RJ: Right we’re not trying to replace wormhole.

KS: Wormhole can’t use it though. We don’t have update.

GC: Right I shouldn’t have raised wormhole. Ember elsewhere and other stuff.

YK: Sounds like a good follow-on RFC. I think GC has mentioned we want this RFC to have very little implementation work so we can just ship it.

RJ: Right and I think we’ve said that a few times.

EF: Sounds like we all agree, we should move it forward.

RJ: Next up is deprecate globals resolver: https://github.com/emberjs/rfcs/pull/331

(discussion)

MB: I will comment on this and merge.

RJ: Next is `isVisible` https://github.com/emberjs/rfcs/pull/324 deprecation. No objection? Great.

RJ: And then transitioning away from property fallback behavior: https://github.com/emberjs/rfcs/pull/308 Since we’ve moved it to FCP the only comments are fairly positive. The linter has been updated thanks to MM. I think merging this is a good time to update the guides and docs to use the new style.

Agreement!

RJ: I’d like to move https://github.com/emberjs/rfcs/pull/337 into FCP. We discussed this last week.

YK: I’d like to give it another week.

RJ: Any specific concerns?

YK: I did a big exploration with people a while back. This wasn’t the direction that we were going. It seem good, but I want to close the loop on those other conversations. I think the biggest issues come from “where do we want to go in the future”.

KS: I still plan to extract things to interfaces as we move to TS, allowing you to implement the interfaces instead of extending.

YK: Yeah I just want to load the context again.

KS: I’m not sure I see a path that bridges the old and new worlds for a non-breaking transition.

YK: I agree.

RJ: So please read and leave comments. KS also did some great work allowing ES and Ember’s inheritance to interop which is great.

KS: It works with the patterns we use now, but just without fixing the constructor stuff.

RJ: I’ll carry this forward. Please review and comment or drop comments into chat. I want to get it through quickly if we agree but not squash anyones thoughts.

RJ: Next deprecating component lifecycle hooks https://github.com/emberjs/rfcs/pull/298 we just need to close the loop on this. YK and DG had concerns but you need to leave your thoughts so we can close it up or move forward.

YK: Ok, please ping me later.

RJ: And this RFC for deprecating `isBlank` etc: https://github.com/emberjs/rfcs/pull/334

(discussion, general agreement we don’t like these methods in core)

RJ: Ok I will write up thoughts.

### CoreObject interop with native ES

RJ: There is some conversation about how we might be able to backport support for the native classes.

KS: So I think to document it it would be good for older versions to be able to use it. We can’t do old releases since IE9 support ends up dropped.

RJ: The idea is that we will do patch releases of 3.x for these interop fixes. But we can release an addon that is a polyfill for this stuff but also breaks IE9. It brings a bunch of ember versions pre-compiled with the fixes, and swaps them in.

### Roadmap RFC creation

KG: We’ve got a set of notes that have been circulated with everyone. We would like input on these and then an as-of-yet unidentified party will write a roadmap RFC.

(discussion)

### 3.2 release

KG: I don’t think 3.2 is out yet for ember-cli and ember-data. So do we release 3.3 in three weeks, or do we just start the clock from their release date?

(discussion)

RJ: We need to get better about managing releases.

MS: Jen has been cycling through other team meetings to try and quickly catch up on things.







