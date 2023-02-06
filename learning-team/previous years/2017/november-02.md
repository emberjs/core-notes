# Learn Team Agenda 11/2

## Topics

- Search Update (MS)
- https://docs.google.com/document/d/12XbQZW_m4uZUWZFypd0yxNCi-sPVw-GCFekxz4mc4-0/edit?usp=sharing (MelS)
- 24pullrequests.com (RM)
- API

## Action Items

- [x] Staging env for API docs is badly needed
- [x] Need to continue updating content in Ember itself
- [x] Finishing up redirect work
- [x] Redirect with Fastly in staging too, or drop Fastly - talk to @amrylam to see if there are any clues
- [x] Find out what @mixonic did to the buildpack to get around previous bad deployment
- [x] Breakout w/Todd Jordan and Michael Schinis on search structure
- [ ] ID 2nd contributor to help with search - Jen will reach out to wmattgardner and connect with TJ/MichaelS
- [x] Burndown list of everything that would need to be ported into a staging env
- [ ] DB: Heroku blog post to launch on 10/23, DB- my focus now, dedicating time next week.

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- MS: Michael Schinis @mschinis
- MelS: Mel Sumner @melsumner
- JJ: Jessica Jordan @jessica
- CM: Chris Manson @real_ate

### Notes

#### Website Document

- Mel created this https://docs.google.com/document/d/12XbQZW_m4uZUWZFypd0yxNCi-sPVw-GCFekxz4mc4-0/edit# which will aid designers in contributions to the website

- RM: Since Mel/Jen aren’t around we may table

- Mel arrives

- MelS: trying to enable others to contribute, I wanted to write down roles and responsibilities on the website and to identify needs/holes so we could go into the community and recruit.

- MelS: Hoping the others review and update this document so that we can post and get others to contribute to the site.  in chicago we have a lot of enterprise power with the ability to contribute and I think we

- MelS: So if anyone has ideas and things they want to add that would be great.

- TJ: What would we do with this once its done?

- MelS: we could put it in an markdown file in the repo, or make use of the github projects tab.

- TJ: and what about the survey

- MelS: was trying to understand the list of priorities and locks suggested a survey, so have developed that out.

- TJ: is that something we can include in the newsletter this time?

- MS: yeah should be good to go

- JJ: sure!

- RM: I can review tomorrow morning

- JJ: sounds good

#### 24 PRs

- RM: similar to hactoberfest, kind of an advent calendar where you submit 24 prs in december.  We as maintainers should provide necessary stuff to direct new contributors to the project.
- RM: Just mentioning as something we should be aware of.

#### Review apps for Guides

CM: app I’m working on is tied to ember eductions, so I would like to try to emulate my docs based on the ember guides, so I’m interested in assisting in development of an ember-based successor.  It would be good to have a deployment environment where we could test guides before going into prod.

RM: right now guides is on netlify, but I believe it does have review apps for PRs

TJ: if you are creating a new ember app for it, you can develop out of a separate repo, and when the time comes we can move it to ember-learn and leverage our heroku infrastructure, which takes advantage of pipelines, etc.

CM: sounds good

#### Search!

MS: Finished the piece that pushes to algolia and stores json files locally.  One problem that fastly rate limits during index, so would like to switch endpoint from fastly to S3.  But I need to know the actual endpoint url behind fastly.

TJ: I can give you that right away…

MS: cool.  I can give folks access to algolia if you guys sign up and give me account names.  If you give me s3 url today I can have impl done by this weekend and have the UI stuff done by next week.  Will share a bunch of stuff this weekend.


