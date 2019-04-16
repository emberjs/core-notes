# Learn Team Agenda 2018-04-19

## Topics

- Follow up on action items from last week
- Review initiatives from F2F in March
- Determine what we want to ship by September
- I want to reenforce the above
- Guides PR progress - how can we push through 💪
- Guides Search - it’s broken 😭 (update: I know how to fix it!)
- https://www.npmjs.com/package/create-ember and npm’s new init command
- Topics for Ember Times, Ember Learn section?
- (@Gaurav M ) Marketing question
- RFCs - some guidance
- Guides App System overview video (finally)

## Action Items

- [ ] @Jessica J Start trying out Browser Stack on Website
- [ ] @Jennifer W and @Chris M follow up about maybe updating the “loop process” of adding a new deprecation
- [ ] @Chris M to help fix the current deprecations issues - consider some sort of CI process to double check the links in the Ember code
- [x] @Chris M submit a PR to current website to make the JS only return guides results in the search
- [ ] @Melanie S collate a list of requirements for the search

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RW: Robbie Wagner @rwwagner90
- MRS: Melanie Sumner
- AL: Amy Lam
- AA: Anker
- RM: Ricardo Mendes
- JJ: Jessica Jordan
- GM: Gaurav Munjal
- JW: Jen Weber
- CM: Chris Manson
- MSch: Michael Schinis

### Notes

#### Process:

- Let’s start our meetings with going over the action items from last week. (Confirmed)
- Going through the initiatives

- MRS: Do we all agree that the Guides should be our major area of focus?
- TJ: Maybe subtasks aren’t all urgent/important
- MRS: Can we at least prioritize? Do we need to do this as a group?
- CM: Can we have a column for voting?
- MRS: let’s stay away from that for now
- CM: Don’t feel comfortable reordering independently
- JW: I think we should just talk it out - the most valuable thing we could do with this time. Updates can easily be shared by slack, planning not so much
- CM: Would prefer a prioritization pass by a couple people, and we talk about it next week

#### Individual goals to ship by September:

- *Put your name and any goals you have to finish by September

- Jen
  - Support shipping the Guides App (Ember app) - ASAP
  - The Shortest Ember Book (the mini book) - Soft launch May 1st, print run prior to JSConf EU June 2nd. locks will be using it. Second print ahead of the fall Ember conference
  - Run an online Writers Panel w/Balint, Robert, Marie, and maybe 1 more person, target by end of May
  - EmberConf interviews video - needs ~4 hours of work
  - Rewrite the first page of each main topic in the Guides/help others rewrite the first page
  - Help bring in 1 more new contributor per month (4 contributors), with goal of empowering them to mentor other contributors themselves

- Todd
  - API docs left nav revamp
  - Incorporate CLI, testing docs into API
  - Super Rentals simplification

#### Guides PR Update

