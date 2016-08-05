# 2016-08-04 Agenda

Previously

- [ ] RM: talk to @ebryn about controllers 
- [x] RM: fix sidebar in blog page - (will revisit when we get back to website stuff)
- [ ] RM: Learning Team Blog Post
- [x] RM: Invite Teddy to Learning team (will need schedule a meeting)
- [x] RM: Research Team Page
- [x] TJ: Subroutes on remote branch

Topics

- Advanced Ember documentation (how do we handle this?) - DB (and Erik Bryn?)
- Tutorial (TJ)
- Ember Hearth
- Translations
- bors
- Gavin + Learning Team

# Action Items 

- [ ] RM: Schedule meeting with Teddy
- [ ] ??: Expand Learn page
  - [ ] Add Deep Dive videos
  - [ ] Advanced Ember topics -> ping mike/LI (nathan)/Netflix (sugarpirate?)
- [ ] RM: Recruit translation infrastructure workers
- [ ] GJ: Ember Inspector videos

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- RM: Ricardo Mendes @locks
- GJ: Gavin Joyce @gavinjoyce

## Notes

---

### Advanced Docs

RM: was thinking about creating a page and linking Gavin's deep dive videos.

RM: Hardest part is getting people with in depth source knowledge to pass that info along.  Will likely be a slow process.

GJ: what areas should we focus on here

RM: views, run loop, getting extra documentation from netflix, linked in

GJ: talked to rwjblue about deep dive videos in the past.  if there were obvious topics I could try setting up with him

TJ: I've heard in a couple occasions Ember-cli 

RM: Mike North has some thoughts about this and should ping him, as well as netflix and linked in 

### Tutorial

TJ: 2 items of feedback I'd like on the tutorial subroutes.  PR is opened agains super-rentals.

- Changed the use of "slugs" to just using id routing
- used mirage to mock http requests (as opposed to stubbing the store)

RM: I'm for just using id routing

TJ: My next part of the tutorial will be creating a reservations form.  Will likely put the tutorial down a bit to work on API Doc improvements.  Will task what's next if other want to pick it up.

### Ember Hearth

RM: munumunum and I are picking it up again.  He did a restyling that looks good, still tweaking UI.  I'm setting up continuous deployment based on tags.  We have osx and linux builds. Trying to get a different packager in ember electron to make it easier to create installers.  Also need to understand auto-updates.   Will wait for Leah and next meeting to discuss.

### Translations

RM: Couple of problems:

1. People are getting a bit demoralized
2. We dont have a good workflow to publish updates to guides

RM: Want to pull translations out into another repo because:

- confuses people (some try to update all)
- too many files
- want to kill the sync bots: too many commits on the source repo
  - want crowdin to trigger sync, not the other way.
  - need to figure out a better way for versioning
  - find someone trustworthy to see it through.  Some are interested, but not sure of their availability.

### BORS/Homu

RM: Stalled because person working on it set up heroku and bot/webhooks, but the bot wouldn't recognize the r+ command.   Since then that dev has moved on.  Need someone to pick up the torch.

### Gavin

RM: Everyone is on board with Gavin joining.  Need to understand process of adding new members.  Would love to bring Gavin's access and video content into our core learning and docs.

GJ: Planned on completing videos for guides next.  Hoping to do 1 per week.  Would love feedback on that.  My focus atm is with Glimmer 2 in Alpha and increasing my Ember role at the company.   Post Glimmer 2 my learning capacity should increase as it dovetails with my company's goal of providing better ember resources to employees.
