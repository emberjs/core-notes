# ember-cli Meeting Notes - 2017-10-26

## Attendees

- @rwjblue rj Robert Jackson
- @turbo87 tb Tobias Bieniek
- @kellyselden ks Kelly Selden
- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler

## Agenda

- ember testing codemod
- ember-cli/#rfcs112 peer + optional dependencies
- ember-cli/ember-cli#7401
- ember-cli/ember-cli#7388
- ember-cli/ember-cli#7384
- Merging RFC process & repo with emberjs/rfcs

## Discussion Notes

### ember testing codemod

tb: will the new api work with ember 1.13?

rj: no, it depends on owner.  The polyfill would be needed.

ks: what about `this.render()` invocations in helpers?

rj: that wouldn't get rewritten right now

### pr 7401

rj: we used to have this idea that you could tell ember-cli where `node_modules` was and it would resolve relative to that.  This PR changes things to essentially use `resolve` and removes the custom `node_modules` path.

rj: it was added to support unusual environments, like running the app in docker but having `node_modules` outside of docker.  This is a potential downside to the pr, but users should probably just symlink `node_modules`.  I don't have the app that motivated the original work: it was internal.

rj: this was never made a public API; there's very little usage in ember-observer.

rj: there's `process.env.EMBER_NODE_PATH`; it's not clear what it's for.

ks: if it's not public API and it's not used we should clean it up.

tb: presumably there was somebody who wanted this.  I'm not sure it's not really public API.  Although we could depreciate it in 2.18 and remove it in 3.0.

rj: okay it sounds like everyone is :+1: on this particular pr and we can discuss later about `EMBER_NODE_PATH`.

### pr 7388

ks: the pr removes EOL assumptions from `insertIntoFile`.  blueprint test helpers changes files when you install it; I was trying to improve it and noticed that it's inconsistent about whether or not an EOL is implicitly added.  It would be easier to reason about if it were consistent.  It's breaking, which we could do in 3.0.

rj: how do we depreciate it though?  I agree the pr leads to better behaviour, but users need to be able to opt in to the new behaviour.

ks: it wouldn't be foolproof, but we could deprecate on lines that lack a newline.

rj: that seems like a reasonable enough deprecation.

ks: it's not perfect though: people could be aiming for two newlines and relying on one.

tb: having a property in options is uglier but it works.

tb: why are these even in ember-cli?  maybe what we should do is extract to a separate library.

rj: that seems fine, we just need to be consistent about what gets extracted and what stays.


### pr 7384

ks: when can i use regex in `insertIntoFile`

rj: seems like the right thing to do here is the extraction we talked about re pr 7388

### merge rfc process + repo with ember/rfcs

kg: should we merge our rfc process with ember + rfc

rj: so this would be roughly similar to what we already do in core notes.

ks: as long as we all have permissions I'm all for it.

rj: fixing the permissions is part of this; I agree Kelly everyone on the subteams needs access to be able to do their process

rj: we also want to make the ember-cli policy about champions more widely adopted.

### peer + optional

tb: I'm not sure about cli enforcing peer deps

rj: consider motivating cases like
  - htmlbars-precompile
  - babel-6

  as well as when glimmer components happen.  It's reasonable for addons to have peer dependencies 

dh: the current behaviour isn't helpful for users though: Tobias what's your objection to hard validating peer dependencies?

tb: peer dependencies can be misleading, there needs to be an escape valve

rj: so it would be a breaking change for those users

dh: how about a flag to opt-in to warnings?

tb: that seems good to me

rj: we can have a link to docs that explains for the rare cases where you actually don't want to meet the peer dependencies but the common case here is an error that we should fail on.

ks: can you not issue warnings today though?

rj: `ember install` will not issue warnings in part because we swallow this for the spinner.

ks: to verify we're not going to touch any non-addons?

rj: yes, although other dep checkers could.

ks: and then what about the flagging?

rj: the default when this ships would be to hard error with a link to docs that told you about a flag to opt in to warnings or whether it's a process environment variable.

ks: what if the peer dep itself is not an ember addon?

rj: all we'll do is `resolve.sync`, we won't read the dependency itself for the purposes of peer dependency validation.

ks: what about checking versions?

rj: good point, we would have to read at least `package.json`

ks: what if we make hard erroring depend on a flag until 3.0?

rj: this will add a burden to new users though.

---

rj: We could add a warning to echo the `npm` warning and explain to users that this will be a hard error in another version

ks: that sounds good.

rj: okay great i'll update the rfc to mention the flag and gradual rollout.


