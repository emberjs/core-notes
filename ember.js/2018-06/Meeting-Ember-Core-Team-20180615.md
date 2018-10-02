# Meeting: Ember Core Team 2018/06/15

## Agenda
- RFC Review
  - Move to FCP
    -  [{{in-element}}](https://github.com/emberjs/rfcs/pull/287)
  - General Review
    -  `[Ember.Object](https://github.com/emberjs/rfcs/pull/337)` [Constructor Behavior Tweak](https://github.com/emberjs/rfcs/pull/337)
  - Custom Components RFC Updates

## Attendees
[ ] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler

## Minutes

### RFCS

RJ: We just sent out a tweet for a number of RFC FCPs, so hopefully they’ll get some attention and we can merge them next week.

#### {{in-element}} RFC - Move to FCP?

RJ: I think we have now answered the specific questions that Yehuda and Godfrey brought up.

TD: Is the TLDR that now: 1. We default to “clear the target element” semantics 2. You can disable this clearing behavior by passing `insertBefore=null` and 3. we will support targeting a sibling element via `insertBefore` in a future RFC?

RJ: Yes, Tom, that is an extremely good description of the summary of the proposal.

TD: Thank you Robert, I enjoy working with you.

DG: Jolly good.

RJ: Is anyone opposed to moving this to FCP?

**Resolution:** [No opposition]

#### RFC 337: Ember.Object Constructor Behavior**

RJ: This was just opened and is not being proposed for FCP.

RJ: The proposal is that the constructor will continue to receive a POJO of props. This change only affects folks who are using ES Classes today. The specific issue this works around is that class fields can now be used as a defaulting mechanism. In today’s Ember, the class field would always be clobbered. This also ensures that shaping happens at the class level instead of the instance level.

KS: Basically, if our DI system treated properties as property injections, this would be consistent. We can get to a world in which we have ES Class constructors.

MB: Wouldn’t this lock in `init` in the new world?

RJ: We have never discussed removing `init`.

GC: I would like to explore a solution.

KS: We need something that addresses the performance problems with the old world and allows a bridge to the new world.

GC: I’m fine with using this for `Ember.Object`.

RJ: There is some perspective that whatever behavior we assign to `Ember.Object` is something we’ve locked into. There is another perspective that we move beyond a base class and design the new world.

TD: Is this not a breaking change?

RJ: It depends. We never announced anything official related to native class support. And this will cause some breaking change for native class users. The pitfalls today around class fields today are a big footgun - so this will be welcome.

RJ: I would like to start moving very quickly and get past these pitfalls.

KS: There is also a big performance boost for native classes re: `super`.

MB: I guess the big question mark is how many users might be using `new` to instantiate Ember objects. And whether this deprecation will bite those people.

RJ: Well, we could remove the deprecation part. The way we plan to do this is to have a silent last argument used to pass a symbol. And then if you don’t have the symbol, you’ll get a deprecation warning. But we feel that custom constructors are not used often because they’re pretty broken, so we don’t think this is much of an issue.

KS: `init` is certainly the happy path currently for ES class constructors.

TD: We have two loopholes: 1) Intimate API, and 2) It was broken anyway.

RJ: There’s another RFC that’s a broader scoped roadmap, [https://github.com/emberjs/rfcs/pull/338](https://github.com/emberjs/rfcs/pull/338), that we should review soon to discuss.

#### Custom Components RFC Updates

RJ: Godfrey and I paired on this this week. There were just a handful of suggestions and tweaks, but I think it’s effectively ready to go. I think we can enable it this week in this canary cycle. Once it lands, we’ll be able to use Glimmer Components in release versions.

KS: This does not use `@tracked` so this is not a complete bridge between Glimmer and Ember.

GC: How much work would it be to get `Ember.set` working in Glimmer?

KS: It actually is pretty simple. It’s about marking object dirty.

GC: This does not seem to be worse than what we tell add-on authors to do now.

[Discussion about compatibility issues]
