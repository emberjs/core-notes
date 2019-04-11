# August 06 2015

## Topics

Guides: Ember CLI
* "Installing addons" top-level section (+1 MK, TD, TG)
* CLI Config
  * Move "Understanding Ember" config to config section
  * Move debugging section ([PR #529](https://github.com/emberjs/guides/pull/529))
* Should we include an `ember generate` command with code snippets?

Guides: Services
* Merge [PR #532](https://github.com/emberjs/guides/pull/532) and then flesh it out
* What would make good examples?
  * Radio player
  * Flash notifications

Guides: Test helpers documentation breaks JSHint
* Globals are legacy cruft
* How to properly fix this going forward?

Guides: Maintenance
* Version switcher
* `need help` issue tag introduced to signal beginner-friendly issues
* Google still points to `v1.10`
* New architecture/deploy pipeline
* Should we update old versions?


Guides: Animations
* Ping Edward, TD, and TG

Guides: Ember Data
* No advances (LK)
* Redistribute to BM/SP/CP

Guides: Closure Actions
* Ping MB


## Minutes

Attendees: Trek (TG), Tom (TD), Michael (MK), Christoffer (CP), Brendan (BM), Steffan (SP), Matthew (MB), locks (LK)

MK: what about links to outside sources?

TD: core team says don't want to get in business of aggregating

links, but okay to link to aggregators

TG: even link to subsections of aggregators, eg on testing

TG: i will deliver the bad news

MK: addons, extending - go in getting started, break up?

TD: break up

TG: even if it's one page, get the structure right

TD: creating addons is a different story

we are all on board

MK: should we put configuring stuff in configuring section?

TD: understanding section should be about mental model

MK: not what it does now

TD: okay to move this stuff to configuring section

TG: okay for moving debugging stuff, okay with joost's stuff

TD: we should have examples of configuration options, a guide on

options for app configuration, a list of options

TG: will ask joost to update

MK: the services pull request - where to go

much discussion ensued about how to explain services

TG: in favor of merging and then updating as necessary

TD: the guide is pretty barebones, but okay to merge

TG: more useful than now, and then let's figure out somebody to expand

LK: they have been very responsive, so let's hammer out the current

comments and then merge

TG: me or tom will flesh out after

MK: jshint pr

TD: testing helpers explanation is old and outdated, but we don't

have bandwidth to update, change is good

TG: agreed

TD: given situation is a clusterf**, what do we do?

TG: real fix is to make test helpers behave properly, not document

our sad reality

TD: i am okay with this

TG: let's merge and then create an issue to fix the underlying problem

MK: animations, anybody know where edward is at

TG: don't know, not critical that it gets in, not high priority

MK: i will ping edward

LK: haven't had time to work on ember data/models, stefan and wecc

want to help

MK: you should delegate to them

CP: brenden has some experience

BM: yeah, will sync up with locks

MK: ember generate for code blocks

TD: inconsistent command with output

general feeling that it should be explained more in text, not just put above

TG: issues/prs around warning about old versions

TD: seems like a good idea, no real downside except annoying if

you're using an old version regularly

TG: redeploying is a pain, bigger issue is google points to 1.10

LK: also people always complain about version switching taking to root

MK: not that big a deal, just close them

TG: give it time, you will get annoyed

MK: what about separating structure from content

TG: doesn't work well if we change the structure of the site with

different levels

TD: fixing things like this are good for community involvement

MK: how do we get out the word about things we want help with

TD: i will tweet it
