# August 6, 2021

## Agenda

- (public) FCP → merge
    - [Inject service RFC](https://github.com/emberjs/rfcs/pull/752) (CHG)
- (public) 4.0 jQuery removal breaks some framework provided test helpers [https://github.com/emberjs/ember.js/pull/19675](https://github.com/emberjs/ember.js/pull/19675) (MB)
- (public) 4.0 ⚠️ ? (MB)
- (public) [Default Helper Manager RFC](https://github.com/emberjs/rfcs/pull/756) (CHG)
- (public) RFC stages update (CHG)

## Attendees

- [ ]  Yehuda Katz (YK)
- [ ]  Tom Dale (TD)
- [x]  Kris Selden (KS)
- [ ]  Leah Silber (LS)
- [x]  Robert Jackson (RJ)
- [x]  Igor Terzic (IT)
- [x]  Matthew Beale (MB)
- [x]  Edward Faulkner (EF)
- [ ]  Dan Gebhardt (DG)
- [x]  Godfrey Chan (GC)
- [x]  Ricardo Mendes (RM)
- [ ]  Chad Hietala (CH)
- [x]  Katie Gengler (KG)
- [x]  Melanie Sumner (MS)
- [ ]  Jen Weber (JW)
- [x]  Chris Garrett (CG)

## Action Items

- [ ]  To-do...

## Minutes

### Inject Service RFC

RJ: Not sure it provides a lot of value

(discussion of the timing to add the deprecation after adding the new feature)

RJ: Agreement to merge, the timing of the deprecation addition is already not explicit.

(discussion about timing of adding a lint rule earlier)

Lets merge

### 4.0, remove jquery usage from ember testing

RJ: I took a look at this. Basically it leaves the ember testing package broken.

RJ+KG: I don't think you can use these in a modern app anyway.

MB: There are some that use jquery and some that don't though

RJ: Suggestion: We can have the jquery ones assert if you use them. Leave the non-jquery ones.

### 4.0

CHG: We could throw if a deprecation passes its `since`?

MB: Maybe, but the tricky bits are often getting tests cleaned up or rationalizing edge cases we didn't spec specifically enough

MB: Deprecation burndown: [https://github.com/emberjs/ember.js/issues/19617](https://github.com/emberjs/ember.js/issues/19617)

MB: Last component removal comment: [https://github.com/emberjs/ember.js/pull/19669#issuecomment-884286415](https://github.com/emberjs/ember.js/pull/19669#issuecomment-884286415)

RJ: I think we can do the secret flag thing. We should decouple the time on that from the Ember 4.0 removals. We can add a secret handshake, and we need to update Ember's codebase tests to make sure they do the handshake

### Default helper manager RFC

CHG: We asked preston to split out the RFC for these into chunks. We asked him to talk about functional components. I don't think the default manager RFC has any blockers now that the work is done.

(discussion)

MS: We asked that the "how we teach this" could be used in the guides.

CHG: We talked about the API docs being useful in RFC. I'm not sure if it make sense in the RFC, sometimes we don't even update the guides until later.

(discussion of where documentation for this feature should go in the API docs)

### RFC Stages

```
katie — 30/07/2021
The metadata format has already been updated for the previous RFCs. They need data filled out about what stage they are in and also PRs opened to advance them to the next stage if they aren't yet Recommended. But as we said, the next bit should probably be implementation for new RFCs. The next step for that would be reviewing that open PR for stages stuff on the RFC repo, and figuring out the logistics of a new RFC going through the stages. The RFC specifies a banner on each RFC showing the current stage. Maybe we skip that for now, since it is at least in the yaml frontmatter.
that was all over the place, I think the next steps are:
- Move existing RFCS to a 'Legacy' stage
- Forget about banner for now, it's in the yaml frontmatter
- Forget about automated opening of PRs for now, let it happen manually
- Add fields to the frontmatter for links to the PRs for each stage update
- Update prose in existing PR for stages to reflect legacy stuff and doing it piecemeal
- Update blogpost pzuraq wrote for the same
- Merge PR, publish blog post
the banners were added to the RFC to specifically address concerns of people not understanding that there are stages
and the automated PRs were to address a concern about having no where to comment on an RFC that didn't yet have a PR to the next stage
```

- [ ]  Move existing RFCS to a 'Legacy' stage @Ricardo Mendes
- [ ]  Add fields to the frontmatter for links to the PRs for each stage update @Ricardo Mendes
- [ ]  Update prose in existing PR for stages to reflect legacy stuff and doing it piecemeal
- [ ]  Update blogpost pzuraq wrote for the same