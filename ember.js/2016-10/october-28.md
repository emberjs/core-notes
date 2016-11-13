# Ember Core Team 2016-10-28

### Agenda

(please note (private) or (public))

- (public) CFP Update (LS)
- (public) Modules RFC Implemention Work (RJ)

### Attendees

Dan Gebhardt, Erik Bryn, Godfrey Chan, Robert Jackson, Leah Silber, Alex Matchneer, Kris Selden, Peter Wagenet, Stef Penner

### Minutes

#### EmberConf CFP

LS: The EmberConf CFP has been open for a little while and proposals are flowing in. We've got some new folks on the program committee this year and almost all proposals that are already in have *already* gotten some feedback and are iterating. So let people know, earlier means more value, we'll help them iterate!

LS: [The CFP Brainstorming session we did last year](https://s3.amazonaws.com/emberconf-2016/11-22-hangout.mp4) has been scheduled for Wednesday, November 9th at 12pm Pacific / 3pm Eastern / 8pm London. If anyone else on the core team is up for showing up as an invited expert please let me know, it'll be a mix of core team and program committee folk. Was REALLY great last year, many of the best talks came out of ideas that were discussed and proposed on that call.

#### Glimmer 2 Update

GC: I fixed the issue with class-based helper, and also make local variables win over helpers. The class-based helper issues was probably by far the biggest blocker for shipping. There are two issues on my radar – hasBlock not working in partials and block params named `|component|` does not work. Those are relatively minor issues and I believe we already know how to fix. Will pick it up soon if no one else does. We should probably get back to doing some performance investigations once these are fixed, but for now bug fixes takes priority.

#### Modules RFC Implementation Work

RJ: The 201-created folks have been doing good work on prototyping an initial implementation of the new resolver rules. There are still a number of known issues to address (listed in an issue in their repo), but once those are addressed I'd like to advocate for shipping an MVP (possibly as non-default in new ember-cli apps until we are all :+1:). The MVP would still be dynamic at runtime (no build time mapping), but would allow us to start actually using the new system.

DG: I haven't looked into their implementation in detail yet, but I'd be happy to work together on the remaining issues next week.

SP: We should be careful to not assume that a build time mapping is guaranteed to be better, it is quite likely that the map itself would be prohibitive for large applications.

RJ: OK, so it sounds like we agree that we can probably ship the initial version as runtime only, and start investigating build time map structures that would work well for us.
