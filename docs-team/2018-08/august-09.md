# Learn Team Agenda 2018-08-09

## Action Items

- [ ] <action-item>
- [ ] After Sam gives Ember Data testing a try, Jen will help make some connections for contributors who have paid time to donate
- [ ] Will publish a plan for the website subdomains plan

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- JW: Jen Weber @jenweber
- CM: Chris Manson @real_ate
- SS: Sam Selikoff @samselikoff
- MS: Melanie Sumner @melsumner
- JJ: Jessica Jordan @jessica
- YM: Yohan Mishkin @yohanmishkin
- FS: Frédéric Soumaré @hakilebara
- DB: David Baker @acorncom
- TD: Tom Dale @tomdale
- <attendees>

### Notes

#### Survey update

- SS: the survey’s out now, ton of responses.  Ryan plans to go through them and create a pdf tldr.  A lot of insightful stuff 150 responses.  Need to mine it now.  Next will come the markdown document.
- MS: I’m really excited about embercamp chicago, everyone has accepted.  lining up backups and sending out remaining non-acceptances (really hard!).   I found out that 1500 people at jpmorgan use Ember, so I think there’s capacity for us to become more engaged as a community.  Putting out to the company to encourage them to get out to Chicago.  Hopefully we get things set in the next couple of weeks.

#### Alex / Newsletter

- JW: The most recent version of the newsletter has a sentence that had a political undertone so I submitted a PR.  Turns out it was a non-native speaker and wasn’t even meant that way.  Made me think if we need some safety net especially for non-native speakers and people with various cultural backgrounds.  So considering adding Alex as an automated CI tool that can check for things to ensure we write inclusively.  I opened a PR for this particular instance and the author was receptive.  They actually added a wildcard phrasing for me.  Jessica will look into putting it into CI.
- JJ: Yeah, thanks for doing this, and for reviewing.  Alex looks straightforward so that we can check every travis build.
- CM: we can add alex to the guides as well. it works with eslint.  If we are happy with it I can set something up.
- JW: we should try for the blog first, but I’d like to eventually implement across the board.
- CM: Will hold off until the blog then.
- YM: They have an alex for addon development too.
- JW: cool!

#### Help wanted and chicago meetup

- MS: WE did our chicago ember meetup last thursday and decided a goal for the next year would be to take on a community project.  What we decided was to pick up the help wanted app.  I’d like to project manage this and make it a thing with our community.
- FS: I like the idea of help wanted.  Issues is a good place.
- MS: we want everyone to continue issues, but there are too many ember orgs right now, so we want to consolidate.  I think its a good point that we would want to
- FS: in reading past notes, it was quite ambitious.  A lot of good things.
- FS: Can I get involved with help wanted?
- MS: There are some initial planning and cleanup we need to do before starting work in earnest.  There are 2 implementations out there and we need a plan to go forward.  Hoping to sort things in the next week and we can revisit in this meeting and post to slack when ready.
- DB:  I’m thinking graphql is a good possibility for this app.  If you want to start looking at technologies.

#### Tracking Decisions

- MS: I want to avoid re-making decisions we’ve already made.  If anyone has ideas/suggestions for this talk to me.  We really need something.
- JW: I wonder if we can get by with a tab on airtable.
- CM: I like the ideas of keeping things together.  I’ve been doing some airtable api stuff, and it shouldn’t be too hard to put things on a static page somewhere.  We can go with airtable and then surface it to the public at a later date.

#### Ember Data

- MS: sam, has anyone contacted you about helping with ember data docs.
- SS: no
- MS: in talking with runspired, he let me know that ember data was in need of some help.
- SS: Yeah seems to be both a docs problem and with tests.
- MS: with data, its hard to know all the permutations and test for all of them.
- SS: yeah we have similar probs in mirage bc its also an ORM.  Its impossible to write all the permutations manually.
- MS: how do we make a transition plan to get it to where we want it to be.  They also would like to have some typescript help for a test harness.  Could be an opportunity to mention in NYC meetup, and possibly do something with ember map.
- SS: Yeah me and ryan can pair and get our feet wet with it.
- JW: somebody pinged me on twitter to tell me that they have open source time in their company and wanted direction in picking something in ember.  Not sure how much time and how many people, but this might be a good area.
- SS: we can create a quest issue that we can point people at after delving into the problem a bit.
- MS: as far as typescript, If we get folks interested we can send them to the ember data team.
- DB: Cool I can put out something on the typescript channel where there might be some good candidates.
- JJ: Should I say something in the newsletter.
- MS: Maybe or maybe we should wait for the quest issue.  what do you think?
- SS: It might be good to have some direction to give folks that want to help.  We can carve out some time this friday and I can give an update next week.
- CM: itll be good to have a quest issue as a place for people to subscribe to.

#### Contributors workshop

- JW: I’m doing a contributors workshop in Boston later this month, and I was asked if we could open it up to online.  It’ll be aug 22 at 6pm.  Is anyone willing to be available around 7pm-8:30pm to answer questions from online followers?

#### Inspector

- DB: I’ve been working with inspector folks to give Robert Wagner rights to deploy new versions.  He wants to set it up to deploy automatically.

#### Website

- CM: there was talk of getting website structure RFC up last week?
- MS: we decided we don’t want an rfc because its taking a long time to consider and we want to avoid bikeshedding.  What we are going to do is create a plan and then post it publically.

