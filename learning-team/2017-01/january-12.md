# 2016-01-12 Agenda

### Previously

- [ ] RM: CouchDB access for Ilya
- [x] TJ: PR meeting notes from last few weeks
- [x] TJ: Work with ryanto on test video
- [ ] TJ: Reach out to Tom Dale about future API changes with modules, and questions about namespaces.
- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] DB: integrate the Netlify CLI tool into guides CD system, make sure it works well

### Topics

- DB: Google Maps API key in tutorial, should we publish one and periodically roll it if we have issues?
  - https://github.com/emberjs/guides/issues/1554
  - We've been getting consistent questions / complaints since the change, so I would suggest we do ...
- (public) DB: Review
  - https://github.com/emberjs/guides/issues/1535 (should we close? do we want to document input helpers or should we link to addons to help with this instead?)
- TJ: Question on guides for backlevel versions (issue came up)
- TJ: API docs update
- RM: stefriera tutorial
- RM: Emberitas (stefriera)

# Action Items 

- [ ] GM: file fastboot issues from api docs
- [ ] SR: send locks like to emberitas workshop materials
- [ ] TJ: research alternatives to google maps in tutorial
- [ ] TJ: clarify future of input helper.

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- LS: Leah Silber @wifelette
- GM: Gaurav Munjal @gaurav0
- SR: Stephanie Riera

## Notes

---

### Netlify update

DB: working on getting a machine user setup to work with Netlify (and proper permissions), looks like things should work pretty smoothly here

### Do we fix back level versions of the guides?

https://github.com/emberjs/guides/pull/1768

TJ: do we fix back versions?

RM: nope. we might consider if it LTS, but otherwise it's too much work

### API Doc Update

TJ: Merged GM's fix around fastboot last week.  GM, does that solve our fastboot issue?

GM: Seems to fix it.  We need to do some more testing around fastboot.

TJ: OK, lets make an issue in the new docs repo and we can get to it when we have spare cycles.

### Tutorial fixes

TJ: started submitting fixes for https://github.com/emberjs/guides/issues/1708

TJ: First fix is in routes: https://github.com/emberjs/guides/pull/1765

TJ: Plan on doing some each week.

### Beginner's Tutorial

RM: Took a look at SR's tutorial.  Have some structured feedback.  will give offline feedback and would also like the rest of the learn team too.

TJ: would be nice to have a link to the ember watch tutorial page from the ember tutorial page.

RM: would rather link to ember watch from the learn page. 

TJ: I also plan on reviewing, may also take it to Raleigh hack night next week.  We typically get new users interested on getting set up.  Will pay attention to what's clear and what's not there.

### Emberitas

RM: We have some meetup resources.  Would like to leverage some of the workshop materials that are out there to share.

SR: You should have access to the Austin Emberitas materials.  its open source.  I'm happy to champion this.  Will talk to Shannon about it.

### Google Maps Key

TJ: It has gotten some complaints, but I don't believe its an API key issue.  I don't have a key and the tutorial continues to work fine for me.  Initially it with the tutorial repo, but I've since fixed that up so that the behavior is consistent.  The problem with the tutorial itself is that we walk the user through downloading the client library into the vendor directory to show the user that you can install third party libs into `/vendor` and have them packaged with and accessible by your app.  The problem is that google doesn't play well with this.  I believe its that it continually changes its service urls, could be the fact that we aren't using an api key and its just giving us temps. 

RM: Do you think we can find an alternative lib?

TJ: I can research it.  Will post findings to the open issue.

### Input helpers documentation

TJ: Should we invest in adding investment to explaining input helpers if the way to go now is using native inputs?

RM: Native inputs can be complicated to explain to new developers.  Require the `mut` helper.

TJ: but if its the way to do it going forward, might was well steer people going that way.  I will start a discussion on slack to verify.
