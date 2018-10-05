# Meeting: Ember Core Team 2018/06/08

## Agenda

- RFC Review (RJ)
  - For advancement into FCP:
    - [Deprecate](https://github.com/emberjs/rfcs/pull/335) `[component#sendAction](https://github.com/emberjs/rfcs/pull/335)`
  - For merging:
    - [Deprecate “Globals Resolver”](https://github.com/emberjs/rfcs/pull/331)
    - [Deprecate Component#isVisible](https://github.com/emberjs/rfcs/pull/324)
    - [Property Fallback Deprecation](https://github.com/emberjs/rfcs/pull/308)
- Discuss template import “things” / path forward? (RJ)

## Attendees
[ ] Yehuda Katz
[ ] Tom Dale
[ ] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[ ] Matthew Beale
[ ] Edward Faulkner
[ ] Martin Muñoz
[ ] Dan Gebhardt
[ ] Godfrey Chan
[ ] Ricardo Mendes
[ ] Chad Hietala
[x] Katie Gengler

## Minutes
## RFC to FCP: [Deprecate `component#sendAction`](https://github.com/emberjs/rfcs/pull/335)

Discussion … no reservations with moving to FCP

## RFC: [Deprecate “Globals Resolver”](https://github.com/emberjs/rfcs/pull/331)

RJ: No comments since last week. Good to merge.

## RFC: [Deprecate `Component#isVisible`](https://github.com/emberjs/rfcs/pull/324)

RJ: No comments since last week. Good to merge.

## RFC: [Property Fallback Deprecation](https://github.com/emberjs/rfcs/pull/308)

RJ: Feedback has been all positive. Good to merge.

GC: We need to confirm that we’ve tweeted about this.

RJ: I’m not sure if this was done.

YK: Maybe we should have a separate account for tweeting about RFC FCPs? Let’s punt that to the Steering Committee.

RJ: Ok, I will merge these if we tweeted about them.

### Discuss template import “things” / path forward?

RJ: I know there are a bunch of threads re: different `import` syntax to use. I’m more concerned about ensuring that any `import` proposals are compatible and complementary with MU.

*KS raised MB’s work on this.*

RJ: Yes, MB has an open scratchpad with some proposals. We should check with him about the current status.

KS: Are you concerned about an `import` that ignores the MU rules.

RJ: Some people might use `import` as an end-run around the need for in-repo addons.

MM: Don’t in-repo packages potentially compete with npm packages?

YK: My main concern is the potential for confusion over the interaction between implicit MU imports and explicit imports.

KS: This isn’t a new proposal for `import` vs. `use` is it?

RJ: No, it’s not. It’s the same thing.

KS: I liked the idea of types being named exports.

RJ: I personally would be ok with auto-creation of entry points if no file is present. Basically like index.js.

YK: I’m ok with this, but we have a series of questions to answer first. We need to understand how `use` fits with JS module imports. We need to think about it more if we introduce new ways to import things.

RJ: We were discussing these sorts of things in the MU strike team on Mondays, but we probably need a new group to focus on this.

MB: I would appreciate help with this. It’s a big task.
