### June 26 2015

#### Agenda

SP: is taking minutes (at the bottom of this page, feel free to help)

  * SP: is using use-canvas (has beta invites)
  * this is a ember app!
  * somewhat normal markdown, but still WIP

SP: at google continuing the effort with Ron on the HTMLBars security/XSS document

* transposing the document to  markdown + private GH repo for ease of development
* splitting the document into several more focused documents
* our goal today is a easier to consume more actionable document

SP & EF: IE8 enables Ember[properties] to be lazy!

MB: Have discussed a splat syntax for component args w/ mmun and Kris (and some other yappers):

* `<my-comp *someHash as |yielded|>`
* `{{my-comp *someHash someProp=override}}`
* `{{my-comp save=(some-helper *foo)}}`

@wycats is nervous about adding new microsyntax to HTML without a great deal of thought and care. Also, shouldn't this be `...someHash` for compliance with JS splatting (`*` is more of a Ruby thing)

RJ: "Urgent" RFCs

* [ES6 Modules](https://github.com/emberjs/rfcs/pull/68)
* [Deprecation / Warning Handlers](https://github.com/emberjs/rfcs/pull/65)
* Pods (urgent @wycats/@tomdale? TODO)

RJ: "Urgent" 1.13 Issues

* [{{each}} fails with duplicate items](https://github.com/emberjs/ember.js/issues/11549)
* [No cleanup of route views](https://github.com/emberjs/ember.js/issues/11539)
* [infinite loop](https://github.com/emberjs/ember.js/issues/11519)

##### LTS Concerns?

@wycats doesn't feel like the concerns specifically about the LTS are community-wide. It's more people using the LTS release RFC as an opportunity to express concerns about the 2.0 churn. That said, there are some very real issues related to our aggressiveness in the 2.0 cycle that we should keep in mind going forward, and especially for 3.0. Hopefully the tooling situation will be better by the time we reach 3.0 too.

##### NPM 3 is beta tested

##### RFCS to discuss

[#65 - Deprecation Warning Handlers](https://github.com/emberjs/rfcs/pull/65) seem uncontroversial at this point. tl;dr is that multiple handler functions can be registered to handle deprecations and warnings. Consumers will be Ember during tests, Ember-Data, Ember-Inspector, and an addon Robert is working on. I would like to merge this today/tomorrow and unblock people from doing the work needed to land it in time for 2.1.

#### PRs to discuss

[#11437 - BUGFIX release - Ember.View.views should be present](https://github.com/emberjs/ember.js/pull/11437)

* ember-inspector related issue/pr from @teddy

[#11547 - Revert "Fixes: Safari's 'double finally on error bug'" #11547](https://github.com/emberjs/ember.js/pull/11547)

* 4% of iOS users have Safari 6.x
* iOS 6.1 apparently fixed this, trying to track down a machine (don't want to install the old xCode)
* if 6.1 fixes it, can we remove this?
* code-size + extra debugging pain on some platforms, and that annoying extra throw/catch on boot.

[#11513 - Move away from ArrayComputed/ReduceComputed #11513](https://github.com/emberjs/ember.js/pull/11513)

* converts AC/RC to simple CP's
* drops support for custom AC/RC macros, users can just use array methods thanks to glimmer
* needs more people trying it out

[#11484 -  CLEANUP beta Remove object controller](https://github.com/emberjs/ember.js/pull/11479)

* include in embers default tests?
* drop support for auto-generated controllers (even with the addon)?
* [#11484 -  CLEANUP beta Remove array controller](https://github.com/emberjs/ember.js/pull/11484)

[#11468 - BUGFIX release – Deprecate Freezable and frozenCopy. Resolves #11452](https://github.com/emberjs/ember.js/pull/11468)


#### Minutes

Attendees: Alex, Edward, Kris, Martin, Robert, Leah, Trek, Stef, Yehuda, Tom, Matthew, Igor


Discussed further bug fix releases in 1.13.x

pending blog post to help communicate this

pods RFC needs to land

each fails with duplicate items, quick fix (useful error), but real fix will land in 1.13.x soon

tricky problem, kris feels the more involved binning approach will solve it, it will be implemented and then back-ported to 1.13.x (wycats, mmun and krisselden all believe that the binning approach cannot break any existing working cases)

rob will release 1.13.3 with the improved error message this weekend. Error message will include information that we will be fixing in a future 1.13.x release

route views don't appear to be cleaned up in 1.13 (`willDestroyElement`) is never called EF4 will take a look. RW will provide a concise JSBIN

RW: used yielded block params changing, can cause infinite loop and crash. 

MM: ^ [emberjs/ember.js/#11519](https://github.com/emberjs/ember.js/issues/11519)

KS: hacked around, feels its related to components wanting to set internal state. Causing unwanted backflow. 2 way binding issue.

RW: issues contain good info, someone needs to dig in. TD / YK will look into this.

SP: memory leaks appear to still need to be issues

RW: view destruction is part of it

SP: yes, also appears attrNodes can leak

KS: attrNodes leaked associated with container views

YK: will be fixed soon, but requires the energy of very specific people.

RW: new fork for IE8 safe HTMLBars, be aware

SP: I can look into [emberjs/ember.js#11501](https://github.com/emberjs/ember.js/issues/11501)

deprecations are numerous

how can we make it nice?

YK: improve categorization of RFC

Until <some version> attribute to deprecation messages should help convey the priority, and facilitate a better workflow

YK will add extra meta data

ES6-module API deferred to 2.1, merely just because of time constraints today

RW: `Ember.View.views` comes back as a deprecation, PR catches a bug and needs to be fixed.

land [emberjs/ember.js#11468](https://github.com/emberjs/ember.js/pull/11468) just get tests working (rob has it)








