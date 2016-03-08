# ember-cli Meeting Notes - 2016-02-25

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Chris Thoburn
- Kelly Selden
- Jake Bixby

## Actions

- (Nathan) Open issue on rfcs repo for "core extensibility primitive" assigned to Chris.
- (Nathan) Provide feedback on [#4](https://github.com/ember-cli/rfcs/pull/4#issuecomment-189021955) and [#35](https://github.com/ember-cli/rfcs/pull/35#issuecomment-189014121).
- (Nathan) Invite ember-cli-deploy people for next week's conversation.
- (Jake) PR solution for [Issue #5481](https://github.com/ember-cli/ember-cli/issues/5481)
- (Chris) RFC draft for extensibility primitive.

## Discussion Notes

### RFC #4 - Processes

- Our current story for process management is nonexistent
- Our process for additional server tools is leveraging side effects of the original implementation.
  - The API wasn't necessarily designed, and was instead just present.
- We want to design a lifecycle for tying child processes to ember-cli and provide bidirectional communication between these processes.
- Concerns:
  - sigterm cleanup
  - Play nicely with Windows
- This will allow us to clean up the overloaded middleware story:
  - Express server: http mock, http proxy, livereload, ember-cli-csp
  - It would allow us to possibly pull the server out of ember-cli and into an addon.

### RFC #35 - Platforms

- Desire is to add a new flag and tweak the semantics of some of the core ember-cli commands.
- The approach is clear, but falls down a slippery slope. How do we decide which features make it into ember-cli
- Further, the more complex commands need rather serious surgery in order to do the right thing: serve & test are watch commands and communicate to external processes.
- Ideally the feature spec'd within would be an addon, we should rewrite this to figure out the core features required in order to implement it as an addon.

### Core Extensibility Primitive

- We should be thinking about how to extend the core ember-cli primitive of a command via an addon, possibly each one of those has its own lifecycle.
- Not only that, but these addons need to customize things like Testem, and more, so it makes sense to have a process manager that can be hooked into.
- Apparently there is a pipeline primitive in ember-cli-deploy which we might want to explore.
- The basic primitive should have the ability to be isolated to allow for multiple simultaneous invocations.
- Possible use case of "in-repo platform" as something possibly easier to do with a broccoli-funnel instead of overriding the resolver uniquely per platform.
- Command line options would need to be propogated into each addon as we won't know what is and isn't legal at top level anymore.
- (V2) Should support multiple simultaneous outputs from a single input, even watched states like servers and testing. A primitive version can be done by forking a broccoli tree.