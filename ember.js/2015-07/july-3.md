### July 3 2015

##### Topics

* Docs Sub-Team - @tomdale (https://beta.usecanvas.com/trek/emberjs-guides-and-documentation/73e1b6a7-622d-4d45-83a8-51557193b4e1)
* API's marked as `@private` by [emberjs/ember.js#11362](https://github.com/emberjs/ember.js/pull/11362)
* issue backlog is filling (for all repos) we need some help triaging
* some migration steps Sortable -> AC/RC are hampered unless we backport AC/RC to 1.13.... But this is risky. What do

##### RFCS to Discuss

* Final :thumbsup: on [deprecation hooks](https://github.com/emberjs/rfcs/pull/65). Please review and raise issues with Matt before the meeting if you have any.
* Try to get consensus on [registry/container reform](https://github.com/emberjs/rfcs/pull/46). 2.0 is our last chance to make something stable out of a quasi-public, messy API that is de-facto public already.

##### Go/No-Go

* `ember-htmlbars-component-generation` - Angle Bracket Components (without fragments, but with documented lifecycle hooks and public `attrs`)
  * How coupled is this to shipping an API for `<ember-component is={{someComponentName}}>`? They should land together in 2.1

##### Issues

[#11590 - delete stale branches](https://github.com/emberjs/ember.js/issues/11590)

* people should review there own stale branches, and clean them up: https://github.com/emberjs/ember.js/branches/stale

[htmlbars#374](https://github.com/tildeio/htmlbars/pull/374)

* propsFirst bugfix needs review
* issue: https://github.com/tildeio/htmlbars/pull/374

All those private -> public API PRs

* would be nice if people submitted a single issue with a checklist (i recommend that in an issue)
* the future of enumerable is uncertain, but it will survive 2 -> 3 based on timeline. Should we make it public? I would like to still kill the enumerable change events though...

[#11567 - ArrangedContent Bug](https://github.com/emberjs/ember.js/issues/11567)

* do we fix or try to fix?  Or do we just close as WONTFIX, and tell people to use sort + glimmer ?

[#11576 - Experiment with a more pay as you go ember](https://github.com/emberjs/ember.js/pull/11576)

* 30-40% reduction in execution of ember.js
* HTMLBars code is still the largest offender
* could see as good as 2x faster execution times if we take this further
* need someone to help / champion

#### Minutes

Attendees: Robert, Trek, Matt, Martin, Tom, Igor, Stefan


Several people not attending due to the holiday. Some last minute confusion
about if the meeting was still going to occur.

SP: Assume no meetings on US National Holidays (or observed days).

RJ: First topic: docs team.

TD: Can we invite locks + michael?

TG: Sounds good, we clearly need community help. Delegating is good, but we need to solidify the and share the vision.

TD & TG: Let's be sure they are invited.

RJ: We should refresh our understanding of what parts of the API docs need work. EG versioned API Docs etc.

MB: What's up with the 1.13 API docs?

RJ: It's my fault, haven't had time to confirm my understanding of the release steps.

TG: I'll help with this one today.

RW+TG: Let's set aside time.

RJ: We need a way to keep track of missing API and guide entries.

TG: We need to be sure the guides don't turn into a dumping ground.

SP: Contributors should feel welcome to provide API documentation. It's trickier to accept large guide contributions, although good intentioned historically  these have resulted in a confusing and shaded narrative,.  Hopefully with the doc team, we can expand the group of users who understand the vision.

MB: We need to clean up the documentation for helpers. I'll create an Ember.Helper.helpers and move built-in helpers there.

RJ+TG: Should make sure to consider other solutions like modules, try to better organize them than they were before.

RJ: We now enforce that all YUI docs are marked @public or @private. There may have been some misclassifications and there are some outstanding PR's that need to be addressed requesting API's to be marked as @public.

RJ+TD+SP: We can move the documentation for enumerable utilities to support prototype extensions (using @for) but we don't necessarily need to mark Enumerable as @public.

TD+SP: Should we move Enumerable to an add-on?

SP: I'll submit a PR that will deprecate Enumerable 1.13. leave private + deprecated in 2.0 to ease upgrades. It will be dropped after the first LTS in 2.0

SP: Tom, can you review PRs with public/private changes?

TD: Seems good bro, I can do it on the plane on Sunday.

SP+TD+RJ: We need to triage a bit more. Please take a little time to look through issues today.

TD: Maybe we are at the point where a triage team (a la Rails) makes sense.

SP: Perhaps we can experiment with individual office hours.

SP: RC removal is gated on a solution for sorting. Possibly we can backport the 2.0 sorting semantics into 1.13 inside an addon

RJ: Ember.View is deprecated, users cannot add class names application view elements.

TD: They can just put another div in the template.

SP: It could create a non-minimal refactoring cost to 2.0.

MB: It seems like a painful 2.0 breaking edge case that we are stuck with.

TG: They can ask Tom for help. He loves facetime calls.

TG: This will be blocker for 2.0 upgrade, but those users can use the addon until 2.4 and migrate to routable components when they land

SP: So the addon should silence the deprecation in 1.13

RJ: Yup, and it already does. ember-legacy-views

TG: We need good terms and guides for these ugly left-over edge cases (basically "how do we explain route -> route driven templates -> action passing in a way that doesn't raise too many WATs")

RJ: Deprecation RFC & API, seems to have general approval

MB: I have general approval from wycats on this

RJ: I plan to have a polyfill for this API on 1.13, which will allow people to customize the tooling for 2.0 upgrades

MB: I will do the final checks and merge the RFC. Cory or Clemens can possibly pick up the implementation.

RJ: Dropping branches. How?

TD: (starts deleting old stuff)

SP: The lazy execution PR has basically stalled, needs a lot more work to be a finished product. Will leave the PR around for people to look at and review, but someone else would need to take it across the finish line.
