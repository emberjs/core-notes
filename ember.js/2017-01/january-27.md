# Ember Core Team 2017-01-27


### Agenda

- [Typescript in emberjs/ember.js packages](https://github.com/emberjs/emberjs-build/pull/188) RJ/TD
- [Module Unification Quest Issue](https://github.com/emberjs/ember.js/issues/14882) RJ
- Template Nesting / Slots / Blocks / Oh My?!? AM
- RFC's for ember-engines - Move to FCP? RJ
  - [Asset Loader Service](https://github.com/emberjs/rfcs/pull/158)
  - [Asset Manifest](https://github.com/emberjs/rfcs/pull/153)
  - [Linking Between Engines (and Applications)](https://github.com/emberjs/rfcs/pull/122)
- Adding `since` to deprecation warning RM

### Attendees

RM, TD, RJ, EB, AM, MB, DG, GC, MM

### Minutes

#### TS in emberjs/ember.js

RJ: It is annoying to add functionality here, but it is also annoying for Ember to not have access to types. We're planning to bring in glimmer di and it would be good to have access to those types. I bring it up since we all agree emberjs-build should die, I'd prefer to kill it off, but nobody has time for a grand rewrite. I know KS thinks we should move away, and I agree, but this is worth landing for now IMO.

TD: KS is not here so I don't want to merge over his possible issues.

RJ: Right. I'll talk to him by Monday when he returns. Get his sign off.

MB: Perhaps we can create a quest issue?

RJ: Robbie Pitts did this work, and has also done some work on a possible new thing. Perhaps he would be interested in pushing the rewrite forward.

DG: I think we need to move on this sooner than later (the TS), so I think this is the way to go for now.

#### Module Unification Quest Issue

RJ: This is mostly just to circulate the quest issue. It replaces some of the items from MB's quest issue and addons items for glimmer di. Please review. We can start getting traction and push it up the hill for emberconf.

(agreement we can keep both the ember-cli issue and this new quest issue on ember)

#### Template Nesting

RJ: I'd like to keep these things rolling forward. I don't thing we need a solid syntax, but I want to agree we have and issue and try to agree on constraints.

AM: I have doubts about how much we can get done w/o wycats here. I think all the avenues have been explored, and that my RFC was a good attempt at unification. The yield approach seems like the right direction to do. I think there is a strange syntax issue if you pass five named things and no default.

GC: I think doing what robert said, starting a canvas and enumerating constraints and what everyone wants would help. And would help YK participate async. It is probably difficult for him to do a call or slack at this point.

MB: suggest this is a presentation after emberconf

RJ: I think we should agree on the problems to solve. Agreeing on the constraints. Like: we need nesting, but also we must be staticly analyzable, but also engines. Then we can empower a strike team.

AM: Ok, well I'll put together constraints and let other people iterate on it.

RJ: Yes sounds good, lets talk about opening strike team. The community slack rooms not having history is a real challenge.

#### RFCs

RJ: We want these to be public APIs from the Ember engines standpoint. They aren't really Ember APISs, but we felt they were enough of the programming model they should be RFCd.

TD: For me my biggest concern is that there is a lot of thinking about this amongst vendors, so I'd be wary of building our own thing if it doesn't align with HTTP2 etc.

RJ: These are Ember services to exposed things, they are opaque to the implementation.

TD: I guess what I'm saying is that I'd rather not add an asset loading service if there is going to be an asset loading API in the browser. But I don't know enough.

RJ: The service exposes the API to engines and Ember. Either way you'll need something wrapping the platform. Hopefully we can figure out what the current proposals are and see how they interact. One, the manifest, isn't even about the API it is just the JSON format. And it exposes hooks to modify that at build time. It isn't even about runtime.

RJ: The third is linking between engines. Like `link-to-external`. So take this as homework, read through and leave comments. I'm trying to PM and not let these die in committee.

DG: Sounds good. These have been in use. Does trent have a demo that shows this in action? I think a demo would be helpful for everyone on core to see to evaluate these APIs.

RJ: I think I have a thing, perhaps I can email it to core@

DG: Shows how much I know that I didn't know ember-engines.com is using lazy loading.

#### Since on deprecations

RJ: I was talking to Tom about this today. He has been thoughtleading me one-on-one. It needs an RFC, it is definitey public API. Since we also need to know the source package (which is not exposed) that needs to be figured out. After this call I think we can start figuring out the Svelte API.

RM: I said I would start to write this RFC today, should I wait?

TD: No I would like to start it as soon as possible.

RM: Consider it done.
