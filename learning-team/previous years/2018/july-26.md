# Learn Team Agenda 2018-07-26

## Topics

- MelS: Ember Data
- TJ: Ember Styleguide in API docs?
- CM: Guides App “guidemaker”
- Status updates

## Action Items

- [ ] <action-item>

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RW: Robert Wagner @rwwagner90
- MelS: Melanie Sumner @melsumner
- JW: Jen Weber @jenweber
- JJ: Jessica Jordan
- MG: Matt Gardner

### Notes

#### Ember Data

- MS: We need some people to help out with ember data.  Would like us to put out feelers/ send out SOS.  Talked with runspired last week, and got a list of things they need help with.  They have less resources than we do, there’s currently a lack of resources there.  Last couple of release have things that need to be addressed.
- JW: Maybe we should treat this as we are building a new core team as several have rolled off.  Kinda like a reset. At least long term we look at building the team even more.

#### RFC

- MS: Getting with rwjblue to discuss tracking and updating RFCs.

#### Website

- MS: somebody added addon docs to our styleguide repo.  EmberMap guys are going to do some Marketing research about our home page.  Should go out in a future times issue
- JW: would love to call out the author that made that commit.  He’s been doing great work and would love to encourage him.
- TJ: API docs still has the old nav bar
- MS: Chris is working on a bootstrap-free nav bar
- CM: Wanted to get consistent width across the pages, but since the layout was based on bootstrap grid, so didn’t want things to be even more dependent on bootstrap.
- JW: I ran into some fastboot-related issues when trying it before.  At the time I was working with the jquery version of it, and have not tried the more “embery” one.
- CM: We are taking the WCAG guidelines for it and translating it to ember component.  I’ve had reasonable success with it, will need some help from Mel with the styling aspect.  If we are happy with it we can move forward as a “bootstrapless” replacement.

#### Times

- JJ: doing a readers questions around DDAU this week.

#### Inspector

- RW: got the tests working again.  Working through issues.  PR’d some things into the Times to get ideas and feature requests.

#### Guides/CLI docs

- JW: Looking at PRs and trying to clean things up.  Haven’t made progress this week on CLI docs but will spend some time on it this weekend.  Can now deploy the guides so if you need something ping me.
- JW: I get the feeling the contributions to guides content has slowed.  Its easier than ever but doesn’t seem too active.
- MS: could be that they are pretty dern good right now.  Could also be summer…
- JW: Good points.
- MS: I’ve been told things typically pick back up in August.
- CM: What i’ve noticed, is I see initiatives like Jen’s CLI and Ricardo’s restructuring as looking ahead to make the next “significant” step to make things more awesome.  That the guides are in a decent place.
- JW: There a couple of “in limbo” prs for guides.  one that there is some debate on another to start using `this.propertyName` instead of `this.get(``'``propertyName``'``)` where appropriate.  I want to merge these but could use a secondary look.
- JW: another thing is I’ve been thinking about ways of empowering our community base to be contributors and take ownership of things.  One of the ideas I have is to take a poll of people on core teams and are deeply involved on how much they dedicate to ember OSS.  I want to show others that we aren’t as superhuman as others think we are.  Would like to make sure we are striking the right tone.
- Group: Yes.  Would be helpful
- CM: I think showing that not many people contribute could hurt folks that do this type of work as a job.
- CM: I think emphasizing that our contributors are not tied to a single company may help
- MS: I think our community generally understands that there are few folks from different companies contributing
- JW: Yeah I’d like to do this with the focus of getting new contribs, but I think I need to think through the questions a bit more.

#### API
- TJ: We put in a fix this week to search indexing to index ember-data.  There needs to be a companion fix on the api docs app side that search across both libraries.  Right now it only searches the library you are currently in.

#### Guides Search
- JW: is anyone looking at guides search being broken?  I may look at it tonight
- CM: My next step is implementing the advanced algolia search indexing to be built into the ember project.
