# ember-cli Meeting Notes - 2016-03-03

## Attendees

- Nathan Hammond
- Chris Thoburn
- Kelly Selden
- Luke Melia
- Aaron Chambers
- Jake Bixby
- Chad Hietala
- Stefan Penner
- Leah Silber

## Actions

- (All) Identify set of custom commands that have been created.

## Discussion Notes

### Core Extensibility Primitive

- https://github.com/ember-cli/rfcs/pull/35#issuecomment-189014121
- https://github.com/ember-cli/rfcs/pull/4#issuecomment-189021955

### ember-cli-deploy [Pipeline Primitive](https://github.com/ember-cli/ember-cli-deploy/blob/master/lib/models/pipeline.js)

- Worked well, API hasn't appeared to be lacking thus far.
- Pipeline is a simplistic concept, Unix-like, easy to implement inside of plugins.
- Goal was to replace grunt tasks and one-off scripts.
- One of the weird things about the Pipeline primitive is that it doesn't know anything about broccoli.
  - Most other extensibility points involve passing broccoli trees around
  - There need to be thoughts about interop between pipeline hooks as compared to passing around broccoli trees.
  - A couple of things inside of ember-cli are more concerns of deployment (asset-rev and sri) are part of the Broccoli world but but have implications for deploy pipeline.
- Effectively shells out to `ember build` as a plugin.
- All other plugins run over top of that produced artifact.

### ember-cli current limitations

- ember-cli has grown organically and its current state is the outcome of that organic growth.
- As a result of ember-cli's build process being relatively scripted it's difficult to "peer into the box" right now.
- There is no extensibility point for reaching in and snagging a broccoli tree.
- We should identify and make explicit all of the current pain points to see what we can do.

### Concerns

- There is a bit of confusion about how current extensibility hooks work.
- We may be able to identify pre-existing extensibility points for these goals without invasive changes.
- We may be able to tweak things and achieve most of our goals.
- It's entirely possible that if we try and identify an ivory tower solution that we simply add another piece of complexity to the process.
- Broccoli transforms happen repeatedly and quickly. We should make sure that we don't lose the performance we're accustomed to.
- Adding more extensibility into the system could make it difficult to build the things we want in the future.
  - More public API surface area means that people can tweak more means that ecosystem consistency is more difficult to accomplish.
  - One of the great powers we have is the ability to make a rising tide lift all boats. Doing this wrong or too soon could be catastrophic to that goal.
  - Nothing should change before we have achieved 100% modules.

### On Pipelines

- Knowing how to watch and filter trees needs to be in that pipeline.
- Would require tremendous refactoring.
- Would make it possible to split some tasks out of ember-cli-deploy.
- All of the `treeFor` hooks would have to be called within a particular stage of the pipeline.
- There needs to be a "primitive" that gets passed from stage to stage in the pipeline. Figuring out what that is is difficult since it should support Broccoli, but other things as well.
- Any pipeline addon can rearrange the pipeline. (DAG?)

### On Research

- Can we easily list out the steps, in order, of what happens inside of the Ember build?
  - If so, then we could possibly push that into a pipeline.
  - If we can't really figure out a linear order is that because it's not possible to do so?

### On Approach

- Current builds are "one size fits all." We know that not to be the case.
- It'd be nice to have ember-cli able to identify what to do from the application "shape" instead of making it imperative.
  - Engines and tree-shaking in a future state make that more important.
- Come up with something we can do first in 1-2 months.
- Long term goal is to describe a declarative API that makes it easy.
- Currently have significant technical debt we need to pay down from organic growth.
- Maybe we build an alternative EmberApp object? This would allow an opt-in switch.
