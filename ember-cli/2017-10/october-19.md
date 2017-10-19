# ember-cli Meeting Notes - 2017-10-19

## Attendees

- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @kratiahuja ka krati ahuja 
- @rwjblue rj Robert Jackson
- @trabus jb jake bixby
- @turbo87 tb Tobias Bieniek

## Agenda

- ember-qunit update
- ember-cli-update
- aadsm/jschardet
- strategies RFC

## Discussion Notes

### ember-qunit update

rj: new API largely done, at least as far as known knowns.  It's 4.1.0-beta or thereabouts.  There's a demo repo that demonstrates usage.

rj: working on a codemod, aiming to make a quest issue by end of day for remaining work.

ka: does the qunit-api make it easy to add new apis eg for fastboot testing?

rj: yep, this is much nicer than today where you have to basically wrap `moduleFor` the same way `moduleForComponent` &c.  Now it can be driven by just using a helper.

tb: you had mentioned you will write a blog post?

rj: yep.

tb: should probably mention that it's pre-release for now.  We want beta users, but it'll be easier if they're more experienced ember users.

rj: confirm.

tb: if we release in a major version we should jsdoc with `@experimental` or similar.

tb: also to confirm acceptance tests are not a part of the rfc correct?

rj: that's correct.

tb: will adding that be in a separate release?

rj: probably.  I suspect the rfc will take more iterations.  We'll release ember-qunit as a non-beta, eg `3.0.0` with the new functions marked as experimental, probably before ember-cli hits `2.17`.

rj: there's an order-of-operations problem with acceptance tests and the global helpers (click &c.).

tb: what's the plan on the native dom helpers then?

rj: there's some small changes that need to be done; eg the current ones defer to acceptance tests, but the library would just export them.

rj: exactly what to do still requires some planning, especially around the migration path, but the way things should work going forward is that the helpers are imported from somewhere.

tb: so likely for native dom helpers the import will just change, and otherwise that the helpers would be imported.

rj: confirm.

tb: what about async await?

rj: the tl;dr is to ship regenerator runtime only in tests so the codemod can just switch to async await.  If there's a need to convert to nested promise usage, I'm not opposed, but it'll be PRs welcome.

### ember-cli-update

rj: any update since last time?  it looks great, would like to make it more official.

ks: there's some outstanding issues that prevent making it more official right now.

kg: what about updating `yarn.lock` &c.?

ks: at the moment we're not doing any package management stuff at all; whether for npm or yarn.  It's still up to the user to run `yarn` manually.

rj: sounds good, it would be great if we could get 2.17 released with a more official story.

### aadsm/jschardet

rj: there is a transitive dependency that is LGPL.  We'll have to drop and pin `external-editor` to not include `jschardet`.

ks: do we have some kind of test helper that will crawl `node_modules` and check for LGPL

ka: can't greenkeeper do this?

tb: there must be something.

### strategies

rj: comments on the rfc?

dh: i have two: one i'd like to bikeshed the name `strategies` and two i'd like the rfc to motivate the `assembler` arg rather than only have it as a placeholder for possible future API.

---

ks: not a fan of deep requiring from `ember-cli`.

rj: there's a related issue about defining what our actual public API is?  eg which imports are considered public & stable.

ks: yes and we don't want to make the problem worse in this implementation.

ks: what about a `treeFor` that generates components from eg config?

rj: that's fine; those things are all on the input side, this rfc is focused on the output side.

---

rj: i agree on renaming `strategies` even if it's just `assemblerStrategies` and also +1 on working on an API, at least for returning files & AST to avoid double-parsing.

### rebuild on file delete

tb: there seems to be an issue in rebuilds when a file is deleted.

rj: i think the issue is that broccoli-concat tries to read the file after it's deleted.

rj: i'll try to look into it tomorrow, but first step is to actually repro and log an issue with broccoli-concat.

### eslint

rj: i want to move away from nested eslint files.  broccoli-eslint throws an error if you pass it a merge tree because eslint wants to build a config from the real source upwards.


