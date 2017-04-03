# ember-cli Meeting Notes - 2017-03-31

## Attendees

- Nathan Hammond
- Jake Bixby
- Tobias Bieniek
- David Hamilton
- Alex Navasardyan
- Katie Gengler
- Kelly Selden
- Chad Hietala
- Robert Jackson

## Agenda

- Glimmer Pipeline
- Tree Shaking
- `app.import()` from `node_modules`
- Blueprint (`blprnt`)
  - use Glimmer resolver?
  - composability of blueprints
  - blueprint migrations/transactional?
- Background Service
- Slow Commands
  - `generate`
  - `help`
- Ember CLI/Broccoli Errors
- Global add-ons
- `lib-cli`

## Discussion Notes

### Glimmer Pipeline

Extract `lib/broccoli/ember-app.js` into a separate npm package.

### Tree Shaking

- given list of file entries + module information + roots, generate a retained graph
- keep module loose w/o concat until the very end
- generate dep graph at the very end of the build process
- have a hook that will give you access to dep graph w/o being able to modify it

### `app.import` from `node_modules`

- support amd, cjs or es6 w/o watching
- everything that's imported is considered dynamically linked
- should care about single file (entry point) make sure we can tell the difference between globals/modules for tree shaking (globals and module are in different buckets)
- need to be able to "blacklist" modules to resolve them during runtime
  - possibly make it automatic, we *should* have info already or do a dep walk on app.import path
  - should *not* require for users to pass into list of modules when using `app.import`
- address differences between `import`s (documentation or otherwise)
  - `app.import` is project relative
  - `this.import` is relative to whatever `this` is
- path *has* to start with `vendor`, `node_modules`

### Blrpnt extraction

- unfork
  - port new test changes from ember-cli
  - make sure we haven't lost anything added in ember-cli/blueprint.js
- load blprnt in ember-cli
  - bring into ember-cli as drop in replacement
- decouple pods/classic structures information from blprint/blueprint.js
  - create new structures using new primitive to manage this logic in ember-cli
- create module unification structure to provide blueprint support
  - use glimmer resolver to take advantage of rules to generate file paths

### Background Service

**idea 1**: Convert bin/cli into an actor system to provide parallelism  (actor === task)

**idea 2**: Daemonize the process

- removing add-ons (packages.json changes) needs to restart daemon
- daemon per application
- abstraction at app layer

*Conclusion*: Since the gain of this refactor doesn't seem high enough
at this point we will not move forward with those plans.

### Slow Commands

#### `generate`:

- idea 1: cache the project property that gets passed in, which is probably the biggest slowdown
- idea 2: based on ember-cli version, add-on commands will use a shim for `includedCommands`
  to export a hash with keys being the command name, and value being a hash including the path
  to the module to be required, as well as command options and any other relevant info
  - the primary issue comes from requires at the top of the command
- deprecate command name property, in favor of the key

#### `help`

- upon add-on install, identify and write an add-on's available blueprint g -h json
  output to a per project file like `.ember-cli-help`  or something similar
- `ember -h` would parse that generated json file and generate the terminal output

### Ember CLI/Broccoli Errors

Currently, our error handling in ember cli is very rudimentary (e.g. Template Compilation errors
when all that uses see is confusing message from Glimmer internals). There were previous [efforts](https://github.com/ember-cli/broccoli-middleware/pull/4) to outline what it might look like ideally.

This would require:

- changes to handlebars compiler itself (it has error information already, just doesn't propagate it up);
- changes to ember-template-compiler
- changes to glimmer
- changes to broccoli-middleware
- changes to broccoli-builder (this one is interesting b/c we diverged from the mainstream version;
  mainstream version does some work to expose error information already; elephant in the room is should
  be un-fork and start using mainstream one or just keep using the fork)
- creating a package that would unify error information across projects mentioned above,
  a.k.a `new BroccoliError(/*some args*/)`
- some design work to make it nice
- profit?

### Global Add-ons

- Needs an RFC
- Save global add-ons in user home folder (like `.ember-cli`)

### `lib-cli`

*Conclusion*: seems like a low priority at the moment. The project is moving towards being more generic.
In order for this effort to be successful, we would like need an external client (i.e. `angular-cli`).
