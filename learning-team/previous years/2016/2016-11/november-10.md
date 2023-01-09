# 2016-11-10 Agenda


# Topics

- API viewer
- Guides viewer
- javascript module api RFC + API Doc Emberization
  - RFC: https://github.com/tomdale/rfcs/blob/js-modules/text/0000-javascript-module-api.md#api-documentation
  - Notes: https://github.com/emberjs/rfcs/pull/176#issuecomment-259225731
  - api ember repo: https://github.com/ember-learn/ember-api-docs
  - Agreed upon API behavior back in March (private, etc): https://github.com/emberjs/website/issues/2452
  - feature toggling behavior: https://github.com/emberjs/ember.js/issues/13101
- Using a non-mirage backend in the tutorial
  - https://github.com/emberjs/guides/issues/1695
- TDD in the tutorial
  - https://github.com/emberjs/guides/issues/1718
- Using Tilde online education videos

# Action Items 

- [ ] RM: CouchDB access for Ilya
- [ ] DB: Help Leah assign S3 creds for api doc deployment

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- IR: Ilya Radchenko @knownasilya
- Gaurav Munjal: @gaurav0
- RM: Ricardo Mendes @locks
- LS: Leah Silber @wifelette

## Notes

---

### API Doc

- TJ: API Viewer is back under ember-learn
- RM: We need a versioned api viewer.  Where is it at?
- TJ: Got a bunch of tasks. working through it
- GM:  Helping work through issues, tasks.  Would like to talk about private apis in docs
- RM: Talked to Yehuda, and the plan is indeed to have internals subdomain.
- RM: We need Continuous Deployment where every passing build deploys + MVP - these are priorities
- RM: Versioning
- RM: Eventually we want CLI docs - Tobais willing to help us
- RM: Last thing LTS, beta, canary
- DB: did we get S3 creds to deploy
- RM: Nope
- LS: I have access, but may need to wait for Robert to help bc he knows what we need to do for it.
- DB: We can help navigate you via screenshare.
- GM: We need to make it so that if someone makes a change to jsonapi-doc that the data should update.

### Guides in Ember

- RM: 2 constraints: Version and Locale
- RM: Means that routing needs trickery because you need to support dynamically loading pages based on version/local
- RM: Also want to separate app from content.  
- RM: would like a repo that holds the markdown files, and then put the build output somewhere where our ember app can digest
- RM: Would like to do smarter things with the guides, but I don't think we can do it with markdown.  Not sure what the future direction will be, but if we have a repo with the markdown files with a folder per lang and then a subfolder with version I think things will be better.
- DB: Ilya do you have everthing you need?
- IR: A bit blocked.  Need guidance on getting Travis set up deployment for pagefront, couchdb access.
- RM: tried but didn't work.  I'll try reaching out to the couchdb folks.  They like ember so they might help.  Should have something for you in a week or two.

### Mirage In Tutorial Update

- DB: not a clear decision yet.  Talking to LS about it
- LS: I can pitch the core team once I get enough info/options
- DB: Mike suggested getting some consultancies to fund it.  Is it worth going forward to see if there is money for it.
- RM: I don't think mirage is the problem.  Don't see why it should be removed.
- GM: What if we have a repo with a partially set up project, with mirage already installed and configured.
- TJ: Part of what we want to do with the tutorial is have them start from scratch, and I'm afraid that it would  also be confusing since they still can see requests in the network tab.  
- RM: wouldn't a hosted solution also be confusing then?
- TJ: I think its more logical to new users that the data would be on a server.  The fact that mirage is mocking at the xmlhttprequest level is not obvious to those that are new.
- TJ: The core issue here is around new users, that would expect their ember data connections to show up in the network tab, and don't have an understanding of how mirage works, confusing it with ember data.
- TJ: I think the two alternatives we are dealing with here is setting up a hosted server environment  and mirage.  other mocking solutions I don't see as much better than mirage.
- RM: Regardless of setting up a server I think whatever we are talking about is not happening before ember conf.
- TJ: there's a lot that can be done currently and a lot of feedback around the tutorial that should be easy to do right now.  Goal until ember conf will be to address the tutorial feedback checklist we have, and leave the items around TDD/Mirage until later.  
- RM: agreed. There are some quicker wins around the tutorial we can acheive before then, including delaying the mirage introduction and simplifying some of the tests. (ex. integration vs needs)
