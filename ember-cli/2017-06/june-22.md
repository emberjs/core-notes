# ember-cli Meeting Notes - 2017-06-22

## Attendees

- @hjdivad dh david hamilton
- @kellyselden ks kelly selden
- @kratiahuja ka krati ahuja 
- @rwjblue rj robert jackson
- @trabus jb jake bixby
- @turbo87 tb tobias bieniek


## Agenda

- custom-transform
- set date for fastboot
- typescript
- npm credentials
- npm org/scope
- module scope / tree shaking
- yarn non-interactive

## Discussion Notes


### custom-transforms rfc#108

- ka: last one wins for two transforms, but allow people to pick between them with from
- rj: can we imagine a reasonable use case for this?
- ka: not a concrete example, but an app may want to use something from another addon
- dh: my preference is to error or soft error until there is an actual use case
- rj: seems okay but i have a reservations.  If we do this but have a last one wins (which is what we do with blueprints and commands) it's essentially official support, so it seems weird to also add a warning.
- dh: i imagined last one wins with warning is essentially a soft error.  i'm also happy for this just to be an error case.
- ka: but now the user has to pick between 2 addons that want to provide the same transform
- dh: i think that's the case generally for incompatible addons.
- tb: who actually needs these transforms
- rj: fastboot
- tb: anybody else?
- rj: cjs stuff could have landed as a transform.  Also, it might be a bit forward thinking but eventually we want to be the base for a CLI for other tools, not just ember and glimmer.
- tb: why do these need to have names anyway?  can't we use broccoli `stew.map` or something?
- rj: that's totally reasonable within within an addon, but it's harder for apps.  app authors shouldn't need to care about broccoli
- tb: we could provide pre-baked implementations for amd, fastboot whatever and just plug in.
- rj: sure but people are trying to app.import from vendor, but it's an ephemeral vendor provided by someone else.  We need access to this in some way.
- tb: say more
- rj: the vendor tree you `app.import` from is a combined tree, a merged tree.  But how does an end-user in an app get access to that merged tree?
- tb: why do they need names?  can't we have it just be a function
- rj: could go either way
- ka: users will be confused about amd being a string but things like fastboot being done directly by function


### fastboot 1.0 date

- ka: fastboot looks good, when can we release 1.0
- rj: let's do it tomorrow.  As far as I'm concerned there is no blocker, we were just waiting on updating addons
- ka: the only thing is that addon owners will need to deal with the `app.import` thing until the rfc lands
- rj: most imports are wrapped by an addon anyway
- tb: yes but that's mainly because we couldn't import from `node_modules` reliably
- ka: sounds good, i'll do a final check this weekend

### typescript

- rj: so the issue here is adding a build step, but it would let us use newer syntax
- dh: but not the syntax?
- rj: i don't think that's a fight worth fighting
- dh: thoughts?
- tb: it will necessarily introduce a build step
- rj: that will add friction.  I don't think there are many consumers of ember-cli
- dh: the type annotations are useful for addon authors and cli contributors.  The project is large enough where it's exactly the sort of thing where it's hard to know the shape of arguments &c.
- ks: it's nice to not have a build step on ember-cli and it's nicer in general
- tb: stack traces are useless etc.
- rj: node doesn't have sourcemap support?
- tb: it didn't seem to be working when i last tried
- dh: seems like conclusion of this discussion is that a number of people don't want to have separate typings within js and another subset is less strongly opposed to having any build step at all


### npm credentials

- rj: is there anything actionable here?  the only thing i think we can do is reduce the number of people who can publish.  We have some autodeploy
- tb: those are linked to the ember-cli user
- rj: i don't know that we can get to a point where only the ember-cli user has access.  Our current list of publishers is larger than I would have expected.  Should we  reduce it?
- tb: given that everybody on this list is in the ember-cli team it seems weird
- rj: i agree
- tb: the lesson here seems to work more towards automated deploy
- rj: does npm have 2fa?
- tb: maybe for the business things but otherwise unsure.


### npm org / scope

- rj: i was dealing with scopes in glimmer and this turns out to actually be easy
- tb: should we use @ember for both?
- rj: seems good to have @ember-cli be separate
- 

### module scope / tree shaking

- rj: related there's the addon that produces globals from the module api
- ks: what about addons that use the shims?
- rj: they should migrate to the new shims and the codemod will work.
- rj: i have a question though: should we revert the pr that added the new shims
- to ember-cli-shims?  i kinda think we should
- dh: what are the considerations?
- rj: the babel plugin transforms the new api into globals.  We landed in ember-cli-shims the addon.  But they have to be transpiled at build time.  And they generate wrapper modules in the output.
- tb: is it released in ember-cli-babel yet?
- rj: not yet
- tb: it will only be available for babel6?
- rj: yes, but that does work way far back
- ks: after thinking about it, i think we should revert it as well.
- tb: we should hold off on publishing ember-cli 1.2.2 until the ember-cli-babel work is ready
- rj: okay i'll make ember-cli-babel work with the new thing and then update the shims repo to revert the thing that provide @ember/whatever, leave the old shims deprecated and then more or less revert the entire addon.


### yarn non-interactive

- tb: the pr works but there is one test failing on appveyor consistently but i'm not sure what's going on
- rj: does appveyor have the newest yarn?

