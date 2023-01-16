# Topics

### Previous Action Items
  - [ ] David: still want to contact Trek re: SEO questions, ask for original context
  - [x] Matt: will see about having the survey intern help with new styling for header 
  - [ ] Todd: will check on private api info leaking through on API viewer (waiting on this until next week)
  - [ ] Ryan: update on screencast

### Agenda
- Template for core-notes minutes
  - easier to extract data (possible viewer, or at least for The EmberWatch Times)
- Translations
  - ongoing language efforts / RFC
  - deploy / infrastructure
- [Featurex Statusboard](https://github.com/emberjs/website/pull/2393)
- [Issue / PR template](https://github.com/emberjs/guides/issues/1273)
- [Upgrade section](https://github.com/emberjs/website/issues/2355#issuecomment-170077858)
- [Website header](https://github.com/emberjs/website/pull/2477)
  - [new `website` header](https://github.com/emberjs/website/pull/2477)
- [Ember Data builds promoted](https://github.com/emberjs/website/pull/2312)
- Private / behind-the-scenes todos? - Locks
- infrastructure sub-team? blog post mentioning teams
- [ember community survey 2016](https://github.com/emberjs/website/pull/2484)
- API Doc private hiding: rendered vs yuidoc approach [issue 2452](https://github.com/emberjs/website/issues/2452)
- [forwarding not going to the right version](https://github.com/emberjs/guides/issues/1302) - ideas on why? (David)

# Minutes

## Attendees

_Name (Initials) `slackid`_

- Ricardo (RM) `@locks`
- David (DB) `@acorncom`
- Todd (TJ) `@todd.jordan`
- Ryan T (RT) `@rtablada`
- Ryan L (RL) `@ryanlabouve`
- Matt (MB) `@mixonic`
- Leah (LS) `@wifelette`

## Notes

### New Action Items

- [ ] RL to create a combination header/footer restyle PR, consolidate CSS (to eliminate differences with guides, and remove emberconf references)
- [ ] RT continues with consistent voice updates in quickstart (no merge 'til emberconf)
- [ ] TJ to work on filtering private/deprecated from YUIDoc output
- [ ] RM to create a draft guides PR template (and possibly core-notes and RFCs )
- [ ] LS to broach PR template subject with core team
- [ ] DB to work on Build page and feature dashboard website pages, reach out to `@miracleblue`
- [ ] DB to send a guides PR linking to cli upgrade steps
- [ ] RM to create a repo in EmberTown for a living styleguide
- [ ] RM to create a Trello or Waffle site for the docs team

### Header Styling

Header style:  LS: comment on new header style about not using the emberconf brand.

Header width is different than currently with the guides.  This was because the responsive grid used on the site is different than the guides.

LS: To hesitate to rip it out of the website so that it works. Would rather not deploy with the different widths.

History (LS)  Guides page was done by a third part company and then dropped it.  Would be great to finish it off ourselves. 

LS: Could both the guides and the website use the same CSS?  

RL to take restyle forward and and propagate guide style to the rest of the website.  Agreed it makes sense to deploy a header and footer restyle together.

### Screencast Update (RT)

Bring voice in quickstart (me vs you vs I) into consistency.  Trying to align the two (screencast and docs) as close as possible.

Fine to work on, but RM will not merge any quickstart changes until emberconf because of the translation efforts.

### Private Classes in API Docs Issue Update

PR from Kris Seldon that updates website to not render private classes.  This doesn't fix privates showing on other renderings of the API.  

Todd to submit a PR removing @class, from privates/deprecated, or filtering out from generated YUIDoc JSON to get a discussion going with core.

### Template for Core Notes Minutes

Currently inconsistent across teams. RM would like a template to guide teams, and possible someone (RM can find) to retroactively apply to old minutes.

LS: make sure it doesn't add arduous steps, but consistency would be useful.  Will bring up the idea to the core team.  

RM: Could be a pull request template on the repository.

### Translations

RM: Put out a request for new translators on twitter.  No positive responses thusfar.

### Website

RM: MB is not able to continue at the moment, so if someone wants to pick up the feature dashboard that would be good.  DB to look at it.

RM: a phased approach might be good to get something tangible.  (manual-> more automated).
DB: Doesn't want to deal with manual, will work forward on automated.

Build page redesign/feature dashboard: Someone showed interest about implementing a design that Yehuda mentioned on an issue (vertical layout) (`@miracleblue`)  DB may reach out.

### Issue/PR templates

Proposing a Pull Request Template (markdown file).  RM to create one for RFCs and Core notes, and get comment from core.

DB proposes doing something for guides and trying it there first.

LS to chat with Yehuda about concerns over barrier to entry.

### Upgrades

DB: Propose Step by step section in guides to go from 1.13 to 2

RM: Doesn't think its a guides thing.  Wants it to start on Ember Watch and make it a testing ground for the website.  (wants to do this in general for iterating and experimenting.

DB: What about a link to the ember-cli release page? RM: Send me a PR and I'll think about it some.

### Styles (More!)

RM: If we are going to make the header an ember component, we could but the styles in a bower package for the website now, then any addon made can just import that.

RL: Style guide would be great to ensure consistency across the ember ecosystem.

RM: would love that.  Thoughtbot broke it down into SASS components.  Would be conducive to a style guide.

RM: Will create a repo under embertown where it could start and "graduate" to Ember.  Will use embertown as an incubator for ember projects

### Ember Data Build Promotions

DB should note in the site/build redesign

### Task Tracking for Docs team

RM: Lets use Trello to coordinate back channel communication amongst the docs team.  The docs team is not just guides anymore.  Lots of cross cutting concerns that probably shouldn't be tracked in guides repo.

### Infrastructure

Might be a new infrastructure subteam created.   Also still some discussion on how they will work, and dissemenate information to the outside world on this.  Discussion is happening amongst the core team and will reveal more info by emberconf




