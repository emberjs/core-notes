# ember-cli Meeting Notes - 2016-08-25

## Attendees

- Nathan Hammond
- Jake Bixby
- Kelly Selden
- Tobias Bieniek
- Katie Gengler
- David Hamilton
- Stefan Penner

## Actions

- [ ] Nathan - Blog post regarding Node LTS.
- [ ] Stef - Finish migration to npm 3.

## Discussion Notes

### Broccoli Pit of Success

- Revisited conversation. Progressing.

### ember-cli-broccoli

- Fork of `broccoli` with only the stuff that we need (+ Heimdall)
- Split into multiple pieces (`broccoli-builder`, `broccoli-brocfile-loader` and `broccoli-middleware`) which we're hoping to upstream.
- See [#6208](https://github.com/ember-cli/ember-cli/pull/6208)

### Document our plans for dropping Node

- Write blog post.
- http://kangax.github.io/compat-table/es6/#node012