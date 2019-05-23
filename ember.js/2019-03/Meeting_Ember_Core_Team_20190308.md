# Meeting: Ember Core Team 2019/03/08

## Agenda
    
- (**5 min**) CTA: guides and API review (MS)
- (**10 min?**) Module Unification as part of Octane Edition (YK/TD/RJ/MS/GC)
- RFCs
    - → FCP
        - (**5 min**) [Website Redesign](https://github.com/emberjs/rfcs/pull/425) 
[](https://github.com/emberjs/rfcs/pull/425)        - (**5 min**) [Classic Class Owner Tunnel](https://github.com/emberjs/rfcs/pull/451)
        - (**5 min**) [Nested](https://github.com/emberjs/rfcs/pull/457) [Lookup](https://github.com/emberjs/rfcs/pull/457)
        - (**5 min**) [<BuiltInComponents />](https://github.com/emberjs/rfcs/pull/459)
        - (**5 min**) [decorators](https://github.com/emberjs/rfcs/pull/440)
        - (**5 min**) [Deprecate {{partial}}](https://github.com/emberjs/rfcs/pull/449)
        - (**5 min**) [Deprecate {{with}}](https://github.com/emberjs/rfcs/pull/445)
        - (**5 min**) [Named Blocks](https://github.com/emberjs/rfcs/pull/460)
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Promote
- (**5** **min**) co-location of component files? (YK/TD/RJ/MS/GC)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [ ] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Minutes

### CTA Guides and API Review

MS: Reminder to please review the Octane branch of the guides over the next week. If everyone could mark 10 minutes on your calendar a day to look at the API guides. If you see something, say something. File an issue, you don’t have to fix it yourself. Or fix it, that’s great. Remember that over the next week, remember that this time of year is when we have the biggest npm spike of people using Ember. Let’s tidy up our living room.

YK: If you’re not doing heads-down implementation work, it’s appropriate to try to do some documentation work this week.

CG: It would be appreciated.

KG: Can you share the link?

YK: Question: the Octane guides, the number of commits out of sync with master is high.

MS: We’re rewriting a lot of parts.

RJ: People can merge in if needed. Rebasing will be a nightmare. I asked about this in the channel the other night. This is a feature, not a bug—we’re choosing the branch model and rewriting. Lots of the section that exist on master are moved, gone, or changed.

YK: How much are people doing small fixes on master know they should consider Octane docs as well?

RJ: They probably wouldn’t know unless someone tells them. We will need to review the delta of commits.

### MU in Octane?

RJ: Exit criteria for this conversation is a decision to move forward and do the work on Octane re: MU. My personal perspective is that while I would massively prefer including MU, the un-doneness of the various parts that were blocking and are not done, the unfinishedness, means that the entire Octane effort will appear less polished, more painful, and less good. I think that we should not do MU as part of Octane. Which pains me greatly, because it’s one of the most exciting features. I think including MU puts the entire project at risk.

YK: Anyone who objects? I think there is consensus on the descoping.

*crickets*

RJ: We need to message this. Many people who have been working on MU and thinking their work was contributing to Octane. E.g. things that check for Octane assume MU is on. I’ve started local branches of a few projects like Ember, Ember Data blueprints. Need to message this and get it out there.

TD: I totally agree. I think I should update that blog post with a different frame. We should say that we are de-scoping MU from Octane and here’s why.

RJ: I was hoping that most of the post could be salvaged.

TD: I think so.

RJ: It would be awesome if we could get this out early next week so it’s not a surprise at EmberConf. 

CH: I have a quick question. It seems that we are trying to finish Octane prior to EC. Why do we feel that we need to do this?

CG: I think we are talking about delaying by several months to include MU in Octane. Plus, it really hones the focus of Octane. 

EF: I agree. There are a lot of incoherent pieces. We are close, but not there yet.

GC: The more we go down the rabbit hole, the more we are in design territory. And that’s counter to the spirit of Octane. It opens up a bunch of design issues - like what about route templates? We risk not allowing for real world testing before moving forward.

RJ: I personally don’t think we can do MU without figuring out how to invoke components from addons.

KS: We already have some weird local lookup stuff. I’m curious how this affects Embroider.

EF: I haven’t been relying on MU at all.

EF: I’ve already synthesized template imports.

YK: The main thing that I can say about this is that Embroider and MU / NFS (new file system) are tightly bound.

DG: I’ve  brought up the possibility of introducing a new file system without introducing MU or template imports. I’m signing on with this because it sets the stage for the next edition. I see Embroider and the new FS and template imports as nicely coherent.

RJ: Ok, I’m going to assume it’s fine to discuss all this publicly.

CG: And I’ll be discussing this on EmberMap to help get the word out.

### RFC: Get the Website Redesign into FCP

RJ: I’m good with this going into FCP. And all the comments have been addressed and trailed off.

MS: We have completed the transition of the site to an Ember app. And it’s something we can announce at EmberConf.

RJ: Just to clarify: the current website has been rewritten as an Ember app. But it’s not the new redesign.

MS: Correct. This is the first phase. The next phases will bring the redesign into the app.

TD: I have a question. I know that Leah and Sam have planned some updates to the Tomster.

MS: The way that Leah and I have discussed it, we don’t feel that there significant changes to bring into the RFC.

RJ: This is similar to every RFC.  There are some tweaks made during the implementation period. I’m just very glad that Tomster and Zoey will be coming back.

RJ: I’ll comment on here and add the FCP label.

### RFC: [Classic Class Owner Tunnel](https://github.com/emberjs/rfcs/pull/451)

RJ: I think we’ve got to take one of these two approaches for `init` and passing the owner.

CG: <screen sharing> The idea is that we’ll be able to move people in place from Ember classes to native classes with `@classic`, and then they can move straight to the Ember.Object-free syntax in which `constructor` receives the `owner`.

CG: The alternative is that we could have an optional `didCreate` hook that you could add.

KS: This would allow us to mix things in today without requiring the usage of Ember.Object.

TD: What are the cases for requiring `@classic`?

CG: If you can remove all Ember.Object idioms, such as `init` and mixins, then you don’t need `@classic`.

YK: In some cases we won’t have an answer - for components we do, but for controllers we don’t.

YK: If there’s a mandatory base class, and it uses `init`, then you have no choice.

RJ: Is anyone opposed to moving this to FCP.

KS: I may have some comments to add to the RFC.

TD: I will move it to FCP.

### RFC: [Nested](https://github.com/emberjs/rfcs/pull/457) [Lookup](https://github.com/emberjs/rfcs/pull/457)

YK: This seems likely to take longer than 5 minutes.

RJ: I favor slashes, but I think that I may be alone.

TD: I want to make sure that you don’t feel steamrolled, and that your concerns are heard.

KS: What are we discussing? There is an open question in the RFC about `::` vs `/`

YK: The RFC is proposing `::`.

YK: The RFC needs to delete that open question to move forward.

KS: Is there a chance of getting the `invoke` thing working?

YK: I’m working on it, but it may be a month.

RJ: I don’t know how this fits into the world about on-disk usage of CapsCase.

TD: Once we add template imports, then that just becomes an issue of blueprints.

JW: I haven’t fully internalized why `::` is seen as preferable. It feels very subjective. This is one of the first things people will encounter that’s an ember-specific idiom. And why not align with the convention from the file system? That’s my first instinct.

CG: This is probably something that beginners won’t encounter right away, since they won’t be nesting components immediately.

KS: What about doing codemods to avoid introducing new syntax?

GC: The missing context is that we have decided that we are shipping Octane. And we have accepted some incremental changes over the last year that are not super ergonomic until they’re available as a whole.

JW: What do we really mean by “temporary”?

YK: At some point we will really want people to use imports, which don’t have this problem. And as long as sloppy mode templates are a thing, this problem will exist.

JW: I think we should be really cautious about introducing a new syntax. Because we might understand them all but it adds to the cognitive load for beginners.

EF: This is definitely a valid meta-point, but we have consciously adjusted the dial and accepted more incoherence. And we have erred too far on the other side and failed to ship.

KS: But there are alternatives now … and we are saying that this is not a beginner scenario.

YK: The “I want a directory” situation does come up pretty early. But I think that using the `component` helper is a bigger cognitive load than `::`.

RJ: Ok, I will comment about FCP.

### RFC: [<BuiltInComponents />](https://github.com/emberjs/rfcs/pull/459)

GC: We really want to stop teaching curlies as a way to invoke components. This fixes the remaining anomalies: `{{input` and `{{link-to` 

GC: This allows you to switch your components to angle brackets without exception.

KS: What about two-way-binding?

RJ: Invocation style does not change this at all. I realize we pitched something similar in the past, so this is confusing.

GC: The only substantial controversial things are the names of the args on link-to.

MB: Regardless of where the implementation is, have we considered moving this to a separate addon?

RJ: I would prefer that these no longer be manually registered (that’s a legacy before we can assume ember-cli).

RJ: The only other big thing to discuss is `model`  and `models` vs passing ids. But I think that is a separate issue that could be a subject for future design work.

TD: Are we at FCP?

MB: Note that the `<TextArea>` thing is a bit wonky.

YK/KS both think we should go with `<Textarea>`

RJ: We can lint against `<TextArea`

### RFC: [decorators](https://github.com/emberjs/rfcs/pull/440)

CG: This moves decorators to stage 1, and drops support for stage 2. We will wait for stage 3, but have the option to experiment until then (say behind a feature flag).

KS: What are others doing? MobX, Angular, etc.

YK: They adopted early and went with stage 1 and will stay there.

TD: I will comment to move this to FCP.

### RFC [Deprecate {{partial}}](https://github.com/emberjs/rfcs/pull/449)

RJ: Gavin wrote this up. I think it’s correct and the codemod is correct.

RJ: Jen, the how we teach this section is small - could you think about this during the FCP and whether more is needed.

JW: I’d like to see someone take a stab at the deprecation language.

RJ: There is a section, the deprecation section, that describes it. It is weird because that is basically the “how we teach this” section.

*Moving to FCP*

### RFC [Deprecate {{with}}](https://github.com/emberjs/rfcs/pull/445)

RJ: We decide to drop the introduce of `if-let` as an alternative and simply deprecate `{{with`

TD: My concern is that this is a Handlebars feature that we’re dropping.

YK: But this is a different context-shifting implementation (so it’s a troll to think it’s the same).

TD: My concern is not blocking. I am +1 actually.

*Moving to FCP*

### RFC [Named Blocks](https://github.com/emberjs/rfcs/pull/460)

RJ: My concern is that this is transitional issue.

RJ: I’d like to punt on FCP and let people absorb it.

### Co-location of component files?

TD: I was very surprised that this is allowed now.

RJ: It’s very old. It predates my time on the core team.

We reached consensus that we should attempt to update blueprints to use co-located templates and components. There were concerns about whether it would be confusing that route templates are still in `templates/`, but others felt that this was a feature, as it would make the `templates/` directory clearly around route templates, and putting templates in `routes/` would make them feel too much like components and create confusion. We will plan to move forward with `app/components/foo-bar/{component.js,template.hbs}` and see if any confusion crops up.
