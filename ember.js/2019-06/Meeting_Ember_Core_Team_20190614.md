# Meeting: Ember Core Team 2019/06/14

## Agenda

- (public) (**2 min)** Determine note taker
- (public) (**2 min**) Determine person to upload notes
- (public) (**20 min**) API docs strategy (JW)
  - Plan for integrating Glimmer & Test Helpers
  - How we want to present decorators in Ember.js API docs
- (public) (**10 min**) Engines / FastBoot projects (DG)
  - Are these projects “official”? If so, do they belong on the teams page? (FastBoot is currently mentioned under the CLI team)
  - Is anyone here heavily using engines and interested in taking a leadership role?
- (public) RFCs
  - → FCP
    - `[@classic](https://github.com/emberjs/rfcs/pull/468)` [Decorator](https://github.com/emberjs/rfcs/pull/468)
    - [Deprecate inline {{link-to}}](https://github.com/emberjs/rfcs/pull/501)
  - FCP → Merge
    - [Async Observers](https://github.com/emberjs/rfcs/pull/494)
  - → FCP to Close
  - FCP to Close → Close
  - Enable

## Attendees

[ ] Yehuda Katz
[ ] Tom Dale
[ ] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[ ] Robert Jackson
[ ] Igor Terzic
[ ] Matthew Beale
[ ] Edward Faulkner
[ ] Dan Gebhardt
[ ] Godfrey Chan
[ ] Ricardo Mendes
[ ] Chad Hietala
[ ] Katie Gengler
[ ] Melanie Sumner
[ ] Jen Weber
[ ] Chris Garrett

## Action Items

[ ] Add a note to Components docs about using @glimmer/component (JW will open an issues)
[ ] Need to add more info to the Glimmer docs in YUIdoc format
[ ] Annotate Ember Test Helpers with YUIdoc labels and include the results in the npm package
[ ] Pull Glimmer docs into Ember.js docs via dependency config in YUIdocs
[ ] Robert & Yehuda breakout on showing all docs together (knowing that any possible implementation in the app itself is the distant future

## Minutes

**API Docs Strategy**

JW: Do you here that horrible noise?
Everyone: No.
JW: OK, maybe its just in my head?

JW: How do we make the glimmer/component and ember-test-helpers/ember-qunit documentation discoverable to our users?
JW: Folks were working on migrating the super rentals tutorial app to octane, and ran into issues with figuring out how to migrate things from Ember.Component to `@glimmer/component`.
YK: We currently don’t talk about `@glimmer/component` at all in the API docs, but we do talk about `@ember/component`.
JW: We don’t want to link to glimmerjs.com as that isn’t really the thing we are trying to teach folks (they are Ember users, not GlimmerJS users).
JW: I’d propose to to show both @ember/test-helpers and @glimmer/component and @glimmer/tracked in the sidebar of the api.emberjs.com site.
RJ: The logical place for these projects is in the projects listing, not the packages list under the Ember project.
JW: We can do it either way, fairly straight forwardly.
JW: What do folks feel comfortable with maintaining?

…discussion of how/why/what…

RJ: ember-test-helpers just uses inline yuidoc and its docs can easily be extracted alongside the rest of the ember docs.
JW: as a takeaway, I’ll investigate what’s there and what I need to add to extract the yuidocs.

… general agreement to discuss placement in the guides later …

JW: Regarding the glimmer docs - they are very sparse and not complete enough for folks to get comfortable with the component docs.
YK: The glimmerjs site should be treated as completely separate and should not be part of the ember learning experience at all.
KG: Where does the code live?
RJ: In the glimmerjs/glimmer.js repo.
YK: Glimmerjs users should not look at the emberjs docs - and vice versa.
YK: There is a separate point that we want source-compat between ember and glimmer.
YK: Tom and I plan to discuss this at the next F2F (in NYC)
JW: Ok, the path forward is to write docs in yuidoc and use the source to develop the docs.
YK: I believe that we should add a big red bar across the top of the `@ember/component` section to point people to `@glimmer/component`.
DG: I agree
RJ: We should also be clear that `@ember/component` is not deprecated.
RJ: We will have two APIs living side-by-side for quite a while.
RJ: There are just some things you can’t even do with `@glimmer/component`. We have a process ahead of us.
YK: Most people building apps today don’t want to feel pressured to upgrade.
DG: The project scopes (ember/glimmer/ember-data) are the obvious lines upon which to organize the guides.
RJ: Once Octane is released we should re-analyze the list of “Commonly searched-for documentation”.
JW: Last but not least - the way we do docs with YUIdocs is a deadend. Todd and Siva are investigating alternatives.
JW: YUIdocs is very fragile - almost every change in the past couple years has broken the whole system.
JW: Ok, back to the sidebar….
RJ: I think the problem with including the test-helpers with the rest of ember is that the versioning is different, and the packages are maintained separately.
YK: Let me make a point about lockstep. We don’t currently have a notion of “platform version”, but we need it.
JW: We should bring into the discussion other projects, such as ember-engines, etc.
RJ: My suggestion is to remove the “Projects” section entirely and list all packages together.
RJ: Also we have long wanted to be able to serve docs locally from your project.
YK: The search would be impacted (indexing would be treated differently).
JW: Shipping a change like that to the sidebar is not something we can do before Octane.
YK: We should do a couple more changes like router.js
DG: I believe that showing everything at once will reinforce the common feeling that Ember is all-or-nothing and overwhelming (ref: my recent blog post).
RJ: I am in favor of dropping the class listings.
YK: We’re missing a couple things - the link to the package, and the link to the repo, from the individual packages.

## Async observers

RJ: No feedback.
YK: Ok, let’s merge it.

`**@classic**` **decorator**
RJ: mixonic has made a comment. pzuraq and I will follow up with a tweak.

**Deprecate inline {{link-to}}**
RJ: We don’t need to tie this to Octane.
YK: I feel like now is not the time to do this.
YK: Post-Octane and post-community-migration, this will seem natural.
GC: If there’s no urgency to this, then people haven’t had a chance to consider it. I suggest we put it in the freezer.
