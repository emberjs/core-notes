# Ember Core Team 2017-01-06

### Agenda

- MB: Going the factoryFor feature flag
- RM: [JavaScript Modules API](https://github.com/emberjs/rfcs/pull/176), does the Wednesday update need an FCP cycle?
- MM: Tobias Bieniek is interested in bringing the TypeScript work for simple-html-tokenizer to completion. What is the status of Chad's PR and the WIP branch?
- MB: Frozen hash and params bugfix into stable
- KS: generalized solution for console polyfill, deprecations, features, that can be used in libraries like glimmer, route-recognizer, etc.
- RM: nursery and retirement home places for projects ([Spring cleaning](https://usecanvas.com/ember/spring-cleaning/0OvM9VVmBIMB62JuBdPHbf))
- SP: ember-cli master is now dropped node 0.12 support, code-base is now more ES6y class + let + const + concise function etc.

### Attendees

MB, AM, DG, IT, KS, RM, RJ, SP, TD, YK, MM

### Minutes

#### JavaScript Modules API

(cover a few issues re: isTesting and where it lives)

TD: I'll make a module named ember/env where this stuff lives. Do we need another FCP?

YK: Would be peple asking for this be trivially pleased with the way it was addressed?

TD: Yes. I think this is as trivial as it gets.

YK: Sounds little risky to skip FCP, but it seems like a judgement call.

RJ: I would like ember-source, which goes out with 2.12 to have the final version of these modules in it. So shipping sooner would be good.

YK: Is Ember testing already public API?

KS: It is already public API. If anything else comes up that is missing it would be good to make it an additional RFC.

TD: I think in the future when we add APIs they should require an addition to this RFC's map of API

#### ember-source

RJ: Ember 2.11 stable lands on Monday, so should it export this map? Currently it exports the old shims? I can change them quickly.

(consensus that we should remove the old shims from 2.11's stable ember-source release, and in 2.12 we can land the real map)

#### factoryFor 

RJ: Normally we would have no/no-go this earlier, but we have not met for two weeks to that trolled us.

MB: I've taken a look at `factoryFor` in real apps and fixed a few bugs that were due to the fact that Ember tests run with all features on and all features off.

KS: There is a performance penalty to this until the future works lands.

MB: This deprecates `_lookupFactory`. In 2.13 we can enable `no-double-extend` which would remove the double extend from everywhere in Ember and fix the performance penalty.

MB: The new API will not warn.

YK: The first step is uncontroversial: just add the new API so we can encourage people to start moving to it right away.

KS: So how do we handle communicating that when you opt into the new API it changes things?

MB: I know this has been a very complicated issue to work through, but I feel confident that we've got the right solution now. We've spent a lot of time looking at how it works in the real world now.

*discussion about next phase after this is landed, but my internet cut out*

KS: Stef or Dan, are you working on any RFCs for other things in this area?

SP: Not at this time.

DG: I am working on some container/resolver rethinks that relies on "absolute specifiers", static identifiers that don't require going through the full lookup algorithm. Within Module Unification, we need a single ID to point to a module, which could exist in multiple places, or at multiple module paths. For example, as a default or named export, it could exist at multiple places on disk. This is the original idea behind module normalization.

DG: I have this written up in a document I can share. The interfaces on the container, the registry, and the resolver all deal with these specifiers. It's only within the resolver that the specifiers get mapped to ES module paths. That can be done with a map that's created at build time and works with something like Rollup. Then we can just short-circuit straight from the specifier right to the module. Or you could have a requirejs-style lookup where you can take that specifier to require something.

SP: This is really interesting but maybe now isn't the time to do a deep dive on the new stuff, we have other agenda items to get to.

KS: One of our boot issues is that you have to evaluate a lot of code. Now you have to import a module to register it. I'd like to get to a point where you can register something in the resolver as a module ID so it can be required lazily without paying an upfront cost. But maybe this should be discussed in a strike team or something.

#### TypeScript for simple-html-tokenizer

KS: chad started a conversion to typescript

YK: and I did a refactoring that fixed a bunch of location bugs. I want to be sure this work gets in to whatever we're using. The old thing basically always consumed tokens before generating location information, and this was not correct. My APIs were more streamy.

KS: We can confirm but I think it is the WIP branch. The tests are failing on travis but it seems like a versioning issues over TS compilers.

RJ: Another blocker was not doing the Glimmer work to consume it.

YK: a worse problem is that there were no tests in the tokenizer for the API glimmer used. I added tests, but I also made changes.

SP: Can we do things incrementally next time?

YK: No, this was a incremental step in a bigger change that never landed. I had a codebase where the events were emitted at the wrong time, where there were no tests and this was a good step.

YK: I acutally tried to land it into Glimmer and that was probably the overreach.

SP: Ok so we need Tobias to merge in one of the refactors, and then to make sure Yehuda's changes land.

KS: I think it is completed. There is build work that needs to be done.

YK: I didn't change the API, I might have changed a few events. The port to TS was not a minor thing. You could do a naive approach, but I changed the state machine to be better typed.

KS: I don't think this is far away.

TD: Is Martin going to follow up?

MM: Yes (then his microphone craps out) anyway I will get him to follow up with the WIP branch, Yehuda's, and I'll suggest that he split up the branch into multiple PR's if it makes sense to.

SP: My only requirement is that when it gets merged it works in Glimmer as well. I don't want master to get out of sync with Glimmer. When we land a big change to a microlib we should at the least open an issue explaining the process needed to adopt it upstream.

YK: I've been trying to make my own work more incremental.

SP: Yeah the recent stuff with opcodes was good, but the surprise was the learna stuff causing extra work.

YK: the stack-based work I'm doing now is less incremental. It isn't always obvious how you can make work incremental.

####  Frozen hash and params bugfix into stable

MB: This has landed now but we have not cut a release recently. Are we going to just put this in 2.11 and skip backporting to 2.10?

RJ: I think it will just roll into 2.11. I haven't heard anyone clamoring for a 2.10 backport. This kind of thing is what LTS releases for, and the issue is not in 2.8.

KS: If people can't incrementally move from 2.9 to 2.10 to 2.11, then that's a stronger argument for fixing it in 2.10.

RJ: There's not a lot of big differences between 2.10 and 2.11 that would cause people trouble moving between them.

KS: We need a way to deprecate/strip things in our microlibraries as well. We should extract utilities for doing deprecations and production builds/stripping.

RJ: There are some problems with the built-in debug utilities that we should work on that could probably done with this work.

KS: Before we talk about this more, Matthew, are there any action items with your agenda item we need to discuss?

MB: I will follow up on the GitHub issue where people are waiting for a fix, if no one is strongly opposed we will just ask people to upgrade to 2.11.

#### nursery and retirement home

RJ: RM raised this idea

RM: I have two things, the nursery and the retirement home. Rust does both and Dockyard has davy jone's locker. Ember-rails is an example, only one person works on it.

YK: I think making Ember work with Rails is actually important. And we should not just remove it.

RM: There is also ember-cli-rails

RJ: Right I would start there if I needed to today.

RM: This is part of my learning queue. To write integration cookbooks. But I need help since I don't want to only have Rails.

YK: We should not that Rails remains very popular. If we remove it people will think the opposite of what we want, which is that Rails is very important.

SP: I think when we look to deprecate we should need to understand the alternative and document it (ala Ember deprecations)

TD: Isn't the Rails integration just JSON-API?

YK: No there are a few other things needed to get up and running. We've had interns who didn't know where to start. Copy/paste these ten commands would be enough. Or a Gem + API.

TD: Let's move ahead with the retirement home and worry about the nursery when we have something to put in it.

(some discussion about Rails + Ember strategy)

#### ember-cli update

SP: The ES class stuff in Node 4 is compat with our core object, so that is great. Bower is gone on master (the system version would be used if an addon needs it), npm is nearly optional. At some point in the future we can make the swap to yarn as well.

RJ: It was a ton of code change, so getting good testing for 2.12 seems important.
