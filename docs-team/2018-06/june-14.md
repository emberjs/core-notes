# Learn Team Agenda 2018-06-14

## Topics

- 3.2 search broken?
- Testing API docs - opened an issue https://github.com/emberjs/ember.js/issues/16749
- Status Update Contribution Guides - JJ
- Ember Times Content Update - JJ, see also meeting minutes here: +Ember Times Meeting June 2018
- How do we get the Times out to more people? Could start with an experimental banner on API docs https://github.com/ember-learn/ember-api-docs/issues/524
- Mentoring 🎉
- SEO update
- Ember CLI docs - I’m still plugging away, basic content first draft is done. So much great feedback from community members!

## Action Items

- [ ] Ask the Ember release team to ping us when they are doing a minor or patch release
- [ ] Write up the guides release process to include pinging Algolia
- [ ] We should just open an issue to just put the testing docs into emberjs core

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- JJ: Jessica Jordan @jessica
- CM: Chris Manson
- JW: Jen Weber
- RT: Ryan Tablada

### Notes

JW: Add pinging the learning team to the release process (need to check APIs and update Algolia)
RT: we could add this to CI maybe? When a build is triggered for a new minor branch (via regex) create an issue on the Algolia repo?
CM: It’s Guides that is broken for search. There are random versions that don’t work

#### Contribution Guides (JJ)

- JJ: I answered a reader question about how to start contributing and got the idea to create an overarching contributor page on the website to have a single landing page for new contributors.  Am going to spike on that this week.
- JW: People have been asking for that for a long time.  Agree that it should be on the website.
- TJ: Maybe we should RFC this since it add content to the website and updates the menu.
- JJ: Yeah, I can do that

#### Times:

- JJ: Seemed there was a sentiment from the 2018 blog posts that people don’t know what’s going on in Ember.  This led some discussions around the Times on whether there are things we can do to get our content out there. We discussed marketing, and adding ways to subscribe from blog posts, and looking at other major newsletters and see what they do. Most people seemed comfortable leaving the schedule as is, and increasing outreach.
- JW: I’ve seen other clis display a link when installed, maybe we can do something there with the times or announcements, etc.
- CM: Yeoman has something like that.  May need RFC
- JW: we could put up a temporary banner on api docs for like a month.
- CM: and use google analytics tracking on it.
- JW: will add an issue to guides
- JJ: I can work on it

#### Mentoring:

- CM: siva reached out saying there was someone who needed mentoring, that wanted to contribute to the ember website. I’m taking the opportunity to work with him through a contribution.  I’m keeping track of the session I have with him to see if we can use that as data to help future mentoring.
- TJ: would be cool to show takeaways/learnings in a public place
- CM: Yeah, not sure what will be useful or not yet but will report back

#### SEO:

- CM: been going very well with guides, hitting the top of a lot of results.
- CM: would like to make of list of things we want to be in the top 5 for
- CM: I have a pr to the build pack that will help things, but need to get hone to merge/approve https://github.com/heroku/heroku-buildpack-static/pull/105

#### CLI Docs:

- JW: I have the first draft done.  Response from community for review co-authorship was overwhelming.  trying to pick 4.  If there’s anything that would benefit from people willing to help contribute to content would should take advantage.
- TJ: what about broccoli?  I think oli had a broccoli tutorial
- CM: I talked to him about making it a site.  He mentioned it was more a guide to creating plugins, but would like to see it develop into a site.  Will reach out to him again.
