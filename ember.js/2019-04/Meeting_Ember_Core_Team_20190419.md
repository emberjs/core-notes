# Meeting: Ember Core Team 2019/04/19

## Agenda
    
- RFCs
    - → FCP
        - (**10 min**) [Tracked Property Updates](https://github.com/emberjs/rfcs/pull/478) (CG)
    - FCP → Merge
        - (5 **min**) [Yieldable Named Blocks](https://github.com/emberjs/rfcs/pull/460) (RJ)
    - → FCP to Close
    - FCP to Close → Close
    - Promote
        - (5 min) `[fn](https://github.com/emberjs/ember.js/pull/17941)` [Helper](https://github.com/emberjs/ember.js/pull/17941) (RJ)
- (**5 min**) `[each-in](https://github.com/emberjs/ember.js/issues/17529)` [with keys with a](https://github.com/emberjs/ember.js/issues/17529) `[.](https://github.com/emberjs/ember.js/issues/17529)` (RJ)
- (**5 min**) `[deprecate](https://github.com/emberjs/ember.js/pull/17926)` [module location](https://github.com/emberjs/ember.js/pull/17926) (RJ / RM)

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [ ] Robert Jackson
- [ ] Igor Terzic
- [ ] Matthew Beale
- [ ] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [ ] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

- [ ] Adjust `watchable` package in proposal to @`glimmer/tracking-compat` (instead of `@glimmer/tracking`
- [ ] Separate out auto-computed from rest of RFC 478 - YK, CG, and KS will meet on Monday to hash out details
- [ ] Merge Yieldable Named Blocks RFC
- [ ] Merge fn implementation
- [ ] each-in - use Ember.get alternative that simply doesn’t treat periods as paths
- [ ] Update docs to show `deprecate` function within `@ember/debug` package

## Minutes

### Tracked Property Updates

CG: *Reviewed contents of Tracked Property Updates RFC*

YK: The feedback isn’t coming out of nowhere. The amount of auto-interop between the systems didn’t work out as smoothly as we had hoped. So we are dialing it back a bit based on feedback.

YK: The problem comes when you try to migrate your `computed` to `tracked`. Any consumers that are depending on that `computed` won’t necessarily work.

RJ: I expect this to be used in services and such that are shared.

MS: What if we don’t do this.

CG: We’ll end up with a number of addons that require one system or another.

YK: It will be a blocker to upgrades.

KS: In our Octane RFC we said that we would need another RFC if interop issues were found.

CH: Perhaps `watchable` could be imported from `glimmer/tracking-compat`.

DG: This would alleviate my concern about the word form differences between `tracked` and `watchable` .

CG: *Reviews the use case for auto-computed*

RJ: How about a name along the lines of “ensure sync”

YK: I think that’s better.

KS: We have a similar concern along the lines of testing. I feel like this is edge-casey and we can do better.

YK: Can we separate out the dependable / watchable work from auto-computed?

YK: Let’s meet on Monday to hash out the details of a future RFC for auto-computed.

### fn Helper

RJ: I’ve added an assertion when an unbound function (`this.foo` ) is passed but not bound.

YK: This brings `fn` implementation inline with the expectations of the original RFC.

### each-in breaks on keys that contain a period (**`**.**`)

YK: Can we make a function that internally doesn’t treat periods as paths?

RJ: That seems fine. I’d only be concerned about using some non-`Ember.get` solution that would simply error along a non-existing path (and thus be breaking)

*Agreement to internally use* `*Ember.get*` *alternative that simply doesn’t treat periods as paths.*

### Update docs to show `deprecate` function within `@ember/debug` package

*No opposition to Robert’s proposal*
