# 2017-04-13 Agenda

### Previously

- [x] All: Mark items in each learn repo as "good for new contribs" (by Friday!!!)
- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] SR: send locks link to emberitas workshop materials
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo#

### Topics

- tutorial
  - Deploying Super Rentals
- API Docs
  - Deploying to subdomain api.emberjs.com
  - URL redirects
  - rfc176
  - search?
  - delivery plan
- heroku blog post

# Action Items

- [ ] MS: Finish out search upon return from awesome trip ;-)
- [ ] TJ: Find out who was willing to help with hiding methods based on feature and get update.
- [ ] DB: Open an issue on hiding feature flagged methods/properties/events
- [ ] TJ: Deploy super-rentals to free dyno

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- GM: Gaurav Munjal @gaurav

## Notes

---

### API Docs

##### Search

TJ: is it back to working?

DB: Made a PR to algolia (https).  Wasn't working at first but now it is.

DB: Michael will check and we can merge when he gets back from Crete.

##### What to use for current URL?

DB: I suggest changing to latest ( can't remember the feedback that rwj gave us).  Will run it by him.

TJ: It seems latest has the same problem, being that its not clear what it means.  (canary, beta, release).  I suggest using `/release`, `/lts`, and if necessary someday `/beta` and `/canary`.

###### Feature Flags for methods

DB: there was an issue brought up in slack where methods behind feature flags were being displayed: http://stackoverflow.com/questions/43379449/ds-adaptererror-extend-fails/43382239#43382239

TJ: Yeah, currently we filter based on class during the ember build.  We could conceivably add method support (would make the build a bit longer).

DB: Should we do this processing as part of the api viewer?

TJ: We would need the features file as an additional input.

DB: Will open an issue on the initial issue.

TJ: We talked to somebody on slack last week about this and they said they may try to PR it. I'll check the archive to see who it was and ping them.

##### Using api.emberjs.com subdomain

TJ: If we used the subdomain it would immediately solve our PWA issues.  Our setup for /api is the problem atm.

DB: I think the reason we wanted /api was the vision to eventually have the website as an ember app as well, and then api as an engine, as a showcase.  It might be worth it long term if we go ahead and implement service worker/webcache at the root website.

TJ: So then we lose ember-service-worker for now.

DB: We could copy the generated files over to the website.  I don't think they'll need to change much.

TJ: We can test it out.

##### Priorities

DB:  I don't think PWA support should stop the switchover to /api

TJ: Agreed.  I think the minimum bar for v1 should be search, and then api redirect.

DB: Agreed.  I'll update the milestones in github.

##### Infrastructure Blog Post

TJ: We mentioned doing a blog detailing our new dogfooding and infrastructure on the website.  When/Who is doing that?

DB: I think I'm on the hook :-P  We should wait until we've released v1 and taken over /api

TJ: Sounds good.

##### Deploying super rentals

TJ: would like to deploy super rentals so that we can point people at a working example, instead of making them clone the repo and install.  Where should we deploy?  Should we use one of our Heroku dynos.

DB: I'm inclined to just put it on a free dyno and then link from the github repo for now.

TJ: ok

