# 2016-12-15 Agenda


Topics

- DB / SV /RM: Help Wanted Update
- DB: EmberMap guys offering to help with videos, thoughts?
- DB: website storage
- RM: [Learn page showcase](https://github.com/emberjs/website/pull/2722#issuecomment-266288860)
- TJ: API doc updates

# Action Items 

- [ ] RM: CouchDB access for Ilya
- [ ] TJ: PR meeting notes from 12/1
- [ ] DB: Talk with Gavin re: videos
- [ ] DB: will talk with Trek re: static page hosting, can use Github pages?
- [ ] ?: Try out github pages for guides.

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- GM: Gaurav Munjal @gaurav
- SV: Steve Valladolid @mellatone
- YB: Yaw Boakye @yaw

## Notes

---

### Help Wanted App

SV: Willing to help out with Help Wanted app

DB: Wanted to get something out for a SoEmber workshop

SV: What about the newsletter.

RM: Would like to start the newsletter back up, in a similar way to Rust Weekly.

DB: Concerned about our bandwidth

RM: Me too but I think can bring in some help.

### EmberMap Video help

DB: Any concerns about the ember map guys helping with video content?  Their stuff is pretty good.

TJ: Should this be something Gavin coordinates, depending on bandwidth.

DB: yes.  I'll get them in touch with each other

### Website Storage

DB: Firebase hosting ending March 15, moving would cost $50/mo.  We need to find an alternative.

DB: Could we put guides on github pages?

RM: Unknown.  Maybe trek knows?  May have been some things around https, apex index, and performance that were issues.  Someone should port to their personal account and see if it works.

DB: after talking to trek, netlify gives us tls for free.  Will sign up and look at it.

### Current API Docs

RM: cloned the api to /internal to prepare for the transition to the new API docs, based on a F2F discussion.

### Learn Page Updates

added deprecation guides link, Have a FAQ section now with 1 FAQ

### API docs

TJ: GM, TJ, MM continuing to work on api docs, logic side in good shape.  looking at end of month for that.  Still questions on hosting.

Siva is getting a staging server setup with Gaurav: https://ember-v-api-docs-staging.herokuapp.com

GM: Couch is first $50/month free.  after that it costs.  Also need to work out offline access without the 250MB download.

RM: FastBoot vs StaticBoot on API app?  Static files is much cheaper.

### Deprecation Guides Contributions

RM: Wrote a detailed issue around updating deprecation guides for the [lifecycle hook args](https://github.com/emberjs/rfcs/pull/191).  Getting Jen Webber to help out.  

RM: Also getting cibernox to help with the [Ember.K deprecation](https://github.com/emberjs/rfcs/pull/178) from someone new to contributing.

### Tutorial Move

YB: Moving the tutorial from guides to main learn site.  Biggest issue so far is what to do with the sidebar.  Currently leaving it the same.  Mel helping with a dropdown including the tutorial.  Don't have to wait for that to be done, just put it under a route and it can be linked later. (/learn/tutorial)

RM: The tutorial doesn't have to be versioned like the guides, so it can be moved into the main website.  Easier to include it in the website repo because of middleman infrastructure.

DB: The tutorial should just support the last major LTS.

RM: the next step to figure out is translations.  Brazil is making great project tutorial, quick start is done, 30% of guides.  By moving tutorial to the web site we can release translated versions.
