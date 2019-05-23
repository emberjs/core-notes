# Meeting: Ember Core Team 2019/03/15

## Agenda

- **(5 min)** FCP → Merge
    - Nested Invocation https://github.com/emberjs/rfcs/pull/457
    - Angle Invocation for Builtins https://github.com/emberjs/rfcs/pull/459
    - Classic Class Owner Tunnel/Injection Parameter Normalization: https://github.com/emberjs/rfcs/pull/451
    - Deprecate {{partial}} https://github.com/emberjs/rfcs/pull/449
    - Deprecate {{with}} https://github.com/emberjs/rfcs/pull/445
    - Decorator RFC https://github.com/emberjs/rfcs/pull/440
    - Review: Website RFC https://github.com/emberjs/rfcs/pull/425

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [ ] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [ ] Ricardo Mendes
- [x] Chad Hietala
- [ ] Katie Gengler
- [ ] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

- [ ] Nested Invocation → Merge
- [ ] Angle Invocation for built-ins → Merged
- [ ] #451 is a no-go, leave FCP
- [ ] Deprecate Partial: https://github.com/emberjs/rfcs/pull/449 → Merge
- [ ] Deprecate With: https://github.com/emberjs/rfcs/pull/445 → Merge
- [ ] Decorator Support: https://github.com/emberjs/rfcs/pull/440 → Merge
- [ ] Website RFC: https://github.com/emberjs/rfcs/pull/425 → Leave a comment that framework core has no blocking concerns. :thumbsup:
- [ ] GC will confirm that nested angle invocation can be go-ed with the people not present at this meeting

## Minutes

### Nested invocation is basically working

GC: I have the nested angle invocation in master, I think the risk of enabling to get into the nest release is low. Could we go the feature? The branch point is very close.

YK: I think it is worth going and we can circulate it in the chatroom.

Nobody blocks

YK: GC Please check with the people not here

### Angle invocation of built-in

GC: I don’t think it will be done by the next branch point anyway.

### Octane timeline/announcements

TD: The preview is available today. Octane landing page on emberjs.com that JW is working on. A preview version of the guides will be live at octane-guides-preview.emberjs.com

TD: I will say: We want to make sure it is polished, and the features we want are in a stable release, we will cut over after that.

YK: We will say that we think the current set of implementation is basically complete.

GC: You probably shouldn’t use it in production.

EF: I think you could layout out guidelines for what kind of person would use this.

GC: I think there is not a huge reason to adopt it immediately.

YK: If you want to use angle components use them

YK: I’m trying to avoid saying “Octane is only for beginners”, but if you are highly tolerant of incoherence you might use it.
