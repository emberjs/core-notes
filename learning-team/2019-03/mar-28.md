# Learn Team Agenda 2019-03-28

Facilitator: JJ

## Topics

- Review last week’s action items
- [x] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions)
- [x] Find new facilitator for post-EmberConf @Amy L
- [ ] Heroku http to https redirect hitting heroku directly, @Chris M write as issue, then notify @ Todd and @ Siva

- House cleaning
  - https://github.com/ember-learn/statusboard/pull/71
  - https://github.com/ember-learn/guides-app
  - :skull: https://github.com/ember-learn/glimmer-styleguide
- Question from Data team: What does the learning team need to consider packages having fully landed? https://github.com/emberjs/rfc-tracking/issues/11 and RFC https://github.com/emberjs/rfcs/pull/0395
- Redirects for Ember Octane Guides

## Action Items

- [x] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions) @jessica
- [x] Archive glimmer-styleguide https://github.com/ember-learn/glimmer-styleguide @Jennifer W
- [ ] Write up an issue to describe approach on how to make Ember Data Guides happen @Jennifer W
- [ ] Talk to Robert about Ember CLI Netlify with Addons @Chris M
- [ ] open an issue about adding redirects @Jennifer W
- [ ] Move contribution guides repo to Ember Learn org @Jessica J


## Attendees (Initials: Name @Discord)

- [x] DB: David Baker (acorncom)
- [ ] TJ: Todd Jordan (todd.jordan)
- [x] JJ: Jessica Jordan (jessica)
- [x] SK: Siva Kailasam (Siva)
- [ ] AL: Amy Lam (amyrlam)
- [x] CM: Chris Manson (Chris Manson)
- [ ] RM: Ricardo Mendes (locks)
- [ ] LS: Leah Silber (wifelette)
- [ ] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [x] KL: Kenneth Larsen (kennethlarsen)
- [x] JG: Jared Galanis (jared)
- [x] FS: Frédéric Soumaré (hakilebara)

## Public Notes/Minutes

### Intro
- *reviewing todo items from last week*
- CM: let’s discuss when we can meet again to populate Airtable with priorities discussed on last F2F


### House Cleaning

- JJ: Does anyone have updates on this topic?
- CM: There was a PR to Guides App, but it doesn’t seem to have been in the right repo and I moved it. I have no idea about the status of the other projects, e.g. status board
- JW: I did cleanup in the Guides Source repo, I couple of PRs are still left. I’m going through the issues backlog (< 80) and now I have a better sense of the priorities. I feel we should re-triage to direct community efforts to work on the project better
- CM: Maybe it would be good to set priority labels
- FS: I created this document for a better overview of open issues and PRs in Ember: https://docs.google.com/spreadsheets/d/1sPyN9z9wZMpTNwqCfa6R9QSPZkIW4iQd-H4gZC7ILLk/edit#gid=0 These are PRs that haven’t been active in at least a week for different projects regarding documentation. We could also track more activity statistics over time
- CM: I’d like to work on this with you to make it more useful, maybe we can get more stats out of it
- JW: Issue triaging is important, but I think PRs reviews and merging are more crucial
- JW: Ok, let’s not close issues for the Guides Source repo, but let’s rather repriotize them
- JW: We sometimes have PRs with very long lived branches. Opinions on how to handle those?
- CM: Sometimes people use these to test things. For example I tested stuff on netlify with these feature branch WIP PRs. 2 ways to avoid this: either more encouragement for PR authors to close / merge these long-lived branches or moving these topics back into an issue until they’re ready to be merged
- JW: We should close some of these, I’m also looking at mine
- CM: Agreed
- CM: Question: What is Glimmer StyleGuide?
- JW: It was the precursor of the Ember StyleGuide. We learned that there were enough browser incompatibility issues that we kind of discontinued this issue. Let’s archive it, I’m doing it right now
- CM: Is it used anywhere, e.g. the blog?
- JW: No, I don’t think so. We checked, but archiving shouldn’t affect this anyways
- DB: We had issues with the old Style Guide being used and accidentally being removed before, but it should be good to archive now


### Ember Data Packages

- KL: There’s an RFC for Ember Data package modules. Chris T was asking in regards to that what the learning team considers as delivered and documentable
- DB: Ember Twiddle is hard to sustain for future releases of Ember, hard to maintain due to technical constraints. Maybe codesandbox will be an alternative in the future, since the platform has matured a lot recently
- KL: Ember Twiddle used Ember Data releases in the past already
- KL: It would be good to update Guides and API docs, if there’s more, feel free to mention in the tracking issue
- JW: It would be good to add some of the stats on how this affects releases
- KL: What about a separate Ember Data Guides and when could it be delivered?
- JW: It’s on the agenda, but it would be good to transfer tutorials first. We started with the prep for Ember Data to be separated out of the Guides
- CM: I agree, let's finish the tutorial first and then we have more knowledge and an easier time to extract the Ember Data Guides
- JW: We should revisit this when we repopulate the Airtable and the priorities
- JW: I think we should also teach a reduced feature set for Ember Data to help people with learning curve and debugging. I’d like to rewrite the Ember Data Guides with this goal. Ideas how to?
- DB: We should just get something drafty out soon and iterate
- CM: Someone from Intercom has more insight in what to change rewriting one of their apps in Ember Octane, also my mentee would be really interested to help out. I’ll put them into your direction
- JW: I’ve only written a bit about Ember Data, so I might to have a certain view
- KL: Ember Data Identifiers might completely change the learning story, going away from Models
- JW: When is it ready?
- KL: Dunno
- FS: How does the process exactly look like with the whole Guides project?
- JW: I guess right after the tutorials are extracted out
- DB: Probably we need versioning with the big changes coming up for Ember Data. That’s different compared to the CLI Guides
- JW: Yeah, err on the side of versioning as well
- DB: Gives people greater assurance for using their Ember Data version
- JW: Agreed
- DB: We need to really focus on what we have today
- KL: There’s a lot of writing on the RFC about documentation efforts as well
- JW: Add an issue for the thought process as reference. I can do that


### Redirect to the Ember Octane Guides

- JW: preview page is up, but how do we make redirects happen. We need to not make urls of old references break. How much work would it be to put in these redirects and what do we need?
- CM: This is a question for Infrastructure: Do we start putting the work in or do we need to clear questions beforehand to find out how the format looks like?
- CM: Each Guide is a Markdown file. We don’t use the yaml config apart from the redirects. You can have empty Markdown files with the config for the redirect only. It would be important to have the netlify redirects to be inferred from the frontmatter config, so the update of the redirects is not manual labour anymore. Already discussed with Robert Wagner, the maintainer of ember-cli-netlify on what we can do to update this generally. We can already get started to setup these configurations for the redirects today which become active once the netlify issue is resolved. Those files that are only used for the redirects are not listed in `pages.yml`
- JW: If we don’t do the netlify thing yet, we can still ship?
- CM: Yeah, it would just be a SEO and performance improvement that we get from resolving the netlify redirects, but it’s not a necessity for shipping
- CM: We also should have some tests for the redirects to ensure there are no 404s
- JW: Agreed



### More Updates

- FS: I’ll be working on https://github.com/ember-learn/ember-styleguide/pull/113 this week
- JJ: Started a repo for contribution guides, need to move it to ember-learn org and writeup issues for contributors to pick up
