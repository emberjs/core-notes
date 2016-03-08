## Attendees

- DB: David Baker
- TJ: Todd Jordan
- YK: Yehuda Katz
- LS: Leah Silber
- TD: Tom Dale
- RM: Ricardo Mendes (Locks)
- EB: Erik Bryn

## Minutes

TJ: Maps tutorial: Have an example using g-maps as a service.  Would like to merge DB's PR after deleting the test.  We should add a fuller component test example.  It would be a good reference.  Plan to pr the maps example for feedback on whether its a good use case.

DB: going to open an issue about component integration tests, showing how to pass down actions in them

---

YK: Super-rentals: we need to put a blurb in the top of the readme indicating the current state of super-rentals as to not confuse.  Right now its not in a usable state

DB: I'll add a note to the header of the Readme

---

translations: Leah signed up for an Crowdin account, sent out invites, time is at a premium atm, hoping to work on it more in a bit

---

LS: Codeschool, Ember getting started, have volunteered to have people get going with their tutorial.  Leah will talk with Codeschool folks, invite them to the meeting

---

YK: Need to get search working so that it returns current results

DB: been a topic of conversation for a month.  Waiting on input from Trek

YK, TD: don’t block on Trek for fixing SEO stuff

---

DB: when Ember-CLI 2.x goes stable, our Ember 1.13 instructions will break for folks

YK, TD: Hmm, not good, let's go back and fix it to ember-cli@1.13

---

[Ricardo joins us]
[Erik joins us]

(some discussion lost here)

discussion of issue on Ember website, topics to discuss on the website (https://github.com/emberjs/website/issues/2460)

TD: We should aim to keep guides geared toward people new to this field

EB: issue came out of looking through a client's chat room and seeing a lot of confusion and misinformation about how ember works and why.

RM: This information really frequently gets behind because only a few core contributers are really qualified to explain

DB: If we do have docs on advanced topics, would need core team members writing them.

EB: Documenting these things could force the core team to get the same page on them.  Could try to lead that effort in getting input from the core team.

TD: Conclusion: need to work on a feature dashboard.  Understanding ember section is valuable - is more stable now then it used to be.  Need a core team member to put the information together and a doc team member to massage the information.

---

TJ: What are the plans around incorporating ember-cli docs into emberjs?

RM: The thought is we keep ember-cli as primarily geared to addon developers.  When 2.x lands we'll consider adding content around using ember-cli to create projects.

TD: Proposes combining ember-cli/emberjs docs because they are so cross-cutting

RM: We need better structure to the guides before incorporating ember-cli

TD: Newbies tend to be more task oriented

RM: Front page, community and guides section need structural work

## Action Items

- [ ] David is going to open an issue about component integration tests (see above)
- [ ] David is going to add a note to the super-rentals readme
- [ ] David will contact Trek re: SEO questions, ask for original context on this
- [ ] Leah is going to invite CodeSchool folks to our docs meetings