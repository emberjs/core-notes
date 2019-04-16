# 2017-02-16 Agenda

### Previously

- [ ] RM: CouchDB access for Ilya
- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] GM: file fastboot issues from api docs
- [ ] SR: send locks like to emberitas workshop materials
- [x] DB: Will toggle a "enforce HTTPS" checkbox on Netlify on guides if we don't get any negative feedback in the next week
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo

### Topics

- Status updates
- (TJ)API App Replacement
  - New marching orders from tdale: [https://usecanvas.com/ember-docs/draft-issue-around-moving-ember-api-doc-away-from-pouchcouch/5Z5Av1VqAxSBjDioxRiPAQ](https://usecanvas.com/ember-docs/draft-issue-around-moving-ember-api-doc-away-from-pouchcouch/5Z5Av1VqAxSBjDioxRiPAQ)
  - [https://usecanvas.com/ember-docs/api-docs-app-meeting-notes/7f3hAtcIhwWER9WQgMZHKx](https://usecanvas.com/ember-docs/api-docs-app-meeting-notes/7f3hAtcIhwWER9WQgMZHKx)
- (TJ)Tutorial
- (DB) Working on Google search stuff
- (TJ) Help wanted issues for emberconf contributors workshop

# Action Items

- [ ] Mark items in each learn repo as "good for new contribs"

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- RM: Richardo Mendes @locks
- DB: David Baker @acorncom
- MS: Michael Schinis @mschinis

## Notes

---

### Google search

DB: going to start moving on this, have a guy who is willing to help.  We'll add a `canonical` tag to all old versions of guides and point the pages to `/current`. We'll then have Netlify do a 302 redirect `/current` to the current version of the guides.  But we might need to have a complete `/current` folder instead ...  Will be checking on that

### API Doc Replacement Shift in Plan

TJ: Had a meeting with tdale, which led to a re-focus on the api app in the leadup to emberconf.  Basically...

- Get it to support JavaScript Module API RFC
- Get it smaller and more performant
- Get it so we can use our current S3 infrastructure

### Issues for Contributors workshop

TJ: Would be good to start collecting issues from around the ember-learn ecosystem for this.  Lets triage what's out there and label "Good For New Contributors". The workshop can pull from these.

### Alogolia

RM: MS willing to help out.  Since api doc is now hot, maybe he can give assist there.

TJ: Absolutely!  Can get him some issues.

DB: How about search?

TJ: Do we want to do that to him?

MS: I've actually done some algolia before for our Ember app

<technical algolia discussion between DB and MS>

MS:  I can work on it if that's where I'm needed

all: thanks ❤️
