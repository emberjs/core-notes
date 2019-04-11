# 2016-04-14 Agenda

# Previously

- [ ] RT continues with consistent voice updates in quickstart (no merge 'til emberconf)
- [x] SV: Take a look at welcome page PR to see if he can take it forward (done by DB)
- [x] DB: Research schema.org as an SEO solution 
- [ ] YK: Reach out to google contacts for SEO guidance of ember docs
- [ ] DB: clean up of issues, PRs on the guides repo
- [ ] DB: remind @wycats to reach out to google contact about SEO
- [x] TJ: reach out to a core team member on getting access to write to super rentals, and assign ownership on guides.
- [ ] TJ: fix Kris Seldon's private hiding PR and get it merged
- [ ] TJ: review private api handling in website API successor
- [x] RM: reach out to `@wifelette` about creating a learning repo and next steps on website navigation restructure.

# Topics

- controllers
- new org
- website changes

# Action Items

- [ ] RM: Brain Dump of Controllers with EB
- [ ] LS: Bring up creation of learning team github org with core
- [ ] RM: Talk to Ryan L working on responsiveness to see where he's at
- [ ] RM: Send out some website redesign thoughts.
- [ ] LS: Bring up consolidating navigation under "Learn" with core

# Minutes

## Attendees

- Todd Jordan (TJ) `@todd.jordan`
- Ricardo Mendes (RM) `@locks`
- Eric Bryn (EB) `@ebryn`
- Leah Silber (LS) `@wifelette`

## Notes

### Controllers

EB: Discussion to be had with RM about how I teach controllers and how to communicate it. (brain dump).  Need a sane way of teaching controllers that undoes the damage caused by routable components.

LS: Chatted with YK.  Agreed.  Mentioned its very nuanced.

### Learning Team github org

RM: LS, what are your thoughts?

LS: Mixed feelings, what are we trying to accomplish?

RM: I've been having to develop new stuff on my own account, and github permissions are  not fine grained enough.  Not able to create org and difficult to give rights of things like issue assign to team members.

LS:  Need to talk to larger core because this is a big decision and other teams may follow.  Put it on core team agenda.

### Website Redesign

RM: Moving code samples on main page to twiddles.   Current examples all contact external api which is blocked by twiddle.  We'd have to reconsider the examples and rewrite them without the dependency.

LS: is there still work on making the website responsive.

RM: Maybe Ryan, will get up with him.

LS: Lets figure out if that is happening because we may want to hold off to avoid big conflicts.

LS: For main page redesign, new designs never materialized, but we may be able to take some things for inspiration.

LS: Beginning to think it will be hard to redesign site successfully without paying someone, and we can't pay someone.

EB: What do you think the budget for something like this might cost?

LS: we have a lot of pages, so it might be as high as 20-30k

EB:  Would not be opposed to donating to it at some point.  We can talk offline.  If we make it an ember app it will encourage community contribs.  We just need to start with a good design.

RM: We are working on an ember living style guide which will help with the effort.  I'm am part of the OSS Design org on github and the IRC channel for it.  Can possibly reach out to them at some point, if we get to that.

### Website guides/api structure change

RM: I want to rename guides to "Learn".  From that page we could link to guides, api, deprecations.  Future: Internals subdomain, showcase, and other stuff that falls outside guides, but are part of learning (currently we stuff things at the end of guides that aren't quite part of the mission).

LS: I like it because it would free up a navigation spot (with api falling inline with learn). Only concern is people may come with guide or api in mind, but on the other hand most don't know the difference.  I'll bring it up with the core team to see if there are any objections.

RM: I want to write a blog post about the Learn team.  Was waiting for a blog post on subteams. 

LS: will ask tom about it.

RM: Should I write the blog post so that is goes as part of tom's post.

LS: no, just go ahead and write it separate. Will put pressure on the others :-)

RM: also want to tweak the blogs page, because recent blogs is random and confusing.  Hard to find old posts.

EB: Did codescool blow up?  What are we using now? 

LS: Learning team working on alternatives with tutorial and getting started

TJ: I can make that a higher priority

EB: how about incorporating fastboot?

RM: we need to consolidate documentation into the new Learn page for core things like fastboot, cli, etc.

TJ: need to get the learn page first, and then work with the other teams to port documentation.
