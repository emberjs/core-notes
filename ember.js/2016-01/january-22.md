# Ember.js Core Team 2016-01-22

## Attendees

Matt, Dan, Ed, Godfrey, Kris, Martin, Tom, Yehuda, Erik, Stef, Leah

## Topics

- `@each` Bug - https://github.com/emberjs/ember.js/pull/12832 (stef)
- DG -- Pods Discussion (dan)
  - new modular pods proposal - https://gist.github.com/dgeb/5185fd0179327a2426da
  - analysis of NPS (and a pods+ proposal I no longer support) - https://gist.github.com/dgeb/9ed417afa7164dec4aa3
- Testing (robert)
- Glimmer2 stuff (yehuda)

## Notes

### `@each`

SP: there are a chain of poor tests around the @each issue. I think it is good to enumerate as many cases as possible and write better tests. Something around 2.2 (I believe) changed though we haven't hunted it down.

KS: Is there a chance it could be the more frequent invalidation was required/intentional?

SP: I don't think so. Tricky to get to the root since there have been multiple issues for a while, and the conversation is becoming muddled on the issue

(technical discussion)

### Pods

DG: I didn't grok new pods until the end of the F2F, so I've been reviewing and thinking about it. I created a new proposal and it spun into a few variants. I went through what I think everyone went through at the last F2F

DG: I've created a new proposal with thoughts and explorations

YK: I think it is too early to evaluate proposals as a group right now. We only settled on a solution a day or two ago, and so we might have a good option or not. A smaller group iterating seems like they might find better ideas.

YK: fwiw my recollection of the main constraint is that we do not want slashes in component names.

YK: We need a method to group that does not mean specifying the group explicitly at invocation

YK: We want some compat with the current global system. There should be a way to share components in your app, but it should not diverge extremely from the current invocations

YK: lastly addons need a solution for this. there was a import proposal which we back-burnered, and the second was packaging

YK: (one more constraint matt couldn't type out)

YK: lastly relocation should be DnD, basically

YK: we need to check the mental load of adding a new thing (do I need to look at a flow chart to know how to name a thing?)

SP: generators should save keystrokes, not cognitive overhead

EF: We could make it so generators run in a nested directory create the thing in the right place.

DG: I think the way to deal with namespacing is to have people invoke the generator with slashes to namespace.

EF: Another constraint is to make sure we don't have to reserve future names that may conflict with existing directories. That's why the + was introduced.

DG: Pods+ was designed to be future-proof

YK: I like the proposal, I just want to discuss the cognitive load aspect a bit offline

EF/YK: soft constraints, short is bad, long is bad, special characters are off-putting

(discussion)

SP: don't want to add to this, but I'd really like to have my unit tests next to my code

YK: package by feature cs package by layer are the terms in Java, you can google and get some ideas about what others have done with this stuff

YK: One of the goals of the whole feature is that you can perceive nested parts as a "sub-app." We would like you to be able to nest things in the areas where they are used. You should be able to look at a single route and view it as an encapsulated unit. If you flatten everything to a top-level, it's hard to find the things that are specific to a particular route.

(discussion of pods + routable components)

YK: Using + for file or dir names requires some editor due diligence

KS: modular approach also solve titlebar

YK: disagree, I think it makes it worse. It has both approaches, so you have inconsistent content in the titlebar

### Summary of Pods Design Constraints

1. Reasonable branching factor. Users should see a reasonable number of items at any given level in their hierarchy. Flattening out too much results in an unreasonably large number of items.
2. No slashes in component names. The existing system allows this, and it's not something we want to support with Glimmer components.
3. Addons need to participate in the naming scheme, most likely with namespace prefix and double-colon separator.
4. Subtrees should be relocatable. If you move a directory to a new place in the tree, it's internal structure should all still work.
5. There should be no cognitive overhead when adding a new thing. The right way should be obvious and not impose unnecessary decisions.
6. We need clean separation between the namespace of the user's own components, helpers, routes, etc and the framework's own type names ("component", "helper", etc) so that we can disambiguate them and add future ones.
7. Ideally we will have a place to put tests alongside their components.
8. Local relative lookup for components and helpers needs to work.
9. Avoid the "titlebar problem", in which many files are all named "component.js" and you can't tell them apart in your editor.

### Testing

RJ: mmun and a coworker are working on improving test helpers. Going to do it incrementally, but not expose them until the whole is done.

YK: Should for sure have an RFC

RJ: Right, and I wanted to rewrite the testing guides. It will help us see what need to be in the RFC

EF: yeah it is in an addon, but the experience is described in the guides and so should be RFC'd

RJ: Right, this is with the goal of "readme driven development"

### Glimmer

YK: Glimmer FF

RJ: I got sidelined, it is a small amount

MB: can I get on the chat?

YK: we have a room, we can add people to it

MB: we should add people like serabe etc as well

MB: I'd like to see a meeting like we have for htmlbars.

(dive into testing setup for glimmer packages)

YK: would be helpful to have the DSL as we have [here in glimmer for envs](https://github.com/tildeio/glimmer/blob/07069c69057731730d25bfe340f843db8b3c23cc/packages/node_modules/glimmer-runtime/tests/ember-component-test.ts#L374-L394) (also [here](https://github.com/tildeio/glimmer/blob/07069c69057731730d25bfe340f843db8b3c23cc/packages/node_modules/glimmer-runtime/tests/ember-component-test.ts#L491-L504) and [here](https://github.com/tildeio/glimmer/blob/07069c69057731730d25bfe340f843db8b3c23cc/packages/node_modules/glimmer-runtime/tests/ember-component-test.ts#L1176))

YK: to the extent that we have better tests is it b/c of tools like this

YK: we did the work on merging in glimmer 2 yesterday. after the F2F it felt like the biggest thing

