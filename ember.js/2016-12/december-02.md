# Ember Core Team 2016-12-02

### Agenda

- Remove work around for iOS8 32bit bug: [emberjs/ember.js#14624](https://github.com/emberjs/ember.js/pull/14624).  (RJ)
  - App Store Stats: < 8% for iOS 8
  - [apteligent stats](https://data.apteligent.com/ios/): 3.56% for iOS 8
- Move ember-engines to its own org (vs. to emberjs)? (DG)
- Consolidate domain names? (RJ)
  - ember-cli.com
  - ember-fastboot.com
  - emberjs.com _(Current Owner: Tilde)_
  - ember-engines.com
  - ember-a11y.com
  - broccoli.com ????
  - emberwatch.com _(Current Owner: Tilde)_
  - embertwiddle.com  _(Current Owner: Tilde)_
- [RFC #178](https://github.com/emberjs/rfcs/pull/178) Ember.K to FCP? 

### Attendees

AM, DG, EF, YK, IT, RJ, MM, TD, MB, GC, RM, LS

### Minutes

MM: Broccoli 1.0!! :-D

RJ: We have small patches we needed to ship that we will upstream, I'm in touch with Jo.

#### iOS 32-bit bug

RJ: We added some workarounds for this bug by making some hot paths not be `use strict`. There is a PR to remove it now. Can we do this? There are some metrics linked above.

TD: What was the last phone?

RJ: iPhone 5 and 5C on iOS8. You can upgrade to iOS9 though and it is fixed.

TD: You can upgrade to iOS10 on the iPhone 5. This seems ok to me.

RJ: I'm not convinced that the percentages here are accurate. I brought this up b/c we've described support for IE etc, but older browsers and specialized things we have not really talked about.

(some discussion)

YK: What is the cost of keeping this around?

RJ: We discovered this lack of strict mode was masking some other foundational issue in Ember and apps. `this._super` was working with a null context because `window` was made the context.

(some discussion)

TD: Sounds like the burden to continue supporting this is low, so we should reject the PR. Additionally we should begin an RFC to flesh out he browser support matrix and clarify our policy.

addendum from KS: I'm trying to get our internal numbers on this as well. I think we have the data, just need to roll it up correctly.

#### Ember-Engines on an org

RJ: We have a lot of packages for engines and I'd like to make its own org. Some are in ember some are on dgeb's account.

YK: I think the number of packages is starting to call for a meta page that links to all the various repos.

(discussion)

RJ: I will do it!

MM: What about RFCs?

RJ: RFCs should stay in emberjs. There is maybe some confusion? But in general it is also nice to have a place to keep non-ember related conversations.

#### Custom domain names

RJ: I want to start our brains thinking about this. Some of these domains are owned by individuals, some are tilde, we should reduce the bus factor.

YK: Tilde would be happy to manage the domains. We have some small amount of money that is about the right amount for domains etc. We should check the amount of money.

(some discussion)

#### Ember.K

RJ: There has been a lot of discussion here, cibernox built a codemod.

YK: The codemod must return `this` as well

RJ: Yes, despite people not really know that is a thing. Agreed. I would like to advance this to FCP. Many of us have chimed in.

MB: The only pushback we have gotten is general "this feels a bit like churn" feedback. And we've responded in a pretty standard way. I think given that there is nothing else I second going into FCP.

RJ: Right. FCP it is.
