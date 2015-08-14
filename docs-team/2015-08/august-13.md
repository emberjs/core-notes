### August 13 2015

#### Topics

Deprecations:
* Core.View needs documentation
* Deprecations must have id and corresponding anchor in guide

Guides:
* Keep engaging contributors
* Core Concepts [Issue #585](https://github.com/emberjs/guides/issues/585) rewrite
* Model section still without leader
* Tutorial needs a new leader
* Introduction of a contributor's style guide
* Full review and read-through
* Redesign

API:
* [PR #30](https://github.com/emberjs/api/pull/30) still not reviewed.

#### Minutes

Attendees: Trek (TG), Leah (LS), locks (LK), Michael (MK) (via locks), Tom (TD), Yehuda (YK), Brendan (BM), Christoffer (CP), Matthew (MB)

**note**: I (LK) arrived late so these are not full minutes

LS: mixonic Core.View deprecation

YK: no performance advantage to Core.View

you should use a component instead

YK: confirm

YK: Core.View should not be in wide use

MB+YK: <deprecations guides talk>

YK: deprecations guide link should use id

this should be tested automatically

LK: how do you redirect old anchors?

MB: using a hidden anchor. pattern already used in website

LK: [Issue #585](https://github.com/emberjs/guides/issues/585) brings up some good points

content would need editing to be merged back into guides, but we should take ideas from it

current "Core Concepts" is mostly a glossary

TD: I like the idea of adding diagrams

MB: current styling makes it hard to read text

TG: Ember's steep learning curve is due to unfamiliarity with client-side app development

<gives Unity example for game development>

MB: I can fold this into my efforts

LK: I'm assigning it to you MB

LK: you haven't reviewed [PR #30](https://github.com/emberjs/api/pull/30) yet TG

TG: ping me, I'll review it later today

MK: really awesome how more people are jumping into helping out eg HeroicEric, acorncom, SaladFork, elbeezy, joost, eccegordo, mattw59 let's continue to engage them and see if any of them will pick up some of the below items

MK: models section - we need somebody to own this, and we need a due date

LK: I'm stepping as the leader for the Models section

I'll coordinate with Stefan, BM, CP to pick it up

MK: tutorial - radio silence from lauren, i am too busy. we need an owner and a due date. i can catch them up and me and lauren's discussion/work so far.

LK: I'll lead this instead, I should be more comfortable with writing for this

YK: I would like that

MK: style guide - i will open a pr with a draft by next tuesday

YK: do you mean a user style guide or a contributor style guide?

LK: contributor

YK: I was thinking about user style guide

TD: we can enable it by default in ember-cli

MK: full guides review - we should review each section from top to bottom for accuracy, clarity, brevity, and completeness. i propose we find an owner for each section (templates, routing, models, etc) and set a due date. i have started on routing.

TD: we should do a group read-through

LK: agreed

TG: we should have an edit, preferably someone for core

I volunteer myself and MB

the editor should review 2 weeks before each release

this also sets a deadline for documentation contributions

<chatter about coordinating the redesign of the guides>