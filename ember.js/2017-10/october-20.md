# Meeting: Ember Core Team 2017/10/20

## Agenda

- Merging emberjs/rfcs and ember-cli/rfcs (RM)
- Change PR/release/merging strategy. (RJ)
- Detail the Router Service phases (RM)
- `{{let}}` RFC (RM)
- Testing status (RJ)
  - [emberjs/rfcs#232](https://github.com/emberjs/rfcs/blob/master/text/0232-simplify-qunit-testing-api.md)
  - [ember-qunit-codemod](https://github.com/rwjblue/ember-qunit-codemod/)
  - Next RFC: interaction helpers
  - On Deck: Acceptance Tests
- PR REVIEW
  - https://github.com/emberjs/ember.js/issues/15709

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM, CH, IT

## Minutes

### Merging emberjs/rfcs and ember-cli/rfcs

RM: Having two repos is confusing. There are some RFCs where it isn’t clear where they go. So I think we should merge the repos and processes together.

RJ: I think if we do that we need to change the process a bit. Some of the Ember CLI RFCs feel very specific. I’m suggesting we should do it, but have labels or folders or something.

YK: I like the distinction between Ember the project and an advanced implementation details. But it can be helpful to have RFCs for implementation items.

RJ: Right we do this more in CLI than in Ember. We will close an RFC after a long discussion and say “there is no public API change” so lets just do it. I think we should do better as pushing RFCs, unless one of us is a champion then the RFCs tend to languish. In CLI we added language to the repo saying each RFC needs a core or subteam champion to advance.

### Change PR/release/merging strategy

RJ: I would like to change the practice for PRs to target down instead of patch up. The GH UI now allows you to change the target branch of a patch, which makes this easier for us to manage.

YK: I think there are two kinds of changes. Broadly speaking I think most people should work on master. Sometimes is can be nice to work on another branch and then backport, and other times you only want to target beta.

RJ: I’m saying nothing will change for contributors. They should default to presume master, but we can retarget on our end.

RJ: I ahve a mental mode of master is ahead of all other branches. I would like to land patches into beta and then `git merge beta` into master. We won’t miss anything.

EF: RJ has stated it well, we don’t want contributors to handle this.

YK: We’re saying contribs do what they do today, they target master, but we will retarget and land in beta then git merge.

RJ: Right, the first time we merge it will be a pain.

YK: There is at thing you can do.

YK: We’re convinced the process of retargeting will always work?

RJ: Well not always, but it will be resolvable. 

YK: If we land a commit into a beta branch that we do not want in master, we may end up landing that commit in to master by accident.

(discussion)

EF: So we take a change into the beta branch, and it automatically or quickly gets merged into master and a maintenance branch. If you want to target the maintenance you can just target that directly.

YK: GC suggests that we simply document that we have some ideas for the maintenance branch but we don’t need to implement the solution until the first time it happens.

EF: DG raises we should have the proper process for the first beta-only commit or there is a risk we lose a commit from the first when landing the second.

### Detail the Router Service phases

RM: We need to detail the router service. We don’t need to go over it in detail now. We need a quest issues with all the phases etc. so I can distribute it.

RJ: You are saying the work for the RFC. I will make a paper doc or something.

### `{{let}}` RFC

RJ: I am in favor. People didn’t like the inline version. I’d like to advance the block version.

(discussion)

GC: I think it is unfortunate that you cannot ergonomically have multiple lets.

RJ: You could do it with hash with the named blocks changes.

GC: You would need to repeat the name.

RJ: Right this is what I like about the inline version.

YK: I would like to keep the addon experimentation with syntax limited. the fact that variables are only introduced via block form today is nice for refactoring tools etc.

GC: You’re using let b/c the thing on the left is presumably quite long, so you don’t want to be adding a lot of retyped characters.

RM: I talked with cowboyd, I will write an RFC to supersede it.

YK: Sometimes I like to use let syntax when demonstrating Glimmer to people who don’t use Ember/components.

### Testing status

RJ: I have implemented things at a beta level of quality. I will write a blog post  and we can do the crosslink/syndication thing. I would like to have the blog post out by midweek next week. Followup are two additional RFCs: deprecating ember’s test helpers and using an addon like the native test helpers.

EF: So we would land the new things in an addon, we will be done shipping them when they are in the default blueprint. 

RJ: Right, some of them are going to land in 2.16 many will land last (like component integration tests). We will have overlap of the two systems without deprecation so we can work out any issues. Can deprecate the old Ember apis after 3.0.

RJ: And then finally we will have integration and acceptance tests using the same system. It will be the completion of the testing unification stuff.
