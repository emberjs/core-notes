# Meeting: Ember Core Team 2017/09/29

## Agenda

- Advance 3.0 Browser Support Change RFC ([emberjs/rfcs#252](https://github.com/emberjs/rfcs/pull/252)) to final comment period.
- 2.16 release status check
  - 🙏 https://github.com/emberjs/website/pull/2984 🙏
  - https://github.com/ember-cli/ember-rfc176-data
  - Ember Data 2.16 next week
- Discuss argument / named block syntax
- ¡¡¡PR Review!!!
  -  `Enumerable#any` [returns non-booleans](https://github.com/emberjs/ember.js/pull/13363#issuecomment-331964866)
  - https://github.com/emberjs/ember.js/pull/13406#issuecomment-214030931
  - ~~https://github.com/emberjs/ember.js/issues/15681~~

## Attendees

YK, RJ, RM, GC, MB, DG, EF, MM

## Minutes

### Advance 3.0 Browser Support Change RFC

RJ: First I want to suggest we advance the browser support RFC. There are many comments (20ish) and I think every single one is positive. The only negatives were “why not also drop IE11”.

RM: Yeah and the community itself seems to support keeping IE11.

RJ: Yeah IE11 will eventually be a problem. It is supported for a very long amount of time.

YK: There was a conversation re: Vue about IE11 and I think the position that you must support it if the vendor supports it is overly conservative.

RJ: Specifically I want to put this to FCP. We have no new information and we want to move on it.

YK: Specifically we learned we were correct.

GC: Wasn’t there a comment about “can we do an IE10 build”. That seems better than bring-your-own support.

RJ: We would need to support it. We would need to keep around the property/attr DOM stuff etc.

(discussion about how to strip IE11 support out in the future, ala targets)

### Ember String RFC

RM: I landed this this week, there were no additional comments.

MB: Deprecated until 3.5, yes? Yes.

### 2.16 release

RJ: we want to remove ember-cli-shims in 2.17

(discussion about if we can remove it in 2.16)

RJ: We can traverse the addons and if any use babel 5 and the app does not have ember-cli-shims, then we should warn to say you may need ember-cli-shims.

### 13406

RJ: We already took notes on this and talked about it. We need to leave a comment but we aren’t going to change it. Math.min and Math.max seem reasonable for computed.min computed.max. > < is not obviously better an is definitely a breaking change.

### Discuss argument / named block syntax

YK: How do we start?

RJ: I’m not sure if you already came to a conclusion. I think it is probably best… We reached consensus on many points. There are a relatively small number of disagreements around the details. To me the only thing that remains is the change to the block declaration syntax.

EF: I think a lots of people could be swayed either way. I think a lot of people could live with a word if it was the right word.

YK: there was a converation in chat that was discussing additional options.

RJ: Many people there were not in the initial conversation, they may have been ground re-covered.

YK: Many of the proposals felt like hail-mary passes.

RJ: I think a prefix with a good word is ok. need to decide CapCase or lowercase.

EF: I think MM has an good idea which is make it “stage 1” and move ahead

(discussion)

DG: I rationalized my : proposal at the bottom of EF’s document. I think the difference between having an accepting and passing syntax is fine. I wrote down my rationalization there.

YK: I think that most people confused my statement about the “pun” worries me. People really really want to believe that @x is basically the sigil. People think that @x is the name on both sides.

DG: One of my points is that we could encourage the use of args. inside the templates.

YK: I don’t agree with DG’s syntax at all but I am backing up some of the motivation.

DG: At some point this also becomes subjective.

YK: I think people think we can get away with avoiding @ inside curlies.

EF: Right I think it is good that we keep angle syntax and curly syntax.

(discussion re …attributes)

EF: I don’t see any path forward for trying to retcon curly semantics. We’re landing on the idea that x=y arguments in curlies are the way to pass arguments, we don’t introduce @x= into curlys.

DG: I’d like to say that the least radical part of my proposal is to stick with @ for passing and simply require the usage of args.foo for reference. There is then a clear distinction.

RJ: In glimmerjs today that would be using this.args.

MM: You would make it a keyword.

EF: the only gap would be if they things args work on the template b/c it is on this. Which is not true.

RJ: I also don’t know if we do anything to freeze args.

GC: I think it does need a special syntax. It is just a special keyword. trying to hid that fact will make it difficult.

YK: I think the longer these conversations to on I think the more willing people are to accept the original proposals.

RJ: Hard case makes bad law.

YK: I think so. And some of the cases were bad. There were things that we liked about the original syntax proposal. And I’m struck by how much the community liked the named blocks proposal. I’m uncomfortable with how often this conversation veers off into redesign.

GC: We talked about a breaking change of adding @ to curlies. After RJ left the F2F. We decided it could work but would not be workable. I think if we ship the thing and people want it though, we could still add it.

YK: IT had a good point at having two worlds. It becomes hard to communicate about things on stackoverflow etc.

GC: I’m just saying we could change it in the future if we need to.

YK: I think we can avoid curly syntax at all in the angles world and then we just avoid that entirely.

EF: there is a bit of a completeness argument. If we leave it open too long the community will run ahead.

(discussion re: arguments splat)

YK: GC suggest we reserver @Caps or something for the future.

EF: If we let people use any arguments then we cannot claim it later.

(discussion of ways to reserve names)

- Everything that starts with a vowel
- All arguments must have a dash “dash-rule”
- Reserve Caps
- @ng

(discussion of this trolling list)

YK: The main things you want to avoid is having people pass things from angle bracket world into the curly world. Since there is not way you can pass attributes. I don’t think you will need to, since named blocks provides for must use-cases that the component helper currently satisfies. It just isn’t that important if you have named blocks. It becomes a power-user tool and they can deal with the less than ideal API. GC pointed you need splat though, to make this happen.

RJ: Generically supporting splatting is very different from supporting it for the component helper.

YK: splat is indeed a tricky feature to do performantly but we can do it.

GC: You need splat to satisfy the currying case via named blocks.
