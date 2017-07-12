# ember-cli Meeting Notes - 2017-06-29

## Attendees

- @hjdivad dh David Hamilton
- @rwjblue rj Robert Jackson
- @stefanpenner sp Stefan Penner
- @trabus jb Jake Bixby
- @kategengler kg Katie Gengler
- @turbo87 tb Tobias Bieniek
- @kellyselden ks Kelly Selden


## Agenda

- ember-cli rfc 105 use optionalDependencies for addon discovery
- prettier on ember-cli codebase
- ember-cli rfc 100 Include ember-cli-dependency-lint in the default app blueprint
- parallel broccoli-persistent-filter
- spenjacks work


## Discussion Notes

### rfc 105

rj: we should discover addons from optionalDependencies, all the way down the tree.
sp: so we should treat these as production dependencies and ignore if they're missing
rj: i think this is great but we should not have the additional API added in the rfc
tb: what about transitive optional dependencies?
sp: it will always be present but not always discoverable based on the npm topology (consider eg `npm link`)
rj: let's just do what npm does; we do a relative `require`
sp: we might want to make this work in the case where a dependency that has an optionalDependency is linked
rj: it's already true that things are different when you `npm link`
tb: sounds good as long as we maintain that it's optional
sp: what about the extra api in the rfc?  it looks to me like it should be applicable to all addons.  let's leave a comment saying we're +1 sans the extra API


### prettier

sp: anybody opposed to a prettier configuration?
tb: we do have eslint already
sp: the second question is whether we should do a big prettier bomb or do this file by file?
rj: we need the gap between the proposal and landing it to be small
sp: okay so next step should be to open a PR that uses prettier and we can decide whether we like the configuration or not.
ks: what does it do beyond eslint?
rj: think of it as `eslint --fixed` or `go fmt`
dh: does it supersede eslint?
tb: part of the pr will be to split eslint configuration from prettier configuration so there isn't overlap
ks: what's the mechanism for running it?
sp: what about a git commit hook
dh; git commit hooks are almost universally a bad idea
kg: there's an eslint plugin that can deal with this
ks: what about spinning up a new person on the project?
rj: we'll definitely need an npm task to do this
sp: `npm run pretty` or something
ks: what about changing things that break the prettier validation on eg github or something?
sp: that seems okay, we can check it out locally and fix things up.  we could write a script to do this, eg `pretty-pr PR_NUM`.
rj: let's try it and we can always turn it off if it gets annoying.  It seems very good to automate this kind of thing to avoid formatting discussions in PRs that do work.
sp: we don't need an rfc for this



### rfc 100 ember-cli-dependency-lint

rj: there exists a plugin dependency-lint that extends beyond dependency-checker
sp: does it supersede the other one?
rj: i think we want to consolidate them into the same thing
sp: can we make the default configuration change no existing behaviour but allow people to opt in to stricter checking
rj: what about new generated apps?
sp: not immediately.  Also we need to be concerned about bus factor; can we unify these two projects.  Any concerns?
ks: only concern is about bikeshedding the name.



