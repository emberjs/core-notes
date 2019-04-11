# Learn Team Agenda 10/19

## Topics

- Retro part 2 (retro pt 1)
- Algolia / search

## Action Items

- [ ] Staging env for API docs is badly needed
- [ ] Need to continue updating content in Ember itself
- [ ] Finishing up redirect work
- [ ] Redirect with Fastly in staging too, or drop Fastly - talk to @amrylam to see if there are any clues
- [ ] Find out what @mixonic did to the buildpack to get around previous bad deployment
- [ ] Breakout w/Todd Jordan and Michael Schinis on search structure
- [ ] ID 2nd contributor to help with search - Jen will reach out to wmattgardner and connect with TJ/MichaelS
- [ ] Burndown list of everything that would need to be ported into a staging env
- [ ] DB: Heroku blog post to launch on 10/23, DB- my focus now, dedicating time next week.
- [ ] RT: Write Rolodex/Contact Book Tutorial - still 2.16
- [x] JW: Reach out to sugarpirate about getting some blog posts into Ember Way (informal) - update 9-21 - haven’t heard back yet, will ping Lauren and/or other contributors again - update 9/28, sugarpirate says bring on the blog posts!
- [ ] JW: Chat with Tobias B about possibly piping Discourse Q&A into Stack Overflow. Ponder SO barriers and solutions. - update 9/21 - decided on involving a small number of people privately for Stack Octoberflow. Will reach out to them in the next weekish.  Update: currently swamped

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- JW: Jen Weber @jenweber
- JG: Jared Galanis @jaredgalanis
- DB: David Baker @acorncom
- MS: Michael Schinis @mschinis
- TL: Terence Lee @hone
- RT: Ryan Tablada @rtablada
- MelS: Mel Sumner @melsumner

### Notes

#### API docs

- (TJ) Status of API stuff - Merged fix to legacy redirects, worked ok in staging but not on prod. No confidence in staging env.  Really need the staging to mimic prod. Ember core docs are under review and going into canary. Siva is maybe working on this too, trying to get staging env for data. Prod problems were the same symptoms as the first bad deploy, before @mixonic’s work on the build pack. …and Status Page went down, mysteriously. Only change was adding some routes for legacy APIs.

- (RM) Glimmer API docs not building

- (MelS) Didn’t we solve the status page? (RM) direct linking to website CSS was breaking, but now it’s included in Statusboard

- (TJ) Still working on mapping for url links. Getting 1 ping per day over broken links :(
- RM: Need to list out all the things that need to be done to get our heroku apps a good pipeline to production.

- JW: if you want to ping me with stuff you know about I can put together that list.


#### Search

- (MichaelS) Need to work on how data structure works in JSONAPI docs. Need ~ 1 hour with TJ to go over implementation details. Should shift docs from Algolia to our own custom implementation so we can make our own scripts w/o waiting for 5 day lag. (DB) Will Algolia comp the new search service? (MichaelS) Yes, as Algolia ambassador, has that as an option. (DB) what happens with Guides docs? (MichaelS) Guides need to be ported over.

- JW: do we need a fallback until this is ready?

- MS the indexing part: if I can finish by mid next week (can work this weekend), then the ember side should not require much change. Maybe 2-3 weeks until we have it.  Maybe we can use the data store to search until then.

- DB: we could also have the search box on the ui and give a coming soon method

- RM: we could also do a google search until then

- MS: You can also prefix the search so it gives just our stuff

- RT: is there a way to force google to re-index

- MelS: yeah, there is.  I can share that with the group.

  - https://support.google.com/webmasters/answer/6065812?hl=en
  - DB: https://css-tricks.com/on-site-search/

- RT: also pinging an seo expert.

- RT: From eventbrite SEO expert: “Do you have a sitemap.xml file? That would be the fastest. Submit that and you’re asking Google to recrawl”

- JW: There’s a new contributor to help with search, that could help in the future.  Maybe TJ, MS could have him sit in…

- TJ, MS: 👍

#### Release Process
    Discussion of how things could have gone better. Delay release? not an option. Push feature to next release?

- RT: complex infra seems like a barrier

- TJ: really needed a release week/freeze time and we hit prod env problems

- RM: what is meant by feature freeze?

- TJ: we need a week for testing

- RT: we can do that. Just need to set our own targets

- TJ: this is a process limitation

- RM: tech limitation is that there is only 1 version for the guides. I want a repo with a folder with Markdown files per version. Jared & David have put some work into it.

- DB: 2 issues here. Links and all the API docs. Which are we talking about here?

- RM: Can’t merge future guides stuff. It would have to sit in a branch. Links wouldn’t have been a problem if redirects were working

- TJ: PR for documentation had been sitting for weeks without review, until the last minute. Then deploy from a branch caused some pain.

- RM: PR should have been in prev cycle. This is a very specific problem that we can take measures to prevent in the future. Module unification will be the next big challenge

#### Ryan

RT: Erik and i are doing ember weekly so you you have stuff to promote (like contributor calls) that let me know.  Also helping Jared with the primer review.

RM: Idea behind the primer is to ship something for now, and have the headers stay static as possible (cause they are anchors) and update content as we go (refine, refine, refine).

TJ: what about rolodex

RT: would like to pair and create “fitzgerald.js” (ember’s version of gatsby), to turn markdown to ember.  was going to incorporate

#### Misc Locks

RM: Mel and I are coming up with a plan for CSS in the website.  There are changes that we are considering there. Status bar still needs some tweaks.

RM: we are not hacktober friendly at all atm.  If anyone wants to spend time developing out issues and and triaging that would be awesome.
