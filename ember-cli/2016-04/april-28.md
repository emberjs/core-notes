# ember-cli Meeting Notes - 2016-04-28

## Attendees

- Nathan Hammond
- Jake Bixby
- Tobias Bieniek
- Kelly Selden
- Katie Gengler

## Discussion Notes

### Node.js 6.0

- Eventually the LTS.
- Enabled support already, theoretically works.
- Cherry-picked a bugfix to the 2.6 beta.
- Not going to port support back to 2.5.1.
- May not have trouble with full LTS support by virtue of our influence within the community.

### `<base>` tag

- PR [#5792](https://github.com/ember-cli/ember-cli/pull/5792) was merged.
- [Blog post published.](http://emberjs.com/blog/2016/04/28/baseURL.html) Feedback so far has been mostly quiet.

### YUIDoc output

- Now available at [http://ember-cli.com/api/](http://ember-cli.com/api/)
- Custom ember-cli theme in development: [yuidoc-ember-cli-theme](https://github.com/Turbo87/yuidoc-ember-cli-theme).
- PR for using custom theme in ember-cli: [#5854](https://github.com/ember-cli/ember-cli/pull/5854)
- Going to stick with `@public` only.