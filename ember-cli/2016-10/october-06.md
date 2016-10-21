# ember-cli Meeting Notes - 2016-10-06

## Attendees

- Nathan Hammond
- Kelly Selden
- Tobias Bieniek
- David Hamilton
- Chad Hietala

## Actions

- [ ] Stef - Push Macro RFC conversation to Ember Core
- [ ] Nathan/David - Test again `npm@master`.
- [ ] Nathan/All - [Review destroy folders PR.](https://github.com/ember-cli/ember-cli/pull/6241)

## Discussion Notes

### Node.js 0.10 Deprecation

- The date got moved out from underneath us.
- The new date, October 31, means that we officially support 0.10 for Ember CLI 2.9 assuming our 10/17 release schedule.
- [We're not going to change our messaging from the blog post.](http://emberjs.com/blog/2016/09/07/ember-node-lts-support.html#toc_node-js-0-10-node-js-0-12)

> The first version which will not support Node.js 0.10 will be Ember CLI 2.9.0 scheduled to be released on October 17.

- We imply heavily via that quote that 2.9 will not support 0.10, but there is a hidden conditional a few sentences before.
- Unlikely people will complain about supporting it longer.

### npm v4

- Fortunately just landed v3.
- We should make sure we're not obviously broken by it.

### Travis + Node.js 0.12 + npm

- Tons of errors, breaking.
- Notified the Travis CI team.
- They're working on an issue upstream.
- Work to eliminate `npm install`s from our test suite.
