# Meeting: Ember Core Team 2019/09/20

## Agenda

- (**10 min**) Notion Updates (CHG)
- (**5 min**) 3.13 blog post (YK)
    - [https://github.com/ember-learn/ember-blog/pull/260](https://github.com/ember-learn/ember-blog/pull/260)
- (**10 min**) Octane "check in" (RJ)
- F2F check-in
    - Comment for [Add new basic helpers to Ember](https://github.com/emberjs/rfcs/pull/388) (MB)
    - EmberCamp "Review" (RJ)
- RFCs
    - General review, low priority: [Component Boolean Arguments](https://github.com/emberjs/rfcs/pull/407) (MB)
    - Staging 0, low priority: [API to properly dispose objects](https://github.com/emberjs/rfcs/issues/545) (GC)
    - → FCP
    - FCP → Merge
    - → FCP to Close
        - [Configuring addon modules in Module Unification layout](https://github.com/emberjs/rfcs/pull/462) (MB) → Yes
        - [Modifiers](https://github.com/emberjs/rfcs/pull/353) (MB) → No FCP to Close, lets leave a comment pointing at the RFC with a primitive, at the addons that exist today, and say we want to have a formal solution one day (the addons are good proofs of concept).
        - [Deprecate Hash Helper](https://github.com/emberjs/rfcs/pull/482) (MB) → Make it clear this isn't advancing. Check the F2F notes for context. Just leave a comment.
    - FCP to Close → Close
    - Enable

## Attendees

- [x]  Yehuda Katz
- [x]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [x]  Igor Terzic
- [x]  Matthew Beale
- [ ]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [ ]  Ricardo Mendes
- [ ]  Chad Hietala
- [x]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber (caught the end)
- [x]  Chris Garrett

## Action Items

- [ ]  Come up with terminology for ultra-private, team-wide, project-wide (all teams), and world-public permission levels
- [ ]  Come up with a policy for sensitive/ultra-private types of documents (e.g. alumnization)

## Minutes

Notes: DG / MB

### Notion update

CG: We had a meeting yesterday to talk about how we should use Notion. We added a top-level section "How We Use Our Notion".

CG: Each team will have a "Notion Lead" who will attend meetings. They will also be admins and able to add people.

CG: CG, IT, and KG will be team leads.

CG: We also decided that we will allow public pages.

CG: We should not be keeping super sensitive info in here. But still ask before making things public (like phone numbers).

IT: We will make all of the ED section public by default.

YK: I am eventually going to propose a FW workspace that is public-only. But there are a few things that should not go in there.

RJ: The section to go in each of the root folders - when should we expect that to be done? And what is the deal with the non-team-based root folders?

YK: I made the main one, which I renamed to Internals Technical Philosophy. I want to be able to edit this quickly and not worry about PRs and public stuff.

YK: I'd like us all to use this as a team knowledge-base.

TD: If we make this public, do we want it indexable by Google?

YK: There is a checkbox and we can leave it off. We really don't want this showing high up in Google results.

CG: I want the Atlas to spike out ideas for documentation.

DG: This can be used as a staging ground for blog posts.

MB: And not everything shared has to be "official" (i.e. blog posts might appear on individual blogs)

MB: Is the proposal that all the FW notes will be visible to all the teams?

CG: The top-level FW page will remain private to the FW team.

RJ: We need terms for "project-wide" vs. within individual projects.

MB: We should all be aware that marking something "private" in the notes is not just private to the FW team - it is project-wide.

### 3.13 Blog Post

YK: The current post is rather vanilla template. It urgently needs something specific to the Octane release. TD and I will work on this today.

RJ: The release is coming late tonight or tomorrow. I'm glad to block until the post is ready.

GC: I was told that we stopped talking about betas in blog posts. What do we do about `@model` in this case?

MS: We just removed it from the template. You can still add custom content to blog posts.

GC: The Octane guide uses `@model` . Also co-location works in 3.13. But it requires the Octane flag to be enabled.

GC: The confusing thing is that it's not a feature intended to be used in Octane-only apps. In the future it will be usable for classic-mode apps as well.

RJ: The reason it's not enabled right away is that we have some perf improvements to make.

YK: We need to write the instructions for using Octane in 3.13.

MB: How do we expect to get feedback from things in beta if the flag is not enabled?

TD: I don't think anyone thinks this is a bad idea. We just have to write the content.

KG: I think this would be better as separate blog post.

GC: Do we expect setting the Octane flag to error if you don't have the Octane-optional features?

GC: It seems bad that the ember-component-css is ignoring that flag.

RJ: We can have a separate discussion about this.

YK: Even if all we get out of beta is that people test the codebase, that's good in and of itself.

### Octane check-in

RJ: Seems fine to wait until after..

YK: 3.14 beta has already shipped.

RJ: The point of the extra release was guides / inspector. I want to make sure we as a team are pitching into that work.

MS: This is where we might help addon authors etc, get popular addon ready?

YK: I think we need 3.13 stable, but yes.

RJ: Yes, and blog posts "how to you test your addon to be ready etc". And guides, atlas work, inspector work, a whole slew of things which may not be code which are why we wanted another cycle.

TD: I am actively working on getting Glimmer JS 1.0 out.

RJ: I think if it was 0.14 nobody would care, but that it is 1.0 alpha is exciting people.

RJ: I will also raise this next week.

### F2F Check in

RJ: I'm working on the new helper prose. I'll bounce it off people. I want to make sure it expresses consensus.

### EmberCamp

RJ: I really enjoyed this event. Speakers were very good, great curation of content. Thanks MS!

RJ: I'm not sure we can learn things from this ahead of EmberConf, or vice-versa but it went really well. Kudos.

YK: I think at bare minimum it is a good group of people to recruit for next year's EmberConf.

RJ: There were no duds. And often you have one! So very impressive.

MS: We had a lot of flexibility, we wanted to day to mostly be on Ember, but also wanted to highlight that everyone is working on front-end. I think the frontend focused ones got good feedback.

MS: We had a great talk on CSS. We had good attendance by Dockyard staff.

MS: Keynote speaker was good, I met her at the diversity day for global accessibility awareness day.

MB: Matt G gave a great talks on mapping on the web.

(more discussion wrt EmberCamp / EmberConf talks)

### Component Boolean Arguments

YK: I think HTML says it is a thing, it is not hard to find a philosophically useful thing.

YK: The question is: Is this coming up a lot and people want this practically.

RJ: For me it has no come up a lot, but partially because it is not well supported.

YK: I would want it to be clear that you can still type `={{var}}`, and you can imagine that it is harder to discover.

GC: This would also for sure block positional params. I don't like the magic class desuraging thing we had for positional params anyway.

MB: I will add to next week, we could leave a comment.

### Disposing of Objects

GC: YK doesn't object! j/k this is stage 0 so just a heads up.

YK: Yes as stage 0 it has no meaning to object.

RJ: I have done a thing like this. The things in EC and lifeline won't work if derivative of glimmer component etc. I think we can fix that here.

YK: I've also built a thing like this. I don't want us to have 5 things, and it makes sense that the answer would happen somewhere deep like Glimmer.

RJ: I can less about how we do it than that we provide a solution. It is important that we provide systems that can do this async stuff safely.

GC: I think it is straight up impossible to use a glimmer component / native class without this. You may need to teardown something something.

YK: I'll talk to GC offline. It makes sense for Glimmer and internals stuff to be in the same system. And second I think some kind of entanglement system makes sense.

(discussion)

KS: If things are able to query if they are destroyed it is best to put them all in that state and then do the destruction work.

YK: The more critical thing for me was to do it for all the objects between two things without them all needing to have destroy.
