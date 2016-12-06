# ember-cli/fastboot Meeting Notes - 2016-11-17

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Chad Hietala
- Kelly Selden
- Jake Bixby
- Robert Jackson
- Krati Ahuja
- Ryan Cruz
- Katie Gengler
- Ed Faulkner
- Tom Dale
- Alex Navasardyan
- Miguel Madero
 
## Actions

- [ ] Nathan to pair with Krati on learnings from `ember-engines`
 
## Discussion Notes

Context for the discussion:

- [Issue #6350](https://github.com/ember-cli/ember-cli/issues/6350)
- [RFC #75](https://github.com/ember-cli/rfcs/pull/75)
- [PR #6395](https://github.com/ember-cli/ember-cli/pull/6395)
- [RFC #77](https://github.com/ember-cli/rfcs/pull/77)

**Note: further conversation has occurred after this meeting.**
 
### How much can we chew?

- Rewrite `lib/broccoli/ember-app`?
  - Belief that a lot of the coupling is the root of a lot of problems.
  - Start the process of extracting it into a configurable way
  - Find a short term escape hatch.
    - Opt into a separate build pipeline.
    - Extract existing into an addon.
 
- require a different file at the top of `ember-cli-build.js` as a faster way to deliver?
 
### Goals

- Ship FastBoot 1.0.
- Don't paint ourselves into a corner.
- "totally happy"
- Rather than land FastBoot itself into CLI, try to aim for generic?
  - How to avoid blocking Ember FastBoot gets complicated.
- Guarantee speed of build for FastBoot.
 
### Tom's Internal Crisis

Heading in a direction where possibly things are built "just in time." In the sense
that making any request guarantees that you get only the assets that you need. And
good guy Ember CLI has your back in a way that you get tree-shaking "for free."

Tom, paraphrasing Stef, possibly putting words in his mouth: mostly important that
we design a system that accounts for both debugging and performance concerns. Single
`app.js` files complicate the idea of heading toward "per-route" builds. Tom
thinks about build process as possibly occurring "online" but to do so breaking
`app,js` into pieces is a rider.

### Implementation

The RFC may not need to specify all implementation details.

#### Contrast with ember-engines build

- Hooks exposed in a way which allows us to jump into the the parent build.
 
#### `postprocessTree`

- Something that implies "dangerously access parent tree."
- For FastBoot the minimal implementation may really just need a `preConcat` hook.
 
#### Merge/Overwrite

- Avoid building the same modules twice.
- Broccoli exists to allow dependencies to be shared through the graph.
- We need a way to share smaller pieces in the event that a subgraph needs to be
  consumed by two other pieces
  - Allow for reuse of smaller modules.
 
#### Debugging

- The "code that runs in FastBoot" goes out to the browser.
- Debugging problem not solved by clobbering of modules.
- Need to actively write tools in this space if we're going to be successful.

#### Addons

- Specific behavior we want to provide for addons?
- Hoist information from FastBoot existence into project information.
  - `treeForFastboot`
- Maybe pave a path for `treeForX`?
 
#### API for broccoli-middleware improvements

- WIP for making that customizable.
- Fundamental blocker for FastBoot.
- Identify hooks to insert new middleware.
 
### Community Initiative Compatibility

#### Module Unification

- Avoid clobbering collection namespace.
- Add a `src/fastboot` folder which is a group of collections which mirror top-level.
  - `ember-paths` magically looks like it.

### Forward-looking statements

- Make sure we account for packaging as a "last step" in the build process.
- "Break apart/split", "filter", "merge" as the primary concept flow?
 