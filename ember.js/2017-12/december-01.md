# Meeting: Ember Core Team 2017/12/01

## Agenda

* `unloadRecord` regressions (MB)
  * https://github.com/emberjs/data/issues/5136
  * https://github.com/emberjs/data/issues/5111
  * https://github.com/emberjs/data/issues/5025
  * https://github.com/emberjs/data/issues/5041
* Ember 2.17 Release (delays, poor messaging, etc) (RJ)
* [Error Handling Issues](https://github.com/emberjs/ember.js/pull/15871) & LTS… (RJ)
* Motion to merge: [Acceptance Testing RFC](https://github.com/emberjs/rfcs/pull/268) (RJ)
* 3.0 Preparation & Progress: [emberjs/ember.js#15876](https://github.com/emberjs/ember.js/issues/15876) / [emberjs/ember-2-legacy](https://github.com/emberjs/ember-2-legacy) (RJ)

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

## Minutes

### Ember 2.17 Release (delays, poor messaging, etc)

RJ: We haven’t done a blog post about this release. I think during the 2.17 beta we did the best ever at releasing (thanks to Katie). No Ember stuff yet, no Ember Data stuff yet.

YK: We’re cool with 2.16 of Data as an LTS?

RJ: Yeah we don’t have an LTS policy for Data right now.

MB: Instead Data is like any other addon, it has backwards compatibility to the most recent Ember LTS.

YK: Ok that sounds good, if that is the policy. Lets discuss at the F2F if/how we can spread LTS to a wider umbrella like ember-data.

(blog post discussion)

MB: I’ll take up championing the post writing for this release.

GC: We should continue to try and find others to contribute.

### [Error Handling Issues](https://github.com/emberjs/ember.js/pull/15871) & LTS (RJ)

RJ: In Ember 2.11 we changed the way errors were caught in the runloop. Previously exceptions would propagate out of a runloop, after that they were captured.

(discussion)

RJ: This PR is in 2.17. The odd thing is the 2.16, the LTS release, has a fundamentally broken behavior. So do we backport this change to 2.16 and change the error handling in a patch releases. I think there is a chance someone’s test suite would change in the patch release.

MB: If it is already in 2.12, then we should leave it in 2.16. 2.18 is coming soon and is an LTS so that is soon enough. We can mention/describe this in the blog post for 2.17 (2.16-LTS).

YK: I agree with this analysis.

### 3.0 Preparation & Progress: [emberjs/ember.js#15876](https://github.com/emberjs/ember.js/issues/15876) / [emberjs/ember-2-legacy](https://github.com/emberjs/ember-2-legacy)

RJ: I made a long list of 3.0 issues. Master is 3.0 as of a few days ago! I would like core to review the list and make sure we’re not missing a) deprecated items that should be removed b) browser support items that we can remove. For the latter I’ve only been able to reference the things I know about.

RJ: Master no longer relies on Phantom. We use weakmap now, no more meta. Many deprecations are being moved out to the legacy addon. We’re trying to move as much of the implementation as possible out of Ember where possible, however there are a handful of things that will remain behind a private flag that have to do with deep internals.

YK: Those things are a good motivation for svelte.

RJ: Yes. I think the list of these things is actually pretty small though. I need folks to look at it.

YK: sgtm.

RJ: I’m eager to get this stuff done sooner so we can get it a full beta cycle. Don’t want to repeat the 2.0 vibe where it went in at the last minute. I’d like to release an alpha perhaps.

### Rust

YK: FYI Alex just landed the first Rust code into Glimmer-VM to emit wasm.

KS: (voices concern re Fastboot and wasm). Does the Ember-CLI policy for node apply to Fastboot?

RJ: Unclear, we should discuss. But I think by default it would follow Ember-CLI’s policy.

KS: IE11 is probably the lowest common denominator at this point, anyway.

MB: Is the plan for the Rust to spit out JavaScript for IE11 etc?

YK: My current thinking is that we just keep both around. Both the JS and Rust version around. This means if we need to feature flag our way back to JS we are fine. I’m fine with the ASM transpilation strategy but…. well KS you are looking into it.

KS: Yes I tried something I thought was simple but there were significant things missing. If you stick to int32 everywhere it is mostly fine.
