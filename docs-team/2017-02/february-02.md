# 2016-02-02 Agenda

### Previously

- [ ] RM: CouchDB access for Ilya
- [ ] RM: Make issue about Core Concepts missing Controller
- [x] DB: integrate the Netlify CLI tool into guides CD system, make sure it works well
- [ ] GM: file fastboot issues from api docs
- [ ] SR: send locks like to emberitas workshop materials
- [ ] DB: Will toggle a "enforce HTTPS" checkbox on Netlify on guides if we don't get any negative feedback in the next week
- [ ] RM: Create an issue to improve component layout api docs.

### Topics

- Status updates
- ?

# Action Items

- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- AS: Alex Speller
- SV: Steve Vallanoid @mellatone
- IR: IIlya Rechencko
- GM: Guarav Munjal
- MA: Miguel Andrade
- RM: Richardo Mendes

## Notes

---

### Steve

Working on Ember Help Wanted, haven't checked in on the Backend.  Need to get up with `@acorncom`.

### Alex, Ilya, Miguel

Here to help out with Twiddle

### Yaw

Working on Tutorial replacement app

### Locks

Working on several efforts in the leadup to Ember Conf (Watch, Twiddle, etc)

I'd like to use this meeting to coordinate Twiddle since it doesn't have its own meeting.

I'd like to do the same for Inspector...

### Twiddle

IR: I have a PR to improve the responsiveness/layout, ready to merge (dependant on some cleanup and tests.  _Demoed new functionality to the team_

RM: We need to clean up the process on how we get our design changes approved.  After the call we will write up a short document and add it to the repo.

RM: Any concerns or objections to the PR?

IR: Couple of things stuck on.  There was a logo with the original mockups.  Tried to contact

SV: Have we tested enough to be sure there is parity with the current version of Twiddle?

IR: Still some work to do there.

RM: some issues with the editor, swich to Monaco.

MA: Monaco needs to be inside an iFrame

GM:  but the editor is not in an iFrame

RM: will revisit it.  I don't want to block the redesign on it.

RM: Priority is getting tests passing and features working.

GM: Mike North wants to do some work to add a code reviewer.  (separate effort)

### Porting emberconf website to Ember

RM: Working on getting it moved over before the conference, for dogfooding and having a better dwa harness.  `@villander` helping out

### api-doc app replacement

TJ: Status update: was able to spend some time today on the app.  There's a blocking issue around the display of namespaces vs classes in a submodule.  The heart of the issue is around how we are documenting some of our classes, so instead of tackling that bigger issue, I'm making the UI work like it currently does, combining the two types in the list for a submodule.  I should have a PR today.

GM: Need to get some more people on board with finishing out the api-doc app

RM: I think we should do something similar to inspector, in having a separate app for the viewer as the web site .  Would be reuse between the two.

TJ: Would be great also to have some help with deploy and algolia.

RM: We possibly can recruit.
