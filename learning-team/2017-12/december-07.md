# Learn Team Agenda 12/7

## Topics

- MelS: Style Guide
- Dash App Search https://github.com/ember-learn/ember-api-docs/issues/403
- MichaelS: API Docs Search
- CM: Guides 2.0
- TJ: API Docs Roadmap: https://github.com/ember-learn/ember-api-docs/issues/344
  - where we are, what’s next
  - Newsletter
  - 2.17 release blog post
  - Quick update on Ember crash course side project

## Action Items

  - [ ] DB: Heroku blog post to launch on 10/23, DB- my focus now, dedicating time next week.
  - [ ] Jen checking 2.15 vs 2.16 method/attr count https://github.com/ember-cli/ember-rfc176-data

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- MelS: Mel Sumner @melsumner
- CM: Chris Manson @real_ate
- DB: David Baker @acorncom
- SK: Sivakumar Kailasam @siva

### Notes

#### Style Guide

- MelS: Looking to get rid of brown.  Also want to stick to material design principles.
- TJ: how are we sharing the guides atm?
- MelS: been working off a codepen and want to get things into a common style guide, and eventually into something like freestyle.  I’ve been given a license to go for it and iterate from there. https://codepen.io/melsumner/full/9d551738a81e319a773395a2cfa1a82e
- JW: what is actually in use verse stuff we want to eventually roll out.
- MelS: I wanted to use the style guide to get things out of my head and documented.  Been trying to get things rolled out over the site.  Guides I have not done yet.  Trying to do small changed to incrementally switch over.  Would like to introduce global/shared CSS.
- JW: is the ultimate goal to share this stuff across the site ecosystem?
- MelS: the dream is to have a few common style files that can be shared across.

#### Dash Search

- TJ: There’s a lengthy api docs issue around why dash search doesn’t work and what we need to do.  Not a user of dash and wonder what our approach should be.
- DB: I think we should put it out to the community for users of dash to potentially contribute this fix.
- JW:  Yes.  I think we should look back at chat/issue history to see who some of the interested/potential parties for a potential fix.
- SK: I know the author and will reach out to see what needs to happen to get this done.
- JW: People who might care about Dash - Katie Gengler, Michael North, pichfl , chriskrycho, santeau

#### Algolia

- TJ: it sounds like we need to find some additional somebody interested with time to learn and help finish out the work that Michael has brought this far.
- DB: I’d like to reach out to an algolia contact to help us with this.
- JW: Would like to reach out to the general learning team, and would like to take a path that gets it back in there as fast as possible.
- MelS: I have some time right now and would be willing to sit with Micheal to find out where its at and what help is needed. We could make a decision based on the amount of work left on whether to finish what Michael has started or to back out to the default algolia implementation for the time being.

#### Guides

- CM: guides app is mostly working.  Works for all versions that locks moved into his guides source repo.  We’ve now merged that cleanup of it into master.  To get a sense of whether it was completed, I got the idea to use percy to compare the new app to the old system.  2 things came out of that: first is there are some problems with the new app - style of doing links in markdown where you put reference links scattered in the document.  second thing is there’s an inconsistency in the version of the markdown file that locks copied over for 2.15 - maybe an intermediate got copied over before the final. Will need to check to make sure the copied over source md matches what’s currently in prod, plus we will need to pull the new releases that has come out since the copy.  Will run percy after that to check that everything is the same and create a list of items to wrap up.
- JW: that’s awesome.  I was surprised on how simple the solution was.  it was really well done.  If you could put together a quest issue we could get some help to finish out.  People will be excited not to fight with Ruby anymore and be motivated to help.
- CM: If I could get some help with the actual copy process, that could help out a lot.  I’m fuzzy on how specifically it is done.  I believe it was locks who did it initially.
- JW: Maybe we can get locks to document this

#### API Docs

- JW: Can we do a test that checks if there are missing methods, for 2.15 - 2.16 and moving forward?
- TJ: But it would require manual review
- SK: We could output the html and diff it
- JW: What about percy?
- TJ: still manual. What’s the goal?
- JW: at least finding more methods/attributes we may have missed. Will look into running some basic tests or using https://github.com/ember-cli/ember-rfc176-data and a js script to compare
- TJ: We almost had a major regression because of EmberJS core work in typescript that broke YUIdoc compilation
- JW: o_0
- TJ: how would we catch that?
- JW: o_0
