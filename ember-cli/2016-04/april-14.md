# ember-cli Meeting Notes - 2016-04-14

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Jake Bixby
- Kelly Selden
- Katie Gengler
- Chad Hietala
- Stefan Penner
- Robert Jackson
 
## Actions

- [ ] All - Review [`<base>` tag PR](https://github.com/ember-cli/ember-cli/pull/5792)
- [ ] Nathan - `<base>` tag deprecation guide.
- [ ] Robert - 2.6-beta1 with core object
- [ ] Robert - Bump Ember, Ember Data, ember-cli-jshint on top of 2.4.3 release as 2.5.0
- [ ] Nathan - Update RFCs with comments from today's discussion
- [ ] Unassigned - Canary is a movable tag.
 
## Discussion Notes

### master => canary

- https://github.com/ember-cli/rfcs/pull/48
- Why not both?
- Canary is an auto-tag (or [mirror branch](https://gist.github.com/ozh/4154909)).
 
### Base Tag

- https://github.com/ember-cli/ember-cli/pull/5792
- Punts asset URL handling back to userspace since we don't rewrite.
- The "one simple trick" to add <base> back in.
 
### Node.js Support Policy

- https://github.com/ember-cli/rfcs/pull/47
- If we do drop we will bump major.