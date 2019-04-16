# 2016-04-28 Agenda

# Previously

- [ ] RT continues with consistent voice updates in quickstart (no merge 'til emberconf)
- [x] YK: Reach out to google contacts for SEO guidance of ember docs
- [ ] TJ: Coordinate getting out a quality tutorial in the April-May timeframe
- [ ] TJ: Private API work
- [ ] RM: Brain Dump of Controllers with EB
- [x] RM: Talk to Ryan L working on responsiveness to see where he's at
- [x] RM: Send out some website redesign thoughts.
- [ ] TJ: Get access, free pro license for his company's video conferencing
- [ ] Barely any Mixin reference in the Guides

# Topics

- YK did reach out to PI @ Google numerous times, with no response. He's hunting for alternative contacts now.
- Algolia: thumbs up/down?
- Getting RM's website changes live
- Discuss Learning team blog post content https://usecanvas.com/ember-docs/learning-team-~-road-ahead/4QYf1yGIB0kHrZxIItbBKS
- Tutorial Update: Services Tutorial PR out for review, Starting on autocomplete/filter update/ futhey still working CSS, has an addon created.  Next week, nested routes

# Action Items

- [ ] RM: research using NPM release info (in json file)
- [ ] DB: Algolia, get going on this
- [ ] DB: SEO, link rel="canonical", get started
- [ ] TD: write a blog post on subteams

# Minutes

## Attendees

- TD: Tom Dale @tomdale
- DB: David Baker @acorncom
- TJ: Todd Jordan @toddjordan
- LS: Leah Silber @wifelette
- MB: Matthew Beale @mixonic
- RM: Ricardo Mendes @locks

## Notes

---

## Algolia

- DB: can we get a confirmation on how we want to handle this?
- TD: I'm fine with going with Algolia
- DB: cool, I'll get started on this then

### SEO

- LS: YK is not getting love from the google team.  Exploring other avenues
- DB: Canonical URL is a way, but it wipes out old versions from google's index, but YK was wondering if a schema would work, that's why he was seeking advice.  Canonical is better than we have now.
- TD: we have algolia, and if we are good about semver, things should stay somewhat compatible.  We've spent a lot of time on this and am not confident google will have anything useful for us, so lets go canonical.  Do it after our switch to algolia.
- DB: since I'm touching all that anyway, I might as well do them both at the same time.

### Tutorial update

- TJ: pushing hard to get this done in the April/May timeframe so we have something nice.

- TD: pods being pushed on hard, would love to have tutorial updated as well to match the new pods structure

### Ember Data Imports

- RM: made updates to ember data imports in the guides so they are up to date now

### Blog Post

- LS: locks wants to write a blog post for the learning team, but that's dependent on TD writing a blog post introducing the teams.  Just a reminder to TD

- TD: On it

### Responsiveness/Website

- RM: Did a couple of PRs around some of the easier pages for responsive design.  Working with Ryan L on that.  Someone created big PR on redoing the contributions page.  Kinda stalled, so will close if no action. 
- RM: Found out how to do continuous deployment, need to figure out the permissions so that right user (bot) can kick it off (commit).  Also working out the new learning page.
- DB: Slowly working on the help wanted app.  If you want me to get people in my meetup to work on lmk

### Landing Page

- RM: would want to replace home page examples with twiddles
- MB: home page downloads tons of javascript and is slow.  Should look at lazy loading or something to make that faster.

### Newsletter

- RM: working on this week in Ember newsletter will send LS a draft
- LS: what's the difference between this an ember weekly.
- RM: weekly is more about the community from the perspective of users of Ember.  Newsletter will be geared toward contributors and maintainers.
- LS: would like to know thoughts on the future of this offline.

### Triage

- RM: Closed 300 issues this month
- RM: Working on a bot to do things to issues like label and close, so we don't give so many people "the keys to the kingdom"
