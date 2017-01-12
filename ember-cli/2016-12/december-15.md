# ember-cli Meeting Notes - 2016-12-15

## Attendees

- Nathan Hammond
- Alex Navasardyan
- Tobias Bieniek
- Stefan Penner
- Robert Jackson
- Katie Gengler
- Jake Bixby
- David Hamilton
- Kelly Selden
- Miguel Madero
 
## Actions

- [X] Rob - [RFC for cache keys for addon builds.](https://usecanvas.com/rwjblue/ember-cli-addon-deduplication/2PXhx70CUNQX6UK5AKdTQi)
- [ ] Kelly - RFC for blueprint migrations
- [ ] Nathan - Promote #80 to FCP.
 
## Discussion Notes

### [RFC #80: `broccoli-middleware` and `serve-files` improvements](https://github.com/ember-cli/rfcs/pull/80)

- Move to FCP? Yes!
- Document the `X-broccoli` header, make it more clear.
  - Header only exists on the inbound request.
  - Effectively the "API" that we're adding.
  - Approximately a refactor because it's just splitting the concerns more reasonably.
- Name of `serve-files` changing. Could cause issues.
  - Is considered private API.
  - Order guaranteed between the new pair.
  - Could possibly alert in the DAG resolution.
    - During beta we'll see what shows up if people are relying on this.

### RFC Async Process Improvements

There was a long detailed discussion on this topic. We want to improve the process of dropping _out_ of the RFC process for things which no longer require an RFC, we need to improve the async process, we need to consolidate this pattern with upstream Ember Core. Right now the RFC process feels like a fish trap.