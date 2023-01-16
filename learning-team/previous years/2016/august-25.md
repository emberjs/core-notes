# 2016-08-25 Agenda

Previously

- [x] Gavin to paste basic video outline before core meeting
- [x] Leah to bring up video at next core meeting
- [x] DB: pursue Firebase upgrade question
- [x] DB: respond to welcome page feedback
- [x] DB: review tutorial
- [x] TJ: look at inspector video, ping locks to get Teddy to look at it.

Topics

- Videos Update
  - Core Feedback
  - Inspector Feedback
  - Proposals going forward https://usecanvas.com/ember-docs/getting-started-video-proposal-v01/4sKvjQSrXoPfg03rTErkCs
- Welcome Page Update
- Firebase Update
- Is Subroutes Tutorial Ready to merge Yet?

# Action Items 

- [ ] RM: talk w/ core wrt `application.hbs` / `welcome-page`
- [ ] GJ: will come up with a script outline, possibly intro music, other items for us to discuss
- [ ] DB: will talk with Firebase contact to understand billing questions here
- [ ] RM: Blog post before vacation :-)
- [ ] RM: Get Stanley access to learn
- [ ] DB: Work with Stanley to move api-doc repo to ember-learn

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- GJ: Gavin Joyce @gavinjoyce
- SV: Steve Valladolid @mellatone

## Notes

---

### Video update

GJ: There was [feedback from the core team](https://github.com/emberjs/core-notes/pull/98/files#diff-3a952088bf78a9dc88a96a969107a1e2R21) on the original proposal. Here's an [outline of an updated proposal](https://usecanvas.com/gavinjoyce/getting-started-video-proposal-v02/7KMiPiJS7Dqi6ML0ORvCm8). This time next week we'll have a script outline for the Inspector video, and some experimental clips for consideration. The style and quality of this video can be a testing ground for the proposed Ember introduction videos.

### Welcome page

DB: How do we get resolution on this?

RM: Will talk to core about it.

### Firebase

GJ: is staying with firebase something we will do long term, or are we still considering alternatives?

DB: I need to clear up some questions with our Firebase contact.

### Subroutes tutorial

DB: 2 open questions

1. use of `controllerName`
2. use of `replaceWith`

RM: We should get a core member to review/approve before merge to settle

TJ: will replace replaceWith with just setting path to '/' 
_Update:_ Leaving replaceWith as is, setting path to '/' will invalidate nested routes.

### Hearth

RM: keeping up Hearth: need to replace logo.  Need Stef P to incorporate node so that users don't have to install it themselves

### Inspector

RM: Talked to Teddy.  At the moment he's working on Glimmer with Yehuda and Godfrey, then going on vacation.  When he comes back we'll schedule some video calls for knowledge transfer.  Probably mid-September.
