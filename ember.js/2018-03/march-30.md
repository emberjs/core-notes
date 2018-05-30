# Meeting: Ember Core Team 2018/03/30

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/03/23


- emberjs.com/blog [RM]
- Module Unification ST meeting again on Mondays at 12pm NYC time
- RFCs
  - https://github.com/emberjs/rfcs/pull/318 - `array` helper - FCP to merge
  - https://github.com/emberjs/rfcs/pull/322 - Deprecate `Ember.copy` and `Ember.Copyable` - FCP to merge
  - https://github.com/emberjs/rfcs/pull/321 - `{{#each-in` and `{{#each` key function - Needs more design, maybe FCP to merge next week
  - https://github.com/emberjs/rfcs/pull/79 - Improve CP ergonomics - FCP to close
  - https://github.com/emberjs/rfcs/pull/319 - `html-safe` helper - Needs more design
  - https://github.com/emberjs/rfcs/pull/323 - Array functions - Needs more design
  - <AngleBracket />?
- CoreObject / ES<latest> Build Work

Next week: +Meeting: Ember Core Team 2018/04/06

## Attendees
[x] Yehuda Katz
[ ] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[ ] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[ ] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[ ] Katie Gengler
[x] Mel Sumner
## Minutes

**MU-ST**

KS: Tobias had some concerns about losing HTML tooling with named blocks.

YK: We are kind of stuck on the scoped package as namespace issue, we need to start brainstorming.

MB: My job for the weekend seems to be to write this up and come up with some ideas.

**array helper**

YK: It would be nice if we didn’t need to reify the array. That the implementation could avoid round-tripping to JS would be good.

RJ: This is an internal helper, so I think we could do that.

Good to FCP!

**copyable deprecate**

RJ: I love that this author jumped in a did a bunch of detailed work.

Good to FCP!

**each-in**

GC: let’s give this a little more time. Looks good, but I’d like more feedback.

Hold on FCP!

**improve CP ergonomics**

(discussion)

YK: I think we should FCP to close, and say that we expect to change the semantics here when we transition to ES6 classes (decorator for CPs, tracked etc).

FCP to close!

**html-safe**

(discussion, a lots of pushback about the string `html-safe` being confusing)

YK: I think we probably want to think about what to do about `{{{` and to think about trusting as the primitive,

EF: I think we should also consider that we may not want “html” here.

KS: I think you consider it as “tainted” by the user, and escaping for the context.

YK: We should provide helpers for the escaping, and not “trust this for css”.

KS: You might have a color etc.

YK: The tainted is “it came from my keyboard”. You want to semantics that things are presumed dangerous unless you mark them safe and let the user opt-in. Tainted in Rails was a big disaster.

EF: I’m hearing that we don’t need to dive into the can of worms on safe for a given case, but improve the name of the thing we have here.

YK: I think it is very dangerous that people use HTML escaping for any case. It isn’t correct.

KS: different attribute values have different escaping rules.

EF: Right, you need to only bless for a specific context.

YK: and glimmer can help here, it knows where a values is used and could check for a brand.

RJ: so should we kill escapeExpression?

YK: I think we could and we could tell people use to some NPM package that should do this. Lets try to pluginize it.

YK and MM will work on this.

**array functions**

RJ: Basically some utils so we can move away for prototype extensions.

KS: I thought making these standalone was always the goal.

RJ: Like an addon or functional…

KS: I’m not sure about if we want to do this, but we do need to get rid of the prototype extensions.

GC: I don’t know much about how this works, but I thought you need Ember.A so thing can duck type as arrays that we know how to work with. So you could satisfy some API and it would work with all the array APIs in Ember?

KS: No, Ember.A was a way to if we don’t have prototype extensions to add observability. But it also added these other functions. At the core we just need a mutator that at the core is replace that calls the observation stuff.

YK: I strongly don’t want the observability to the part of the future system.

KS: I wouldn’t want it to be more that a hint. Take care of it early on and the rest would be immutable pieces. But I don’t know if that needs to be in the Ember model. The problem is that talking about the future tends to keep us from fixing the prototype issue.

GC: It sounds like it may not be intended that you can satisfy a protocol for “ember array”

KS: It is just very slow.

(discussion)

EF: We could choose to put these functions in an addon if we think they are not in core in the long run.

KS: I’m not sure about that, but we want to make core more tree-shakable anyway. So I’m more concerned with.. we need to expect the dirtiness and not do the Ember.A, but that will cause breakable where people were giving it an array but it gave back an Ember.A with a bunch of new methods on it.

KS: I’m thinking we need to create a deprecated proxy thing on Ember.A return.

(discussion)

YK: I think there is a better array programming model, and using `notifyObject` to just dirty arrays would be better. I worry a little that adding all these methods will exasperate the continuing use of the old array APIs.

RJ: I think the ED team feels the same

(discussion)

YK: I think GC thinks an alternative would be Ember.A returns the Ember array interface.

KS: But it doesn’t work that way b/c you want a basic for loop to work.

YK: in the same way that lodash has the functional and the object I think it might work.

(discussion, perhaps GC left some thoughts uncompleted)

KS: I think we need to have a mechanical transform as well.

RJ: I presume MM will update the RFC.

**<AngleBracket />**

YK: I’ve realized that the aspects of the angle design I find nice have not been articulated clearly. Obv they would need to be described in the docs, but we are not there yet. We have {{ and expressions, if a thing is callable we call it. Increasingly we allow you to call things not on the filesystem. There are some inconsistencies that are fine.

YK: I’ve also said that things on the filesystem should not be thought of as a different resolution, just as things in the scope for some reason. They don’t change what a variable means. < has a simple meaning, it is a thing you can put a callable inside of.

YK: Some things that seem reasonable ala {{#(foo)}} don’t work, just because of syntax. We’ve decided a lot of things don’t or do work because of syntax and it has gotten us into a hard spot.

YK: I think one thing React does well is to treat html in this context as a component as well. It is a component that has a default implementation and we don’t allow a variable name though. My mental model is the reason people feel overwhelmed (in Ember) is b/c the mental model has gotten more complicated. I was hoping we can use `<Angle />` to reformulate into something simpler.

RJ: I think rationalization is very much required. I agree you put three of us in a room you will have 3-5 mental models of how things work today, and that is from those who know.




































`





