# Meeting: Ember Core Team 2018/04/13

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/04/06


- (public) Ember 3.1
  - [emberjs/ember.js#16503](https://github.com/emberjs/ember.js/issues/16503): `Cannot read property 'syscall' of null`
  - Fix: [glimmerjs/glimmer-vm#797](https://github.com/glimmerjs/glimmer-vm/issues/797)
- (public) RFC’s to Merge
  - https://github.com/emberjs/rfcs/pull/322 copy/Copyable
  - https://github.com/emberjs/rfcs/pull/311 <AngleBracketInvocation />
- (public) emberjs.com/blog (RM)
- (public) JS Modules API [RJ]
  - Current WIP
  - Missing exports: https://github.com/ember-cli/ember-rfc176-data/issues/12
    - `Ember.onerror`
    - `Ember.HTMLBars.template` / `Ember.HTMLBars.compile`
- (public) Roadmap Kickoff Heads Up (TD)

Next week: +Meeting: Ember Core Team 2018/04/20

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[x] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner
## Minutes

**3.1**
RJ: there’s still a couple bug fixes we need to land
RJ: but it seems to be going well, apart from some expected `proxy` problems
RJ: we haven’t released the blog post, I think Mel has been working on it?
MS: I am finishing Ember CLI prose, will merge by tonight

**emberjs.com/blog**
YK: the blog has broken IA

