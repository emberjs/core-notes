# ember-cli Meeting Notes - 2017-10-12

## Attendees

- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @kratiahuja ka krati ahuja 
- @rwjblue rj Robert Jackson
- @trabus jb jake bixby

## Agenda

- SIGUSR1 for rebuilds
- release post-mortem
- ember-cli-update in core status
- strategies rfc

## Discussion Notes

### SIGUSR1 for rebuilds

rj: a community member made this suggestion while working with docker.  It seems more or less like a no-brainer.  We have most of the infrastructure already in place.  This also helps with a couple of use cases, eg a hosted environment where they want to disable the watcher and decide rebuilds themselves, or get files over a websocket &c.

ks: is there a way to disable watching right now?

rj: no, but I don't particularly want to couple those two particular things.

ks: does it ever made sense to do a partial rebuild on this event?

dh: we'd want to add `trigger` or similar to the instrumentation summary as you wouldn't have `changedFiles` in this case, but I'm :+1: on this.


### Release post-mortem

ks: what can we do to improve the release process?

rj: one of the issues we have is that not a lot of people run betas.  Can we improve this?

ks: `ember-try` integration.

rj: on the bright side, the improved linting situation means that addons will now lint `test-support` &c.

ka: is this optional?

rj: it's in by default.  The issue before is that there wasn't a good way to add linting at all.

ka: Is this going to be a frustration for addons?

rj: So the linting will only happen when developing the addon itself.  It's true that failures that were passing before will now fail, but this is still a bugfix.

ks: there's the handlebars dependency thing as well.

rj: so the problem there is that `npm install` will download optional dependencies but add them in `package.json` under `dependencies`.  All of the things have now been fixed:
  - ember-data dev dependencies are now properly listed as dev dependencies, not dependencies
  - hash-for-dep hashes correctly and does not error if it can't resolve a dep

### ember-cli-update in core status

ks: should we be putting this in release notes for ember yet?

rj: i think the next step is to get our house in order for this beta cycle and then do that.  For instance, the ember-cli release notes don't yet say to use `ember-cli-update`.

rj: The blog post might just link to updating which could be on the ember-cli page.  Whatever we do we should make sure that the experience is good for people who only read the emberjs blog.

kg: is using ember-cli without git still a thing?

rj: technically, yes.

ks: if we shipped transforms with ember-cli then ember-cli-update could work without depending on git.

### strategies RFC

rj: we might want to defer until Alex is here although I think it's fine to move this forward under experiments.

dh: in fact doing so will likely help clarify the rfc as eg the experimentation will help flesh out the `assembler` API which currently seems a little out of place as a pre-emptive arg passed in to the strategies.



