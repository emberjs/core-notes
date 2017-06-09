# Meeting: Ember Core Team 2017-06-02

### Agenda


- Move emberjs/website and emberjs/guides to ember-learn org (RM)
- Enable `ember-engines-mount-params` feature flag. Was RFC’ed and
  merged in
[emberjs/rfcs#225](https://github.com/emberjs/rfcs/blob/master/text/0225-ember-engines-mount-params.md). (RJ)
- [BREAKING BUGFIX] Fix positional params behavior.
  [emberjs/ember.js#15287](https://github.com/emberjs/ember.js/pull/15287) (RJ)
- node inspect compat \w FactoryManager Proxy (SP) →
  https://github.com/emberjs/ember.js/pull/15321
  - should we drop the `get` and if so for which versions?
- can we get a status update on svelte and module unification? (YK)
  - “addons” directory and `::` components question (YK)
- ember-console - [show](https://github.com/stefanpenner/ember-console)
  and tell (sp)
- ember + node compat update (sp)

### Attendees

AM CH DG GC IT KG KS RJ SP YK MB

### Minutes

#### Enable ember-engines-mount-params feature flag

RJ: This allows passing param to {{mount}}. It was RFC’d, I want to know what need to happen to “go” it.

YK: Why might someone object?

RJ: I’m in favor, (discussion)

KS: We enabled the plumbing for engines buy we didn’t fully RFC it at a high level. I’m on with this, but I feel mountable engines… I feel like engines should be mountable and could store state on the URL or in localStorage. It is a similar namespace issue to query params where we had to add the helper.

SP: Wait, this is just passing arguments to mounted engines, which already exist.

RJ: I think what KS is mentioning that all arguments are passed in the top namespace. So it limits what we can add for API later.

YK: Right, if you look at “drawbacks” in the RFC it uses a (hash helper, but in other sections it doesn’t use the helper. There is an inconsistency between these two things:


- https://github.com/status200/rfcs/blob/ember-engines-mount-params/text/0000-ember-engines-mount-params.md#drawbacks
- https://github.com/status200/rfcs/blob/ember-engines-mount-params/text/0000-ember-engines-mount-params.md#motivation

RJ: The implementation is such that we only pass hash args, no positional. The drawbacks section is showing passing an ordered arguments. That isn’t in the implementation. I think the drawback is just a bad example.

YK: I think KS is saying namespacing would be a good idea.

KS: And I don’t find the RFC consistent.

YK: I want to hear a good reason to pass args without a namespace

SP: so `{{mount 'foo' params=(hash foo='bar')}}`. where these are just passed through as params to the model hook.

RJ: No they appear as the model argument on your controller.

SP: So if you have a route what happens? If there is a route I would expect it to go via the model params path, and we can make a default that yields params as the model.

RJ: But the `{{model` has never used a route.

KS: And that is actually a problem I think. But there is some near-future need for this.

RJ: No i just want to move this forward.

YK: Let me try to summarize: We have a thing that is basically the target of a route. Routes pass a model to a controller/template. AFAICT `{{mount` lets you skip having a route object, so you want to present to the template as if you were the route object.

SP: I think `{{mount` could be implemented as a route for the purposes of lifecycle etc.

YK: But today we only have routes set a model, and so this only sets a model.

SP: My goal is to rationalize why we use “model” over “params” here, and the implicit route seems like an argument that addresses my and KS issues.

RJ: I want to pass stuff from lexical scope to engines.

YK: So the resolution is pass `{{mount 'foo' model=(hash foo='bar')}}`

#### [BREAKING BUGFIX] Fix positional params behavior.

RJ: Someone please review this! The test tell the story. I did a lot of searching for usages of positional params to see how many use closures. And none of them were using contextual components at two levels (which is when this arises). Also did some checking internally at work. I could find no second level curried positional params.

YK: That seems understandable.

SP: To unblock you you’re requesting review?

RJ: I am not going to merge this. Many people have violently agreed with the fix, I just want them to approve it. Would be good to get in for the 2.15 branch point.

SP: To close this lets have two people look at this.

YK: I think this isn’t happening in the real world is that the semantics are wrong.

RJ: Also just seems hard to reason about with either semantics.

GC: One other way it could change behavior is when you have a positional argument overriding a named argument at a higher level.

RJ: Yes, that would be very hard to find.

YK: People will report the bugs.

#### node inspect compat \w FactoryManager Proxy

SP: I’ve been working to improve this console

(discussion, node seems to reserve `inspect` on every object)

#### Moving repositories to ember-learn

DG: RM wanted to raise this. Any objections?

RJ: I’m only opposed as change for changes sake. There is a reason this needs to happen, but I just don’t know what it is.

YK: It is easy to speculate that people on the learn team don't have access.

RJ: Maybe, but we could fix that. I just want some pros and cons.

YK: Generally it would be managing the project. Does he have access?

RJ: Yeah he is an owner. Maybe there is some other issue though, the sync isn’t granular enough or something. There is cost for moving things.

YK: Let’s find out why he thinks that the current setup is causing problems to make sure it’s non papering over something else.

SP: I’ll sync with locks as well

#### can we get a status update on svelte and module unification

YK: Status update?

RJ: Things are moving on svelte. plumbing exists for svelte, but consumers cannot tak eadvantage since they don’t build ember. challenge is to get that landed without hurting all builds.

MB: Module unification immediate next things:

- several fixes for the module unification feature flag
- resolve modules without a default export

(discussion, MB can’t take notes and talk sorry. Read: https://madhatted.com/2017/5/30/ember-js-module-unification-update-and-contribution-tips)

#### ember + node compat update

SP: we work with node 8 and npm 5 with some warnings, I’m working on them this week

YK: Are the warnings with ember re: node versions accurate or do they lag?

RJ: They come directly from the testing infrastructure.

(lolz YK hasn’t updated his ember-cli version ;-))

RJ: Yeah there is some lag

YK: I tend to ignore the warning and I’m not sure if I’m doing something bad.

SP: We normally try to track a stable release with every node release. Ember-cli is in node’s test suite and passed on node 8, but npm5 wasn’t included and so they didn’t catch some recent incompats.

(some discussion about how to improve the warning, perhaps link to the node releases list.)

YK: I just want to know if I should upgrade ember-cli or downgrade node. I don’t know which I should do.

SP: Yeah and that is hard to know. We will add a link, to the docs/support.doc which will provide additional details.
