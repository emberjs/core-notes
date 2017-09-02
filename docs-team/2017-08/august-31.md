# Learn Team Agenda 8/31

## Topics
- Status Reports

## Action Items

- [ ] YB: clean up the tutorial PR to the website
- [ ] RM, KG: Pair on proposed Guides ToC  (after ember camp)
- [ ] RT: update on discourse+blog integration
- [ ] DB: pending Leah creating Heroku org for Ember to shift to new org approach
- [ ] DB: Heroku blog post
- [ ] RT: Write Rolodex/Contact Book Tutorial to launch with 2.16
- [ ] TJ/RM: record/task out stuff that needs to be done for the api changes in 2.16
- [ ] JW: see what breaks upstream when trying out @module/submodule format in YUIdocs (how does this affect jsonapi-docs and API site)
- [ ] RM, Teddy, Jessica: solicit contributors for js module (176) testing of ember inspector

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes
- JW: Jen Weber @jenweber
- MS: Melanie Sumner @melsumner
- JJ: Jessica Jordan @jessica
- RT: Ryan Tablada @rtablada
- JG: Jared Galanis @jaredgalanis
- DB: David Baker @acorncom

### Notes

#### Router service documentation

RM: We need to document router service to release 2.15.1 asap.

RM: Will open a PR

#### Roadmap Page

RM: working on it this week, its a big priority for me.  working on status boards this week so I can do a release page next week.

#### Algolia API

MS: Have a pull request for search classes ready.  as soon as that’s in I can test it on a branch and take it live.

MS: When Algolia merges, we can manage our own index/data.

RM: We are likely going to have to push more stuff into release builds.

#### JavaScript Primer

JG: Plan on getting modules and arrow functions in a PR soon.

RM: Don’t worry about small prs, that’s better for us.  I added some edits to your pr.  Ryan can you also look?

RT: sure

#### Ember API Docs

JW: was trying to get everything running locally, still debugging to get a local end to end development env.  Early indications are we should be able to fit the new packages into yuidoc’s current syntax and display things in our UI.  Its a matter of testing it out and finding any gotchas.  I’ll be back on it this weekend if anyone wants to help, get onto to team-learning slack

TJ: I should be able to dedicate another evening to it tonight.

#### Newsletter

RM: Jessica has been taking on a majority of the work for the ember times newsletter

RT: Maybe we should crosspost to blog?

RM: I don’t think the newsletter fits quite well with the blog

RM: but we should make sure it’s linked (/learn, /contributing, /community?)

RM: _(some discussion of twitter)_

JW: We can help signal boost plus I know when you hashtag things emberjs a bunch of bots pick it up

RM:  I don’t know if Ember Weekly mentions us, but I have talked to them to make sure there’d be no conflicting work/competition.  There are some complimentary differences between Ember Weekly and Ember Times

  Weekly: new posts, meetups, addons
  Times: what current efforts are going on where folks can help contribute to

JJ: How do people find out about the newsletter actually

RM: There’s the announcements channel on slack, word of mouth

#### Tutorials

RT:  working on getting us off of middleman and onto an ember-based stack for a tutorials viewer.

RM: tried this once with guias to get us on ember.  Glad we are picking up again

RT: looking at using fastboot as a rendering service and then push the html content it produces  to s3.

RM: Ping Mel bc she has some componentized assets you can used (ember-styleguide)
