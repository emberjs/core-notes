# Meeting: Ember Core Team 2018/02/16

## Agenda

- “Splitting Ember” RFC FCP https://github.com/emberjs/rfcs/pull/284#issuecomment-362973156
- Remove property lookup fallback https://github.com/chadhietala/rfcs-1/pull/1
- status of Godfrey’s RFC series (YK)
- Weekly Q/A re: immutability https://gist.github.com/dgeb/bcb388df1fb37a90d80ff7f4e907c8d4
- Testing Leakage - https://github.com/emberjs/ember-qunit/pull/314
- Symbol Support `(get obj symbolHere)`
  - What about symbols on Ember.Object?
- status of Engines/FastBoot (RM)
  - https://discuss.emberjs.com/t/readers-questions-what-is-the-status-of-ember-engines/14236
  - roadmaps
- PWA quick wins (RM)
  - webmanifest
  - service worker for assets
- Glimmer VM update (YK)
  - Should be extremely quick, mostly punt to separate discussion
- Issue Triage +List of issues to tackle
- status of broccolijs (RM) **Punting this to the F2F**
  - website
  - documentation
  - normalization (plugin API, project structure)
  - 2.0
  - change tracking

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [ ] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler

## Minutes

### “Splitting Ember” RFC FCP

RJ: Ed is not here, so we should defer this. The conversation has warmed back up in FCP, so we should discuss.

YK: The questions is if the optional dependencies thing is good enough.

RJ: I’m not sure there is hard overlap. GC and I discussion the addon could do its own traversal to detect is another addon requires a feature or not.

YK: This rfc has a slightly better mechanism to require a version. I think this question needs more discussion so we should halt the FCP.

YK: That even knowledgable people on the FCP seem confused about the mechanism may mean that it is not a good one. Tobias was confused and laid out an example.

YK: I think there is a question about if using packages is the right mechanism. I think optional features gives us a good mechanism we already have. I agree we should punt the FCP.

RJ: Yeah even people who would be implementing think it is maybe wrong, so that is a problem.

### Remove property lookup fallback

RJ: This RFC as written matches my mental model. I think we should submit it.

YK: there are increasingly ambiguities about what the `@` syntax means. Biting the bullet and saying there is legacy crap, but we want it out of the mental model, seems like the right direction.

YK: In order to explain what the block syntax is doing, and why `{{@foo bar}}` `{{#let x as |y|}}{{y}}{{/let}}` we need to fix the ambiguities in the mental model.

RJ: I am in favor of the RFC, I’d like the RFC to insist on a codemod. Is there a size result impact to compiled templates?

YK: No it impacts the binary size but that doesn’t impact Ember today. It basically goes from `['unknown', 'foo']` to `['get', 0, 'foo']`.

CH: I wanted to keep the performance aspects out of the RFC.

YK: It has potential to open performance improvements but it would require a lot of work.

RJ: It would be nice to highlight how knowing where something in a template comes from today is difficult.

YK: I think it is verbose, but in a way JS developers are already used to.

RJ: I think this motivation is much stronger than any performance motivation.

YK: It should be a deprecation RFC

CH: It is one, the only difference is that one has a transition plan.

### status of Godfrey’s RFC series

YK: I think the status is that Tom is on it. Will you be able to submit the component manager RFC?

TD: I think I can do that. Yesterday I got a spike of this working. I am going to get further with the spike then I will update the RFC.

YK: And the step after that will be to RFC angle bracket invocation.

TD: I think there are open questions. I will make a list of them for discussion.

YK: Maybe we should update the status board.

### Weekly Q/A re: immutability

YK: Seems good, but at the top it perhaps wants to dispel the notion that Ember is unfriendly to immutable stuff.

DG: Bringing it up in DDAU makes sense.

YK: Right, the examples that Ember 2-way binding is not so common any longer, we allow you to return an array etc. Like, how does ember-redux work? It just does.

TD: I think it is actual communication and uses nice buzzwords, so I like it.

RM: I gave only a short notice to Dan to answer the question. But on the discord I asked a few more questions. I’d be happy to get a head start on the following weeks.

### Testing Leakage

RJ: Today there is a problem, async in a test leaks into another test. We did a bunch of work at LI to ensure nothing leaks between tests. This PR brings that functionality to Ember-qunit to be an out of the box feature. I think it is unambiguously a bug fix, however it will clearly cause suites that are passing today to fail. People have tests that only sometimes passed.

YK: So flakey tests would just always fail?

RJ: Right. Some things are not caught, but many are.

YK: I think the error should be clear. “This test used to be flakey now it fails”

MM: It must be actionable.

YK: Presumably it fails 1% of the time. I think we can communicate that is broken.

RJ: We can tell you now the exact test that is failing, but it cannot tell you what async is leaking. So it may be difficult to debug. The thing we did at LI was to monkey patch BB to capture stacks and report it in the error message. We did do the work to get it upstream, maybe in 3.1 it will land.

RJ: I think that is MM’s point. If we enable it now it will fail apps and people will just turn it off.

YK: So let’s make sure we have the better debug process before the make this setting the default.

RJ: Right, we can land the PR with it disabled, but we will wait for the better debugging to change the default to do this in tests.

YK: If you can detect the async source, couldn’t you just wait?

RJ: But you may actually have a thing you want clean up, for example it could be leaking in fastboot.

(discussion)

RJ: I think I can see how you might do an auto-settled, but have a warning. So when enabled, we can fail suites that leak. When disabled we can auto-settle and you still get a better test suite, it may slow down etc.

RJ: Ok, time up.

### Symbol Support

RJ: Before 3.0 `(get` didn’t work with a number, we fixed that. I realized it didn’t work with symbols. So I have a PR that adds support and a smattering of test and fixes some messages that did string coercion etc. I think we should land it, I wanted to raise it.

YK: I think we should add support for symbols on a class (on ember objects) if we do this. Our object model currently uses enumerability to copy properties, and we should be copying symbols although they are not enumerable.

RJ: I vaguely think we should add this independently.

YK: I think we should fix it, I will pair with you. It will be easy.

RJ: We should do some benchmarks.

(discussion)

### status of Engines/FastBoot

RM: Can we skip this for PWA?

### PWA quick wins

YK: I think this is an ember cli team question.

RJ: I think we can do lots of things by default. but this is vague.

YK: I think there should be an RFC.

MB: I think manifest is the easiest thing, really.

### Glimmer VM update

YK: I did a bunch of changes to Glimmer VM and we should update Ember very soon.

TD: Lets do it

### MU Update

MB: What is up?

- Matt wanted to have an RFC for today for namespaces, details
- Trying to land sources for services as a standalone https://github.com/emberjs/ember.js/pull/16240
- That effort highlights caching issues around sources