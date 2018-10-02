# Meeting: Ember Core Team 2018/06/01

## Agenda

- [Angle Bracket Invocation RFC](https://github.com/emberjs/ember.js/issues/16688) - 🚢 ❓ (RJ)
- RFC Review - (RJ)
  - Propose FCP To Merge
    - [Deprecate “Globals Resolver”](https://github.com/emberjs/rfcs/pull/331)
    - [Public API for {{in-element}}](https://github.com/emberjs/rfcs/pull/287)
    - [Deprecate Component#isVisible](https://github.com/emberjs/rfcs/pull/324)
    - [Property Fallback Deprecation](https://github.com/emberjs/rfcs/pull/308)(
  - Propose FCP To Close
    - [Ember.Component support for](https://github.com/emberjs/rfcs/pull/242) `[aria-{label,labelledby,describedby}](https://github.com/emberjs/rfcs/pull/242)`
- [“Ember Engines Roadmap to 1.0.0”](https://discuss.emberjs.com/t/for-core-team-review-engines-1-0-roadmap/14871)
- Request from Learning Team: timeline for big changes coming for Ember apps
  - `{{this.prop}}`
  - `{{@arg}}`
  - Angle bracket invocation
    -  `<ShowPost @post={{post}} aria-label=``"``Some thing here``"` `/>`
  - classes
  - (etc)
- A11y/router (also see the recently announced https://reach.tech/router)

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[ ] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[ ] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### Angle Bracket Invocation Feature Flag
Discussion of transition hazards and filesystem casing. These concerns are orthogonal to the RFC at hand but important to think about as we go forward. We need to make sure that `user.js` → `User.js` transition doesn’t troll people in Git. In addition to codemods and migration scripts handling this case, we should make sure Broccoli/Ember CLI detect case mismatches and error or warn.

**Resolution:** GO `ember-glimmer-angle-bracket-invocation`

### RFC Review

#### [emberjs/rfcs#331](https://github.com/emberjs/rfcs/pull/331)
RJ: Only comments so far from core are just me I think. Want to ask for more implementation details. Current resolver subclasses global resolver, meaning even today we will fall back to App.FooBar lookups. I think we can safely deprecate this and remove it in a major version bump. Think this detail needs to be captured in the RFC.

TD: What about Gaurav’s unanswer question about transition guide for non-Ember CLI apps to Ember CLI?

YK: I think that would be on community members who still have globals based apps, since other people won’t realistically be able to give guidance on this.

**Resolution:** Final Comment Period

#### [emberjs/rfcs#287](https://github.com/emberjs/rfcs/pull/287)
YK: Need to make it clear whether this is canonizing existing behavior, or whether this contains “wishlist” features that would need significant implementation work. I think this is the core of the disagreement.

YK: Godfrey was concerned we would make the teardown and setup semantics public.

RJ: We don’t want to do that because we want to be able to eventually move the content in an intelligent way.

YK: I think there are some reasonable ways to do that in the future.

RJ: We need to give actionable feedback for this. I will draft a proposal for how to move forward on this and review with YK that it seems like it reasonably balances the concerns brought up in the RFC discussion.

#### [emberjs/rfcs#324](https://github.com/emberjs/rfcs/pull/324)
CH: Do we want to deprecate APIs related to Ember component APIs if we expect people to migrate to the Glimmer API eventually?

RJ: I’m sympathetic to not wanting to create a bunch of deprecation churn. In this case, I think there are almost no users because the functionality doesn’t really work and is unlikely to affect many people. It’s important to signal that this is something that people shouldn’t waste time trying to use, rather than getting rid of something that is in wide use.

**Resolution:** Final Comment Period

#### [emberjs/rfcs#308](https://github.com/emberjs/rfcs/pull/308)
CH: As far as I can tell there’s nothing really blocking this, I want to figure out what the next steps are.

YK: This is a big change so I think we need to start small and make sure people are comfortable with the value this brings. I don’t think we are ready to go straight to a deprecation on this. Can we start with a lint rule first that people can disable?

RJ: One nice thing about the lint is that it will only apply to your app code, not all of your addons.

YK: The high order bit is to just do things very slowly and pay attention to any backlash.

RJ: It seems like we have consensus on the core team, so it’s important to signal to the community that this is where we think things are going. We can always change course if needed, but right now it’s just sitting for no good reason.

TD: I think it’s confusing to call this a deprecation RFC if we are not planning to deprecate it any time soon, before we’ve gone through a process of linting, migrating, etc.

EF: We should update the RFC document in the implementation section to make it clear that this is intended to be a very slow process, and break down what we expect the incremental steps to be.

MM: The lint definitely needs some work, particularly on error messages.

Discussion on how to deal with linting with people on older Embers without `@args` syntax.

**Resolution:** Chad Hietala to update RFC to capture planned rollout steps. FCP if no new substantive issues raised.

#### [emberjs/rfcs#242](https://github.com/emberjs/rfcs/pull/242)

**Resolution:** YK will talk to MS, rough consensus that this can be closed in favor of moving to angle bracket invocation syntax which allow arbitrary attributes to be passed

### Ember Engines 1.0 Roadmap
RJ: I put together a “Road to Engines 1.0” document with MS and posted it on the core team forum. Please review and make sure it makes sense before we share it publicly.

YK: I think it would be a good idea to do this is a mini-RFC, as it allows people to comment on the roadmap.

RJ: The Discourse forum feels like a friendlier place to have discussion about high level roadmap things.

### Timeline for Big Changes
MS: Locks has requested that we get a timeline of some of the bigger changes coming down the line. The Learning Team has been working hard and getting ahead of the curve of the big changes. We want to make sure the Learning Team has a enough time to prepare for changes and isn’t taken by surprise.
