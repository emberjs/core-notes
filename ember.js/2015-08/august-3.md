# Ember Meeting Agenda 2015-08-03

#### Topics

* https://github.com/emberjs/guides/pull/422 (do we include 3rd party resources in guides or not?)
* Where/how do we officially surface great 3rd party resources like http://emberobserver.com/ and http://www.emberaddons.com/ ?

##### Go/No-go Features:

* ember-routing-core-outlet (kill it with liquid fire)
* ember-routing-route-configured-query-params
* ember-debug-handlers - Previously 'go'ed
* ember-registry-container-reform

##### Important Issues:

* https://github.com/emberjs/ember.js/pull/11315 - Changing layout in the
* https://github.com/emberjs/ember.js/pull/11225 - Two way bindings with setter CP's are not working.

#### Minutes

Attendees: Matt, Robert, Tom, Yehuda, Stef, Kris, ?


RJ: remove ember-routing-core-outlet feature, not used by liquid-fire any longer)

RJ: ember-routing-route-configured-query-params needs more vetting before 'go'ing, lets shoot for 2.2.

RJ: ember-debug-handlers - go'ed

RJ: ember-registry-container-reform - go'ed with the caveat that `lookupFactory` should be underscored.

YK: Seeing the routable component implementation really helps understand the problem space, and lets us start looking forward to the next stages.  No go'ed for 2.1, but no specific negatives.

MB: Re: 3rd party resources, the main challenge seems to be maintainability. We have low visibility into the content behind a link, and it would be easy to forget to check the content for accuracy after a year or so. Instead we should put effort into encouraging and building up unofficial resources

MB: Encouraging better discoverability for 3rd party resources goes hand in hand with encouraging video and other content to be found there instead. In the new website design we should be considering how to can surface unofficial resources.

RB: #11315, where do we stand. This is changing the layout when there is possibly already a block

TD: I think we explicitly decided not to support this

YK: We can support this, but the overhead would be non-trivial. We can't do a real deprecation, but we can flag the breaking change better

RJ: Use a debug-only error to throw a better message. This is not too common and there component helper (in layout) can be a viable workaround, so that sounds fair.

RJ: Re #11225

YK: That is more concerning

RJ: Yeah, again there are simple user-space workarounds.

YK: This is why we attempted to have lower level interceptions. They were never shown to catch and error cases but maybe they were needed.

KS: Binding semantics are different than get/set semantics, and that is what makes this interception difficult to do.

YK: Let's talk about this after, I know the implementation really well but you might have more of the problem space in your head.

RJ: what about the attribute binding plan for angle components?

YK: Each time this comes up it seems like there are a different people in the room who have different constraints in mind. That applies to everyone.

MB: Would an RFC help?

YK: Absolutely. We can chat and lets get something down.

RJ: An in general, how are angle components?

YK: We have most of that doc implemented as discussed, but some of the bugs being reported are surprisingly similar to tests that exist. ebryn hit something.

RJ: Getting it into master and encouraging testing will help suss that stuff out

RJ: OK I plan to ship beta.5 this week, 2.0 on the 10th. Maybe matt can do a blog post?

MB: Yeah happy to take a first pass. This will be different than a normal release post

YK: I've been happy with the workflow of Matt taking a first pass then editing.

TD: We should talk about the release plan for Ember-Data 2.0. I'm working on the blog post, and it sounds like it will drop a week after Ember.

IT: We will probably take 2.1 to catch up with 2.0

YK: We should talk about lockstep and the path to getting it better in the future in the 2.0 blog post

TD: This cycle has had a lot of pain getting ember-data and other libs to sync with ember, it should get better as the delta between each release gets smaller.

(long meandering discussion about lock-step)
emberjs
