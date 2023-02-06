# Learning Team Meeting June 6th 2019

## Topics

- Choose a facilitator for next week: @Kenneth L
- Review last week’s action items (facilitator copy them over here)
- How is our PR queue doing? How many older than a week? Tracking sheet
- Review new RFCs/RFC Tracking
- Update for Octane Guides @Jennifer W
- Any suggestions for the Ember Times? Add writeup ideas / call for contributors / suggestions to the latest PR or #support-ember-times on Discord.
- (20min) Retro on why v3.10 guides were released without `<LinkTo>`, `<Input>`, and `<Textarea>`
- Porting docs for features like element modifiers, angle bracket syntax and other features that are being documented in the octane guides but have been released on main ember releases - @sivakumar k
- (10min) `main` HTML element and blueprints



## Action Items

- [ ] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions)
- [ ] Ping core team members not in attendance to see if they want to move to projects instead of Airtable for our main initiatives @Chris M
- [ ] Intro for Project Motivation Ember for Review @Jessica J
- [ ] Do a PR to the handbook to get consensus on moving  @Chris M
- [ ] Check RFC tracking issues and remove the learning team review label when done
- [ ] Fix up the API Docs for the link-to and input helpers @Ricardo M


## Minutes

#### Attendees (Initials: Name @Discord)
- [x] DB: David Baker (acorncom)
- [ ] TJ: Todd Jordan (todd.jordan)
- [x] JJ: Jessica Jordan (jessica)
- [ ] SK: Sivakumar Kailasam (Siva)
- [ ] AL: Amy Lam (amyrlam)
- [x] CM: Chris Manson (Chris Manson)
- [x] RM: Ricardo Mendes (locks)
- [ ] LS: Leah Silber (wifelette)
- [x] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [x] KL: Kenneth Larsen (kennethlarsen)


## Notes

### Old PR Tracking

RM: Check back on projects that are tracked in the tracking sheets

### Octane Upgrade

JW: I checked with Vaidehi and others on the current upgrade docs and there still seem to be a couple of gaps and room for improvement. It’d be important that we test the Guides and fill in the missing bits. We for example don’t really explain the imports properly or toggling properties as to be done according to the Glimmer Component docs. It’s important for us to have a list of things that need to be improved and transform them into issues so others can pick up the work easily

JW: Another thing I might want to bring up after the next Framework meeting is moving all the new Guides over to api.emberjs.com. Still need to think the workflow through. Similary we want to rethink the placement of the testing docs (e.g. documentation of test helpers) to improve their discoverability

JW: Go through each section and if you find that this can be summed up with a quick sentence


### Ember Times

MS: What about longer think pieces? For example team management or technical writeup. You could also expand on best practices that come up in the help channel

RM: Yeah sounds similar to Readers’ Questions. The bottle neck seems to be finding people who actually write the think piece

MS: Let’s all brain storm if you have any ideas and you’d find something to write about. Maybe let’s think about it a bit and let it sit before we start writing

JG: Yeah, this takes a bit more time, usually we just jump on a couple of the current issues

JW: I can also check with Framework team to get some topics in that are current and someone from the team or a guest writer can chime in once I have found a few issues to write about. and learn more about the internals of Ember if they’re interested.  I’d love to see more of the in-depth write ups about what was worked on and why it was worked on


### Retro of 3.10 Guides

RM: For a certain reason we couldn’t link back to the built-in helpers correctly from the Guides. What happened and what can we do to prevent this in the feature?

CM: What does the process currently look like?

JW: The best for us to prevent this is to make sure that track RFCs correctly for learning team work in the RFC tracking issues. We currently have 20 outstanding RFC tracking issues and I think we really need to get through the rest of that backlog

RM: The API Docs only show curly braces so far, so even if we decide that we have the current release period to do the Guides, we’d still need a patch release

CM: If someone is released in an Ember version, it should be automatically documented in the API, no?

RM: Yeah, that should be true

CM: I’m just wondering: what was the blocker in this situation specifically? Was there a PR missing that needed to be merged before the release?

RM: Yeah, let me check. But in general: The way the internals work, for link-to it’s one way, where we use the positional params and we need to map that to a name. And this wasn’t done ideally. So we had to add a named arg instead and some more additional API changes. https://github.com/emberjs/ember.js/pull/17735

CM: Is there something that we can do, like an extra review step or is this just something where we have to keep an eye on?

JW: Most of these issues should really be catched by changes introduced by RFCs and the related RFC tracking

DB: It was really rushed, that was the issue with the release

MS: And we need to coordinate with the other teams, e.g. with Katie before she does the Ember release. I think we’re missing a long-term strategy for making this work for our team. We had trouble to keep tracking all the different things that we want to do and put into action. Maybe we should be thinking about core learning team responsibilities that are done by everyone and side responsibilities. What do we think about that?

RM: I think we can explore that. But also there's also another issue. Because not everything is a RFC implementation and therefore might get missed. Maybe there’s a technical solution we could find for the problem. I think we need a mix of processes and technological checks.

JW: There are tests in the EmberJS repo now that check the built output of the docs. This might be an opportunity to do automatic checks for missing documentation keys of parts of the API.

MS: We have to check in the framework meeting upfront: “Did we ship the documentation for this?”

DB: People who write the code need also support us in this effort, because we might miss other things and fall behind in the future as well.

JW: To summarise, let’s finish up the RFC tracking issues and this will already catch most of the work to be done and is easy to review before a release to define if documentation for a feature x has been shipped or not and if therefore the release is good to go.

RM: We need to ask for release blocking when docs are not finished yet to create an understanding for the process and how it can be changed.

CM: Do we have a beta of the API Docs? That’d be useful for us to keep tracking these issues and have a discussion point before the release.

RM: If you can have docs for different release versions that’d be really useful

JW; I think Siva and Todd are already on it, who wants to chime in can ask them

SK: Anyone can build the docs for any version of ember and ember data on their local machine by following the instructions on the ember-jsonapi-docs repo & view the output on their local api docs app


### Main HTML element

RM: Web pages need at least one landmark, e.g. `<main>`  according to accessibility guidelines. One suggestion: Put a main into `index.html` via blueprint. Problem: user has no ability to change / update position of `main` anymore.  Alternatively, put `main` into `application.hbs` around welcome page component. Therefore users still have some flexibility and we have some sound default for those who create a new app from scratch. With this solution on the other hand, they might also skip the welcome page part when they create an app and the modification adding the landmark.

MS: Yeah, doing so in the application blueprint makes most sense. Let’s talk about it after the meeting

RM: Sounds good

_After the meeting_
RM: See also the discussion at https://github.com/ember-cli/ember-welcome-page/pull/156#discussion_r291158013. This should ultimately be an RFC, along with the `lang`attribute, maybe?

MS: See also https://github.com/ember-cli/ember-cli/issues/8599