- CM: The conversation about search is the only tech thing left
- CM: non-tech is should we merge everything in the old guides.  I have a triage page tracking this. there are a few things we need to decide whether to kick along to the new release, fix, kill, etc.
- CM: jen did a good first initial push on it.  Now we now boiling it down to the hardest things we have left.  I’d like to close asap to start migration process and get new contributors on the new guides.
- JW: who wants to help with the remaining triage
- TJ: I can, are we working off of prs?
- CM: (instead of working stright off the PRs - move things in the project https://github.com/emberjs/guides/projects/2) Yes.. there are some with conflicts that need addressing, and the ones in review required need to be moved to communication req
- MS: Todd can take a pass, and I can come in as needed.

#### Guides search

- CM: the problem atm (siva is communicating with algolia) is that api is not working.  I’d like to move it to a guide-only search, while that gives us time to get the guides stuff to follow the same pattern as the api docs site.
- CM: Mike and I met today and figured out what is wrong.  There’s a possibility we don’t need to fix on the algolia side because one of the lvls is unnecessary.
- MSch: algolia has multiple different indices.  We have one config for both, so they tag each index to filter results based on type, giving us both results.  so we can filter on the tag for now to just give us guides.  Long term I’d like to do what we did for apidoc.
- TJ: Chis to PR the website then
- CM: yes
- MS: Since we want to move away from docsearch eventually since its unreliable, and now that we have json files for the new guides we can use those to create algolia indices.  This would open up custom search pages, etc.
- TJ: The next big thing to do with search is to publish the indices automatically.  Siva was going to look at it, but it may end up being complicated. Will follow up
- JW: also need to doc how to index.
- MS: Yes can do this weekend
- TJ: ok, we will follow up.

#### Guest Blogs and Canonical Links

- CM: a way to encourage folks to blog would be to canonical link back to own blogs.
- MS: Can we put this til next week to get more folks in the discussion?
- CM: sure

#### npm create

- CM: would be great if we could npm init ember, create-ember is deprecated in favor create-ember-addon-… Would be cool if we could alias create-ember so we can just do npm init create-ember.
- MS: why don’t we take this to the cli team
- CM: I don’t think it will take any code to make happen, so I think learn team push to make it happen since its a first experience thing.
- MS: I think it would be respectful and up their alley to have them own it, though you can work through them and do it.
- CM: Was more a question if its worth my time?
- MS: Yeah!
- JW: echoing that its a bit out of our scope, but if cli team is supportive it can affect how we teach (maybe if comes thru rfc)

#### Ember times

- AL: any topics for ember times?
- GM: Twittle has support for babel 6 in canary.
- GM: not sure how ET fits in marketing, but what is the status of marketing efforts?
- MS: lets finish the times part first.
- JW: merged pull requests into guides to move that forward this week, and a bunch were new contribs, so highlighting them would be 100
- AL: will DM GM after this.

#### Marketing

- MS: Marketing rn is limited by time constraints, not any secret stuff happening.  Last time we talked about having a marketing research form that anyone can fill out to request market research, as well as a syntax describing marketing effort.  There’s info on these efforts coming soon, probably in the form of a blog post.  We are now to be using the rfc process now for learning directions, and we should have a learning consensus on how we move on things, and use rfcs for community feedback.  We should feel empowered to carry out our vision.  I have a meeting today to discuss blog direction.  There’s a PR on the website to give more visibility to blogs (timeframes, tags, etc) . It was cool to go back and read.  will be useful context to access those easily.  Will also be meeting with Ryan Toronto who has ideas on the website, and I’m including JP Morgan marketing to join the effort of how to pitch ember to execs.
- GM: where can I keep up with what’s going on and make them more visible for people that want to help.
- MS: we are still trying to figure that out.  We are working on a help wanted app for general contributions. I like to keep things in github org projects.  inbox, todo, doing, done, and link to prs.  It should help alleviate concerns of organization and mgmt.  Currently trying to get the why ember stuff this year, and you may see that in an rfc.
- GM: if I have something I want to say in public, who do I run it by?
- MS: David, Jen, and even me are good candidates. but mostly jen and david

#### RFCs!

- MS I want people to get in the habit of RFC’ing new directions.  It will help us decide what’s important.  We’ve been empowered to go down that path.
- JW: can you give an example?
- MS: we could have rfc'd the change in tagline from for ambitions applications to ambitious developers
- LS: I think it will help get the community behind us for things.  Some feel like you are giving up autonomy but it really isn’t.
- JW: what are the timelines 4 months? 3 weeks?
- LS: you can decide case by case and add it to the rfc.  just be smart (2 days not useful for ex.) . 2 weeks seems like a healthy minimum.
- GM: maybe someone should push a good one to be an example
- MS: sure!  I can do one for the blog changes.
- LS: That would be a good one, bc it might bring up things we didnt realize.

#### Guides Overview Video:

- https://www.youtube.com/watch?v=UXy-RAiKft8&
- https://youtu.be/UXy-RAiKft8
