# Learn Team Agenda 7/6

## Topics

- API Docs v 1
  - algolia
  - prs
    - legacy ember data: https://github.com/ember-learn/ember-api-docs/pull/253
    - hashes https://github.com/ember-learn/ember-api-docs/pull/249
    - link-to → href-to https://github.com/ember-learn/ember-api-docs/pull/252
    - /release requests https://github.com/ember-learn/ember-api-docs/pull/239
  - other?
  - issues
    - no older patch versions: https://github.com/ember-learn/ember-api-docs/issues/179
    - internal server error not showing error template: https://github.com/ember-learn/ember-api-docs/issues/186
    - drop from release: https://github.com/ember-learn/ember-api-docs/issues/216 (only the case where we hash on root)
    - glimmer
- Glimmer Conversion
- Help Wanted App
- Hearth
- Tutorial
- Guides TOC structure

## Action Items

- [ ] DB: Will keep working on reworking Middleman build process
- [ ] DB: Infrastructure blog post
- [ ] YB: clean up the tutorial PR to the website
- [ ] RM, KG: Pair on proposed Guides ToC  (after ember camp)
- [ ] TJ: Go/No Go call on API Doc (Monday)

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- DB: David Baker @acorncom
- YB: Yaw Boakye @yaw
- KG: Katie Gengler @katie
- SK: Sivakumar Kailasam @siva
- TL: Terence Lee, @hone

### Notes

#### API Docs

TJ: We have 4 prs and 4 issues of note (see agenda).  Two of the PRs are from me around supporting legacy urls.  One is ember data and other other is supporting hash methods.  Seeing some issues on these in the heroku previews, but seems like it is unrelated to the actual fixes.  Going to try out in staging.

TJ: the other 2 issues are from Martin, and I think we can push those out to next release, or a patch.

TJ: Also there are some issues out there.  One is we don’t support urls with past patch releases.  This could be an issue if someone bookmarks .1 and the .2 patch comes out (the original url becomes invalid).  There are several ways to fix this.  One is showing all patches, another is redirecting old patches to current

RM: What about just showing minor releases, like we do in the ToC?

TJ: That’s one of the options as well.

RM: Actually I think we should just always show the current patch, even on past patches.  That way if someone enters a url based on a version manually based on a version they get from inspector, it will show them docs.

TJ: ok

TJ: finally, we have an issue where when you type an invalid route url, fastboot gives us a plain 500 internal server error screen.

RM: we should try to use a catch-all error route and see if that helps.

TJ: yeah, we can try that.  if it doesn’t work we can pursue with the fastboot team.

TJ: Also, @mschinis mention in slack that the Algolia team is good to go with indexing the new site, so we just have to let them know when we cut over.  He is also getting back to work on OSS next week so maybe able to help with any prs remaining.

TJ: There's an issue out there on using the glimmer nav bar.  It seems out of scope for v1.

RM: Let's move the html/css over as a template, until the story for ember/glimmer integration gets better, which should be soon.

TJ: ok.

RM: What are the blockers?

TJ: I think the 4  I mentioned (2 legacy url prs, back level patches, internal server error on bad route) are the ones (we could probably go out with the internal server error on bad urls since it only happens on bad urls, though not ideal).  Lets try to resolve these over the weekend and make a Go/No Go call on Monday.

RM: Sounds good.


#### Help Wanted app

SK: getting work done at the meetup this weekend, hoping to get some basic frontend structure there.   Dave wants that basic ui as well so his meetup (Denver) can also work on it.

RM: do you need a list of issues from us?

SK: if you could just make sure issues are labelled, that would be good.  No need to do before Saturday.

DB: Need some design help with that app.  locks if you know anybody

RM: I would give them a lot of work if I had some designers.  There’s an open source design org/irc.  They actually have a job board to submit needs;-P  Will need to write a somewhat formal proposal.

DB: We could use ember paper to start.


#### Hearth

RM: No updates from last week.  Still needs a build work. Need to get people to get on to try it.  The package panels are useful, also restarts your server when you install new stuff.  That’s why is useful to have it working.  Slight worry that the ember observer api isn’t public yet.


#### Tutorial

RM: Goal is to remove the tutorial from the guides and quickstart as well ASAP.  Yaw made a pull request to move to website.  There’s a lot of conflicts, so it needs some TLC.

YB: I’ll take a look this weekend.


#### Guides TOC

RM: The current headers don’t make much sense and give the impression that ember is very monolithic.  KG has ideas on the subject.

KG: Yehuda had a suggestion last week to change the TOC on the left side to simplify things, de-emphasize things that beginners don’t necessarily dive into at first such as ember-inspector, ember data, etc.  This is so that people brand new to ember can get to the essential stuff they need.  For me the fact that we have learn, api, and guides as separate links, which is confusing for new people.

RM: I’d like to get guides nested under learn , and the different projects nested under api.  my hope for the learn page is the hub for documentation for the different projects within ember.

KG: Someone could pari/propose a breakdown on what getting started should be, and propose a structure to the core team.

RM: I’d like to avoid broken urls if we can

DB: theoretically I don’t think we would need/want to change urls.

DB: to answer why show learn/guides/api, we had proposed that in the past, but were voted down by core team

KG: the main things of concern is not the top header, but the links under the learn page, and the TOC in guides, separating the essential from the rest.

DB: I think that would be useful to improve.

Everyone: yep

RM: we should take down an action item

RM: some cosmetic things: improve makeup of actual learn page, extract the tutorial and reduce the scope of guides, have separators between logical sections to clearly delineate simple vs advanced.  if you look at the glimmer website, the guides already have that.  We can experiment on things there as well.  Does that sound like a good start.

KG: I think so, but I think the guides need some more refactoring.  If you look at the vue guides they are very clear and logical.   ember core concepts seems like a puzzle to me.  need to keep perspective of a first time user.

DB: KG can you take the lead on that?

KG: I don’t have much time, but can pair with someone to come up with a simple TOC.

RM: I can help after ember camp

#### Website Colors

SK: Did we want to discuss website colors?

RM: I made a pr for the guides to have a white background and black text.  the API docs also need the same treatment.  the old toc on the blog also needs a color update (“pinkish”).  Need someone to tweak.

SK: did I hear something about changing the colors?

RM: Mel S and I had a little strike team but it fizzled, so we will continue to do small iterations on the design.  Eventually when every thing is ember we can bring in a style addon.

