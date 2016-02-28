# Ember.js Core Team 2016-02-19

#### Agenda

- Community Survey status and planning update (MB)
  - [Current draft](https://docs.google.com/document/d/1sQsaF0aNjIQyVMhAH63c1TUMn70sHKUQEFfy6krW4qs/edit?usp=sharing). Please review and provide suggested edits/feedback!
  - Public question review February 22nd - 26th
  - Survey open March 1st - 21st
  - Will have a design pass on the survey page, draft of blog post next week
- LTS release announcement (MB)
  - [PR w/ blog post](https://github.com/emberjs/website/pull/2466)
  - view and controller support would end with the end of 2.4 LTS support in September/October. Of course we can re-evaluate as we get deeper into Glimmer
- 2.5 feature train is shortly leaving the station (MB)
- reclaiming the `ember` package on npm as the primary installation point (YK)
- Docs translation work (LS)
- ISSUES\_TEMPLATE.md (YK)

### Attendees

- Leah
- Alex
- Dan
- Yehuda
- Godfrey
- Igor
- Kris
- Martin
- Matt
- Robert
- Erik

## Minutes

**Survey**

MB and YK chatted about the community survey, and about the importance of prioritizing questions about what version of Ember people are on.

**LTS**

YK: I want people to realize that LTS people don't want to stable release right away.

RJ: I want the cavets about dates for releases to be v. specific.

RJ: We should post by Monday to allow a gap before the 2.4 releases.

**2.5 Train**

YK: this is the last chance for going feature in 2.5.

RJ: I'd like to go the ember assign feature. `ember-metal-ember-assign`

YK: Yeah, small and seems good.

RJ: There is another FF that was set to "true", and tests were failing without it. This means we should set that to `null` and fix the behavior. In the future we should ensure all PRs are merge with the FF as `null` so there is a clean build with it disabled.

YK: This is `ember-test-helpers-fire-native-events`, lets go

RJ: And we should go `ember-htmlbars-local-lookup`, though that is just an API change for the eventual 3rd party stuff

YK: FWIW I like rust's stabilize terminology, better than "go"

RJ: FWIW the native events things should be a bugfix, but we want to be able to back out of it easily. Not really a new feature.

YK: It is intended to be 100% backwards compatible.

YK: Might be nice to use the feature flagging infrastructure for non-FF things in the future

KS: Like deprecations for svelte builds

YK: Right that is another case. we should be able to use the tooling without using feature flags.

RJ: It's all generic enough to use with new method names beside isEnabled etc. Should be possible.

**ember npm package**

YK: We should think about what it takes to use the ember package as the entry package for ember-cli

RJ: We are making ember an addon soon, 2.4 or 2.5 and we should make sure the name does not conflict

YK+MB: Let's roll with "ember-core" as a tentative name so we don't block progress

**Docs Translation**

LS: I don't want to be overly optimistic, but it is underway. I wanted to write up an RFP, still need to do it. We have Japanese, Chinese, Portuguese. The initial burst is nice, 3% on the Brazilian translation, 11% for Japanese. Workflow seems to be going well. Docs folks got it all rigged up, off the the races.

RJ: Is there a deployment plan?

LS: Locks and David B. are the people to ask, not completely sure.

RJ: I'll ping them about it.
