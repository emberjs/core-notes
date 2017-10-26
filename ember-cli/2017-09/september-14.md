# ember-cli Meeting Notes - 2017-08-31

## Attendees

- @hjdivad dh David Hamilton
- @kellyselden ks Kelly Selden
- @kratiahuja ka krati ahuja 
- @rwjblue rj Robert Jackson
- @turbo87 tb Tobias Bieniek
- @twokul an Alex Navasardyan

## Agenda

- strategies rfc
- std/esm
- ember-cli-update

## Discussion Notes

### Strategies RFC

rj: make sure everyone has seen [Strategies RFC](https://github.com/ember-cli/rfcs/pull/110), review proposed API, minimal API changes will introduced/made.

ka: is the final output going to change?

rj: no, current behaviour mimic the current behaviour exactly; having strategies in place will allow us to experiment with things.

ka: makes sense

tb: is there a plan to add this functionality to add-ons?

rj: not yet

tb: I thought it was going to replace the current pipeline

rj: not, it wasn't a plan

### std/esm

rj: we should work on WIP PR for the RFC next time is `std/esm` PR; we talked about it couple of times before; PR enables to use ESM; there's a slight annoyance with the `std/esm` loader.

an: it might not makes sense `bin/ember` to keep

tb: if we change `bin/ember`, we possibly can break compatibility

rj: the current PR is fine; it might make sense to change one of the files to use `import` to demonstrate that it works.

an: makes sense

rj: do we know if there was any resolution around ayo?

dh: no idea, I haven't been following it

rj: there was a controversy b/c JDD is going to make `std/esm` the most used package on npm and forces Node to use ESM.  for this particular package it could become "approved" solution. 

rj: do we care at all about all that^^

dh: the risk is "what happens `std/esm` is going to away?" which seems unlikely

ks: seems like node people market their own loader

dh: the thing that would be a problem if they break compatibility with native `import`/`export`

rj: should we rename files to `mjs`?

dh: this is megabikeshed territory :D don't rename the files until we absolutely have to

rj: yeah. why don't we go forward with PR and leave all the files as they are & create an issue to track conversion for `mjs`

tb: do we lose compatibility with older versions with `mjs`?

rj: no, `std/esm` helps compatibility story there

ks: it doesn't make sense to create the issue that is going to be opened for next 5 years?

rj: it's important for us to be good citizen and voice our concerns. the thing I want to make sure is that we do the right thing and be compatible with future node versions

dh: I can imagine README having a link to explanation about `std/esm` and support for node ESM

rj: sounds like controversy about using the private Node API is resolved

rj: wanted to fill in everyone in on brainstorming sessions I had with Dan Freeman and Alex N (context es6 imports from `node_modules`). phase 1. that is going to be negatively impact build performance and will draft an RFC about that. it will resolves imports from `node_modules`; we will be able to import most of node modules; it will require reparsing already transplied files. it's hard to know how much time it would take and should be opt-in. it depends on Strategies RFC.

tb: no CJS compatibility

rj: no, ES6 modules all the way. long term plan is `treeForAddon` do nothing but emit es latest (for most add-ons that means we don't transpile at all), ember-cli-bable did nothing in the most hooks; assembler strategies will be responsible for doing transpilation into targets. that way we only transpile once. that allows multitarget bundles.

rj: we're going to have to write broccoli plugin that works differnetly from broccoli-babel-transpiler; it's unclear if we want to expose phase 1 to users.

### ember-cli-update

rj: we should start using `ember--cli-update`

ks: are there any alternatives to `ember-cli-update`? `ember-watson`?

rj: `ember-watson` is conceptually different. I don't think it's actively maintained, we should likely have a different standalone tool that does upgrade for us.

ks: I'll just start working on a tool that has codemods and runs them

rj: putting codemods in a visible place gives it more credibility 

tb: there's one more PR that needs review https://github.com/ember-cli/ember-cli/pull/7232. 

ks/rj: PR seems good.
