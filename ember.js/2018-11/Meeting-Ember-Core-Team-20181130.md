# Meeting: Ember Core Team 2018/11/30

## Agenda

- Add to F2F Agenda +Ember Framework Team, Q4 2018 
- RFC author needed: https://github.com/emberjs/rfcs/issues/377 
- Is there any update on the status of the 3.6 release?
- RFC Roundup
  - FCP → Merge
    - RouteInfo Metadata
    - RFC RFC
- ember-data core team is soliciting discussion around cross-cutting
  module naming concerns (https://github.com/emberjs/rfcs/pull/395#issuecomment-443294668)

## Attendees

[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[ ] Robert Jackson (vacation)
[x] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Dan Gebhardt
[ ] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner
[ ] Jen Weber

## Minutes

### RFC author needed: https://github.com/emberjs/rfcs/issues/377 

IT will reach out to runspired to ask about the prioritization here.

There was some discussion re: how Ember can expose requests for capabilities
from addons or something that would be a general solution for this class of
issues. TD was suggesting that something akin to a component manager could be
used for this, a “route data loading manager” for example. YK wants to make sure
we consider the original rational for the feature of data loading based on the
route segment before it is simply deprecated/removed.

### Is there any update on the status of the 3.6 release?

There is a blocker on release, RJ knows what is up but isn’t present today.

(discussion)

Blocker uncovered:
https://github.com/emberjs/ember.js/issues/17172#issuecomment-440318091

### FCP nomination: RouteInfo Metadata

CH: Can we merge? We went back and forth wrt concerns. I talked to EF and RJ
about what the objects are for from/to. This was with the aim of providing a
path for accessing model date on a route. I think those recent updates have
addressed those concerns.

CH: The concerns were not really about the RFC. There are no changes to the
actual RFC, instead we just changed the how.

YK/TD : No objections!

CH: This has been in RFC for a while, yay will merge!
 
RFC RFC

MS: The only concern was that champions might not be a very democratic process.

TD: Right, the response to that on the thread seemed good.

YK: If you can’t get even a single member of core to advocate/champion a change,
it isn’t likely to get core approval to go anyway.

Ok to merge!

### ember-data core team is soliciting discussion around cross-cutting module naming

IT: We’re getting close!

TD: Why not just use the rules Ember wrote?

IT: It is my understanding that Ember does a lot of weird shifting at build time
that has make linking etc bad.

(discussion)

YK: If ED has a better solution Ember/ED should not be different, then Ember
should do what ED does.

IT: If we diverge the packages slightly we avoid a number of issues. Our
constraints are much lower than Ember’s.

TD: You’re suggesting that by making things shallow you fix a technical problem,
but a key tenant of the Ember system, that a class is always a default export,
is broken by making the module name more shallow. Can we go offline? The idea
that nested packages are painful is not my understanding….

DG: I think we should consider waiting until we have RJ here

(discussion)

KG: I want to note we should leave a comment here since the commenter may not
see this conversation. Whatever comes out of this discussion should make its way
back there.

TD: I will leave a stub comment. I strongly want to block this and talk about
it.

IT: Yes that is why I brought this up.

YK: The comment here mentions the “no-double-slash” problem, but I don’t see a
definition here.

IT: RJ described it as a known problem.

KS: Chris mentioned this to me the other day and I wasn’t sure what he was
talking about.

IT: RJ described this as a known issue.
