# Ember.js Core Team 2015-11-13

#### Agenda

- LS: A few things
- GC: Glimmer2
- SP KS, V8 team
- MB: 2.3 branch
- SP: ember-cli

#### Minutes

Attendees: MB, MM, LS, EF, AM, GC, KS, YK, SP

LS: We’re planning travel for the Jan F2F, weekend of the 16th

LS: Also EmberConf items

GC: Still pushing on Glimmer2, planned to work in Ember integration this week but ran into some hiccups. Start focusing on improvements.

YK: Two minute version, we’re in the same place as the last two meetings, but implementation is better `if`, `#if` is working. First implementation was a loop over statements, now we have a VM that does that. We’re making the impl faster and better, but no integration.

YK: One good nugget is that there are a lot of components heavily used with literals. fa-icon for instance. The infrastructure we built allows us to just replace the attrs.foo inside the component with the string and just inline the static result. Subsequent statements that go through the statement can skip the lookups and use the inlined result.

YK: A component lookup can’t change, so can can inline/cache the lookups as well.

GC: Not much to add on Yehuda, the tl;dr is we went from glimmer 1 where the only plausible optimization was on the server to glimmer where we actually have a runtime and can do runtime optimization. This week we’re more honest about writing a runtime VM and can do more runtime optimization.

GC: The if helper is completed, if you look at it as generate block helper, it is only that cannot change scope etc. We can inline statements and avoid any dynamic bits.

YK: we could start doing integration, but robert is definitely an accellerant. If he can get us to the starting gate it can get done faster.

YK: certain problems like the inlining work require two brains. We’ve just been focusing there. We do need to start working on integration though.

KS: Looked at Bustle, found that there was a second of rendering and half of it was compiling JITed code. In 1.12 our views were a big source of this, in Glimmer the algorithm is better but there are hooks can can cause the same JIT churn. Chrome may do more work and have more memory pressure.

KS: We got some confirmation of suspected things. Some are not ideal, there were suggestions that we do things to keep methods from JITing. Prevent methods from inlining.

SP: We worked with a few engineers to look at tracing, and looking at combining the profiler with tracing. The V8 team wants to unify these things in the future, there is a tool for IE that has done this for a while.

KS: there were three modes for a method: monomophic, branching for shape, and dynamic. There was a number of roughly five for getting to dynamic.

SP: They did feel that the amount of compilation they were doing was unreasonable for something like Ember, regardless. They were going to look into the extra compilation stuff. We’re hitting a cliff somewhere and they’re looking into it.

KS: There was something about the initial module/require pattern as well.

SP: The have a two pass parser that trolls our module system- they walk it once optimistically assuming most code is not too important, then when you require at the end it just does a full parse anyway.

KS: The performance numbers for pre-parse were surprisingly high to them

YK: We just wanted to ensure our case was treated reasonably and legitimately

SP: Yeah the V8 team felt it was wrong that 50% of the time spent was out of our hands.

SP: They said give me a benchmark, and they will make it fast. So I’ll try to assemble that.

SP: KS and I will keep looking for low-hanging fruit, and as long as YK and GC keep working we will be in a really good place.

KS: glimmer 1 just got pwned hard by shape changes and JIT

MB: last thing is 2.3 branches this weekend and early next week

YK: I’ve like to land GC’d instrumentation stuff, it is very small

YK: The only things we added were per-user interaction
KS: there is overhead from the helper labels that is noticeable

SP: Their work isn’t in a hot loop, even if it is 10x worse it won’t be too bad

TD: GC let’s sync up on fast boot

SP: We released ember-cli, we owned ourselves on some things, and there is an npm3 bug they are working on that makes npm3 a bit non-deterministic.

SP: Toward the end of next week we should get 2.x out. resovlers etc will all come off npm, all blueprints from their respective addons (like Ember).

SP: We’re working on a guide to getting the best of rebuild times in ember-cli.

SP: I’m going to look at chad’s work after ember-cli output, and look at the tree shaking etc. Hopefully 10x faster builds by emberconf and all this tree shaking stuff.

KS: There is some overlap with the angular team’s work. They have their own mergeTrees etc

SP: They have a diffing step, I think further work removes the need for diffing and they seem less sure. I think we can do all these performance improvements without changing the public APIs and overhauling, we can slowly improve, their team has a similar end destination but is maybe less interested in migrating to it incrementally.

SP: One last thing on broccoli is merge trees work, it is done, but not merged yet. I need to rewrite it for Jo. Ember’s build goes from 800 -> 300ms with it.

KS: what about my sourcemap thing?

SP: I haven’t looked yet, maybe this weekend.

KS: meanders into: wanting to make the run loops not flush sync, users cannot internalize the right usage and shouldn’t have to

GC: last week we had to revert our build for ember-cli, still not sure why

SP: yeah just upgrade ember-cli and npm shinkwrap --dev with npm 3, and things should work

SP: feature.json needs to be in the babel cache for ember builds. Rob was going to do this, I’ll maybe take a look.

