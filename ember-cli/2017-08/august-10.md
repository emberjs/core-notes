# ember-cli Meeting Notes - 2017-07-20

## Attendees

- @trabus jb jake bixby
- @kellyselden ks kelly selden
- @kratiahuja ka krati ahuja 
- @hjdivad dh david hamilton
- @rwjblue rj robert jackson

## Agenda

- https://github.com/ember-cli/ember-cli/pull/7137 tests link pr
- config in meta
- ember-cli bundler status

## Discussion Notes

### ember-cli 7137 tests link pr

rj: what was the conclusion from last time?

dh: dig into addons that check `process.emberEnv === 'test'`; we didn't come to a conclusion about merging the pr

rj: `storeConfigInMeta === false` /tests means that you need to redefine the module in `test-support.js` we should add an issue for this

ka: doesn't engines have the same problem?

rj: yes

ks: also maybe add an issue for customizing `/tests` route?

rj: i think we should only do this if someone complains.  It is annoying that we reserve a top-level name, but it's working for now and it would complicate things for this to be configurable

dh: ok in any case we're good to merge the pr now?

rj: yes my previous concerns are addressed


### missing config in meta / engines

rj: we are missing a cohesive story about doing config across node, the browser, fastboot &c.

ka: yes we currently have several explicit checks for things in fastboot

rj: is ember-cli the core team for engines?

jb: they're so dependent on cli it's basically something for us to deal with

rj: yeah so I'd assumed this was similar to fastboot: a concern of ember-cli until it creates enough drag that it needs its own team


### ember-cli bundler

rj: the last-concat step is moved into a new thing called a bundler; its job is to take all of the disparate pieces and put them into `dist`.  Right now it doesn't do anything special, but the long term goal is for it to do the bundling tasks we've been talking about for awhile.  In the long run I would hope we can do most of the engines build-time stuff there.

ka: can we do fastboot tree-shaking there as well?

rj: in the long run yes, in the short run it's hard to say.  The fastboot tree isn't part of the "normal" build pipeline.  But the basic problem with engines is very similar.  Likely whatever we do to support engines will work for fastboot as well.

rj: each stage of tree-shaking will come with provable correctness, so for example initially we won't prune anything out of `app` until module unification lands, since we can't do anything statically in the presence of custom resolvers.


### fastboot blueprint

ka: should we add fastboot to the default blueprint?

rj: how much does the initial user experience degrade with fastboot?

ka: i'd say vaguely 3/10.  Something that comes up, for instance, is debugging issues.  We don't forward errors; they're just printed to the console.

rj: unrelated to fastboot something we want in ember is a better story for even easier error debugging; for instance showing something in the DOM on component errors due to CPs &c.

rj: is anybody opposed in principle to fastboot by default?

(everybody is :+1: in principle on fastboot by default)

rj: we should likely add a meta-issue for the road to fastboot by default.

ka: sounds good; I'll make the meta issue

rj: one area is likely that we need to do some work on the node testing story for fastboot


### updater

ks: thoughts about recommending updater for the upcoming 2.15 release?

rj: i definitely think we should mention it in the blog post if nothing else.  I've used it a few times for upgrading addons and it's great.  For those unfamiliar it merges via git.  I think we can do something a bit smarter than just git for merging package.json in particular.

ka: we should also add it to the next version of the newsletter @lox is running

rj: ah and also the ember weekend folks about it.


