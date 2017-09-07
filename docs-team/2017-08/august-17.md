# Learn Team Agenda 8/17

## Topics
- Locks freaking out
  - ember-styleguide / glimmer-styleguide
  - Guides
    - TOC restructuring
    - build restructuring
    - ES Primer
    - SSR
    - Deploying
  - API Docs categorization
  - Tutorials
    - Extract Quick Start
      - Make a repo for it
    - Extract Super Rentals
    - Add Rolodex
  - New releases page
  - Roadmap page
  - Ember API Docs release blog post
  - Merge back into main website
    - Ember CLI API Docs
    - Ember CLI User Guide
    - Ember FastBoot
    - Ember Engines
- RFC 176 / Ember.js v2.16
  - So Many Things Here
    - Ember.js API Docs
    - Guides
    - Ember Data API Docs
    - Ember CLI API Docs
    - Ember CLI User Guide
    - Ember FastBoot
    - Ember Engines
    - ???
  - https://github.com/emberjs/ember.js/issues/15587
  - YUIDoc Updates
- ember-api-docs
  - Algolia (MS)
  - Module Quest related changes
- cookbook/guide changes - JW


## Action Items

- [x] MS: Will finish route restructuring @Michael Sk
- [x] RM: Create an issue for adding heroku logo to site
- [ ] YB: clean up the tutorial PR to the website
- [ ] RM, KG: Pair on proposed Guides ToC  (after ember camp)
- [x] TJ: Go/No Go call on API Doc (Monday)
- [ ] RT: update on discourse+blog integration
- [ ] DB: pending Leah creating Heroku org for Ember to shift to new org approach
- [ ] DB: Heroku blog post
- [ ] RT: Write Rolodex/Contact Book Tutorial to launch with 2.16
- [ ] TJ/RM: record/task out stuff that needs to be done for the api changes in 2.16

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- DB: David Baker @acorncom
- SK: Sivakumar Kailasam @siva
- JW: Jen Weber @jenweber
- RT: Ryan Tablada @rtablada
- MS: Melanie Sumner @melsumner

### Notes

#### Cookbook / Guides

JW: Looking for needs in improving guides.  Seems ember data and action passing could use my help.

RM: We would like workshop materials, like based on quickstart.  Would also like someone to own maintaining cli 101.   I’d be interested in a cookbook, Tried before but didn’t materialize.  I think it could still work, because there are things that don’t quite fit in guides.
For guides restructuring TOC, changing links.   Ember data and testing sections need TLC.  Would also like to have a section of the guide dealing with data management.  In general would like to break things up better to show that ember is a smaller part of a larger ecosystem.

DB:  but to answer jen’s question, yes!  We would love you to help out with ember data and actions passing if that is where you feel you can give the community benefit.

RT: How do we go about coming up with how we want to change learning structure?

RM: lets get everything set up to change things drastically.  We can start by creating visual separators and do some small changes to make things more accessible.  We also need to create an RFC to discuss our long term vision.

#### styleguide/glimmer

RM: Have middleman render header/footer, incorporate things as glimmer components.  Mel is starting a “codecation” to see where she can get with it.

MS: Can’t run middleman (bc I run on a PC)

RM: I have some ideas about not using middleman.  We could use ember as a static site generator so we could move forward without fastboot, etc.  Fastboot scares me because the website has some hidden stuff, such as form submission.

DB: didn’t realize :-P

RM: tomster submission, security reporting, contacts

#### guides versioning/build

RM: instead of having to build each version and sending to static. we would have a folder per version.  New versions create new folders.

DB: don’t have time to work on it atm.  The ToC issue is our biggest blocker on this, in addition to our reliance on middleman.

RM: downside it will take significantly longer to build.  Eventually we could have cardstack and manage versions separate from guides.

RT: I have something that’s an early PoC, that convert md folders to json-api using broccoli.  I was looking at it as a simpler alternative to cardstack for this that would give some finer grained control.  Though I think cardstack is the right longterm solution.

#### ecmascript primer

RM: if someone wants to own this that would be great.  Idea is to work/deploy a section at a time until we have a decent primer.

#### new sections

RM: 2 big sections that I want to add is SSR (fastboot) and a deployment section.  Deployment not just ember-cli-deploy, (though we would mention) but rather general deployment options

#### API docs

RM: Yehuda made a spreadsheet to categorize major sections.  Ties into restructuring of the guides.  Goal it to make ember consumable for new users.

https://docs.google.com/spreadsheets/d/1UNfIKGIigWnabCUV6aQK-zBTuv8LVBA8Kzkk1bVhZjQ/edit

JW: if we rearrange the guides it would be really helpful to have the api docs mirror the organization.

#### Tutorials

