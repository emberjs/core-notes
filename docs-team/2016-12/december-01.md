# 2016-12-01 Agenda


Topics

- Updates:
  - Ember Watch
  - API
  - Guides
  - Help Wanted
  - Marketing
  - Tutorial
  - Website design
  - ...
- Ember doc app consolidation

# Action Items 

- [ ] RM: CouchDB access for Ilya
- [ ] DB: Help Leah assign S3 creds for api doc deployment

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- Gavin Joyce: @gavinjoyce
- GM: Gaurav Munjal @gaurav
- LS: Leah Silber @wifelette

## Notes

---

### Ember Watch

RM: I want to move Ember Watch to an Ember app, and working on new features.  I need to make it more newbie friendly

LS: Could be the focus of a contributors workshop at ember conf if its still a task.

### API site rework (https://github.com/ember-learn/ember-api-docs/projects/1)

TD: Making good progress. Down to style and infrastructure for the most part (search, deploy, fastboot, etc) Looking to deploy by emberconf possibly next month.

GM: Could use some design tweaks, should be relatively straightforward to get setup (backend work not needed)

RM: you should request on the design whiteboard channel in slack to some help from folks with design chops.

TJ:  What about the previous action item on S3 credentials.

GM: we can get creds from stanley's db or we can use mine and update travis deployment

DB: Let's use yours.  I'll have some time in the next few days to update Travis

GM: Ok, lets get together offline and I'll get you set up.

### Help Wanted

DB: getting more stable.  v1 should be doable based on the end of next week.  Would like to know what the priority is compared to guides.  Will focus first on getting Help wanted out the door and then shift to guides.

### Ember App Consolidation

TJ: since we have all these ember doc apps being created (fastboot, engines, api, guides), we need to bring these together under one umbrella eventually with engines.  What are your thoughts?

RM: That is probably a ways off.  We should focus on getting individual apps complete for now.

DB: We'd have to turn emberjs.com into an ember app to house the engine pieces.

TJ: How then are we planning to integrate things like api into the website?  Like guides where we redirect to another site?

RM: We could do it like the build page, which loads an ember app via a middleman page with a script tag.

TJ: then I guess we'd have to take off the emberjs top nav header before deploy?  

DB: we might still want that for the offline app

RM: you could make it configurable.
