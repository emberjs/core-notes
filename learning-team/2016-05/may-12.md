# 2016-05-12 Agenda

# Previously

- [ ] RM: research using NPM release info (in json file)
- [ ] DB: Algolia, get going on this
- [ ] DB: SEO, link rel="canonical", get started
- [ ] TD: write a blog post on subteams
- [ ] RT continues with consistent voice updates in quickstart (no merge 'til emberconf)
- [ ] TJ: Coordinate getting out a quality tutorial in the April-May timeframe
- [ ] TJ: Private API work (on hold)
- [ ] RM: Brain Dump of Controllers with EB
- [x] TJ: Get access, free pro license for his company's video conferencing
- [ ] Barely any Mixin reference in the Guides

# Topics

- Collaborate Video Conferencing for Docs Team
  - Delaying our pilot until a couple of issues are resolved (I pushed to do it anyways but failed)
  - We can use lower scaling video until then (ok with 3-4 users).  [Sign up here](https://goo.gl/mGLPuW)
  - Lets try it out
- Tutorial https://github.com/emberjs/guides/issues/1374
  - autocomplete and service PRs merged
  - addon section ready for review, addon published to npm: https://github.com/toddjordan/ember-cli-tutorial-style
  - logjam of prs on super rentals
  - Starting on acceptance test section next week
  - `@futhey` got busy, handed over his work on style addon (great work on styling super rentals).  TJ took it to completion.
- 2 PRs addressing https://github.com/emberjs/guides/issues/1404
  - https://github.com/emberjs/guides/pull/1405/files
  - https://github.com/emberjs/guides/pull/1410/files
  - I (TJ) think actually each has some nuggets to combine into the final solution
- When to use `let` vs `const` in examples
  - For reference https://github.com/emberjs/guides/pull/1399/files
  - I propose (TJ) we lean towards `let` and only use const for true constants, like `const DEFAULT_WIDTH = 100`
- Infrastructure discussion
  - API viewer - any updates here?
  - Help Wanted - DB
  - Builds page - RM
  - CI / CD for website - RM
  - Guides viewer / migration - do we want to work on this any time soon? ask someone else to spearhead?
- Ember-learn org update? (RM)
  - RFCs if needed?
- Responsive work (DB)
  - https://github.com/emberjs/website/pull/2583

# Action Items 

- [ ] Move super-rentals to ember-learn
- [ ] Move style addon to ember-learn (TJ)
- [ ] Work out how to get permissions bot going for Ember Learn (DB / RM)

# Minutes

## Attendees

- DB: David Baker @acorncom
- TJ: Todd Jordan @toddjordan
- LS: Leah Silber @wifelette
- RM: Ricardo Mendes @locks

## Notes

---

## Tutorials

- autocomplete, other tutorial items got merged, merging to super-rentals as well

### Conflicting PRs

- DB: I think locks picked one and merged.
- TJ: Will follow up

### Twiddle

- DB: AWS domain and infra.: Can it move to ember?  Would like to be "blessed" as an official ember project. 
- LS: reached out to joostdevries (pinged on the call)
- LS: Tomsters: Lots of projects are on hold (ember data, liquid fire, ember-cli)
- DB: could be a sub-project under cli. 
- LS: We should chat with Yehuda, and then Steph
- DB: Will have that discussion with Yehuda, how to proceed if its an idea to go forward with.

### Documentation

- LS: have we been working on getting Roberts brain contents documented?
- RM: not been able to
- LS: he has been having regular meetings with Yehuda and Godfrey.  Would be good to see if there is anything coming out of that that should go into docs
- RM: will do

### Current Projects 

- DB: Any word from Stanley?
- RM: Pinged him on Slack, been elusive
- DB: What are our most important efforts right now?
- RM: want to get the website CI done and would like help - will open up other improvements once deploy
- RM: CTA merged!
- RM: Search, CI, Tutorial, Translations (tied into the new guides viewer)
- DB:  Looked at guides viewer this morning.  Robust addon from ed faulkner.  Loads guide from current site and handles parsing.  
- RM: the guides stuff is more important than getting the permission bot going
- DB: help wanted is working except firebase is a poor place to have the data
- RM: Why not couchdb, where I have the wip guides, stanley's api stuff
- DB: will it handle the traffic?  emberjs gets tons of monthly views, we need to consider that kind of scale for new things we deploy. Will look into it.
- RM: Builds Page: mununum?  was willing to help, can outsource.
- DB: last night at denver contribution meetup, someone put in a responsive PR.  If we can encourage him, he can do more CSS for us on the website.
- RM: would be good to have screenshots on the PR.
- DB: He is willing and eager to help.  Does lots of CSS in his job.

### Website Redesign

- RM: Acorns posted a redesign on dribble
- RM: found a Designer Developer that wants to take things forward
- RM: Not crazy about the design overall (too much) need to reconcile what is good from the design with what we want him to take forward.
- DB: Could we focus him on the Learn Page?
- RM: there was a big PR for the website that just dropped off the map.  
- DB: Have talked to him in past, will follow up.
