# Meeting: Ember Core Team 2018/07/06

## Agenda
- please register for EmberCamp Chicago (embercamp.com)

## Attendees
[x] Yehuda Katz
[ ] Tom Dale
[ ] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[ ] Robert Jackson
[x] Igor Terzic
[ ] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[ ] Katie Gengler
[x] Melanie Sumner

## Minutes

### Release Team Update
RJ: We did a post-mortem on what went wrong with 3.2. We added some guidelines around what to do in similar situations in the future if a dependency is blocking release. Now we have an agreed on standard for what to do, which is re-release the previously tagged stable version and pushing the release out to the next cycle.

RJ: We also discussed lockstep versioning, how to coordinate who specifically will be doing each release. All of that is geared towards avoiding the 3.2 situation in the future, where Ember.js had released but others were blocked. Anything I missed, KG?

KG: No, that was a good summary. Should I post the notes of that meeting publicly?

RJ: Yeah, everything we discussed was good to make public.

KG: I took detailed notes about lockstep versioning, you might want to double check before you say that. 😉

RJ: My hatred of lockstep is well-known.

YK: My only concern about lockstep versioning is having a clear way to communicate to users what packages are conceptually part of the same “release” aka what has been tested to work together.

RJ: For me, the literal version number being the same is the root problem. Users having to go to a bunch of different repos and reverse engineer which versions of packages are compatible is incredibly frustrating and we should avoid that.

KG: We’re going to do some research on the pros and cons of lockstep versioning and potentially submit an RFC to move away with it. So far we do not have any volunteers to write the RFC however.

RJ: We need someone who can strongly argue in favor of lockstep versioning to make sure the RFC is fair.

EF: I don’t think there is anyone strongly in favor necessarily. This is largely a stopgap workaround around npm’s broken semantics around peer dependencies. We want to be able to have Ember Data declare what versions of Ember it supports, and have people get the right thing when they npm install. But that’s impossible in npm today.

YK: I think there’s an alternative to a more complex solution, like including a JSON file with all of the metadata about which packages and versions are intended to work together.
