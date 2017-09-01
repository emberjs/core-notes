# Learn Team Agenda 8/24


## Topics
- Status board (née Roadmap, née Dashboard)
- Search
- YUIDoc @modules
- Ember Inspector
- Ember Styleguide

## Action Items


- [x] MS: Will finish route restructuring @Michael Sk
- [x] RM: Create an issue for adding heroku logo to site
- [ ] YB: clean up the tutorial PR to the website
- [ ] RM, KG: Pair on proposed Guides ToC  (after ember camp)
- [x] TJ: Go/No Go call on API Doc (Monday)
- [ ] RT: update on discourse+blog integration
- [ ] DB: pending Leah creating Heroku org for Ember to shift to new org approach
- [ ] DB: Heroku blog post
- [ ] RT: Write Rolodex/Contact Book Tutorial to launch with 2.16
- [ ] TJ/RM: record/task out stuff that needs to be done for the api changes in 2.16
- [ ] JW: see what breaks upstream when trying out @module/submodule format in YUIdocs (how does this affect jsonapi-docs and API site)
- [ ] RM, Teddy, Jessica: solicit contributors for js module (176) testing of ember inspector

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- JW: Jen Weber @jenweber
- MS: Melanie Sumner @melsumner
- TZ: Teddy Zeenny: @teddy
- LZ: Lennex Zinyando @zinyando
- LD: Luke D @luke.d

### Notes

#### Status Boards

RM: call it dashboard/roadmap sometimes.  core wants the name used for something different.  kinda an rfc for the future of ember. this would be a list of what is currently being worked on in the ember ecosystem. (ex. svelt builds, js modules, etc).   Jessica will be important for this bc she’s been handling the newsletter.  We want it to feed seed material to the status board.

JW: is this something that is currently live or viewable, or ongoing.

RM: there’s a dashboard that’s live on the website: http://emberjs.com/dashboard and https://github.com/ember-learn/roadmap-page

RM: want to move these to /statusboards.  Will deprecate dashboard.  Needs design work.  its a glimmer app.  I Need to talk to core members for approval

#### API Search

RM: Michael is still close, going to create the PR to fix.

#### YUIDoc/NPM packages

JW:  What extent do the contributors to ember.js use the built yuidocs in their raw form.

TJ: I’ve never seen it used

JW: if that’s the case it simplifies what we need to do for rfc 176, because the link generation on that is the thing that breaks with using `@ember/*` for module.

JW: what I’d like to discuss is what happens next

TJ: I’d like us to convert `@module` to use new modules.  Modules would be at the second level, how'd we want to group things. The rest of each package could be represented as a submodule.

RM: I’m concerned about the shortcomings in representing modules.  it may be hard to link to submodules if we go this route.

TJ: I'm ok with a change in our doc technology but I don't think its doable in the 2.16 timeframe.  We should see how far we can get with yuidoc.

RM: if someone wants to start looking at converting us to jsdoc at the same time we are looking at patching getting things to work in yuidoc that would be cool.

JW: I will try replacing things in yuidoc and generating json  to use with the app to see where the blockers are.  Who should I contact for help with jsonapi-doc?

TJ: @siva or me.  There should be some doc in the readme as well.

#### Ember inspector

TZ: we need to finish firefox web extensions asap bc they are deprecating the old addon system.  the ff addon team started doing some work.  I haven’t checked it yet because of time.

TZ: jQuery has been removed.  been wanting to separate things into to repos (inspector vs ember debug)for testing (same env doesn’t work).  want to work on the side.

TZ: also make sure inspector doesn’t break for new js modules. We need to do these things first before new feature work.

RM: I can see about the firefox pr (they might need help with ember part of the app)

RM: I can put out the js module (rfc 176) support to the community and try to get contributors.

RM: should be deployed/working atm on the builds page (canary)

TZ: it works, but it looks to be on 2.14

RM: we are using babel transform plugin, so any app that uses babel 6 should get it.

RM: I’m working on a pr for a deprecation for anyone that uses string.

RM: we can talk about future plans in upcoming meetings

#### Ember Styleguide

MS: can’t get orange on white to pass accessibility contrast tests no matter how big I make it so we need to decide what to do there.


MS: each thing on screen is a ember component, and has the right aria properties, etc

RM: ultimately lea makes the final call on website decisions so we can set up a meeting for next week to resolve any questions you might have on accessibility, etc.

MS: switched to roboto font.  lots of opinions out there on font 😛

MS: This is also an ember app.

RM: getting this to be the ultimate website replacement is the goal.

![styleguide screenshot](https://d2mxuefqeaa7sj.cloudfront.net/s_7D741528F7C65DD0E9E9A01CE9B2C2B4A4F09CB01F832FEE9C929DD1618EE5A4_1503596108728_image.png)

