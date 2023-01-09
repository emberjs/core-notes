# 2016-02-11 Agenda

# Topics

- Review action items from last week
- DB
  - Docs structure (how do we want to organize this?)
    - high level, but needed for design folks
- RM
  - translations
  - do we do anything? https://github.com/emberjs/guides/issues/1241
  - https://github.com/emberjs/guides/issues/1244
  - https://github.com/emberjs/guides/pull/1248
- TJ
  - tutorial - service update
  - questions about super-rental repo
    - tests: should we add a test tutorial
    - style:  currently pretty bare.  should we spruce the style up and make it a tutorial
- DB: Ember as CMS
  - pros/cons: https://gist.github.com/acorncom/9c5834530bf95a234920
  - Fastboot serving probably required, involves hosting, how handle that?
  - prob. best to keep this to a high-level discussion
- Community
  - Ember.js Newsletter
  - Ember Hearth
  - Ember Watch
  - Ember Observer
- Tutorial Screencast?
  - Solidifying content for 2.4 guides (remaining open PRs)


# Minutes

## Attendees

- David Baker
- Leah Silber
- Ricardo Mendes
- Ryan Tablada
- Todd Jordan
- Tom Dale
- Yehuda Katz


### Guides SEO issues

DB: Noticed with RoR, current versions of docs aren't versioned.  Not versioning current would possibly solve the SEO issue.

Want current version as top result, but still want to find old versions.

DB: Plan to spend some more time researching and talk to trek. 

TD:  Willing to signal boost on twitter for folks with SEO experience to come in and help

### Code School

LS: Everyone who gave emails should now have access to the code school draft

attendees had trouble accessing.

### Translations

RM: Everything is set up, James Kyle needed access to guides repo.  Added a couple of project lead translators.

LS: to gave access (thejameskyle, thejameskylebot), Brazil not showing

RM: Not synced yet

DB: middleman handles language, need to decide on ordering language/version...

### CMS

DB: Fastboot for guides?

TD: That'd be great. Would be good to eat our own dogfood.  Not as many rubyists in Ember as there used to be.

### Issues

RM: issue 1241  fixed on latest but not on older. iframe linking to a bad url

DB: backporting is a pain

TD: prev versions have external dependencies and tend to rot.  Could manually go into github pages and edit  the file.  tundal45 may be willing to help out.   Just requires time and patience

RM: I'll talk to him

RM: issue 1244 5 issue/pr this week around using the wrong version of ember-data when following the guides.  In tutorial we have an upgrading ember section that said your ember/ember-data should match the guides version.

DB: put note saying your version must be 2.x to work.

RM: best place for the warning is in the tutorial because of problems with mirage.

[discussion of Ember-CLI, beta issues]

RM: PR 1248

DB: Merged

### Tutorial

TJ: I made a few tweaks based on Yehuda's comments last week. I've been working on the services tutorial. I added a geolocation service, so in the Super Rentals example it will give you the location of the rentals relative to your current location.

TJ: Secondly, I know Robert made some comments on the tests for the tutorial. I wonder if we should have a tutorial page for getting people started with testing.

TD: I would think we should integrate testing into each step as you go. That ways testing isn't one big step at the end, which people will troll us for.

### Community resources

RM: Wants a "This Week in Rust" equivalent for Ember highlighting addons and contributions to complement Ember Weekly

TD: A dead mailing list is a signal that the project isn't helping

RT: We could complement the Ember Weekly guy who spend several hours every Sunday working on it.  More automation would be of great help.  First step might be better to deploy it to a website instead of a mailing list

RM: will contact ember weekly and ember watch people

RT: Offer my time doing an Ember in five minutes screencast for the tutorial or the quick start.  Will look at the quick start.

# Action Items

- [ ] David: will research SEO issues further, canonical, will send Tom an issue
- [ ] Tom: will signal boost SEO issues on Twitter
- [ ] Leah: will let CodeSchool folks know couldn't see tutorial
- [ ] Ricardo: will contact Ember Weekly / Ember Watch folks
- [ ] Ryan: will start working on screencast for quick start

