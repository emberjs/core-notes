# Meeting: Ember Core Team 2017/10/27

## Agenda

- [Component Manager RFC](https://github.com/emberjs/rfcs/pull/213) (RJ)
- RFC Repo Merging (RJ)
- [Migration from `any`/`isAny` to `some`/`isSome`](https://github.com/emberjs/rfcs/pull/233)
- [RFC: Peer and Optional Dependencies Support](https://github.com/ember-cli/rfcs/pull/112)
- [RFC: Non Context Shifting Partial Evaluation](https://gist.github.com/chancancode/c0bfb0b8461b11de255be8f5d2a2e48b)

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM, CH, IT

## Minutes

### RFC Repo Merging

There’s general agreement to merge the ember-cli and ember RFC repos, but there is some process to straighten out and make consistent.

Action item: RM will follow through with this. RJ will sync up with him after the call.

### [Migration from `any`/`isAny` to `some`/`isSome`](https://github.com/emberjs/rfcs/pull/233) 

RJ: I will try to comment on this RFC and see if cibernox will update it and then we can discuss next week.


### [RFC: Peer and Optional Dependencies Support](https://github.com/ember-cli/rfcs/pull/112)

RJ: The rough proposal is to validate the peerDeps at run-time.

RJ: It seems totally reasonable for an add-on to use peerDeps to declare a dependency expectation in the host app.

RJ: We can hard error with a config flag to avoid hard errors.

RJ: We (on the CLI team) will probably move this into FCP the next time we meet.


### [RFC: Non Context Shifting Partial](https://gist.github.com/chancancode/c0bfb0b8461b11de255be8f5d2a2e48b)

GC: We can just call this “partial evaluation”.

GC: I’m not sure there’s much more to say. We brought this up in the last few core team meetings. The reaction seems a bit lukewarm.

GC: I can give a summary but please read.

RJ: I am generally in favor. The stated downsides are that it’s weird to do anything if we’re deprecating everything.

KS: I’m concerned about introducing a new thing in the interim phase (pre-GC in Ember). Because there are no advantages to using this approach vs. a template-only GC.

GC: This is not really introducing new things. If you aren’t already using partials, then there is nothing to learn.

RJ: And it removes a number of foot guns.

RM: We can use this to force people’s hands - to allow for future compatibility with Glimmer templates.

KS: I’m concerned we’re stalling - this feels like pre-1.0 and we need to move forward (with GCs).

EF: I’m sympathetic to your concerns KS. What we need is usage (of Glimmer components)

GC: I’m open to waiting a bit for a more future compatible solution that will work with `component` .

KG: Most people aren’t using partials very much. And they’re no longer in the guides.

RJ: This is a nice transition plan, by forcing the declaration of args.

GC: Ok, I will submit it and we can gather more feedback from the community. I would prefer to get more consensus from the core team.

KS: I think we just need to ship the GC RFC with enough so that this feature could be delivered incrementally.

KS: Have we progressed at all on the invocation side design for GCs?

RJ: I thought we had agreed on everything except on the invocation of named blocks.

KS: TS support in ember is almost completely done.

RJ: We should merge that and avoid a long lived branch.
