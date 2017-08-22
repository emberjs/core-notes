# ember-cli Meeting Notes - 2017-08-17

## Attendees

- @hjdivad dh David Hamilton
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @kratiahuja ka krati ahuja 
- @locks rm Ricardo Mendes
- @rwjblue rj Robert Jackson
- @twokul an Alex Navasardyan


## Agenda

- std/esm
- fastboot/engines meta
- @ember/string


## Discussion Notes

### std/esm

rj: should we use std/esm & encourage addons to use it out of the box?

ks: do we have to move to mjs files?

rj: no; there is a configuration option that you can put in `package.json`

an: we have conditional `require`s

rj: that's okay; it supports dynamic imports

ka: what about node compatibility and performance?

rj: it's worth reading the blog post; the tl;dr is it i s slightly more expensive but otherwise not much of a downside.  Supports node 4+, so the same targets that we have

dh: presumably we'll do this internally before making this a default for addons?

rj: confirm; and when we do roll it out for addons, that will consist just of changing `index.js` to `export default` instead of `module.exports` and then requiring this package


### summary fastboot/engines

rj: we're going to update the runtime API `fastboot.config()` adding an argument to ask for a config by name (eg the app's name).  Also add an additional hook the addon will invoke on each root addon, to allow it provide its config in fastboot format, to allow config that differs between node & browser.

rj: There's some additional work on the engines side and the tl;dr of the union of these changes will be that lazy engines will "just work".


### @ember/string

rm: there's an rfc to deprecate various extensions to strings (https://github.com/emberjs/rfcs/pull/236).  The package exists and the extra string things are extracted there.  There are changes to ember-cli-babel and ember-plugin-ember-modules-api-polyfill.  We're still missing a plugin or ember-addon to bring back the string prototype extensions eg for `'something'.capitalize()` for string literals, but of course that's part of what's getting deprecated.

rj: the path forward is to import eg `pluralize`, `singularize` from `ember-inflector`.  There's an open pr to deprecate use of `Ember.String.pluralize` within ember-inflector.  It also deprecates the `String.prototype.pluralize` methods.  We need to make sure the order of operations is good as far as releasing works so that
  - people doing the right thing don't see deprecation errors and
  - people doing deprecated things don't have breakage

rj: there will be a flag to check against deprecations; users who see it can install `@ember/string` to make the deprecation go away.  One of the reasons to focus on this being a good experience is that we'll be doing this for other parts of ember.

