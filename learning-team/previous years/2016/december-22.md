# 2016-12-22 Agenda

### Previously

- [x] DB: Talk with Gavin re: videos
- [x] DB: will talk with Trek re: static page hosting, can use Github pages?

Topics

- DB: Help Wanted Update
- DB: EmberMap, testing discussion, did any of us review?
- DB: website storage
- RM: [Learn page showcase](https://github.com/emberjs/website/pull/2722#issuecomment-266288860)
- TJ: API doc updates

# Action Items 

- [ ] RM: CouchDB access for Ilya
- [ ] TJ: PR meeting notes from last few weeks
- [ ] TJ: Work with ryanto on test video
- [ ] TJ: Reach out to Tom Dale about future API changes with modules, and questions about namespaces.

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- GM: Gaurav Munjal @gaurav

## Notes

---

### Netlify

DB: Netlify accounts setup up.  RM mentions it was put in the core agenda.  Not sure what that means.  Things seem to be running smoothy and think we can turn it on.

RM: We should wait to make the switch because the ember website also needs to change hosting because of github pages rate limiting.  nathan was going to reach out to github.  There may be some concerns about netlify.  Will talk with the core team tomorrow and propose Netlify.  Netlify dev in my working spaces, will reach out to him.

DB: the German support I've been working with has been real responsive.

RM: would also like to talk to them about working a deal with heroku.

DB: Last time I talked to them they were able to give us some resources.  Would like to use that for things like Fastboot-needed pages, API backends, but not for static pages.

RM: I've also heard there's a desire to get all ember resources in one place.  Will bring it up.

### Ember Test Video from EmberMap for Website

DB: Ryan posted a basic outline: https://github.com/EmberMap/oss-videos/blob/master/ember-testing.md

TJ: Oh! will look at it and comment this week.

### API Docs

TJ: Working on an issue around links to namespaces from modules.  Has to do with how we determine what is a namespace vs class.  See https://github.com/ember-learn/ember-api-docs/issues/96 for details

GM: Siva still working on Continuous Deployment.

GM: Fastboot still broken.  We are on the latest fastboot, but it is failing on transitions.  See issue: https://github.com/ember-fastboot/ember-cli-fastboot/issues/202. I've created a reproduce server, but the issue doesn't appear to be being worked on.   This is a blocking issue for us.

DB: Fastboot issue could affect our ability to implement Algolia search since it relies on crawling through static pages.

DB: How are we deploying on the website, since we are a fastboot ember app and the rest of the website is not yet.

TJ: We could use an alternate domain, similar to guides, or include as an iFrame with a common banner.  Not sure if algolia search will work this way though
