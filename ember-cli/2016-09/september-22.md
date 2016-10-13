# ember-cli Meeting Notes - 2016-09-22

## Attendees

- Nathan Hammond
- Kelly Selden
- Robert Jackson
- Tobias Bieniek
- Katie Gengler
- Stefan Penner
- Chad Hietala
- David Hamilton
 
## Actions

- [ ] Tobias: Open issue for making sourcemaps enable-able with warning.
 
## Discussion Notes

### Extract CSS

- Preprocessors, want to move to addon.
 
### CI was broken

- Fixed by reverting [#6193](https://github.com/ember-cli/ember-cli/issues/6193) PR (see [#6276](https://github.com/ember-cli/ember-cli/pull/6276))
- Actual issue is not quite known/resolved 
 
### Source Maps

- "End-to-End" source maps are necessary for debugging support in VS Code and [IntelliJ](https://intellij-support.jetbrains.com/hc/en-us/community/posts/207632025-Debugging-an-Ember-application?page=1#community_comment_203688990)
    - Can enable debug inside of the IDE if you had proper source map support end-to-end.
 
- Need to summarize:
  - What's keeping us from having that.
    - Babel gets slower.
    - Sourcemap concat gets extremely slow.
  - what's needed to make it happen
   - how can new contributors help
 
- Create a meta issue summarizing these things
- Notes:
  - Babel doesn't do sourcemaps correctly for symbol mangling in V5, maybe fixed in v6.
  - Imports are also mangled also may be fixed in v6.
  - ember-browserify doesn't support source map modification.
  - Entire system must trace through end-to-end with sourcemap support.
  - Investigate sorcerer?
  - Investigate performance in Chrome, it was unbearably slow to debug.
  - Sourcemaps inserted only at Uglify step.
  - source map segments or sections? (confirm with @hjdivad) one doesn't need to `cat` sourcemaps.
 
 
### Macro Blueprint

- [Macro Blueprint RFC](https://github.com/ember-cli/rfcs/pull/67)
- Implement as an addon in parallel with RFC providing its own blueprints.
- Whether to include by default is the conversation of record.
- Including the test infrastructure for a macro makes blueprint more valuable.
- `utils/macros` as a home, push conversation into Ember Core team.
  - Focus on teachability, understandability.
 
 
### Addon/Engine configuration

- RFC forthcoming from @pzuraq.