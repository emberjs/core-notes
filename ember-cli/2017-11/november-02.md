# ember-cli Meeting Notes - 2017-11-02

## Attendees

- @hjdivad dh David Hamilton
- @rwjblue rj Robert Jackson
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @twokul an Alex Navasardyan

## Agenda

- node 9
- strategies
- concurrency
  - 7379
  - 7392
- `.ember-cli` as js (7336)
- update `sane` (7141)
- beta release
- `ember-cli-qunit` -> `ember-qunit`


## Discussion Notes

### strategies

an: i'll update the rfc with the feedback and push a sample rfc

an: i'm okay without `assembler`

rj: we could punt and move it to a secondary arg

### Node 9

ks: is this working on appveyor

rj: as of an hour ago

rj: i'll have beta point to node 9 on travis and appveyor.  It should work either way but it would be better for users to not get the warning.

rj: should we do this for 2.16 or only target beta.

dh: seems safe either way to do release or beta.

rj: what about 7?

ks: drop it in beta?

rj: i'll test to see whether we already get a deprecation

### concurrency issues

rj: the issue we have is that the job count is multiplied per broccoli-babel-transpiler build process

an: should we make this opt-out vs opt-in

dh: sounds like we agree that for today we should disable concurrency because of the multiplication.

rj: we still want it to be opt-in, we just can't have it be opt-out because it's trolling people with out of memory issues.

dh: and long-term we'll probably have to make a worker pool.

an: where would we put the pool to make this work?

dh: on the parent process

### ember-cli js

rj: there's an issue asking to make `.ember-cli` a js.  I'm in favour of this.  We can do this with `require`

an: doesn't `yam` already run `require`?

rj: i don't think it works

an: okay i'll have to verify

rj: also about discovery, we only do project root and user's `$HOME` dir, should we do a `findUp`?

an: why?

rj: yarn workspaces, and projects with multiple repos.

dh: seems good, the only downside is the work to make it work.

*everybody is +1 on the idea*

### update sane

rj: 2.0 of sane depends on `fsevents`

dh: we need to make sure it works on all the platforms, but otherwise is anything holding us back?

rj: the last commented issue is about ensuring the native extension is reasonable

kg: it looks reasonable

an: it will slow down install time for eg different node versions

dh: this doesn't deal with the too-many clients problem right?

rj: no, but if that does get fixed we'll need to upgrade

### beta release

rj: we need a beta release and a 2.16.3.  Does anybody have time?

an: I can

### ember-cli-qunit -> ember-qunit

dh: i thought we had already decided to do this

rj: we have done the shim portion, the linked pr is for changing the blueprint

dh: what's the argument against doing this?

ks: churn and consistency with the name.

ks: is there a codemod?

rj: there is but the old API is still supported and not deprecated.

ks: i'm okay with it but we should wait for feedback from @turbo87

rj: sounds good.


### prettier

rj: we have talked before about enabling it in the repo.  Can we use it in ember-cli?  Does anybody care?

dh: I'm :+1:

an: i think prettier doesn't quite support all of eslint

rj: confirm, we'll have to disable some rules but can keep the rest

ks: i'd need to try it out before :+1:.


