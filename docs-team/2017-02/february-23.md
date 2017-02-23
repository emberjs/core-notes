# 2016-02-23 Agenda

### Previously

- [x] RM: CouchDB access for Ilya
- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] GM: file fastboot issues from api docs
- [ ] SR: send locks link to emberitas workshop materials
- [x] DB: Will toggle a "enforce HTTPS" checkbox on Netlify on guides if we don't get any negative feedback in the next week
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo#
- [ ] All: Mark items in each learn repo as "good for new contribs"

### Topics

- DB: guides rework
- TJ: API Docs Update

# Action Items

- [ ] DB: will ask about Heroku hosting for API stuff

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- RM: Richardo Mendes @locks
- DB: David Baker @acorncom
- GM: Gaurav Munjal @gaurav0
- IR: Ilya Radchenko @knownasilya
- SC: Sarah Clatterbuck @sclatter

## Notes

---

### Guides

DB: been working on migrating guides to a single repo approach, will take a bit

### API Docs Update

TJ: Chatted Tom Dale again about design again.  We decided to go with a service worker/app cache approach, and store data in indexedDB.  Updated the issue to reflect.

TJ: I'm also working on tasking things out and giving things an order so people can work on specific things, also I want things to be shippable as we go.  Will update issues.

Main issue: https://github.com/ember-learn/ember-api-docs/issues/132

TJ: Michael Schnider may help us with algolia, Siva is helping with the S3 deployment, Emilio Santelises is also contributing on an issue.

TJ: Now that we have several folks working on api-docs, I might have a brief weekly catch up meeting just to make sure people are making progress and able to continue.

GM:  That would be great.  Let me know when!

GM: If we move completely to S3 we'll lose fastboot support

TJ: Right.  We'll only be moving the data that.  The app will remain hosted by something like Heroku.  Just need to figure out the $$$.

DB: I've talked to contacts at Heroku and I think we are covered there.

TJ: Awesome.

### Tutorial

TJ: have a PR open against guides for the tutorial test reorg.  Would appreciate someone to walk through it and comment.  Will walk through it from scratch myself this week.

https://github.com/emberjs/guides/pull/1818

### Website Design

RM: Doing website tweaks with Mel, doing some cleanup,

- updating colors,
- typography,
- adding responsive media query breakpoints and normalize them.

### Module Imports/ Guides Updates

DB: have you heard more about module imports, because that will affect guides substantially.

RM: have not.  Need to make pass on our docs to clean things up anyways

### Twiddles on the Website

RM: Twiddles: ember apps for twiddles on from page (martin munoz)

RM: (Marten?) was asking if twiddles can be searialized to a single file so updates can be made to the website twiddles with simple PRs.

GM: not sure the benefit but we can talk about it.  Not sure that the front page would get updated very often.

RM: problem with gists is that you can't accept pull requests so one person would be the bottleneck

GM: Can orgs own gists in github, and how would you do that?

RM: not sure you can.  at any rate trying to get a conversation started to address the front page twiddles.  Will keep you updated.

DB: As far as guides gists, we should way for the module imports stuff to drop.

### Newsletter

RM: was supposed to do the newsletter last week.  Going to do every other week, but got busy.  Will try again this Friday.

### SC

SC: Have a PR on the location API. Will take another pass to get ready for merge.

RM: A couple of core members left some remarks?

SC: yeah I'm pretty clear on what they want.

### Ilyia (Twiddle Redesign)

IR: Got Miguel from Ember Paper involved.  Will be helping this weekend as well.  I also have some tests to get working

GM: Keep in mind tests can be hard with Twiddle

IR: Will do.  Focusing on getting the existing ones working.
