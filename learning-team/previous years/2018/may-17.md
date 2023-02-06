# Learn Team Agenda 2018-05-17

## Topics

- Guides launch
- Guides content improvements - Draft by Chris Garrett
- EmberCLI
- A11y Blogpost
- Google Analytics on API Docs
- Some bad routing/docs errors ;_;
- SEO update - 10K new issues this week

## Action Items

- [ ] pzuraq is going to try spiking some improvements to the quickstart and will report back next week. Maybe in the future we push rolodex/ember contact manager forward
- [ ] launch the guidessss
- [ ] Jen & Siva pair up on CLI docs


## Minutes

### Attendees (Initials: Name @slack-id)

- Todd Jordan (@todd.jordan)
- Sivakumar Kailasam (@siva)
- Jen Weber (@jenweber)
- Chris Garrett (@pzuraq)
- Chris Manson (@real_ate)

### Notes

#### Guides Launch

- CM: I think we are done!  We are good enough to go with what we have rn.  We should get some further consensus, but its looking pretty awesome: https://emberguides.stonecircle.io/
- CM: had back and forth with siva while I was away to get things merged to fix issues in a dev branch.  I was able to port his changes to the diff rendering for the code examples into the master branch of the guides app, and we didn’t need to ditch prember.  There’s a bit of uncertainty going to fastboot, since things were designed for prember.
- JW: should we get signoff from siva?
- CM: I think he implicitly did so by closing his pr
- JW: lets do just to be sure
- CM: can we get some more consensus?
- JW: yeah who?
- SK: Godfrey to help us on deployment stuff.   We should review the project board to see what’s remaining and pick a date.
- JW: can we review and knock it out before we go today?
- SK: sure
- CM: awesome
- JW: Plus I think announcing to learn team would be good.
- CM: jessica did a good job finding bugs, but she tagged them as good first issues, should I work?
- TJ: I think shipping is a priority.
(general agreement)


#### Guides tutorials improvements
- JW: Chris G can you share some of your research?
- CG: sure!:

https://paper.dropbox.com/doc/Ember-Guides-Rewrite-RFC-WIP-zrBMSJyBkX9TG7ws86CWM

- CG: The ember guides as they are throw a lot of concepts very quickly and can be a barrier to learning.  Would like it to be more component centric early on.  Showing parallels between other component frameworks would be good (not necessarily specifics, but following the same learning path).  In the RFC I threw out ideas around a ToC.  Also would like to flip the tutorial to start with a component introduction.

TJ: We've had a vision/goal to host several tutorials, catered to learning levels.

Advanced: Super Rentals (for devs coming from an professional SPA background)
Intermediate: Rolodex (for devs coming from site development, jquery, etc)
Beginner/Quick Start (to get core concepts quickly and start playing, regardless of experience level)

Also we've been wanting to split the tutorials away from the guides, so there's infrastructure work to do there.

Any of these efforts could use some help as they are run by people as side projects.

- CG: the quick start sounds like a good place to start on. Let me look at it and see what I can do.
- JW: If you can make our next meeting ane report back that would be awesome

#### CLI docs

- JW: I may want to focus on the guides for content right now.  I think its a glaring thing content-wise that needs love

#### A11y

- JW: Mel and I are working on an a11y blog post, so look out for that in the near future

#### SEO

- CM: Added an ember-metrics impl for api, just like guides.
- CM: would also like to do some organization of the different parts of the site

#### Fixes

- JW: I’ve noticed some bugs that seem like they need some fixes soon.  Would like to look into shopping these around.  It may be some work for some of us to shepard
- SK: sometimes those can scare people away, especially newcomers and api docs.
- TJ: I can triage any issues and advert them in learn + friends
https://cl.ly/23083R2K2T1I
