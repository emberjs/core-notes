# Learn Team Agenda 7/20

## Topics

- ember-api-docs
  - v2
      - updates for 2.16
      - redesign?
      - mobile?
  - v1.1
    - search (mschinis)
    - duplicate items: https://github.com/ember-learn/ember-api-docs/issues/276 (jweber)
  - Percy integration (siva)

## Action Items

- [x] MS: Will finish route restructuring @Michael Sk
- [x] RM: Create an issue for adding heroku logo to site
- [ ] YB: clean up the tutorial PR to the website
- [ ] RM, KG: Pair on proposed Guides ToC  (after ember camp)
- [x] TJ: Go/No Go call on API Doc (Monday)
- [ ] RT: ping eviltrout about discourse+blog integration
- [ ] DB: will create Heroku org for Ember to shift to new org approach
- [ ] DB: Heroku blog post

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes
- DB: David Baker @acorncom
- SK: Sivakumar Kailasam @siva
- JW: Jen Weber, @jenweber
- AL: Amy Lam @amyrlam
- MS: Michael Schinis @mschinis

### Notes

#### API Docs app

##### javascript module changes (2.16+)

RM: was thinking we need to have 2 views.  One for 2.15 an below, and one for 2.16+

RM: was thinking no more namespaces because of packages

RM: we’ll need

- 1 pass for javascript imports
- 1 pass for module unification
- 1 pass for es6 classes

RM: one thing the yehuda wanted that amy volunteered for is to rename modules to packages

AL: do we want all the directories renamed as well?

RM: we could start with changing the templates in the api app to refer to packages

DB: do we want to start converting our reference apps with the shim now?

RM: that can go in a separate quest issue.  we need to generate a checklist of packages and guides sections, and ask for contributions

DB: we don’t want this to happen on guides yet right?

RM: we can branch and ask folks to work off the branch, and we can keep up with rebasing to keep it up to date.

DB: we had talked about the guides showing old imports and new imports.  Do we still want to do that?

RM: if someone wants to 😛 otherwise we can create a webpage that explains things.

RM: we don’t want people to do migrations by hand.  We want them to do the code mod and not worry.

DB: I think we would be ok on Algolia on this front.

TJ: do we want to bring back the api-beta url for this?

RM: I’d rather not

SK: We can use the staging server, once links in prod are cleared from that.

TJ, RM: cool

DB: We need to move from the emberconf org to the OSS ember org for the heroku folks, so they can better track what they are donating to us.

DB: I’ll work it out with Terence and click the button.  Not a huge ugency, just something I need to not drop.

##### Search

TJ: have we heard form MS about search

MS: there’s a bug in the script.  He’s contacted algolia.  if they don’t respond will start debugging the script.

##### Duplicate entries

TJ: Jen’s been looking at only showing the relevant docs for functions/properties that are inherited and implemented at different levels.  Right now we show all, which results in duplicates.  See https://github.com/ember-learn/ember-api-docs/issues/276

JW: I don’t think there’s enough info on the ui side so I’m going to look on the ember-jsonapi-doc project to see if I can get enough info on that side.  My have questions since I’m new to these repos.

TJ: for ember-jsonapi-docs stanley stewart, sivakumar have done a lot of work.  I’ve also dabbled 😃 Let us know if you have questions.

TJ: Also, we seemed have this working to some degree in the legacy ruby app.  You might want to go see what they did.  Its no longer running but the code is still in github in the website repo.

##### locks feature requests

RM: I have a couple requests: #1 can we take out private?

TJ: Yeah, there’s an issue out there to do that.  take private out on the main site, but still have an “internals” site with all of it.

RM: it was working that way on the legacy site.

DB: How about keeping the query params so that you can still access private methods, but have no way to navigate there?

TJ: ripping out privates has been controversial in the past.

TJ: I’ll make some notes in the issue: https://github.com/ember-learn/ember-api-docs/issues/85 I’m not opposed as long as there is a way to get there and links work.

RM: #2 I’d also like to have all the methods and properties show on the same page and not hidden by a tabbed layout

TJ: yep that aligns with what we were planning in redesign

RM: it would also make our Dash integration easier.

RM: Would also be nice to annotate items to reveal type (such as protected/inherited)

TJ: yeah, other doc viewers do similar.

TJ: I just want to make sure we don’t regress usability.   I’m fine patterning after a popular api doc format, like xcode (previouly mentioned)

##### Percy Integration

SK: for PRs, we may have to move the percy to heroku ci.  Travis doesn’t let use env vars for outside contributors for security reasons.  Since heroku is private, it should not be an issue.

