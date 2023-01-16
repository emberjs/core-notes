# Learn Team Agenda 2019-04-04

Facilitator: @Jessica J

## Topics

- Go through last week’s action items
- Go through the list of things we said we’d do after EmberConf:
  - Editing pass to apply the Ember Guides styleguide to existing content
  - Enforcing the Ember Guides Styleguide (plan to create tests)
  - Need to start reviewing RFCS. Who/How/When? It’s part of core team responsibilities and we aren’t doing it - scheduled for next week
  - Need to go through the RFC tracking Project and weigh in on what work needs to be done, link issues, etc. https://github.com/emberjs/rfc-tracking and  https://github.com/orgs/emberjs/projects/3  
  - The Octane Strike team wants to know… would it be feasible to show @tracked in the Guides before Octane is shipped? Similar to how we did Angle Brackets? They are wondering how much work it would take and any issues with doing this ahead of the release.
  - Forming a working group to handle devops/infra work, specifically the problems with our Netlify deployment being blocked in Russia. We could maybe use Fastly? Maybe ping them before starting into lots of work? Loop in Siva
  - Retrospective - how did Octane go? What did we do well? What could we do better? What should we try next time?
  - Community Survey as an internal app
- Add a link to the Octane preview? https://github.com/ember-learn/ember-styleguide/pull/152
- PRs older than a week app review (add this to the template?)
- GitHub review flow - should branches be up to date?


## Action Items

- [ ] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions)
- [x] The facilitator finds a new facilitator: Thank you @Jennifer W
- [ ] Talk to Robert about Ember CLI Netlify with Addons @Chris M
- [x] open an issue about adding redirects @Jennifer W https://github.com/ember-learn/guides-source/issues/719
- [x] Move contribution guides repo to Ember Learn org @Jessica J
- [ ] Take a look at the documentation for deployment in the handbook and make sure it’s up to date @Chris M
- [ ] CM: Put together a plan for video content production. CM has started talking to people like Gavin for help in the future. He has done a lot of great videos and is very motivated to help.
- [ ] CM JJ: Chat about “submit your own whitepaper” style of project showcase data - Question based.

## Attendees (Initials: Name @slack-id)

- [x] DB: David Baker (acorncom)
- [x] TJ: Todd Jordan (todd.jordan)
- [x] JJ: Jessica Jordan (jessica)
- [ ] SK: Siva Kailasam (Siva)
- [x] AL: Amy Lam (amyrlam)
- [x] CM: Chris Manson (Chris Manson)
- [x] RM: Ricardo Mendes (locks)
- [ ] LS: Leah Silber (wifelette)
- [x] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [ ] KL: Kenneth Larsen (kennethlarsen)
- [x] JG: Jared Galanis (jared)
- [x] FS: Frédéric Soumaré (hakilebara)
- [x] DM: Dan Monroe (danmonroe)
- [x] RW: Robert Wagner (rwwagner90)
- [x] CG Chris Garrett (pzuraq)


## Notes

### Intro

- Jen is next week’s facilitator
- Editing pass on Ember Guides  + Tests
- JW: I’ll add the action item to do an editing pass on the Guides to the Airtable to re-discuss when content has settled

### Review RFCs

