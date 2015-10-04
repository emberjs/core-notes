# Ember Meeting Agenda 2015-09-11

### Attendees

Leah Silber, Trek Glowacki, Edward Faulkner, Matt Beale, Kris Selden, Yehuda Katz, Robert Jackson, Martin Munoz, Erik Bryn, Alex Matchneer, Stef Penner

### Agenda

* `Ember.GlimmerComponent` - Time is running out to hit 2.2, where are we at?
* Upgrade Blocking Issues (re: [#12296](https://github.com/emberjs/ember.js/issues/12296))
* EmberCamp Updates
* Large Issue with "Trust of Test Suite" -- https://github.com/emberjs/ember.js/pull/12318

### Minutes

LS: EmberCamp London: embercamp.com very excited! Tickets went on sale today.

LS: Most of the speakers have been nailed down. We're finalizing the last little bit and Jamie is working with all the speakers on finalizing topics.

LS: The docs call this week was small but went well, we talked about the current state of everything and [the transcripts are already merged into the repo](https://github.com/emberjs/core-notes/blob/master/docs-team/2015-09/september-10.md). There were a few things that core team folk had signed up to do (I think Matt, Igor and Trek), and there were no updates on those. If you committed to something, please update the other Docs folks.

LS: LS will file an issue in the EmberCLI repo to get the new logo up there. She's also working on getting a page up on the Ember site for downloading logos, but doesn't have design help, so it might take a bit.

---

RJ: Glimmer Components... where are you?

YK: Godfrey has been working. He's found a bunch of questions while writing the docs—which is why you write docs first. Tl;DR YK will be back on Monday and will work through these questions with people who are motivated and interested. Expect a GH Issue soon. 

RJ: How has the refactor for HTMLBars and morph-range been going?

YK: Very well! The project has been focused on trying to allow us to specialize specific paths so that we don't do extra work to be "generic". I suspect that the integration effort in Ember will be somewhat straightforward.

~~ Long discussion about refactor and change in internal semantics ~~

notable points:

* faster rendering
* faster re-rendering
* more specialized internals (should help reduce bugs)
* Ember vs HTMLBars misalignments will be improved, TL;DR make HTMLBars do more of the work when it knows best.
* better tests (more aligned with how ember uses HTMLBars)
* will help \w rehydration

---

RJ: is troubled – tests are always run with legacy flags on. We likely need to run with both on and off. We need to port the tests. The plan is to use the ember-test-helpers, so we can use `moduleForComponent` and friends in embers own tests.

MB: I may have some time to help this weekend

RJ: Awesome, but I need to get the machinery in place first. Then we can create a burn-down chart.

---

SP: We need a upgrade hazard plan

blocking issues (without reasonable work-around) should be labeled as "Upgrade Hazard" "Help Wanted" "backport needed"

this messages our intent correctly:

* will accept reasonable backport
* want to minimize upgrade pains

RJ: We absolutely need to message that we care and are willing to accept backport PR's, but I am not in favor of keeping these issues open forever.

SP: We can set a time-frame, and age them out when that threshold is met. That threshold should be largely based on the ability for our community to upgrade.  Rationale being, a small fix may make the difference between a successful upgrade or painful transition. 

RJ: We can try it for a time, but I am unlikely to continue to work issue triage on a regular basis.

SP: feel free to ignore issues branded as such then.

----

#emberjs 
