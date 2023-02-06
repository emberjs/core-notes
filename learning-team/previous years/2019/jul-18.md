# 2019-07-18

Facilitator & Note Taker: Jen Weber

## Today's Topics

- (notice) Shared Email from Netlify about 500 errors
- CM guides "many refresh" problem update
- JW or CM Deprecations app update
- How is PR panda going for Guides? (re: action item to add it last week)
    - Stalebot (AL)
- Website Redesign Update
- Isaac has a question
- Discussion about external maintainers & triage role (deferred from last week)

## Attendees

- [x]  Chris Manson (CM)
- [x]  Amy Lam (AL)
- [x]  Ricard Mendes (RM)
- [ ]  Jessica Jordan (JJ)
- [x]  Sivakumar Kailasam (SK)
- [x]  Fréderic (FS)
- [x]  Matt Gardner (MG)
- [x]  Preston (P)
- [ ]  Melanie Sumner (MS)
- [x]  Jen Weber (JW)
- [x]  Kenneth Larsen (KL)
- [ ]  David Baker (DB)
- [ ]  Robert Wagner (RW)
- [x]  Isaac Lee (IL)
- [x]  Leah Silber (LS)
- [x]  Todd Jordan (TJ)

## Action Items

- [ ]  Facilitator (JW) to add notes to [core-notes GitHub repo](https://github.com/emberjs/core-notes/)
- [ ]  To-do...
- [ ]  Try adding Embroider to Guides tests (non failing)
- [ ]  CM and MS will meet to hand over Mel’s champion items
- [ ]  
- [ ]  JW - boilerplate in RFC tracking
- [x]  JW - add my projects to the project board
- [x]  ???? CM will research using Azure and will make a plan for what to do if he doesn’t get to it (not doing this actively but open for consideration)
- [x]  CM - reaching out to people to get their initiatives added to the board
- [x]  For next week's agenda - go over the project board for real, add things that are missing if needed (10 mins blocked out for each of  the next 2 meetings)
- [x]  JW - ask Amy which repos stalebot is active for
- [ ]  CM - review [https://github.com/ember-learn/ember-styleguide/pull/130](https://github.com/ember-learn/ember-styleguide/pull/130)
- [ ]  CM/JW finish off stale PRs in the spreadsheet that we are the authors of (plus Mel)
- [ ]  TJ/JW - do some RFC tracking reviews
- [x]  JW - will share a guides PR with the Times
- [x]  Next week's agenda - Netlify 500 revisited
- [x]  KL: review [https://github.com/empress/guidemaker/pull/18](https://github.com/empress/guidemaker/pull/18)
- [ ]  JW: ask who is willing to be a code owner on the Guides so we can try Pull Panda
- [x]  CM: ask if the website channel can be open
- [ ]  JW - update and share the octane ship date blog post
- [x]  JW - ask the team to review Issac's proposal
- [x]  Next week's agenda - showing working group/strike teams on the website
- [ ]  JW - PR to the handbook for the community maintainer
- [ ]  JW - add these core team notes to the handbook

## Minutes

- Draft PRs get skipped in the tracking doc now, yay! Thanks to @hakilebara
- Initiatives board is up! Thanks @real_ate. Everyone needs to add their initiatives
- LS: GitHub Pull Requests will show you in VSCode what's open and needs review! Might be helpful
- JW: Any other tools that people find useful for PR reviews?
- CM: I like Octobox too
- RM: notification heavy, so I'm working on a Triage Board app

Netlify

- CM: we are using extraneous query params in our requests, which we can remove and maybe this will fix things. If there are more bugs, we need to decide whether we want a fix or for them to take a few days to debug. Recommendation that we fix the QPs first and then see what happens
- CM: This needs a reviewer [https://github.com/empress/guidemaker/pull/18](https://github.com/empress/guidemaker/pull/18)
- KL: I'll help!

Guides refresh "many request" problem

- CM: It's an Ember CLI/broccoli issue. Now we can fix it! Soon the page will refresh very quickly when developing locally
- broccoli-static-site-json PR that showed the issue we had with multiple refreshes: [https://github.com/empress/broccoli-static-site-json/pull/30](https://github.com/empress/broccoli-static-site-json/pull/30)

Deprecations app update

- CM and JW paired on it
- Root cause was Native Class Conversion
    - Reverted and things seem better now
- JW: My opinion is to not go to Native Classes and do Octane when it's out, but we can use the native classes PR as a guide
- CM: It's a good test of the upgrade strategy guide too

Stalebot

- AL: it's on Ember blog and website now! It's a reminder for us, especially because these repos are lower traffic
- AL: If we do code owners, pull panda would work

Website redesign update

- CM: Gillan and Florian are working on the design system. Website redesign meetings are restarted on Thursdays. See redesign channel for more details. Making good progress
- JW: still aiming to ship around/by Octane?
- CM: yes

Testing

- IL: Proposed a restructuring of the Testing guides!
- CM: have made some progress on nested guides but not shipped yet

Community maintainers

- JW - community maintainers proposal. Feedback?
- FS - will people show up on the website?
- JW: I want this to be the case. Someone was working on this...
- CM - don't want website disagreement to block creating a triage team. Having a way to opt in is baked into GitHub
- AL: Siva says he will discuss next week