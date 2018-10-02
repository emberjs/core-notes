# Meeting: Ember Core Team 2018/08/24

## Agenda
- Modifiers RFC please review https://github.com/emberjs/rfcs/pull/353
  - The implementation is basically done
    - https://github.com/emberjs/ember.js/pull/16906
    - https://github.com/glimmerjs/glimmer-vm/pull/843
- 3.4 release on Monday
- Internal modules PR https://github.com/emberjs/ember.js/pull/16905
- `this.attrs` guidance

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[ ] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### Internal modules PR

YK: I think it should be difficult for your to use these packages, for them to be linked to Ember’s stuff. The build pipeline should stop you from turning `-internals` into reliable things that Ember uses.

YK: Let’s say the reference system is an internal. One way to do it is that it is published and you can get the module, and if you add the reference system to your app you get it, but you don’t get Ember’s version.

EF: YK it restating the general NPM problem.

YK: The thing I am worried about is: I think you are kidding yourself if you think this won’t create a huge amount of new intimate API. How do intimate APIs happen? A user pokes arounds and finds a thing that works. The fact that it is labelled internals doesn’t really change this.

KS: We have this already via the Ember loader object. It isn’t new.

YK: I’m saying you make a lot more surface, ah you are saying you can already do this.

EF: I get that this lowers the friction for intimate API usage, but I think we should use the standard ember js thing.

YK: I think you could use mangling, so that the modules are always named per build. So you can’t find them between builds. The second is npm’s internal builds.

EF: I think that friction has a real cost, having spent a few weeks in build systems. The goal is to make things transparent and simpler, and adding friction is bad.

YK: I only want to do things that make nicely onto tools: Let’s put it this way, the case of making things work well with rollup is good. If there is no way to do what I want and have the rollup system work we should make rollup work.

YK: I think I am saying this: We use WeakMaps because we have decided that is is bad to expose everything. What about the mangling strategy?

TD: I think one thing is that we have addons that patch Ember for backwards compat, but mangling would break that.

EF: I worry about where you do this work?

TD: I’m thinking per release. The mangled files would work, but debugging would look weird with lots of badly named files.

YK: And I’m only saying Ember and addons should use the mangled names. Not apps.

YK: I’m not sure if the push to future-proof here is the right push, on my behalf.

KS: There is an issue rolling up modules with side effects, so we don’t want to roll up earlier.

YK: That isn’t want I’m saying: TD your reaction of Ember being considered weird here is valid. I think we should take an hour and think about the impact. Maybe if we think about it we can find a strategy that is good, if we decide there is only something with weeks or months of work, maybe we don’t do it.

YK: Am I the only one uneasy about this?

EF: It is just how the modules work.

DG: IMO it must be clear that these are unstable APIs. If “internals” makes this clear enough I don’t know. That is my only uneasiness though.

YK: EF/TD you seem to think we must do this for NPM support but that doesn’t seem true, that those modules need to be published to NPM.

EF: Yeah package boundaries are not really relevant.

YK: IMO having a package called “internals” has a much harder messaging problem than ember-router importing from ember-router.

DG: Having a single module for internals seems like it might not leave room for creation of other packages. It seems like we could use a naming sigil like `-` before anything internal to allow room for growth.

YK: That makes sense to me. I think my first confusion was: Why is leaving this functionality in a package and importing from there isn’t a problem? It seems like the issue is that today if ember-router needs something from ember-metal you need to import from ember-metal, you don’t need to reference the deep files.

YK: If we just publish ember-metal to npm then ember-router could just import them.

EF: I think that is fine, but it is just harder to keep track of what is private across many modules.

YK: Why create a new package?

TD: so I initially didn’t. We have the JS module API that defines the public API. The internals of Ember have been moving to the public API, but there are also modules added into that API. The packages first of all have a namespacing issue (do we own ember-metal?) so I decided they should go into a single package. Plus the naming of `-internals` is helpful for the messaging.

YK: I was thinking ember-metal would have a private and you could reference there, but it would be the status quo story about ember loader.

TD: You could say we move all these internals to `@ember/object/-private` for example.

YK: Right so you lose granularity but you that hurts tree shaking?

KS: The issue is side effects and circular dependencies. Re-exports are fine, if that is all that is in that file. But we don’t want to roll up side effect with side effect packages b/c those don’t tree shake well. When you import named things from a module, and those named things get tree shook to 0, it doesn’t know it can remove the module if there are side effects. b/c if doesn’t know if importing the module is a problem. you don’t want to before the package step concatenate anything.

YK: So there is perhaps metal clarity to the version with private under the public API. I think the ember-date private story is fine. And I think at the limit we could *only* do that…

(discussion)

EF: I want to clearly maintain the invariant that the modules we talk about are the modules on disk.

### `this.attrs` Guidance

MB: One of my teammates is using angle bracket components and are using `this.attrs` to access arguments. Has `this.attrs` been rehabilitated? How should people get passed arguments?

YK: Plan of record is what we do in Glimmer.js, which is to set `this.args` as the way to access passed arguments. Main question has to do with mutable cells, which requires some design to see how it fits.

YK: The incremental plan is that if you’re using an ES5 superclass… we didn’t change this.get or properties or anything.

TD: Do we tell people to use `this.get(``'``argName``'``)` or `this.get(``'``attrs.argName``'``)`?

YK: First of all, there is no more `this.get()` in the programming model. Second, `this.attrs` has mutable cell semantics we want to get away from. So the correct answer today is to use `this.argName`.
