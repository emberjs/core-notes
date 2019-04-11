# 2017-03-02 Agenda

### Previously

- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] SR: send locks link to emberitas workshop materials
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo#
- [ ] All: Mark items in each learn repo as "good for new contribs"

### Topics

- (public) [https://github.com/emberjs/guides/pull/1829#issuecomment-283738304](https://github.com/emberjs/guides/pull/1829#issuecomment-283738304) (RM)
- DB: retiring sub-team members from the teams page?  Stanley stepped down iirc
- (private) DB: Heroku, blog post re: Fastboot?
- api docs!

# Action Items

- [ ] Team: Give Ilya feedback
- [ ] TJ: open issue about testing "extra credits" design
- [ ] DB/RM: Give Todd feedback on tutorial, let's get it merged
- [ ] RM: Bring up API fastboot stuff at core team meeting, get a decision there

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- RM: Richardo Mendes @locks
- DB: David Baker @acorncom
- IR: Ilya Radchenko @knownasilya
- MS: Michael Schinis @mschinis

## Notes

---

## Status updates

- DB: working on help wanted next week, running an OSS meetup, gathering issues for it, working on API docs infrastructure

### Fastboot

DB:  In talking with my heroku contact, he things its possible for them to give us a dyno for fastboot api docs usage (and possibly for other learning things).  He needs to talk with marketing.   Would like to know if we'd be willing to write up a blog post explaining our usage of heroku to power our api with fastboot.  I wanted to run things by core as I felt I they might want to be the folks negotiating these types of things.

RM: Yeah, we've talked about this some already in core meetings, and core has a good reporte there.  Will bring it to the core meeting and get a decision made.

### API Docs

MS: Did some research on search.  Going to look at it more this weekend.  It will probably be a weekend's worth of work to get it hooked up once the app is ready.

TJ: There's a sequence of things that need to happen before we can get search working. (see issue:)

1. get static docs to server
2. replace pouch with indexedDB
3. upgrade fastboot
4. Algolia

TJ: Other folks helping out currently:

-  siva's been working on the static docs piece hand has the structure deploying
- Asa may be helping on the glimmer end.  Need to circle back with him to sync him on siva's work
- emilio has been picking up existing issues and fixing
- Todd's starting on service worker work tomorrow (has a day dedicated)

### modelFor, paramsFor PR

IR: [https://github.com/emberjs/guides/pull/1829](https://github.com/emberjs/guides/pull/1829)

RM: This section needs to be more obviously connected to nested routes.  Lots of people use the API wrong.

RM:  Lets make the section more obviously connected to nested routes, and link to it from the nested routes section.

### Tutorial

RM: have not been able to get up with yaw.  We may not be able to have the tutorial separated from guides before emberconf.  Looking for someone to help (its Ruby)

TJ: I've updated my PR around testing to more clearly delineate the test sections and provide links for people to skip them if not interested.  Will need people to walk through the tutorial with the perspective of not being interested in test, and then again with the tests to see if both scenarios flow well. [https://github.com/emberjs/guides/pull/1818](https://github.com/emberjs/guides/pull/1818)
