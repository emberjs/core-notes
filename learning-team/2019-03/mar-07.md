# Learn Team Agenda 2019-03-07
Facilitator: AL

## Topics
- Review last week’s action items 
- Review Airtable tasks 
- Motion to FCP to merge - Contributor’s Guide (JW) https://github.com/emberjs/rfcs/pull/446 
- Survey update (Joe JT, if he can join).
- Guides Landing Page - final thoughts? Merge or close? (JW) https://github.com/ember-learn/guides-source/pull/535
- Final countdown for EmberConf! Summarizing the state of the docs (JW)
- RFC tracking - gotta do something about https://github.com/emberjs/rfc-tracking/issues (JW)
- Website Update (CM)

## Action Items 
- [x] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions) AL
- [x] On our last meeting before octane let’s make an accurate summary of the state of the documentation for notes for keynote AL
- [ ] Everyone - try out Octane and/or watch Gavin’s video! 
- [ ] CM will work with SK to set up the Octane url
- [ ] Ask for consensus on merging Contributor Guides RFC JJ
- [ ] Banner for the Octane Guides - JW deadline for next week!
- [ ] Make issues for Contributor Workshop! @ everyone
- [ ] Review new website. @ everyone
- [ ] All core team members - Add content to the Learning Team F2F Agenda https://github.com/ember-learn/agendas

## Attendees (Initials: Name @Discord)
- [ ] DB: David Baker (acorncom)
- [ ] TJ: Todd Jordan (todd.jordan)
- [x] JJ: Jessica Jordan (jessica)
- [ ] SK: Siva Kailasam (Siva)
- [x] AL: Amy Lam (amyrlam)
- [ ] TL: Terence Lee (hone)
- [x] CM: Chris Manson (Chris Manson)
- [ ] RM: Ricardo Mendes (locks)
- [ ] LS: Leah Silber (wifelette)
- [ ] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [x] DM: Dan Monroe (danmonroe)
- [x] CG: Chris Garrett
- [x] J: Joseph
- [x] EF: Eli Flanagan (efx)
- [x] KL: Kenneth Larsen
- [x] JD: James Davis (jamescdavis)

## Notes

### Review last week’s action items 

- Put together a plan for video content production before EmberConf. CM not going to be able to be done before EmberConf. Have started talking to people like Gavin for help in the future. He has done a lot of great videos and is very motivated to help. AL moved to post-conf agenda.

- Chat about “submit your own whitepaper” style of project showcase data - Question based CM JJ … CM not going to be able to be done before EmberConf. AL moved to post-conf agenda.

- Create an issue that describes the decision around the class syntax documentation and make sure that CG is aware of this issue, MS also ping Michael North and Chris Krycho 👍 
  - CG we are going with class syntax for everything except classic components. There are some edge cases where class syntax can’t be used. See Dropbox Paper Resolution to Native/Classic Class Interop. 

- Everyone - Try out the WIP Octane preview! https://github.com/ember-cli/ember-octane-blueprint/ 
  - JW - Gavin made a YouTube video about Octane. EF - has tested the blueprint from ppcano. CM - Gavin’s video uses class syntax. But has some edge cases where it can’t be used. 

- Create issues that convert code blocks to Glimmer/Octane (if needed) 
  - JW made issues and got a ton of PR’s in! May repeat this weekend. If anyone has a plan, ppl will swarm if it’s scoped well. CM “activating the fire hose”. EF - formalization of having the contributor guide landing page will help.

- Reach out to Siva and Todd about moving the api docs to a subdomain CM 
  - CM - will work on this week. Is now a super blocker. JW - pinged Siva this morning. CM work with Siva to make it happen.

### Review Airtable tasks 

  - AL added this to agenda template in Dropbox Paper.

### Motion to FCP to merge - Contributor’s Guide (JW) https://github.com/emberjs/rfcs/pull/446 

  - JJ and JW: get consensus to merge this weekend, adding action item. Core members - feel free to give official GitHub review.
  
### Survey update (JT)

- JT survey has hit done well. Was previously done by 201 Created, this is the first time being done by the Learning Team. In the future, this will be handled by the Learning Team. 
- Lots of help circulating this to the community. Going well. Reaching out directly we’ve been flagged as spam on Discord and Meetup. Next year, should think ahead and be mindful of spam filters etc. on Meetup. It was a barrier.
- Short-term help? Getting the results up to the website once everything has come in on 3/12 next week. 
- CM - When is the actual date it ends? 3/12 midnight GMT. 
- CM - Getting it up on the site plan? JT deploy results weekend prior to EmberConf. CM and JT pair.
- Ends March 12th at midnight GMT

### Guides Landing Page - final thoughts? Merge or close? (JW) https://github.com/ember-learn/guides-source/pull/535

- CM had one comment, we need to make sure indexes (pages.yml) are correct before merge. Our CI doesn’t have the YAML checker enabled for guidemaker. Should eventually get that on. 
- JW our test suite does not catch all invalid URLs. Open deployment preview and test out new URLs manually to see if they work. 
- CM instead of fixing it add to the test. CM JW.
  
### Final countdown for EmberConf! Summarizing the state of the docs

- JW - Main push for doing the Octane docs is to invite ppl to try out the preview of Octane. Will be pushing hard to add more for MVP. CG - We are pretty close, finish components today then at MVP. Classic stuff needs to be fleshed out but the basics will be there. Ping Tom and Yehuda. 
- JW - Anything we absolutely have to do the next week?
  - New guides, set up URL
  - CM notes MS said absolutely must be banner on the new site. 
  - CM we are still planning to launch the website before EmberConf. 
  - JW - Need everyone to write issues for the EmberConf Contributors Workshop. Tag issues as “good for new contributors”. Try to close out issues that are resolved / stale. Review from the help wanted app.
  - JW - Still looking for more mentees for the EmberConf mentor/mentee workshop (ppl newish to Ember or EmberConf) 
  - JW - As a reminder Core Team F2F will be on Thursday, please block out your calendars. 

### RFC tracking - gotta do something about https://github.com/emberjs/rfc-tracking/issues (JW)

- What we will need to do is for each issue, assess what work the Learning Team needs to do. JW will take first pass. 
- Assess if the “How we teach this” is sufficient for each issue. 
- Confusion about what belongs in API docs vs. guides. If something describes how the pieces fit together, belongs in the guides. Something that can be described in isolation e.g. this is a built in helper, here’s what it does…put in API docs.
- We should get something in writing at the LT F2F.
- If anyone is available, look at the RFC tracking issues! One brief triage before EmberConf, can be done by anyone doesn’t have to be Core.

### Website Update (CM)

- CM there is a LOT going on. Here is the link: https://ember-beta-website.netlify.com/. Have used Percy to get pixel to pixel match.
- api.emberjs.com, blog.emberjs.com, these need to be created
- https://ember-blog-legacy.netlify.com/
- Website will be a new repo, fork of old website. Will be tricky determining when to cut off adding/merging things to the new website. 
- Ember Times and blog, stick to old website for now.
- Already discussed CM needs help with the API move. 
- When all is done, have the ability to switch on DNS. Do this over the weekend. Don’t tweet it out, have some time between going live and EmberConf so some buffer. 
- Put new Ember Times PR (next week) on new repo.

### ember data section class syntax ember-learn/guides-source#553

- EF following up in #dev-ember-learning with CG and JW
- PR converts most guides/release/models files to use class syntax with a few exceptions that I noted in the PR or other issues
