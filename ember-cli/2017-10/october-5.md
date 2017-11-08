# ember-cli Meeting Notes - 2017-10-05

## Attendees


- @hjdivad dh David Hamilton
- @rwjblue rj Robert Jackson
- @kellyselden ks Kelly Selden
- @turbo87 tb Tobias Bieniek
- @trabus jb Jake Bixby

## Agenda

- ember-cli 7346
- new qunit testing API
- @ember/debug transpiled to es6
- strategies rfc
- fastboot

## Discussion Notes

### ember-cli 7346

rj: backporting #7342 to `beta`.

tb: the thing I didn't like is that it opens in a new profile.

rj: yes I usually disable launchers.

tb: I do as well but even this has problems eg for users that don't use chrome as their default development browser.

rj: we need user-specific config (similar to `.git/info/exclude`) but i'm not sure what the API would look like.

tb: at least for this PR we should merge.


### new qunit testing API

rj: I'm expecting to work on this this month.  The plan of record is to migrate ember test helpers to an addon and once it's an addon do the work.

rj: The `ember-cli-qunit` probably does not need to bump majors and it would end up doing less work.

tb: what would it even do?

rj: it will end up doing close to nothing: there's a question about whether it should go away completely?  It only exists as a shim that would no longer be necessary.

*(some discussion about ember-cli-qunit vs ember-qunit as the better name going forward)*

rj: it seems fine for `ember-cli-qunit` to always be supported even if it just brings in `ember-qunit` as a dependency.

tb: I'm in favour of keeping `ember-cli-qunit` to minimize churn for users.

---

tb: is there a burndown list that people can contribute to?

rj: the short answer is no, but it makes sense to write up a meta issue or something equivalent that acts as a well-known location of the status.

tb: so the immediate plan is to make them addons?

rj: yes, make them addons with the same API and shortly after that deprecate the existing API in favor of the new ones.


### ember-simple-auth#1443

tb: ultimately the issue is that our call to `war(...arguments)` 

rj: this should be in `ember-cli-debug-macros` , the tl;dr is that you have to do extra work if you output stuff from babel that needs to be retranspiled.


### strategies rfc

rj: i definitely want to move this forward if it's possible.  Let's try to review it and make sure we can push this forward to FCP next week


### fastboot

rj: i have an update on the fastboot error-template issues.  Krati looked at it and fixed the bug in ember, released in 2.15.1 or something.  The root cause is that in ember we didn't consider the error routes to "handle" the errors, unlike an error action.

dh: what's the tl;dr on the response code then?

rj: right now response codes are 200.

dh: seems good, just to be clear 302s are an exception then.

rj: yes, and i think we should change that because it prevents us from streaming responses since we have to send the status code eagerly.


