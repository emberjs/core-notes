# Learn Team Agenda 2019-04-11

Facilitator: Jen

## Topics
- Choose a facilitator for next week - Thank you, Mel!
- Review last week’s action items
- How is our PR queue doing? How many older than a week? [Tracking sheet](https://docs.google.com/spreadsheets/d/1sPyN9z9wZMpTNwqCfa6R9QSPZkIW4iQd-H4gZC7ILLk/edit#gid=2035777454)

----------

*We decided to kick these to next week/Discord*
 

- Add a link to the Octane preview? [https://github.com/ember-learn/ember-styleguide/pull/152](https://github.com/ember-learn/ember-styleguide/pull/152)
- GitHub review flow - should branches be up to date?
----------

*New topics* 

- Review new RFCs/[RFC Tracking](https://github.com/emberjs/rfc-tracking)
  - Most important/urgent 
    -  [~~ember-data packages~~](https://github.com/emberjs/rfc-tracking/issues/11) - JW Ember Data monorepo migration [RFC](https://emberjs.github.io/rfcs/0395-ember-data-packages.html) and tracking. We need to make sure API docs aren’t broken and figure out which, if any links, will break in the Guides etc. We should coordinate action items with the data team
    - [decorators](https://github.com/emberjs/rfc-tracking/issues/7) - @Todd J 👀
    - [router helpers](https://github.com/emberjs/rfc-tracking/issues/14) - needs to be looked at
    - [glimmer components](https://github.com/emberjs/rfc-tracking/issues/2) - needs to be looked at
    - [Deprecate Component#isVisible](https://github.com/emberjs/rfc-tracking/issues/22) - @Jessica J 👀
    - [Record Links & Meta](https://github.com/emberjs/rfc-tracking/issues/11) - @Chris M 👀 
    - [Tracking for Deprecate Computed Overridability and](https://github.com/emberjs/rfc-tracking/issues/18) `[.readOnly()](https://github.com/emberjs/rfc-tracking/issues/18)` - @Robert W 👀 

## Action Items 
[x] The facilitator adds today’s public notes to the Core Meeting Notes repo ([instructions](https://github.com/ember-learn/handbook/blob/master/team-leadership.md#responsibilities-would-include))
[ ] Take a look at the documentation for deployment in the handbook and make sure it’s up to date @Chris M 
[ ] Put together a plan for video content production. CM has started talking to people like Gavin for help in the future. He has done a lot of great videos and is very motivated to help.   - @Melanie S will take this to the marketing team
[ ] CM JJ: Chat about “submit your own whitepaper” style of project showcase data - Question based.
[x] Talk to Robert about Ember CLI Netlify with Addons @Chris M  Shipped!
[ ] Core team members - add tasks from f2f to the Airtable before the next meeting . Things that have a sensible grouping go in Initiatives, and uncategorized tasks go in Tasks/Grid View
[ ] Core team members - sign up for “Product Champions” in Airtable. Goal of 2 people per project. Where we don’t have that, we discuss how to change it
[ ] Next week - we are going to spend time prioritizing our next wave of projects in Airtable

## Minutes

### Attendees (Initials: Name @Discord)
[ ] DB: David Baker (acorncom)
[x] TJ: Todd Jordan (todd.jordan)
[x] JJ: Jessica Jordan (jessica)
[ ] SK: Siva Kailasam (Siva)
[ ] AL: Amy Lam (amyrlam)
[ ] TL: Terence Lee (hone)
[x] CM: Chris Manson (Chris Manson)
[x] RM: Ricardo Mendes (locks)
[ ] LS: Leah Silber (wifelette)
[x] MS: Melanie Sumner (melsumner)
[x] JW: Jen Weber (jenweber)
[x] KL: Kenneth Larsen (kennethlarsen)
[x] RW: Robert Wagner (rwwagner90)
[x] RJ: Robert Jackson (rwjblue)
[x] JG: Jared Galanis(jared)

### Notes

#### How do we want to make use of the "stale PRs" tracking doc?

Mostly just looking at our number across time so we notice if it's getting out of hand, or if we are doing particularly well.

#### RFC Tracking

Most of today's meeting was spent looking through [RFC tracking](https://github.com/emberjs/rfc-tracking), workshop-style.
The purpose of that repo is to help us track implementation of merged RFCs, so we aren't blindsided by changes that need to be made on the learning side.
The core teams are all responsible for updating these issues. 
Community members are invited to participate too! Just add your thoughts as a comment on the issue, and ping a core team person so that they copy & paste your work into the main issue comment.

Moving forward, we will figure out a way together with the other teams to show which RFC tracking issues still need review from various teams.

To catch up on the backlog, we'll ask for volunteers who can help review them, then divide them up.

##### Ember Data monorepo docs

* 3.9 beta does not have the monorepo structure
* 3.9 which I am working on publishing will also not have the monorepo structure
* 3.10 beta will have the monorepo structure
* 3.10 will only have the monorepo structure if we've addressed this by release time, else we'd likely re-release 3.9 to buy us more time
* please update the RFC tracking with what we need to do, especially if there are items we need to help you with