RM: we want a new tutorials page just for tutorials.  We need a repo just for the quickstart.
We also want to extract tutorial/super-rentals
And support help Ryan on the rolodex tutorial

RT: would like to release rolodex with 2.16, launched with the new module api.  When you say “extracting”, what do you mean.  Is there a particular folder in the website you want it to live in?

RM: easiest thing is to create /tutorials and have the tutorials live there?  But that doesn’t seem to solve it completely. would rather have a repo for tutorials because it would make updates/maintenance from ember updates easier since the cross cut tutorials.

TJ: how do you see it deployed?

RM: could have a separate website that gets routed from the website, similar to apidocs

RT: do we want to create a new ember/pwa app for it?

RM: we would need to figure out dashboard/builds as a pwa

#### New Releases Page

RM:  Since the builds page is dreadful, I’d like to replace it with a new releases page.

- upgrade instructions
- new features
- (flags)
- release blogs

Index page would be what the builds page is now

- builds
- calendar

I want to build new thing and deprecate the old one

DB: can we just update the current one?

RM: in that case I say we could fork it and work on the new thing.  Eventually we would redirect to the new page.

DB: where would we get the data for it?  if it weren’t for the data it would be pretty easy.

JW: Who is the target audience for this who would look back in time for old releases

RM: Someone upgrading from one build to another

JW: what’s the difference between this and the release notes on github

RM: gh has barely any info.  The ember cli release notes have the upgrade instructions.   This would also replace the blog post.  the blog is incoherent at times and not seo or user friendly.

DB: do we need to extract this from middleman?  Also do you want the blog posts to be paired down in favor of releases.

RM: I think the blogs are fine but I think the release would consolidate all the separate info

DB: seems like a lot of effort for a little benefit.

RM: the idea is that this will be much more data driven.  like calculation of release date (yrs into future), knowing lts lifetime data.  Would avoid us updating things by hand.

JW: 2 things I’d like to see is

1. clear direction for new users on which version they should use.
2. clear definition of what an LTS is, and what versions there are.

DB: there is an svg file in the initial LTS announcement that we show for what the pipeline is.  Would be cool to have this data driven. https://github.com/ember-learn/builds/issues/4

DB: what are the highest priorities.  i.e. if someone has time what should they pick up

RM: it depends on the amount of time you have available.

TJ: sounds like the 2.16 stuff is highest.

RM: we need the middleman plugin to autolink to ember api docs.  so that whenever you add something to the docs it goes to the right place.

DB: sounds like a nice to have and not for 2.16, plus not sure that its something we want to add to middleman if we are going to kill it.

RM: we could add it as a glimmer component.

TJ: so yeah we need to continue to go to the right place.  As long as ember supports both ways of import we should

DB: but we would need to do that forever because our docs go back to 1.x

RM: we could cut the app into pieces that do different things at a specific version.
We should probably consider 2.16 as a different app, because the mental model/organization is significantly different.  not sure how that translates into urls/etc, but the current viewer needs changes.  (privates, toc, etc).

TJ: we could implement that in a couple of different ways.  We could just keep one app and then have one set of routes go to the current view (today), and have the new routes go to 2.16+

RM: First thing is to figure out if we truly are having different urls.

#### Algolia

MS: I got back into it and pushed to pull requests, 1 to update selectors to help algolia scrape, the other to re-add the search.  looking into an issue, but then we will be ready to go.  it is deployed as a heroku preview if folks want to check it out.   Shouldn't take long to be ready.

https://ember-api-docs-staging-pr-290.herokuapp.com/api/ember/2.14/namespaces/Ember

#### RFC 176 JS module api

TJ: there’s an issue for what needs to be done for this rfc by 2.16: https://github.com/emberjs/ember.js/issues/15587

TJ: Part of what we need to do is update the source to reflect the current modules for the rfc.

TJ: Secondly we need to update the ToC to show expandable sections based on new Module structure: https://github.com/ember-learn/ember-api-docs/issues/131

JW: if you let me know what consumable tasks are to get us to 2.16, I can write issues/share with potential contributors.  Added benefit is getting more people to contribute will grow the pool of expertise we have to help with stuff.

#### Public/Private visibility in API

JW/RM:  Figure out what we want for visibility

- Don’t show private classes at all in TOC
- Do show deprecated, but label them
- No private methods or properties at all

JW: will update the issue with my thoughts on how all this should work

RM: we want to get to a place where we enumerate methods/properties in the ToC as opposed to the index tab.

TJ: that plays off of what Tom originally suggested to “make it like XCode”

JW: indicating deprecated will also be something that might take extra work.

TJ: I think the visibility data is available for the page.

JW: yep but not for the ToC, a little extra work to populate that data up front there.

TJ: a quick win would be to highlight private/deprecated on the page too.  like via a specialized icon


