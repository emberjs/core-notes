# 2016-10-13 Agenda

Previously

- [ ] RM: Will talk to Mike North re: Glossary option
- [x] TJ: Start on testing section improvements
- [ ] RM: Learn team blog post
  - [x] ish, started and got stumped
- [ ] DB: Make progress on search
- [x] LS: Bring Learn page to Face to Face to get feedback, also bring up getting help on new content such as module unification and glimmer 2.
- [ ] Team: get RM ideas on improving website.
- [ ] Discussion of issue labels?

Topics

- TJ: Remove Mirage from Tutorial? https://github.com/emberjs/guides/issues/1695
- DB: API repo transfer?
- DB: Help wanted update
- RM: [ES2015 primer](https://github.com/emberjs/guides/blob/es-primer/source/localizable/getting-started/es-primer.md)
- RM+DB: design/marketing

# Action Items 

- [ ] RM: Check with CLI team re: are http-mocks deprecated / going away in the long-run?
- [ ] RM: talk w/mike wrt tutorial mirage.

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- LS: Leah Silber @wifelette
- SV: Steve Valladolid @mellatone

## Notes

---

## Search

DB: 1.10 is blocked, ran into trouble building things here, need to revisit.  A guy volunteered to help work on other versions this weekend, so may be able to make some progress there.  Priority now is help wanted.

## Tutorial Back End

TJ: Reasons for Mirage was that its a common addon when acceptance testing, and we wanted a way to serve data out of the box.
I understand/agree that this is easier to grok for a programmer coming from other javascript/web technologies, but harder for brand new developers.

RM: Sam has a backlog item to make mirage serve over node, so we could eventually get to a place where mirage is debuggable through the browser network tab. 

TJ: Yeah, looks a little ways off, and currently seems to need a volunteer for that.

DB: iirc Http-mocks is not something the CLI team wants to push long term, so not sure that http-mocks are the answer here. 
Could we try to make things clearer by moving Mirage and ember-data to later in the tutorial, letting tutorial users get further along until introducing it to them?

TJ: Yes... We would have to figure out a good flow for that, but I think we could do something there.

TJ: What about using a hosted service.  ember-cli-101 book uses a shared rest/active-record service.

DB: unsure whether a data hosting solution could require money

RM: Would like to also run offline

RM: I'll volunteer to talk to Mike about the issue to understand the problem more, also about the potential of getting a common hosted data service.  
In general I'd like to review the guides from top to bottom.  
We are mostly in agreement that we want to introduce mirage at some point, and we want things to work offline, but we do think there are things we can do to improve experience for brand new users

### API App

DB: Still working things out with Stanley _Update: DB met up with him.  He's looking for help.  Looking to Todd to assist in remaining work._

### Help Wanted

DB: Siva has been helping.  It is close to being ready.  Using Denali.

DB: Would love to brainstorm UX/UI with SV

SV: gamification!!!

### ES2015 Primer

RM: Focusing on features that people are commonly not familiar with, as they relate to ember.  (ex. arrow functions not working with computed properties) .  Link on the agenda.

DB: how to introduce once written... not at a point to worry about yet.

### Design/Marketing

RM: didn't get with steve (left early), but melsumner (slack) working on color contrast and dropdown menu.  Giving her time to get setup and try out.

DB: Does she need help? If so I can spend some time with her.

RM: Yeah sure, but she is on windows so good luck ;-P

### welcome page

yehuda wasn't able to bring it up at the last meeting.  Will talk to some individually.

### Build page

build page is done. We just need to get it deployed to ember s3 + permission
