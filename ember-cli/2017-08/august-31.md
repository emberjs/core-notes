# ember-cli Meeting Notes - 2017-08-31

## Attendees

- @rwjblue rj Robert Jackson
- @kategengler kg Katie Gengler
- @turbo87 tb Tobias Bieniek
- @kellyselden ks Kelly Selden
- @trabus jb jake bixby
- @hjdivad dh David Hamilton


## Agenda

- 2.15
- project.config caching


## Discussion Notes


### 2.15 update

rj: there some problems where we get pinned to the same host when running the CI job which i've seen in ember.  The failures were unrelated to the change

tb: the weird thing is it's always node 8 that fails.

rj: ember-data is not released but i don't think we need to block that

tb: should we point to 2.15-beta of ember-data or 2.14 stable?

rj: beta

ks: since it's our stable it seems we should point to the stable

kg: but doesn't 2.14 have problems?

dh: the resolutions in 2.15 are backported to 2.14

tb: in that case what's the advantage of moving to beta?

rj: so we'll bump to 2.15 in a point release?

tb: yes

*(general agreement with tobias)*

rj: seems good assuming ember-data doesn't release 2.15 before we do.

ks: so the 2.16 beta will ship with the 2.15 beta?

rj: yes


### project.config caching

rj: we previously had cached `project.config` but this causes problems with addons that misbehave and mutate `project.config` so, for 2.15 we've rolled back to no caching.  In 2.16 we'll do a deep freeze on the object so addons that misbehave in this way will get useful errors + stack traces when they do the mutation.  
