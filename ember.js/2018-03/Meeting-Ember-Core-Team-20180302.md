# Meeting: Ember Core Team 2018/03/02

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/02/23


- (public) Delaying dropping `this.get()` in Ember 3.1 (TD)
  - https://gist.github.com/tomdale/37af947b3dfc52093cd0e9475ef9b550
- (public) `onClick` regression https://github.com/emberjs/ember.js/issues/16311
- (public) highlights from [RFC 309: Module Unification Namespaces](https://github.com/emberjs/rfcs/pull/309)
  - [Implicit namespaces in templates](https://github.com/mixonic/rfcs/blob/mu-namespaces/text/0000-module-unification-namespaces.md#implicit-namespaces-in-templates)
  - [Implicit namespaces in services](https://github.com/mixonic/rfcs/blob/mu-namespaces/text/0000-module-unification-namespaces.md#implicit-namespaces-in-services)
    - Can we close over the addon scope and have a special service inject for the addon?
    - Can we make a mini-rfc for throwing a build-time error
  - [Invoking from an NPM scope](https://github.com/mixonic/rfcs/blob/mu-namespaces/text/0000-module-unification-namespaces.md#explicit-namespaces-based-on-npm-scopes)
    - wycats doesn’t like the `@`, wants to just permit w/o `@`
    - Can we rely on `import` down the line
    - Can we rely on the component helper down the line
    - has a cost, people won’t want to use scoped packages
  - ember- and ember-cli- stripping
    - We have new consensus to not do this
  - [Namespace and source APIs on owner](https://github.com/mixonic/rfcs/blob/mu-namespaces/text/0000-module-unification-namespaces.md#namespace-and-source-apis-on-owner), and the limits of those APIs (no way to address factory specific injections, options)
  - [Resolver API](https://github.com/mixonic/rfcs/blob/mu-namespaces/text/0000-module-unification-namespaces.md#adding-support-to-the-ember-resolver), implement via expandLocalLookup
- (public) RFCs
  - Close?
    - https://github.com/emberjs/rfcs/pull/237 “Remove Ember.Map, Ember.MapWithDefault and Ember.OrderedSet”
    - https://github.com/emberjs/rfcs/pull/202 “Allow the `with` helper accept named arguments”
  - https://github.com/emberjs/rfcs/pull/308 What do we do about `this`; pun intended?


Next week: +Meeting: Ember Core Team 2018/03/09

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[ ] Dan Gebhardt
[x] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler

## Minutes

