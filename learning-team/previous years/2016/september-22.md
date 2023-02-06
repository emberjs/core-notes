# 2016-09-22 Learn Team Meeting Notes

### Previously

- [x] DB: will release 2.8 guides when we're ready for that 

### Topics

- Inspector video
- Help Wanted tool update (David)
- Blog post
- Locks is having an identity crisis
  - Frontpage
  - Learn page
    - FAQs
    - Glossary
  - Roadmap/statusboard
  - Builds app
  - Fancifying Guides
    - O'Reilly
    - Interactivity
    - Future proofing
  - Future proofing Guides
    - classic | closure actions
    - classic | pods | module unification
    - `Ember.Object.extend`  | `class X extends Ember {` (???) 
- New guides content needed
  - testing (helpers, etc)
  - lifecycle rules
  - next tutorial section (forms)
  - 2nd party doc consolidation (engines, fastboot, cli)
- How to push emberfication efforts forward?
  - api docs
  - guias
  - builds
  - web site

## Action Items 

- [ ] TJ: Start on testing section improvements
- [ ] RM: Learn team blog post
- [ ] DB: Make progress on search
- [ ] LS: Bring Learn page to Face to Face to get feedback, also bring up getting help on new content such as module unification and glimmer 2.
- [ ] Team: get RM ideas on improving website.
- [ ] TJ: Compile a list of blog posts/articles that give a high level overview of data flow in ember

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- GJ: Gavin Joyce @gavinjoyce
- LS: Leah Silber @wifelette
- SV: Steve Valladolid @mellatone

## Notes

---

### Inspector video

- GJ: got some additional feedback on the [inspector video](https://www.youtube.com/watch?v=eIc55fxOUAw), aiming to work on it this weekend and re-work it into a hopefully final version
- GJ: what would be the next video priority?  Another topic? welcome to ember?  If nothing obvious, will do welcome to ember.
- DB: could get Leah to show to the core team to see if its the style approach they would like for videos.
- GJ: would like the weekend to apply final polish, will share the final version then.

### Help Wanted Tool

- DB: Will Combine various github repos into one place and put it on the web site.  Punch list for meetup organizers. 
- DB: https://github.com/ember-learn/ember-help-wanted
- DB: Tried firebase to host,  didn't work out - can't to querying very well, especially with permissions.  Tried couchdb, not a good fit.  Still looking for a backend technology.  Possibly Denali?  Tom Dale has been looking at it. Dave wasmer(?) is the contact on that.  Dave is willing to pay for backend hosting with the purpose of stress testing the technology.

### Website

- RM: Growing not to like the web site for various reasons.  Will ask the team for ideas on what do with it.  Intends to send Leah a proposal.
- LS: Kris Seldon introduced me to someone wanting to redesign, but fell through.
- RM: Get me your thoughts on what we need to do the web site

### Blog post

- RM: have not got to it but will now come to the top of my list

### Learn Page

- RM: To have a talk with Yehuda about FAQ and some other learn page related stuff around onboarding and repeat experience.  Roadmap/status board may go to builds page, but we need to work on it.

### "Fancifying" Guides

- RM: Take inspiration from O'Reily to have footnotes and callouts, nicer way to provide links.  
- RM: Interactivity to switch between classic code paths and module unification
- RM: Runnable code samples (twiddle)

### Future Proofing Guides

- A lot of people still want to use classic actions, and we don't do a good job explaining that there are two types of actions.  The currently have to go to older guides versions to read about them.  Matters because of module unification and glimmer components.  Need to be able to introduce concepts and differentiate paths.
- DB: Concerned about the amount of work.  I see that the priority is clarity of guides over new features, such as classic vs closure, etc.  I think the primary thing to work through is to work through these different paths.
- TJ: I think we need to do a better job around explaining component data flow (DDAU).  Our guides are pretty into fine detail, but don't introduce higher level concepts.  There are a few blog posts that do a decent job at this.
- DB: could you compile a list of these, so maybe we could ask some of these authors if they want to contribute concepts.
- RM: This is an overall comment for guides.  I think we can do a better job all around when explaining high level conceptual stuff.  Maybe separate our sections.

### More Learn Page

- DB: would you (LS) agree that the learn page is blocked on styling?
- RM: It could look better, but I think we are more blocked on advanced topics
- DB: we should save advanced topics for later and expose it then.
- RM: Lets resolve the menu bar discussion then.
- LS: I think its intuitive that "Learn" would lead to guides and api, but I know that not everyone would agree.
- RM: its what angular does
- LS: could we just replace guides with Learn and leave api
- DB: I would like to replace both guides and api with learn, but I know there would be pushback
- LS: why don't we just propose replacing both.  we can always comprimise
- RM: I think pushback would be temporary
- LS: just added to core face to face agenda
- RM: if we keep the api header, should have a drop down with ember, data, cli
- DB: if we have dropdowns, I would like the top headers to be clickable, so that if you do click api, or learn, you go to the appropriate landing page
- RM: would eventually like to switch learn page into beginner/intermediate/advanced
- GJ: I think having to read into the page to figure out what to click on is a usability  regression.
- RM: would like to put nice icons/graphics to represent major topics but need design help.
- GJ: could ask some intercom design people.
- RM: last aspect is consolidating ember-cli and fastboot etc documentation pages into website/website style/learn page.
- DB: Concerned about the docs updates required around module unification
- RM: Would like to get leah to add to face to face.

### New Content

- RM: Lots of content needs to be added.  We need new people but we have to be careful around cohesiveness. 
- TJ: would our time be best served detailing issues around what the content needs to be and then recruiting people?
- RM: would like to avoid it for the tutorial, but stuff like testing, doc consolidation, infrastructure would be helpful.
- RM: its my goal with the blog post, to be a recruiting plea.
- DB: Is search important enough for me to keep working on it? _(all: yes)_ DB: :-(
- DB: Think that testing gaps is a good first start (Todd)

### Emberfication

- TJ API - we need to talk to stanley to get him to move to ember-learn so we can start merging.  I can ping him in the next week.
- DB: asked a couple times
- RM - website and other stuff ready to move to ember-learn.
- DB: yeah, just need the time to do it.

### Inspector/Mirage

- RM been triaging with Teddy.  from 113 down to 73 issues
- DB: got committer access to mirage last night. Helping sam with triage
