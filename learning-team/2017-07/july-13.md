# Learn Team Agenda 7/13

## Topics
- [EmberWatch / Rusty Dash](#emberwatch--rusty-dash)
- [Ember Rolodex](#ember-rolodex)
- [Reorganizing contents of website](#reorganizing-contents-of-website)
- [Improving new contributors experience](#improving-new-contributors-experience)
- [API docs](#api-docs)
- [Moving from disqus to discourse for comments section on the blog](#moving-from-disqus-to-discourse-for-comments-section-on-the-blog)

## Action Items
- DB: Will keep working on reworking Middleman build process 
- DB: Infrastructure blog post
- YB: clean up the tutorial PR to the website 
- RM, KG: Pair on proposed Guides ToC  (after ember camp) 
- RT: ping eviltrout about discourse+blog integration
- RM: Let contributors of #emberwatch know about its repurpose on slack channel.

## Minutes

### Attendees (Initials: Name @slack-id)
- RM: Richardo Mendes
- SK: Sivakumar Kailasam @siva
- TL: Terence Lee, @hone
- RT: Ryan Tablada, @rtablada
- JW: Jen Weber, @jenweber
- PI: Patsy Issa, @patsy-issa

### Notes

#### EmberWatch / Rusty Dash

RM: Emberwatch - blog posts, screencasts for ember that we took ownership of last year at emberconf but it needs to be 
decomissioned. https://rusty-dash.com/ is used by rust lang team to showcase rfcs, issues & other stats. 
nagbot(part of rusty dash) mails maintainers about issues, rfcs waiting on response. Repurpose emberwatch into an ember app
like rusty dash using parts of rusty dash.

PI: How do we deploy rusty dash?

RM: Its deployed to digital ocean & uses postgres. Shouldn’t be hard to port to heroku since we prefer them and 
they support this stack.

PI: Will take a look at rusty dash.

RM: We need to add stuff on top of rusty dash. 

SK: rusty dash codebase is built with rust team & their needs in mind, so should we contribute there or go our own way?

RM: we have folks on rust team who are willing to help out on modifying it for others to use. They're willing to move 
bots to individual repos. Volunteers can hop on to rust irc so that ricardo can start the conversation there & get things going there.

PI: will syncup with siva.

RM: We need to add disclaimers to emberwatch repos on its repurpose. Will give Patsy access if he doesn’t have it

PI: will take a look at ember watch repo. Have we given contributors a headsup?

RM: We can let folks know on #emberwatch channel on slack.


#### Ember Rolodex

RT: Will open an issue on this. Its ember w/o ember data. Will be addon heavy and it would try to teach best practices. 
We'll discuss what learning team wants to teach in terms of data flow in the tutorial on the issue. 

RM: Open the issue and we’ll get core and others to take a look.

RT: Opened https://github.com/rtablada/ember-rolodex/issues/3


#### Reorganizing contents of website

RM: Lets try to get tutorials outside of guides before end of the month. There will be three tutorials with ryan’s
being the intermediate one.

PI: would it help to teach about addon architecture in a tutorial.

RM: Possibly. There’s plan to bring cli & fastboot’s docs into main website. So in near future there might be 
forms of mixed tutorials. We should track this on the website repo.

RM: we want to have three different tracks on learn page. 
  1. prefer to see source code, check these apps
  2. want tutorials, go to different tutorials
  3. want guides & docs - link to them

RM: Initially didn’t have clear demarcation, so guides contains installation, tutorial & docs put together.
Need to come up with a better way of presenting this


#### Improving new contributors experience

JW: Have few folks who are ready to contribute but need ‘good for new contributors’ issue.

RM: Will need to talk to other learning team folks to figure out a good way to do this

JW: which issues can new contributors take on?

RM: we usually put up labels like ‘help wanted’ that we’d like others’ help with. they’re good to pick up on. 
We’re on slack mostly if people want to reach out

JW: how long do we wait for PRs to be reviewed & merged to get things moving?

RM: Depends. If its small it gets merged as it comes in.

JW: Would be great if first time contributors get their PRs merged quickly

RM: Please let us know if we don’t respond soon enough so that we can address it & encourage them

SK: should we set up the highfive(https://github.com/nrc/highfive) bot from rust ?

RM: lets discuss post meeting. https://thanks.rust-lang.org/ is something that’s weekly. we can fold into the newsletter.

SK: can we add a feature to see all first time contributor PRs across repos in rust dash and interact with them?

RM: if they don't have it already we should add it.

Others: Yeah might be worth considering

PI: featuring them w/o their consent on the dashboard or newsletter without their consent is something we might 
have to think about

RM: we can think about this and figure out a balance.

RM: Will talk to triage team about making sure new contributor contributions are addressed as quick as possible 
across repos


#### API docs

JW: where are we with glimmer components across our sites.

RM: we’re figuring out how to make it work with server side rendering without which there's a SEO impact

JW: Search was missing on api 

RM: Michael is working on it and it should be fixed in a week

JW: API docs seems to be slightly off on mobile

RM: that’s v2. we’re aware of some of those issues. we’ll ship fixes soon.

RM: We need all the help we can get when we do module unification changes & bundle imports on the API docs. 
We need to fix things on ember master. we can open PRs on guides but we can’t merge to master because it's connected 
to deployments. We’ll create a branch that’d be deployed as a separate app. 

JW: what is bundle import?

RM: instead of importing the global Ember object, you can import the actual scoped package class/functions. 
We need to see if its worth automating the migration of code block samples to new syntax. Will create an epic on this. 
https://github.com/ember-cli/ember-rfc176-data is the reference on the new syntax.


#### Moving from disqus to discourse for comments section on the blog

RM: we want to move comments section on blog posts from disqus to discourse

RT: will talk to eviltrout on how this can be done.
