# Meeting: Ember Core Team 2018/09/07

## Agenda
- Element Modifier Managers https://github.com/emberjs/rfcs/blob/modifier-managers/text/0000-Element-Modifier-Managers.md
- Ember-Router → TypeScript https://github.com/emberjs/ember.js/tree/router-refactor
  - Nothing to really discuss just raising for visibility sake
- Breaking Changes In RouterJS https://github.com/tildeio/router.js/pull/248
  - Nothing to really discuss just raising for visibility sake
- [MU Packaging RFC](https://github.com/emberjs/rfcs/pull/367) (RJ / MB?)
- Add to F2F Agenda[+Ember Framework Team, Q3 218](https://paper.dropbox.com/doc/Ember-Framework-Team-Q3-218-KGLfz2rCmQ7ksN3w1BOXm)  (KG)
- RFC’s FCP → Merge (RJ)
  - [Native Class Constructor Update RFC](https://github.com/emberjs/rfcs/pull/337)
  - [Deprecate Globals Resolver](https://github.com/emberjs/rfcs/pull/331)

## Attendees
[ ] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### Element Modifier Manager

(discussion)

CH: I will add language about the compatibility masks currently used in component managers to this RFC, then open it!

### Router / TS

CH: I’m trying to raise visibility that I’m in this space. I am looking at this with the goal of implementing the rest of the router service.

TD: I think lux was working on this in dev-emberjs

CH: Yeah I’m not sure what he is doing exactly

TD: Seems like they are doing some… stuff. You should check in.

CH: Yep, I can do that.

RJ: knownsalia (sp?) has a PR cleaning up some things, and I think the PR from lux was just moving that forward.

### Breaking changes in routerjs

CH: this was mostly swapping out the base classes and removing all the stuff that Ember does anyway.

EF: I’ve wanted to do this. The problem is do you end up with an ember-ish implementation just to make the suite pass.

CH: I implemented a simpler version of the functionality Ember has. There are probably going to be breaking changes since I need to rename handlerinfos to routeinfos etc. I think we should land a bunch of these changes at once so we don’t need to bump the version every change.

TD: According to NPM I don’t see anyone using this as a dependency.

RJ: Yeah I known people are using it, but not many or well. We should feel free to bump.

### MU RFC

RJ: I spent way too long talking about this on a podcast. I’d like to see us move forward.

(discussion)

- RJ thinks we should offer `{{use}}` from inside a classic app
- EF because of whitespace and such we should not quite teach it as a prefix. We should treat it as a way to change the bindings
- Make clear that using anything besides use in a prelude is a compile time error
- Matt wants to write out the addon migration strategy
- Matt has a goal of FCP by next week
- On Monday DG / RJ / should attend MU standup to cover engines

### RFC → merge

- Both are go!
