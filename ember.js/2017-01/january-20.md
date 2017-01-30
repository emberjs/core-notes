# Ember Core Team 2017-01-20

### Agenda

- simple-html-tokenizer TypeScript pipeline https://github.com/tildeio/simple-html-tokenizer/pull/41#issuecomment-274129205 (RJ)
- [History state RFC](https://github.com/emberjs/rfcs/pull/186)
- [Deprecate eventManager](https://github.com/emberjs/rfcs/pull/194)

### Attendees

AM, DG, GC, IT, MM, RJ, RM, JS, MB, EF, SP

### Minutes


#### simple-html-tokenizer

RJ: I want to be sure we're on the same page for simple-html-tokenizer work. Last time we talked there were 4 branches. I think this can land. The non-rename stuff Chad has been working on can land, then we can figure out what Yehuda was working on in his rewrite.

RM: I have a PR to glimmer with this new branch integrated. And tested that it works locally.

GC: We are on the version after LTS and at the start of canary, so this seems a good time to merge this and get it going.

DG: Can we use glimmer-build?

RJ: Yes. We should. and I can work with you to see what works well and needs improvement.

DG: This can be the trial balloon then for the glimmer-build stuff and moving TS-microlib support into ember-cli.

#### factoryFor

MB: Can be enable the no-double-extend flag since we are at the start of 2.13 canary?

RJ: Yes, but...

#### releases

RJ: 2.11 is not released, 2.12 beta is not released. We plan to branch it from just before chad's glimmer change landed.

KS: So, yes

RJ: Does ember-data still raise the deprecation?

MB: There is a tracking issue: https://github.com/emberjs/data/issues/4737 I will follow up and see what is happening.

RJ: Cool, and I will check with Chad.
