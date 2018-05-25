# Meeting: Ember Core Team 2018/01/26

## Agenda

- Class services (YK)
- RFCs
  - FCP
    - [ember-data ModelData](https://github.com/emberjs/rfcs/pull/293)
  - Close
    - https://github.com/emberjs/rfcs/pull/246 (RM)
- Quick Module Unification update (MB)
  - We have components/services from addons working. Need to refactor to use a `namespace` argument to the resolve instead of `rawString`.
  - Future RFC for node-land mu config API, and a way for addons to choose what things in a `src/` MU addon to expose to classic apps via `app/` re-exports
  - Future RFC for namespaces passed to inject/lookup/factoryFor (without using `::` syntax)
- Ember Data proxies problem (YK)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler

## Minutes

### Ember ModelData FCP

IG: Me and Dan and the ED team met on this and have a path forward. We should not actually FCP, we’re still nailing down the API docs. If anyone has strong opinions this would be a great time. Please take a detailed look.

RJ: I think the comments have been good on there as well. I am excited to move it forward b/c it is a rough spot and fixing it we may learn some things.

### findIndexBy RFC, Close?

RJ: The most recent comment is from Kelly saying “we’re not adding things to this API since it is being removed”. I think that is a fine read to close it. And I think with MM’s recent work we are working hard to collapse some of those mixins down and we are on a good trajectory to close those APIs down. I agree it is annoying the APIs are inconsistent.

YK: It would have been great to fix in 2014.

MM: There are other options. We could move array proxy into an addon. Or make an addon to add to enumerable.

YK: I think we should not encourage adding to native array.

RM: I poked the author on Slack.  I asked if he had implemented it in an addon or anything and he said he had not.

YK: So close this?

RJ: Yes. And I am excited about MM’s progress around this stuff.

MM: We should try to use more native APIs and stop making up these APIs on our own. I think the proxies are mostly only used in Ember Data anyway.

### Glimmer VM Update

RJ: Oh we landed the glimmer vm upgrade in Ember yesterday. There are some minor performance regressions which KS found.

YK: Right I have a patch floating around for that, please try it before it turns to bitrot.

RJ: We’re looking at moving to Babel 7 beta as well. It has much better constructor and other transpilation output re: perf.

RJ: YK there were some fixes in that PR as well, specifically array proxy stuff.

(discussion)

### Proxy

(discussion, new implementations of proxies on ES classes don’t deal with ambiguous cases where a user was “probing” a proxy object without really wanted to read data from the internal proxy target)

(discussion about `get` becoming a proxy-only feature, with the implication you would often use it only for ember data records and not for anything else)

RJ: I think you can say “you don’t need to use get on a CP” and that would be enough.

YK: I think many people use .get and don’t understand the rules.

EF: Yeah this is a conventions thing, you don’t want some teams saying “we will just stick with get”

YK: IMO GC’s description that relationship objects are async and special is key. I think the explanation of “proxies need get” is not good enough. You need to say “ember-data relationships need get, and if you have an addon that uses proxies you need to explain it to your users”. Imagine you are a casual user and you go into your code to swap from .get to normal lookup. You don’t know what a “proxy” is. You just end up breaking your app and getting an unexpected error.

RJ: Across the board you will usually be able to use `this.foo`? Yes, almost always safe.

YK: `unknownProperty` is still an API.

DG: We could deprecate `Ember.get` and basically rely on `this.get` for proxies. `this.get` could warn if the object it is based on does    not support the `get` method.

(discussion)

DG: I will flesh it out. I think EF was picking up on what I was saying. I’m trying to get a linting steps.

(discussion)







