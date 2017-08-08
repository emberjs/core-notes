# Meeting: Ember Core Team 2017/06/30

### Agenda

- Release blockers (MB)
  - What’s up with Ember-Data
- Routing service blockers (MB)
- Svelte/Ember-build-for-prod-app blockers (MB)
- visioneering F2F format retrospective
- roadmap progress
- Learning team post about ember-api-docs (RM)
- Testing RFC’s to FCP? (RJ)
  - https://github.com/emberjs/rfcs/pull/232
  - https://github.com/emberjs/rfcs/pull/229

### Attendees

AM, GC, CH, KG, DG, RJ, TD, MB, RM, KS

### Minutes

#### Release blockers

MB: (notes)

- MB will check on twokul’s draft for ember-cli
- Can we do a countdown for when a blog post is due
- Runspired is working on ember-data blog post
- SP mentioned there are some issues with Ember-CLI and Node 8. SP will try to communicate some issues to Node 8 team via TD and Miles.

RJ: there are two issues on ember-data. There were release management issues and perhaps things were landed too late in the master cycle. Landed too much churn at once. And to be clear this is all my subjective feels.

RJ: Second thing is more concrete. We made relationships more lazy and unfortunately we added an assertion for when you eagerly push a record and are missing a sync relationship. However anyone using the `unit: true` setup in tests (for example) were hit with assertions in all their tests since those files were now required.

TD: Was nobody following beta?

RJ: New and cutting edge apps don’t use `unit: true` and wouldn’t notice. Apps with legacy generated tests would be hit, but they would be less likely to see the error.

RJ: We will probably remove the assertion in a patch release.

TD: Perhaps a meta-problem that we need more conservative mindshare in the ember-data sub-project.

RM: I think they have not had a meeting in a while (2mo?)

TD: Well that seems like part of the problem

(discussion)

SP: I think people working on ember-data did not feel empowered to clean up that codebase. I think the conservative thing might not be true, but there was just a lot of compression/debt that was looming.

TD: I’m happy runspired and others have a vision for ember-data, and that seems good.

SP: That might be true, but the fear of just cleaning up was real. There was no active cleanup.

TD: I think the thing that is concerning is that there hasn’t been a meeting recently.

SP: There was one more recently than 2mo ago, but the have been intermittent. I think we have good contributors but they don’t feel empowered.

RM: SP, Can you try to get someone to take notes? The last set of notes was from September.

MB: I’d like to encourage people involved with Ember CLI and Ember Data to support twokul and runspired who are working on the respective blog posts.

RJ: The only thing I’ve seen from runspired is a big list of known issues which I don’t think is for the blog post.

#### router service

RJ: I wrote a polyfill for the functionality we did implement. There will still be a phase II/III with more functionality. the current runfi

MB: Only the router shape routeinfo is not implemented?

RJ: Right, none of the hooks that get passed routeinfo have been implemented. We will have to add a new flag for the next part.

RJ: we need an issue for tracking the open issues. a routing rfc meta issue. I will try to drum that up and make a meta issue for it.

#### Svelte/Ember-build-for-prod-app blockers

MB: I would just like an issue tracking this work

RJ: I can try, it won’t be until mid-week though.

#### roadmap progress

(discussion)

MB: I’ll try to schedule something for after the 5th. Maybe tomorrow.

#### Learning team API docs

RM: We’re waiting on Algolia to index the docs so we can go live with search working. We want to write a main blog post for the Ember blog. Wanted to see if we’re good to do this. I linked to a draft David did for this (in the agenda list).

#### Testing RFC’s to FCP?

RJ: I think we haven’t talked about this in detail, but there have been no objections to these RFCs. I’d like to move these forward. I have another RFC for after these two, and would like to see these move forward before I open that one.

RJ: the first is to get rid of needs and unit.

TD: Seems good to me.

RJ: There was some discussion over the naming of the hooks in the qunit testing RFC, but that is the only open thing.

#### Miguel Camba lovefest

SP: Miguel has been doing amazing work decoupling things from jquery and also updating the ember-inspector. We should sing his praises.

(ember-inspector maintenance discussion)
