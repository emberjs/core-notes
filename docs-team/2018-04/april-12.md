# Learn Team Agenda 2018-04-12

## Topics

- The Emberjs.com Blog.
- Things of note for Ember Learn writeup in The Ember.js Times? (AL)
- Deprecations app (RM)
- EmberCamp Chicago
- Ember Guides next phase
- Mission Statement Follow-up:
  - “Empowering Ember users to learn, build, and teach.”
- Broccoli.js website & tutorials (Oli)

## Action Items

- [x] @Chris M send on the email from mike at Percy to Leah and get that sorted
- [ ] @Jessica J Start trying out Browser Stack on Website
- [x] @Melanie S add guidelines for blog posts
- [x] @Melanie S and @Chris M talk about emberifying the blog
- [ ] @Jennifer W and @Chris M follow up about maybe updating the “loop process” of adding a new deprecation
- [x] @sivakumar k and @Chris M follow up about getting Serena’s script in CI (or something)
- [ ] @Chris M to help fix the current deprecations issues
- [x] @Chris M follow up with @Amy L to get the search working on deprecations … @Chris M 👋 let me know if want to get something on the calendar, I know timezones are tricky!

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- CM: Chris Manson @real_ate
- MelS: Melanie Sumner @
- JW: Jen Weber @jenweber
- AM: Amy Lam @amyrlam
- RM: Ricardo Mendes @locks
- JJ: Jessica Jordan @jessica

### Notes

#### Emberjs com blog
  - it’s a bit of a mess - does someone want to jump into middleware
  - it would be nice to cross-post ember times
    - JJ: worried that it would add overhead - more work
    - unknown amount of work
    - MelS: let’s try and make one for a past issue
  - CM: Blog feels like release announcement vehicle
  - MelS: Not just for releases we could totally use it
  - CM: would be cool to know what and who can post, because I think folks (including me) could contribute.
  - MelS: Currently Core team members can crosspost.  I agree that we need to share processes around getting stuff out there.  Lets make it an action item.
  - CM: on the topic of emberifying infrastructure, I’ve been thinking the ember-casper stuff I’ve been doing is something that could be used for the blog

#### Deprecations App
- CM: locks put in notes in the agenda. There’s a difference between ids that’s creating a problem.  We have full control on the deprecations side, but need to know what the actual problem is.  I told rwjblue to make it work how he wants and we can adapt.  May be a matter of deciding how it should work from core team.
- JW: usually deprecations have an id, chosen by author, and they are in special blocks in the source code that gives the message link in the console.  The id and the url are both things in the block in the source code. 2 ways to affect, change the website or change the url/fill in in the source.  If there’s a mismatch then go with what’s in the source, because you have to wait until the next release if you change the source.
- CM: a few odd problems, in the way its getting deployed, when you do a pr on the deprecations app you can’t test it properly on the pr, bc its not hosted statically enough to go to the deprecation.  part of the problem is the heroku proxy in front of the static thing.  I want to improve deployment.
- JW: we can use some kind of link checker.
- CM: its much more deterministic than it used to be. now we can determine the url from the id, so maybe the “loop” way of doing deprecations is legacy.
- JW: i feel like there are multiple ways to get to matching ids.
- CM: first we need to get the ones that are currently broken fixed.  I can fix them in the deprecation app today.
- SK: I think serena has a script to generate urls for any deprecations that are out there.
- CM: not as relevant because we have 2 problems.  when we launch originally and wanted to make current ones were still working was one thing, but there’s a new problem for new links.  but we might be able to incorporate a new script into ci to check things.
- SK: ok will follow up.
-
- Ember Learn for Ember Times
- AL any topics?  I know there was something with discourse we could link to.
- TJ: yeah wasn’t there a PR of switching disqus to disource we could link to?
- JW: yeah lets get validation from locks before we do
- CM: Also, we are in the process of cleaning up the prs in the current guides. maybe its time to announce to folks with open prs to work with us to help get things merged.
- JJ: I think we could do that
- CM: I’d like to make a public project to triage these prs, we could put that link there.  if i can do it this week we could do it next.  Could someone with permission create a public project on emberjs?  it might take a little time.
- JW: I appear to have necessary permissions but I’d like to get confirmation maybe from locks that its the right thing.  Also we can write about the minibook in progress.  Not quite ready yet but in the near future.

#### EmberCamp Chicago
- MelS: Scheduled for September 21, haven’t announced yet, but you’ve heard it first 🙂 gonna be at jpmc downtown chicago.

#### Ember Guides Next Phase

- CM: we have a board on ember learn that’s a release checklist.  Still 2 pr that needs review (deployment pr).  If that could get reviewed/merged great.  Then we are back in in the listed topics. https://github.com/orgs/ember-learn/projects/7
- CM: if we could just talk about whether we are ok with those steps then we could move forward.  May need to pull plug on some stale ones.  I think its a good staged approach and a way to do it methodically without breaking things.  waiting to pull the trigger!

#### Mission Statement
- CM: would like to go with one we are mostly happy with, and then have a process to edit change that would be an rfc style.
- MelS: that’s great. I think you are spot on.  The one the Jen proposed last week.  Do we like Jen’s enough to vote on it?
- JW: lets put it in Learning and Friends and take an informal poll.

#### Broccoli Documenation
- CM: reached out to Oli today bc I was doning some broccolli stuff.  There are 2 tutorials to be had for broccoli how to use a brocfile and how to write a plugin.  We can do a node school for plugin writing.
- MelS: can we put the ember style guide call for help in the tutorial this week.
