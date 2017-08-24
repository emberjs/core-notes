# Meeting: Ember Core Team 2017/08/18

## Agenda

- what should `ember` on npm be used for? (RM)
- Ember 2.15 Status (MB)
- PR Review
  - https://github.com/emberjs/ember.js/pull/12805
  - https://github.com/emberjs/ember.js/pull/13017
  - https://github.com/emberjs/ember.js/pull/14590
- Typings for Ember

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

### Minutes

#### What should `ember` on npm be used for?

RM: I remember before I was in the core team, Ed proposed an ember-platform package that included Ember, Ember Data, etc. At the moment we only have ember-source, which isn’t anything other than a source distribution. Is ember-source a stepping stone, the final stage, etc.? We have the `ember` package on npm but it doesn’t do anything and it’s very confusing to people.

RJ: We haven’t decided against anything, it just hasn’t been prioritized what to do. I think it would be fine to publish something as the Ember package that just gives a warning that the person installed something they didn’t mean to install, with a link to some documentation explaining.

RM: Is there an actual plan?

RJ: We have general plans but nothing concrete.

TD: Who is the thoughtleader behind these plans?

RJ: Ed and Stef were ping-ponging ideas.

MB: What are people getting tripped up about by the `ember` package?

GC: Recently when I was setting up my new computer I did `npm install -g ember`, forgetting that the actual package is `ember-cli`.

DG: Should we consider publishing a version with a postinstall hook?

MB: Yes that seems like a win.

#### Ember 2.15 Status

MB: The blog post is still lacking Ember Data information. Is that the only blocker?

RJ: The actual code blocker for Ember Data is resolved. It was fixed Wednesday or something. The only real blocker from my perspective is Ember Data in the blog post. It’s frustrating that no one seems to have time to write the blurb, and it’s slightly painful to write because there’s nothing new, just bug fixes.

TD: We can talk about how we did a big refactor of internals to improve performance, and we’re focused on stability and bug fixes in 2.15.

MB: In the future I would love it if people could include actual benchmarks in these posts to quantify the changes.

IT: There were benchmarks in the various PRs for the stuff in 2.14.

TD: It seems okay to include those benchmarks in the 2.15 blog post if we didn’t cover them in 2.14, as a reminder about the performance improvements and why we don’t have new features this time.

RJ: It’s funny to say, we’re behind by 5 days, but we’re way ahead of where we usually are.

#### Typings for Ember

RJ: I want to ship our type definitions with the `ember-source` package.

![](https://media.giphy.com/media/Heqbbp1m3mzJe/giphy.gif)

RM: Have we integrated TypeScript into the Ember build pipeline?

RJ: No, and no one is working on it, as far as I know, but it shouldn’t be too difficult. It just hasn’t been a high priority.

RJ: Regarding shipping types with `ember-source`, does anyone have any objections?

MB: At the very least, I would want to make sure we only provide type definitions for the module API, not the globals.

#### PR Review

##### [emberjs/ember.js#12805](https://github.com/emberjs/ember.js/pull/12805)

RJ: We can close this PR but we shouldn’t delete the branch. I was just talking to Kris Selden about this. It’s a pretty big win performance, but can’t be cleanly rebased because of some other changes in this area.

TD: The changeset seems relatively small?

RJ: Yes, we need to apply the same ideas to the current codebase. It just significantly reduces the amount of work we have to do in mixins. This also aligns the system with ES classes better.

Resolution: Needs work, will revisit next week

##### [emberjs/ember.js#13017](https://github.com/emberjs/ember.js/pull/13017)

More or less superseded by https://github.com/emberjs/ember.js/pull/13279 and remainder impacted by routing service.

Resolution: Closed ☠️ 

##### [https://github.com/emberjs/ember.js/pull/14590](emberjs/ember.js#14590)

RJ: We definitely want this deprecation, but there are a few issues with the current implementation in this PR. Specifically around temporarily enabling and disabling the warning.

TD: Have we given them the feedback they need?

RJ: I’ve gone back and forth a few times but I’m not sure if we’ve communicated the `get` and `set` strategy.

Resolution: RJ is going to leave some comments on the PR with recommendations.
