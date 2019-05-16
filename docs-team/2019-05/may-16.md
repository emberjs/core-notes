# Learn Team Agenda 2019-05-16

Facilitator: @Jessica J

## Topics
- Review last week’s action items
- How is our PR queue doing? How many are older than a week?
- Review new RFCs/RFC Tracking
- Reminder - release upcoming (JW)
- Octane work status and timelines (JW)
- Changing our GitHub merge requirements https://github.com/ember-learn/handbook/pull/21
- https://github.com/ember-learn/ember-api-docs/pull/612
- Chat some more about Github Project Initiatives
- Super Rentals (JW)
    - Octanification
    - JQuery refactor


## Action Items
- [ ] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions) @Jessica J
- [ ] Ping core team members not in attendance to see if they want to move to projects instead of Airtable for our main initiatives @Chris M
- [ ] Intro for Project Motivation Ember for Review @Jessica J
- [ ] Do a PR to the handbook to get consensus on moving  @Chris M

## Attendees (Initials: Name @Discord)
- [ ] DB: David Baker (acorncom)
- [x] TJ: Todd Jordan (todd.jordan)
- [x] JJ: Jessica Jordan (jessica)
- [x] SK: Siva Kailasam (Siva)
- [ ] AL: Amy Lam (amyrlam)
- [x] CM: Chris Manson (Chris Manson)
- [ ] RM: Ricardo Mendes (locks)
- [ ] LS: Leah Silber (wifelette)
- [ ] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [ ] KL: Kenneth Larsen (kennethlarsen)
- [ ] DM: Dan Monroe (danmonroe)

## Notes

### RFC Tracking Issues
JW: In regards to RFC tracking of (https://github.com/emberjs/rfc-tracking/issues/11). It’d be useful for someone from the Learning team to pair with the Ember Data team to show how to QA the docs for this big, and probably docs breaking, change. Waiting for feedback on when this could happen from Ember Data. It’s most likely not shipping before 3.11 or so, but it’d be good to keep an eye on it and ping the others every now and then

SK: I already tried out 3.11 docs and there were indeed some things breaking. I can help a bit with that sometime later next week or so

SK: Some of the scripts for building the docs don’t work anymore with the new package structures, we’d need to fix this up accordingly

TJ: It would be cool to build betas and deploy them somewhere to see these problems with lots of new changes to Ember, Ember Data, etc. coming

JW: In regards to RFC tracking for (https://github.com/emberjs/rfc-tracking/issues/46) it doesn’t seem to be about a documentation relevant to end users. I can add a note to ask for support on this one for writing the actual docs

### Octane work status
JW: Octane won’t ship with an LTS, meaning the earliest release with which it might ship is 3.13. There’s still some work to be done on the API docs when the beta is cut and other places.

CM: And in 3.11 it can’t happen then?

JW: How the release process works so far, betas are cut 6 weeks in advance, and since the current beta doesn’t contain all the Octane relevant features and therefore can’t be the release candidate for Octane

CM: And why not 3.12 because of LTS?

JW: Yeah, we still want to focus on keeping the LTS schedule going, even though moving the LTS was under considered briefly

JW: It's important to keep in mind that 3.13 is a potential candidate, but it should not be communicated as being the definite candidate, since we cannot tell for sure right now when Octane is really going to ship

### Handbook Update on Merge Reqs
JW: I just added a PR for updating our handbook according to the updates we were talking about a while ago. Already approved by Chris and Mel, but I’ll post the link another time into the chat to ensure consensus on this

### Ember API Docs MR from a Workshop Contributor
CM: Can someone have a look to see how this works and if it’s alright?

SK: Unfortunately tests are failing on master so we can’t review or merge anything right now. I’ll try to get that sorted out soon & work with the contributor to land that PR. 

### Github Project Initiatives
CM: Just wanted to check in with you, and especially TJ and JJ if they’re also fine to move our project triaging from Airtable to Github projects. We already had growing consensus on the move from our discussion on last learning team meetings

JJ: Yeah sure, sounds great. It’s cool that it’s public

TJ: Yeah, also good from my side

### Octane-Ready Super Rentals Tutorial
JW: Some things still need to be updated: removing jQuery usage, maybe related to an addon right now? and updating to Octane features and related syntax

TJ: Yeah, jQuery might be stemming from addons like ember-leaflet - we need to check how to replace usage of these addons in the tutorial or updated the relevant addons to not use jQuery in the first place

JW: I check with Vaidehi and how much she wants to help with it. Would it be in general ok to replace ajax with fetch?

TJ: Yeah sure, send a PR!

JW: I’ll put an issue, cool! Thanks for the feedback, y’all!
