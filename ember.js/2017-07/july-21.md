# Meeting: Ember Core Team 2017/07/21

### Agenda

- PR review bonanza! (RM)
  - https://github.com/emberjs/ember.js/pull/15418
  - https://github.com/emberjs/ember.js/pull/12500
  - https://github.com/emberjs/ember.js/pull/15144
  - https://github.com/emberjs/ember.js/pull/15184

### Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

### Minutes

#### [emberjs/ember.js#15418](https://github.com/emberjs/ember.js/pull/15418)

RM: Kris commented a desire to deprecate `TargetActionSupport`

KS: The main thing about this PR is that the mixin is tiny and small and we’re only exporting it for backward compat. It seems like the mixin itself should be deprecated.

YK: targetObject on component would still work?

KS: No, this is to use the targetObject API on your own class.

RM: And it is private, the mixin

KS: Why not remove it?

TD: It is intimate at the least

YK: I think targetObject is heavily used by components trying to get access to the controller.

TD: Seems ember-bootstrap uses it as an argument

YK: We’re trying to find if anyone uses the mixin though. The template API would remain.

RM: So deprecate until the next LTS?

KS: yeah sure.

#### [emberjs/ember.js#12500](https://github.com/emberjs/ember.js/pull/12500)

RM: This is a feature adding support for this.$() in tagless components.

GC: This is very explicitly not supported I think.

RM: It is kind of my feeling we don’t want to add this at all.

KS: I think the bounds being available on didInsertElement didUpdate didRender would be helpful.

YK: It is already a manager hook right now.

EF: LiquidFire already uses the private API for bounds

GC: I think this would be good in an addon. Where this.$() is represents bounds. I don’t think jquery has the primitive that allows the bounds to be text nodes.

YK: this.$(‘foo’) seems fine, it is this.$() that doesn’t have a clear meaning in jquery. what do you return? The first one is ok if someone wants to expose it. If someone wants to write the RFC to expose this data I think that is good.

GC: LiquidFire and the inspector both use the private hook.

EF: I think we can RFC the existing API. It is well designed.

YK: We just need to make the name something reasonable for glimmer.

(discussion, TD is leaving a comment)

#### [emberjs/ember.js#15144](https://github.com/emberjs/ember.js/pull/15144)

(discussion, seems like ember-cli-fastboot and ember-engines both use this)

#### [emberjs/ember.js#15184](https://github.com/emberjs/ember.js/pull/15184)

(discussion)
