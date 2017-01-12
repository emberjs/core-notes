# 2016-01-05 Agenda

### Previously

- [ ] RM: CouchDB access for Ilya
- [x] TJ: PR meeting notes from last few weeks
- [ ] TJ: Work with ryanto on test video
- [ ] TJ: Reach out to Tom Dale about future API changes with modules, and questions about namespaces.

Topics

- TJ: API-Docs
  - Fastboot issue update
- (public) RM: https://github.com/ssriera/ember-to-do-list/wiki/Welcome
  - TJ: Two Tutorial approach vs revamp
  - JS Primer Update
- (public) RM: Review
  - https://github.com/emberjs/website/pull/2765
  - https://github.com/emberjs/website/pull/2768
  - https://github.com/emberjs/ember.js/pull/14765
- (public) DB: Netlify update

# Action Items 

- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] DB: integrate the Netlify CLI tool into guides CD system, make sure it works well

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- RM: Ricardo Mendes @locks
- GM: Gaurav Munjal @gaurav0
- SC: Sarah Clatterbuck @sclatter

## Notes

---

### ember-todo-list

- Provide ssriera with feedback
- Make it part of a new section of EmberWatch dedicated to community tutorials
- TJ: For current Tutorial - working on making it more friendly to new SPA devs in small increments over the next few months.

### JS Primer

- Chris Krycho couldn't manage to help
- MVP this week for review
- TJ: will help with Tutorial improvements to have a place to refer back to when introducing JS concepts

### PR reviews

- https://github.com/emberjs/website/pull/2765
  - Good to merge once the content is moved to the proper file
- https://github.com/emberjs/website/pull/2768
  - Yaw is investigating how viable having a separate repo for the Tutorial is
- https://github.com/emberjs/ember.js/pull/14765
  - Good to merge once commits are squashed, and tag updated

### Netlify update

DB: Netlify's base "auto-deploy" approach is too simplistic for us, but they have a CLI tool I'll experiment with.  Hoping for drop-in replacement for Firebase, may hit some permissions snags

### API Docs Update

TJ: rwjblue looked that the fastboot issue and found that async usage of afterModel doesn't work in fastboot.  Currently  working on moving async afterModel code to the model hook, but running into some issues around inheritance.  Should have something by EOW.
