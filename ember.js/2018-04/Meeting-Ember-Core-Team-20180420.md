# Meeting: Ember Core Team 2018/04/20

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/04/13


- (public) Ember CLI LTS
- (public) DOM API for tagless components (TD)
- (public) [Browser Support Policy](https://github.com/emberjs/website/issues/2870)

Next week: +Meeting: Ember Core Team 2018/04/27

## Attendees
[ ] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[ ] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[ ] Dan Gebhardt
[ ] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner


## Minutes

Discussion: ember-cli will have LTS versions
Discussion: browser support policy

- consensus: evergreen-2 + IE11
- what about Safari?
- add it to the channel release page (per release)
- Tom: CI browsers seems honest
- Rob: Lockdown on release (2.18 releases and was tested against Chrome 987, need to lock it down)

Discussion: DOM API for tagless components

- Tom: we don’t have a good way to support this right now- it’s a fragment so there’s no this.element. I think we discussed something like a ref helper. I asked the person who inquired “do you want to work on this RFC?” & they said sure, but I wanted to check first to see if there was existing work happening.
- Kris: there’s already an RFC for an element modifier that could be built on
- Chad: Godfrey was going to work on something like this, idk how far he got
- Rob: we can do at least two things. We could add a simple RFC now
- (more discussion about technical details)
- Ed: this shouldn’t be considered a substitute for the view-bounds (API?)

Discussion: Some current bugs/regressions

- Kris: don’t recommend that anyone release 3.1 into production
- Rob: I’ll tag the serious ones and if you can help, please do
- Martin: are we going to have a deadline to fix the serious ones before the next release?
- Rob: We should have a 3.1.1 release. Good call.
- (more discussion about some specific bugs)

