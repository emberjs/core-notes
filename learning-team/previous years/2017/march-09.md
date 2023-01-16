# 2017-03-09 Agenda

### Previously

- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] SR: send locks link to emberitas workshop materials
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo#
- [ ] All: Mark items in each learn repo as "good for new contribs"

### Topics

- (private) DB: Heroku, blog post re: Fastboot?
- api docs!
- tutorial

# Action Items

- [ ] TJ: open issue about testing "extra credits" design
- [ ] DB/RM: Give Todd feedback on tutorial, let's get it merged
- [ ] RM: Bring up API fastboot stuff at core team meeting, get a decision there

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- RM: Richardo Mendes @locks
- DB: David Baker @acorncom
- MS: Michael Schinis @mschinis

## Notes

---

### Ember site -> Heroku

RM: mentioned heroku at core meeting.  Stef said he would draw up an architecture.  Throught that one dyno and the fastly addon would be enough.  Mixonic will talk to fastly people.

DB: We want to set up api-docs on our new heroku instance and access these through a proxy.  Will discuss this with Terence.  He is good to go.  We just need to be willing to write a blog post on usage.

### API Docs Status

TJ: API docs, moving along, needing to remove Pouch adapter (blocking a couple of tasks).  siva is working on it.   Earlier this week he put out a pr that generates doc json files and saves to an compressed hierarchy.  He's currently working on the client connection and plans to have that tonight.   From there we can focus on several tasks:

- generating the left navigation manifest
- implementing collapsable items in the left nav
- background service worker

TJ: One suggestion Siva had was to push the docs data output to heroku instead of S3.  My main concern is whether having the data there would affect our available traffic/dynos on Heroku?

RM: I think also we want to leverage a CDN like fastly, which would be easier to enable on S3.

### Algolia

MS: Started looking at docs search, didn't like it.  Doing tinkering to figure out indexing/data structures to take advantage of the search helper.  Want to get it to not refresh when selecting search results and take advantage of route transitions.

DB: I could see the algolia component you are creating to be an ember addon that we can reuse across apps as we are developing out more sections of the website as ember.

MS: Good to know, will take that into consideration.

### Tutorial Status

TJ: Test revamp PR: https://github.com/emberjs/guides/pull/1818

TJ: Could use some people going through the tutorial to test it.

TJ: Also would like to implement a fix to address the following issues before emberconf:

https://github.com/emberjs/guides/issues/1695

https://github.com/emberjs/guides/issues/1554
