# Learn Team Agenda 2018-04-05

## Topics

- Team Page
  - Review Updates to http://emberjs.com/team
  - Still need some info: https://github.com/emberjs/website/pull/3258
- Collating help wanted issues across Ember Orgs (@engdangeredmassa@gmail.com)
  - Plan/Notes
- Learning Team Mission Statement - let’s revisit and see if we have progress
  - “to create shared resources that educate, inspire and empower”
  - “to make Ember approachable by educating and empowering developers”
  - “to allow Ember to empower others”
  - Remember our objectives:
    - seat at the table
    - level up your Ember (no matter what your level)
    - provide quality, accurate learning resources
    - helping contributors
- Phrasing/Pseudo-Syntax A/B tests- https://airtable.com/shrYbC7kwbzut0AnJ
- “Why Ember” - data collection update (https://airtable.com/shr3buc2CQaQ2rXF5)
- API docs blog post (Jen, Siva, David, Dave Wasmer, locks) - WIP
- Browser Stack Testing for Website / API Docs, etc., dealing with IE11 issues
- Percy (double checking)
- Guides Update - PRs
- SEO update - we have data!!
- broccoli-static-site-json documentation
- Ember Doctrine update
- Who wants to see the Shortest Ember book?!?! It’s a draft https://cherry-shortcake-43271.herokuapp.com/

## Action Items

- [ ] <action-item>

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- MS: Melanie Sumner @melsumner
- RW: Robert Wagner @rwwagner
- JJ: Jessica Jordan
- JW: Jen Weber
- AL: Amy Lam @amyrlam
- DB: David Bake @acorncom
- JG: Jared Galanis
- CM: Chris Manson
- SM: Sean Massa
- SK: Sivakumar Kailasam @siva

### Notes

#### Team Page
- MS: Has everyone seen the live public teams page?  Already stuff done stylistically.  Adding when does each team meet, what are they responsible, where are meeting notes, how to get in touch.  Will get added under the team heading on that page.  Feedback welcome.
- PR: https://github.com/emberjs/website/pull/3258

#### Help wanted

- SM: wanted to restart the help wanted effort by gathering issues across the ecosystem.  I went across popular addons/ecosystem gathering help wanted tags and want to build an app that aggregates this to a place where contributors can see where they can start.  Also want to categorize things were a contributor can enter in a skill, interest and show issues that relate.  Just an MVP is the first step and then we can circle back to categorizations.  Looking for ideas and thoughts.
- DB: The main question I want to wrestle with is do we want to build a back end or just use github’s graphql query capability.  One of the easiest way to handle is for key repos add a github webhook that would listen/feed for new issues/tags.  ATM the backend doesn’t handle processing of hooks but he front in can.  We are about 80% there, but needs the node processing piece.
- SM: would like it spread across ecosystem and not just key repos, so a backend may not be what we want because it would be tough to get every addon to install a webhok.
- DB: we had initially figured it would be just key repos, and have it spread over time.  If you spread it across the community you might  have quality issues.
- MS: I think this would be something repos could opt into, so it wouldn’t be up to us to get external repos right.
- CM: you could have both cases where you have key repos as one entry point and full ecosystem in another.
- DB: when I was working on it I wanted it to steer/direct contributors towards core quest issues and not to the ecosystem as a whole.
- SM: I’d also like to highlight quest issues, but I think an MVP of looking at labels would be a good starting point.
- DB: there’s an existing standard issue label set that Peter Wagenet created that we could use and expose to the community, and let addon authors conform.
- SM: I think we could pull that in.
- JW: locks and I talked about this for the contribs workshop.  I’m super excited to hear about your excitement on this and I think anything that pulls in information to maallow people to get involved more easily is a win.  I think lets build something quickly and simply and iterate.
- DB: part of what we are doing with learning team is to make our apps example apps, so if you want to do one that highlights graphql integration that would be awesome.
- SM:  I’ll start with some mockups.  There are other OSS apps that do something similar.

#### Mission Statement

- MS: lets revisit

#### Mission Statement Candidates

- From Face to Face

    - to create shared resources that educate, inspire, and empower
    - to make ember approachable by educating and empowering others
    - allow ember to empower others
    - empowering people to be successful with Ember

- Others

    - JW: Empower users of Ember to learn, build, and teach
    - TJ: Welcoming and enabling people in their journey towards expertise and success within the Ember community ecosystem.

- Empower
- Meaningful
- Best
- Experiences
- Responsively
- 😛

- Empowering
- Microservices
- Blockchain
- Elastically
- Reactive
- 🤡

- MS:  Lets collect ideas, poll and come to the next meeting prepared.

#### A/B Testing pseudo-syntax or marketing phrases

- https://airtable.com/shrYbC7kwbzut0AnJ
- MS: I’ve created a form
- JW: is it for farming possible phrases to test?
- MS: Yes.  Will take these to run market tests on.
- JJ: do you have resources you want to test on?  like website usage, rfcs, etc
- MS: yeah even Colors/design things - which would you use?
- MS: naming things is hard and this will give us a better picture of what the majority wants/expects.

#### Why Ember

- MS: on the link it was a simple form asking why should a decision maker or developer choose ember. We’ve gotten about 8 responses and they are ones we can use that should use to help the project.

#### API Docs Blog Post

- JW: since the worst of our SEO offenses have been addressed, I’d like to talk about what we need to do to ship the blog post.
- DB: we are left with a list of what we did.  I’d like to include the guides now.  It may be too much but if we included more we could include a call to action to help with the learn ecosystem.
- JW: can you link to the paper? +Building the new Ember API docs platform
- CM: I would feel a bit uncomfortable adding a lot about the guides other than a more general “we are modernizing everything”.  I talked to robert about a blog post.  The code is done but if we are talking about something ready for prime time contribution (moving the repo, opening it up) then we might be talking about a few weeks until that happens
- MS: how about a teaser?
- CM: big fan
- DB: I was thinking along those lines as well.
- JW: how about we make sure you are looped into the draft to make sure our language is ok on it.
- DW: I wasn’t involved in the development, but DB needed some help with the draft, and I left contributor tech details open in places.
- JW: Do you have time to help still?
- DW: I have a little less free time open than when I helped earlier but am open based on what you need
- JW: Lets get this out there to let folks know what we’ve done.  Am willing to coordinate!
- RM: Do we only have one post?
- DB: there were several drafts
- RM: I thought we were doing multiple different
- DB: we talked about a non-technical vs technical, but I’ve been talking about the technical
- RM: we don’t talk about ember as a product enough, and I want people to write about this more “This is a cool think we did, and if you think its cool too then join us”.  WE can use this as recruiting.
- CM: Main blog or personal
- RM: we should blog more from the main blog.  Will try to get Mel to help me post some things. and circulate with the team.

#### Browser Stack

- JJ: we’ve had some issues lately on IE 11.  rwj and siva suggested we add some browserstack testing on some of these things.  Do we want to have a dedicated account for the learn team?  I could look at this but if someone has done this before could use some help.
- SK: I checked with browserstack this week and we can only test against 5 repos at a time which we are already using on the emberjs repo.  Katie has an addon for browserstack.  Maybe just setting up a token on the repo, getting the account set up.  May need some sponsorship to make it happen.
- MS: if we have a pricing structure I can look for a sponsor.
- MS/TJ: we have ability to test IE locally

#### Percy

- CM: I’ve got a percy thing we can accept if we want to.  Are we ok talking to mike?
- DB: we might need to run it by leah for a sponsorship relationship
- RM: we can do a blurb in the readme.  WE can put whatever we want there.  If that’s enough we can go forward, if not we should go through leah

#### Guides Update

- CM: 2 PRs:
- Using an org level project to track what’s left.  To things that need reviews and once accepted we can move on to final stage: https://github.com/orgs/ember-learn/projects/7

#### SEO

- CM: We have search data in the mos account and found a bunch of things that can be fixed.  I can share data, but do we want a slack channel and do we want it private?
- TJ: I think a private “st-seo” channel would be fine.
- CM: If an admin can create that we can get started.
- DB: I’m an admin and can do that
