# Meeting: Ember Core Team 2018/01/12

## Agenda

- RFCs 
  - `{{let}}` RFC: https://github.com/emberjs/rfcs/pull/286
  - `@ember/optional-features`
  - [Optional jQuery RFC](https://github.com/simonihmig/rfcs/blob/jquery-optional/text/0000-optional-jquery.md) (will be published publicly soon)
- Status Board (RM)
- API Docs (YK)
- Triaging
  - https://github.com/emberjs/ember.js/issues/12142#issuecomment-356643172

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [ ] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler

## Minutes

### let RFC

RJ: Do we still feel positive? There was a flurry of comments during the FCP. I think most remaining comments are regarding “templates should not have logic”. I believe most of the issues are addressed though.

YK: HBS is not about removing logic, it is about restricting it to non-mutable and declarative forms. Mustache was “logic-less”, and I think during HBS work I think I mistakingly used that language. I think it is better to think about things like “no mutable variables” etc. It is a programming language, just a very small one.

RJ: So any blockers? No? Ship it!

MM: I think there is some concern about introducing `def` in addition to `let`.

KS: I have mild concerns about `let` being a block form, but it is also in JS as an inline form.

YK: I think we have many keywords in HBS that are similar to keywords in JS.

KS: Yeah but this one is new, and so is the JS one. Hm.

RJ: MM are you opposed?

MM: No I don’t think so.

RJ: Your concern is that there is another concept for adding names to a scope.

MM: Yeah it is that `let` immediately evaluates the block. Just `def` would capture a block.

KS: Right, I thought `let` was supposed to do this before I read the RFC.

MM: I think we will have another mental model for `def`.

RJ: So do the ayes have it?

TD: I think the nays definitely do not.

RJ: Ok!

### optional-features

RJ: GC and I paired on this. We wanted to way to opt into features at app build time. The addon lets you call “ember enable” to set a JSON value. It  also have a nice node-land API. Like ember-source will want to do things like strip code that isn’t needed based on a true/false value. It is simple, a command and a config and tests. We are looking at how to integrate with ember-try, perhaps “scenarios” for groups of features. This will also be helpful for things like jQuery. We will wrap all the jQuery support stuff in a flag. The idea is that these settings will correspond to build flags (feature flagsish) in Ember.

RJ: We haven’t had many features like this enabled/disabled specific to a host app before.

TD: I think it is bad if enabling a FF on canary is different than enabling a feature this way.

RJ: If you’re in a canary build of Ember it makes sense that you might have access to other features not in stable.

TD: Right I think that lines up with FF.

YK: I think this is all great. We need to think about how turning on and off a feature flag is supposed to work. There is a difference between “I don’t want jquery but it is ok if someone else brings it” and “blow up if someone else wants this”.

GC: so far this is designed to switch your app in to some kind of new-world behavior.

YK: Which of the two things I mentioned do you think?

GC: I don’t believe it changes my statement.

YK: Yeah I think we do need to think about this though.

RJ: IMO right now it is on or off. The app controls it.

MB: Right, the app is the only source of config right now so it isn’t an issue. But if an addon requries X feature and you disable it, it might be hard to catch.

RJ: Right I think we need a way to have addons check this stuff. Hence the node-land API.

RJ: GC would like the “enable” command to also run a codemod. I think it is an also-ran feature, but I accept the premise that it is part of a solution. ember-cli-updater already purports to run codemods for you. In this case it isn’t quite that simple. Maybe you just want to change a flag, not a version. I think the goal is to be abstract enough that updater or watson can simply handle this for you.

### RFC optional jQuery

RJ: There is a draft here he will open it soon. Retcons jQuery-based APIs into a “feature” that we can disable as a flag. It also introduces `ember/jquery` which is what will add jQuery itself as a dependency. Basically there will be a feature you opt into. If opt into jQuery but don’t have the package it will error. IMO the RFC does a good job of giving jQuery credit and discussing why it is no longer always needed.

RJ: Part of this effort is obviously we need Ember’s tests to run without jQuery enabled.

RJ: In fact during the testing effort I ran into a bug with the native dispatcher, which was good.

YK: In IE11 if you fire a synthetic event, then handle it and prevent default, the event property for defaultPrevented will always be false.

### Status board

RM: We’ve been talking about how to make this more sustainable. People need to make updates. Katie offered to help maintain it as well.

YK: I think the learning team can project manage the status board. I think there is a lot of overlap where things want to be communicated.

Action: analyze why transition is not showing up in the API docs and fix it.

### API docs / legacy

YK: I’m trying to get the learning team to add “ember-2-legacy” into the API docs. Distinct, like for ember-data. I don’t think versioned docs are good enough. If something was moved into the addon from Ember we don’t want to lose the documentation.

RJ: The ember-2-legacy addon just wants to render the docs itself.

YK: What happens to the docs for things that move?

RJ: I think they are still there. Not all docs are moved from ember to the addon.

YK: I would like the docs to reflect the programming model.

RJ: I’m not persuaded by this case. But ember-test-helpers are basically part of the public API, but they aren’t published with the other API docs. I think your point that other ecosystem addon should participate is reasonable.

YK: We can take it out of here. I just want a direction from this group to share with the learning team so we’re not all over the place.

RM: I wanted to bring in the ember-cli docs but Tobias has some styling concerns. But we will handle those and then bring the ember-cli docs in.

### Triage

RM: There are two issues here. Sergio will try to give us a few items for each week.


### [Documentation for route Transition object](https://github.com/emberjs/ember.js/issues/12142#issuecomment-356643172)

(discussion)

RJ: It is likely the API documentation needs adjusting in router.js itself
