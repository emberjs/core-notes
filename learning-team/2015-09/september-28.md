# Learn Team Agenda 9/28

## Topics

- TJ: RFC 176/ Api docs update
  - [API Docs Rename (RFC 176)](https://paper.dropbox.com/doc/API-Docs-Rename-RFC-176-B2cq8q3hwNbVpWsdNuhVS)
  - Show modules page, feedback
- RM: EPIC RANT. I’m kidding, let’s talk Hacktoberfest
- RM: Statusboard
- RM: CSS/Styleguide
- DB: Merge this PR? LGTM: https://github.com/ember-learn/ember-api-docs/pull/336

## Action Items


- [ ] RT: update on discourse+blog integration - backburner for RT, removing
- [ ] DB: Heroku blog post to launch by 2.16 DB- my focus now, dedicating time next week.
- [ ] RT: Write CORS Primer - backburner, removing for now
- [ ] RT: Write Rolodex/Contact Book Tutorial - still 2.16
- [x] JW: Reach out to sugarpirate about getting some blog posts into Ember Way (informal)
   - update 9-21 - haven’t heard back yet, will ping Lauren and/or other contributors again
   - update 9/28, sugarpirate says bring on the blog posts!
- [ ] JW: Chat with Tobias B about possibly piping Discourse Q&A into Stack Overflow. Ponder SO barriers and solutions. - update 9/21 - decided on involving a small number of people privately for Stack Octoberflow. Will reach out to them in the next week ish.  Update: currently swamped
- [x] RM, Teddy, Jessica: solicit contributors for js module (176) testing of ember inspector
- [x] SK: Test if api docs works on a smaller dyno level on staging & switch away from perf dyno for api docs
- [ ] SK: Help crates.io to move to Fastboot 💀 removing bc not directly relatable to learn time
- [x] RM: router service and `{{mount}}` proper documentation

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- SA: Sergio  Arbeo @serabe
- JJ: Jessica Jordan @jessica
- JG: Jared Galanis @jaredgalanis
- DB: David Baker @acorncom


Notes

#### API Docs

TJ: demoed progress

TJ: Got static functions listing on the modules page, along with classes, removed namespaces.  Currently have 3 branches (ember, jsonapi, api app).  Working on making the functions linkable next.  no reason why would couldn’t have a bare-bones implementation next week and then iterate on it from there. Would love feedback on the modules page.  Was leaning on splitting functions into subheadings with their individual packages.  (angular does something similar).

#### Hacktoberfest

RM: I’m concerned with us handling the influx of stuff coming out of hacktoberfest so I invited Sergio from the triage team to help with ideas.

SA: not many `good for new contributor` issues in ember.js at the moment so some of these secondary repos maybe want to publicize work.  I plan on spending some time soon taking a pass to see if what I can add the tags to.

SA: It may be good to have some point of contacts publicized for helping people set up environments.

TJ: yeah, guides is nortoriously hard to set up.  API docs is also difficult to run changes, but I do have a script.  Maybe next week I can merge that along with extra documentation.

SA: Typically a lot of PRs come in that are very small and would be good to try to stay on top of those and triage appropriatly.  A bunch come in the last week.

SA: issues can be tagged with `hacktober` and will show up for people looking to contribute.  I suggest we make a pass through our issues and tag this as well as `good for new contributors`

DB: I see a couple of our repos don’t have these so I can add.

TJ: I can look sometime next week at api-docs and tutorial to make add some digestible issues.  There may be work to be done with api docs around rfc 176.

#### Status board

RM: its deployed emberjs.com/statusboard.  We have hardcoded website styles which isn’t a good thing because when website styles change the statusbar styles are broken.  Need to do some additional cleanup and it should be good to go.  we need to figure out when to launch and what to add to the nav bar.

#### CSS/Styleguide

RM: We need to keep push on cleaning up to css and changing to modern patterns, esp. mobile support.

TJ: Are we looking for volunteers?

RM;  Yes!

DB: at meetup last night I ran into someone interested.  Runs a small design agency.  Considering commitment at the moment.  Stay tuned.

JT: I may have some time to do some work around it as well.

RM: would like to do a clean implementation and not reuse any current styles and work mobile-first and desktop friendly.  I’ve been using BEM.

#### Primer

JG: restructuring should be good to look at (solved issue with travis build).

RM: haven’t had a lot of time to properly review but do want to merge.  In general I want to make sure we don’t overexplain things and instead just point to existing documentation and focus on how it applies to ember.

JG: I should have some time late this week to tweak it some more based on that before you do a full review.

#### Ember Times

JJ: been working on an app to show new pr requests and ones that are merged so I don’t have to hunt around for it.  Working on it for this week and should have something for tomorrow!

#### Denver Code School

DB: There’s a codeschool in Denver that has some Ember advocates.  The instructor there has expressed some willingness to invest in guides over the long term.

RM: Do they teach Ember?

DB: They do not have an in-house curriculum, but they do teach some to it and allow students to do their projects in it.  This is one of the reasons he wants to invest, because he can develop curriculum to feed back to the school.