- CM: Chatted with Katie about the [tracking RFCs repo](https://github.com/emberjs/rfc-tracking): each RFC needs feedback from learning team
- TJ: Would be good if at least one person from the learning was assigned to each RFC
- MS: I’m not so much in favour of assigning, we should be conscious of energy reserving and not adding more responsibility onto everyone
- TJ: Maybe less of an assignment, rather for someone to be responsive in regards to question about it. More as a point of contact
- CM: It could be the same thing that we do with rotating facilitators in the learning meetings. We could also do the process of reviewing RFCs, writing issues, etc. in collaboration e.g. as pairs
- MS: I think we just need to be mindful about this chore work like reviewing RFCs. Maybe we should think about how to keep the chore work in consciousness
- TJ: Maybe we should create a standing section in each meeting and then people can sign up for it
Several people: Yeah sounds good
- JW: We could also rotate the responsibility of a week by week basis. But I like the idea to take a look a together in the meeting, too. It’s important to keep track, we should all be aware of it as it impacts many different projects, e.g. Ember Times, Guides, etc.
- TJ: We should do it in a meeting and timebox it
- JW: Let’s have a dedicated meeting to go through the backlog and people could pick out a few
- JW: Let’s do a RFC review meeting without any preparation required next Thursday during the learning meeting and go through the backlog and see how this meeting kind goes

### Time Point for highlighting @tracked feature in the Guides

- JW: I think it’s difficult to do so without the full Octane feature set out in Ember yet
- CG: @tracked can be used in classic classes, too, so it doesn’t require every code example to be updated to native classes. 3.10 release will also have decorators land
- MS: But tracked is not enabled right now?
- CG: Yeah we do not have tracked properties and auto tracking yet
- MS: Let’s revisit in a couple of weeks when new features discussed just now have settled
- JW: I’ll write an issue for it to remind us

### Netlify Deployment Issues and Infra in General

- CM: It’s good now and we should stick to the current setup that we have now
- MS: Do we have this documented somewhere in the handbook? It’d be good to have it written down there to be more explicit about our process. We could also have an action item
- CM: Yeah, let’s have an action item for that, I’ll write one down

### Octane Retrospective

- JW: It’d be cool to go one question at a time and hear everyone’s opinion

#### What did we do well?

- MS - writing issues to get the community to help! Good calls to action
- CM - very clear about tech requirements upfront, enabled the actual work to happen
- JJ - had the feeling that the learning team was kept in the loop about what the framework team was doing. Pushed to further communication between the teams
- DB - the goal to ship quickly went well. Liked having things merged and then revised as we went
- TJ - did better than any other EmberConf

#### What could have gone better?

- CM - flip side of requirements, slow build times when running locally got de-prioritised. Would have maybe done a small fix if we could go back in time
- DB - decision tracking
- CG - good for transparency. Event handling (actions) ended up messy, in terms of the “happy path” learning story, and confused users.
- JW - the huge rush at the end prevents people from contributing meaningfully when they have other commitments
- MS - being better at breaking down blockers. Need to be more self-aware of whether we are blocking things


#### What should we do next time?

- DB - decision tracking should go somewhere
- JW - put summary decisions in a wiki. Have a meeting at the start of the next Edition where we hash out a process that paces out work better
- CG - on the framework team, we do better to write docs along the way

### Community Survey App

- MS: My husband helped with the survey this year and we realised the process could be much more stable for the future. We can more involvement from other community members to improve the data science. Big kudos to Amy for doing the outreach to companies (btw we should also clean up the list of companies using Ember, turned out during the survey that some of them are not up-to-date users anymore). Should we put it into the website and how do we do so in a question of the technology (e.g. separate app, Ember Engines). Let’s revisit this once the website revamp has landed?
- JJ: Yeah, that seems feasible to me, too
- CM: It might be good to make the survey process and tools available to others as well - a great contribution!
- MS: Let’s think about ways to multiplying this work, for example Chris’ with the website. Let’s empower more people. Let’s also focus our efforts in a few areas and don’t spread ourselves too thin. Let’s keep an eye out for someone who would for example like to pick this topic up
- DB: What kind of person would you find useful to work with?
- CM: Enthusiasm is key
- FS: It’d be good to have a call out somewhere, e.g. in Discord and get more creative people in as well
- AL: Another thing about the survey: Did we do a blog or an announcement at EmberConf? We should be doing this! So people feel that it’s worth to fill the survey out in the first place. After publishing and highlighting the results, people might even feel compelled to contribute their time working on it. Should it be a blog post?
- MS: If someone is willing to write a blog post?
- AL: I can help with that, maybe a Ember Times bit
- AL: It’s tough to update Ember users indeed, it’s like this CMS system that’s difficult to manage already. This is itself could be its own project
- MS: We have Dianna join us, she has marketing expertise. And she might be able to facilitate this as well
- JJ: Yeah let’s make it part of the Ember Times. I can help with that, too
- AL: Yeah, this way we actually get it done
- JW: To me it feels it’d be useful to review the survey ourselves for the info
- RM: We also did that the previous years for checking results
