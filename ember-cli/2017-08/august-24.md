# ember-cli Meeting Notes - 2017-08-24

## Attendees

- @rwjblue rj Robert Jackson
- @twokul an Alex Navasardyan
- @kratiahuja ka krati ahuja 
- @turbo87 tb Tobias Bieniek
- @kellyselden ks Kelly Selden
- @trabus jb jake bixby
- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler
- @cibernox mc Miguel Camba 


## Agenda

- default blueprint changes
- exposing `EmberApp` trees
- eslint-plugin-ember rules
- std/esm


## Discussion Notes

### Default Blueprint Changes

rj: how do people feel about

1. `./index.j` -> `./lib/index.js`
2. add eslint-plugin-node (extends `plugin:node/recommended`)
3. add basic node-land QUnit test harness out of the box

rj: what I discovered is that we effectively do not support an addon having a custom entry point *while building that addon within its own directory*.  The feature does work when building an addon as part of an application.

tb: we should definitely fix the bug.  I don't know about moving `index.js` to `lib`, especially given the inbound module unification.

rj: what I really want is to have node-specific eslint rules and we can't do this with eslintrc unless they're in their own directory.  Lots of addons have node code; it's not a theoretical concern.


### Expose EmberApp Trees

an: the motivation is to enable css/font optimizers which there isn't a good story for at the moment.

rj: this has been a problem for a while; addons wanting to look at styles and look at templates together; `ember-component-css` for example has this same problem.  One of the issues today is that there's no particular order to when styles, templates and javascript is processed relative to each other.  There isn't a way eg to ensure that templates are processed before styles.

rj: in module unification we would pass all of `src` to a hook (`preprocessAddonTree` I think?) which is aimed at this exact need.  The issue we have today is that the trees are treated separately.

an: so what can we do to unblock miguel?

mc: can we rely on all of the preprocess hooks (for all trees) to be called before any of the postprocess hooks?

rj: it seems fine for us to add that guarantee.

rj: it should be possible today to write an addon that collects all of the trees and invokes something once they have all been built, it's just difficult to reason about.  Conceptually it's the postprocess equivalent of `Promise.all` 

### eslint-plugin-ember

tb: eslint-plugin-ember is within the ember-cli organization but it has a recommended ruleset that we don't really advocate.

rj: it seems fine for the custom rules to be there but just not have them recommended?

tb: yes i would like to remove the recommended list.

rj: yes, the goal here is for this to be a place that contains the custom rules: all the hard work, but not be a place for bikeshed arguments about the preferred configuration.


### std/esm

tb: std/esm looks pretty good

rj: yes, we discussed this previously at length; the general consensus is positive; I would love to use imports.


