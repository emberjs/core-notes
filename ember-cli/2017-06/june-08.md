# ember-cli Meeting Notes - 2017-05-08

## Attendees

- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @kratiahuja ka Krati Ahuja
- @locks RM Ricardo Mendes
- @rwjblue rj Robert Jackson
- @stefanpenner sp Stefan Penner
- @trabus jb Jake Bixby

## Agenda

- Discuss https://github.com/ember-cli/ember-cli/pull/7088/files
- ember-next blueprint: github.com/ember-cli/ember-next
- ember-cli-fastboot / `treeForFastBoot` https://github.com/ember-fastboot/ember-cli-fastboot/pull/423
- npm v5, node 8 update -sp
- legacy addons

## Discussion Notes

### PR ember-cli#7088

- ka: add custom transform when using `app.import`
- sp: if all the transforms are implemented by ember-cli we can guarantee the order
- ka: so if an addon wants to do a custom transform how do they register that transform?
- sp: so the question is should we expose this as public API?
- ka: yes
- rj: do we need to guarantee ordering today?
- sp: yes because eg we need the fastboot guard to wrap the amd-shim and not the other way around
- rj: I don't think it matters: fastboot-shim is idempotent
- sp: yes but it matters whether the guard is inside or outside of the module
- rj: I'm not sure if it matters
- sp: well it's eg unexpected to have an empty module
- sp: I think our ember-cli implementation will be a map that runs through an array of callbacks
- rj: Seems reasonable.  We need to decide what we're targeting, what branch &c.
- sp: that unblocks your work krati?
- ka: yes
- sp: do we need a short rfc process?  Similar to what introduced the AMD shim?  Mention the API, the arguments and the order
- ka: sounds good.  I can do that RFC.
- rj: in the current implementation we use `stew.map`
- sp: yes we're currently planing on changing that to something that supports many transformations
- rj: does the call to `app.import` expect a string or a tree?
- sp: I think it's at a higher level than the broccoli level
- ka: currently it's a string
- rj: yeah in the PR currently it's tree based.  I think that exposes too much.
- sp: we can combine the funnel and custom plugin into one step: it reads the files it needs to care about, checks the list of transforms it needs to care about and then won't need a new funnel step.
- ka: great that unblocks me


### ember-next blueprint

- sp: would like to move to something that doesn't require jQuery &c.  Definitely would like extra feedback, ideas & help.  Also came up with some ideas for improving blueprints, eg the way the addon blueprint extends the app blueprint is a bit hacky
- rj: we need the same thing in engines
- sp: yeah so i added a way to extend a blueprint to transform the parent blueprint's file using a `PatchableFileInfo`, so you can extend blueprints without needing to just completely replace other files.
- rj: is this extracted to a point where this can be reused elsewhere?
- sp: yes
- rj: cool.  It's useful standalone until ember-cli ships with this.  The other thing to talk about for ember-next is to do things like support ember-jquery an addon.  We need to chart the path for this.  We should update ember-cli to deprecate the vendor files it uses today and then have ember-source `app.import` the files it needs just like any other addon.
- sp: ember-next aims to have no jQuery, provide native event dispatcher, a strict resolver with fewer normalization steps.  A stretch goal is decorators and classes
- rm: question, how does ember-next repo help to accomplish this?  why is it a separate repo and why is it under ember-cli?
- rj: because it replaces the app blueprint, which is an ember-cli concern not an ember concern.
- sp: yeah, so ember-next is more like ember-next-app-blueprint
- rj: the goal is to eventually change the `ember new` output to use this, but we need a place to test something in a way that's more involved than a simple feature flag.
- sp: so this is also a place for us to do other experimentation like module unification.


### ember-cli-fastboot `treeForFastBoot`

- rj: to be clear this is a place to discuss fastboot related things
- sp: yes for stuff that's outside of eg the fastboot API.  Much of it is essentially a build concern.  If there's anything else we need it's Krati's call if this is the right venue.
- rj: is the fastboot team still meeting?
- ka: no
- rj: ember-cli doesn't expose a way for addons to expose custom tree types.  There's a couple addons that want this: fastboot and service-worker.  I would propose we add a new API for an addon to be able to add a new top level API for addons.  It seems complicated.
- sp: Why do we have to do anything crazy?  I think krati has essentially already implemented this.
- rj: so `treeFor` already checks to see if something exists.  But we don't have a way of just adding a folder and having it work.
- sp: okay but how can people choose the name of this?
- rj: i think you can only add a new unused custom name.
- sp: we could make the tree name something you import from the addon
- ks: what if it was a single tree hook eg `treeForCustom` that took a string that was the addon name
- sp: that seems like it would be fine
- rj: we need to be aware of it so we can build it in to the current caching mechanisms
- sp: so an addon when it's included could register itself as a hook
- rj: right that's basically what I'm saying
- sp: this means by default your hooks would not be `treeForFastBoot`.  This seems like a good idea.  We could say if your addon adds more than one hook it would be `${addonName}:${customPath}`.  We want to avoid name collision problems.  We can do this by namespacing by addon name, which prevents collisions.
- rj: slightly annoying to update all the things that already use `treeForFastboot`
- ka: I think that's only used by two addons so not too much.
- rj: currently you can augment the build with fastboot assets, but only for the app tree but not the addon tree
- ka: like for vendor?
- rj: what i mean is if you want to replace a module in your addon directory for fastboot, we have no way of doing that.  We need something like a `fastboot-addon`
- ka: we spoke about this earlier and we do need this, but we deferred it because there isn't a use case that requires it right now.
- sp: this should be simpler once we add a hook for arbitrary trees.
- ka: yes
- rj: yes
- ks: is multiple trees too rare of a case to justify forcing the addon name as a namespace even for just one custom tree?
- sp: we can avoid the pain by treating something `x` without a colon as equivalent to `x:x`, just like concise objects in javascript
- ks: seems good
- rj: what about the name of the path on disk to use for the default value?  This should be ergonomic?


### npm5

- sp: current status is we're trolled by a bug in npm because our tests create a couple symlinks via `npm link`
- dh: looks like the issue is ember-cli linking to itself within `node_modules`
- sp: yeah we should be able to work around this within our test suite, although I've logged a bug with npm.  Not much movement there yet.


### legacy addons

- rm: We need a place for legacy addons
- rj: We certainly do not guarantee that ember master will be installable on node 0.12
- sp: yes but `bin/ember` can leak between versions
- rj: I care 3/10.  At some point we should be able to update the file, but for now it's fine.
- sp: Let's add lint ignores to this file.

