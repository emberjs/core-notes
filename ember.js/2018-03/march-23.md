# Meeting: Ember Core Team 2018/03/23

## Agenda

- RFC Review [RJ]
  - in-element RFC: https://github.com/emberjs/rfcs/pull/287
  - `[Ember.Map](https://github.com/emberjs/rfcs/pull/237)` [/](https://github.com/emberjs/rfcs/pull/237) `[Ember.MapWithDefault](https://github.com/emberjs/rfcs/pull/237)` [/](https://github.com/emberjs/rfcs/pull/237) `[Ember.OrderedSet](https://github.com/emberjs/rfcs/pull/237)` [deprecation RFC](https://github.com/emberjs/rfcs/pull/237)
  - “go” / “no-go” decision for `let`: https://github.com/emberjs/ember.js/pull/16384
  - Mandatory `this` RFC https://github.com/emberjs/rfcs/pull/308
  - <Angle /> https://github.com/emberjs/rfcs/pull/311
  - Attributes vs. Props RFC https://github.com/emberjs/rfcs/pull/314
    - People do not like
  - (Component Manager RFC is merged https://github.com/emberjs/rfcs/pull/213)
[](https://github.com/emberjs/rfcs/pull/237)- discuss.emberjs.com administrivia [RJ]
- `#topic-talks` in community slack [RJ]
- Default template helpers in Ember.js [RM]
- discuss.emberjs.com usage… [RJ]
- emberjs.com/blog [RM]

## Attendees

- [ ] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [ ] Edward Faulkner
- [x] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner

## Minutes

### Ember.Map deprecation RFC

RJ: Steps here have mostly been done. Updated ember-data to not use ember.map or ordered set. ED no longer issues this deprecation. That work was landed into the current beta.

TD: So this went into FCP two weeks ago and nobody commented, so I think we are good.

RJ: Should I have even raised it before merging?

TD: Yes. Sounds good.

### Decision for go/no-go let

TD: Do we have docs?

RJ: Let me check the deprecation docs. It isn’t in guides.

CH: Does this depreacate with?

TD: But we could replace all the docs with `with` with `let`?

RM: We don’t document `with` at all. We don’t want it to become like partial where nobody wants to use it but it is still available.

RJ: also we could write a polyfill for this.

RM: I have a PR for the vm to add it to the VM, but it doesn’t have tests.

TD: does it need to be in the VM?

RJ: well `with` is implemented in the vm.

CH: We don’t in glimmer-vm have deprecations for syntax. So getting rid of `with` is a little more tricky.

TD: I think we are good to go this feature. How can we go this feature, but how can we not lose these action items?

RM: The idea is to introduce another rfc with if-let, then deprecate with an RFC

(discussion)

MB: do we need to add a new API `if-let` with the exact same semantics of `with`? That we don’t have it documented in the guides and such tells me this is not a very common use case. We can probably just open a deprecation RFC with the replacement being “use an `if` and `let` in this case”

CH, RJ: agree

### mandatory this.

RJ: Did we merge the component manager RFC? Ah we did!

CH: I’m not sure we can FCP this without having some of the codemods in place.

RJ: does the RFC propose deprecating the fallback behavior? We talked about updating the docs etc for the new this. and landing the deprecation after that.

GC: If we don’t introduce the deprecate I wonder if we would make people feel better by updating the docs and guides.

RM: I think if we do that people will feel strongarmed into accepting the RFC.

TD: It seems a little dubious.

GC: No there is a possibility that we never deprecate it, but we are allowed to do it as a best practice.

RJ: We can FCP/merge this and roll it out at our own pace.

(discussion)

TD: I think I get what GC is saying. If we can add this linting rule to the default blueprint or whatever we can get feedback.

MB: Yeah I think this was CH’s suggestion. We could publish the codemod before we land this and get feedback from people based on real-world usage and apps.

(discussion)

RM: We haven’t communicated the end-goal of these incremental template syntax changes. I think YK wrote a comment but if we had a blog post I think people would be more amenable to these changes. They won’t feel like changes for the sake of changing.

TD: Is there another feature that makes this step feel more coherent or important?

RM: YK thought @name would be the bigger syntax change, but this. is an important step.

TD: Are you saying we need to tie this together better in this thread or in general?

RM: In general.

CH: Yes we need something that paints the bigger picture. A section in the RFC that describes how this fits into the future, that we have accepted some incoherency in the short term to facilitate a good migration path.

TD: I feel like this RFC does a good job of communicating how it fits in to the greater context. Like what else are they missing now?

RM: People are holding on to the older glimmer components etc

TD: But that is just time. People need to change their mental model etc.

RM: I think the blogs etc help.

TD: In the interest of moving forward, can we say we want a codemod people can run and to wait until we have the linter or codemod or ideally both before FCP?

RJ: Yes and I am happy to help. What is slightly unfortunate is that there are groups hesitant to move forward because it is not merged, and others hesitant to merge it. I will comment we have discussed concerns in length and say we will work on the linting and codemod.

### <Angle />

RJ: As far as I am aware (read this last night) all of the comments, negative stuff has been addressed. GC in my last comment I mentioned that we should have an explicit policy for / in names.

MM: CH is the attr/prop thing something you will opt into?

RJ: Wait we are talking about the angle rfc. Are you saying they are entangled?

MM: What is the transition strategy for attr/prop presuming CH’s RFC gets merged?

CH: I think we will do our best effort codemod to migrate templates.

MM: But we have never changed this in a minor version.

RJ: We definitely have.

TD: I think in this specific case I have a hard time imagining apps not breaking due to this change. I was presuming we would make this an optional feature. You enable it and run the codemod.

(discussion)

RJ: I could polyfill the prop element modifier back to 2.8 or 2.10

TD: How good is the polyfill?

CH: There are lists for all html and aria attributes. I expected we would whitelist these and not touch them. There are also a known list of things that are dom APIs that set when the user interacts. For these we would set a prop. For some we could log a message.

MM: I’m also a little concerned about churning. If you swap to the new syntax immediately…

TD: So we were talking about the angle component RFC, how does this tie back MM?

MM: One want way you might tie these together is have the component manager offer a toggle for this.

TD: like basically say the opt-in is by component and not by the flag. I see, the change in approach is that we just swapped to invocation as a syntax instead of as a swap for behaviors.

(discussion)

GC: Is the issue that the codemod uses the element, but for components you don’t know what the element is?

TD: You can’t pass attributes directly to the element.

(discussion)

TD: My understanding is that the only ambiguous case in the codemod is a dynamic value ot a prop.

(discussion)

CH: The …@attributes expandos both the attributes and element modifiers onto the target.

(discussion)

GC: I want to suggest we RFC the angle RFC. And that we should flesh out the migration section on the attr/prop RFC.

TD: I think the question is: In order to smooth the path should we say that when you pass to the `<Angle` syntax is attr/prop mapping is explicit and would not be modified by the attr/prop RFC. That they only take the new semantics.

GC: I’m not sure I know enough yet. The problem is that if we sneak any changes of behavior into the invocation syntax we will end up with people saying “just swap to the new syntax to fix that issue”.

TD: In this case there is no way to pass attributes through for components.

GC: Yeeeaaah.

TD: One thing that would help would be if we had the prop helper.

GC: I think a global switch and the prop helper is very simple.

TD: I think we have consensus to FCP the angle bracket RFC.

GC: Ok. I think I need help from MM to figure out of `/` can be left out of the valid element names.

KS: Yeah we talked about this at the F2F.

GC: Yes we resolved not to add the `/` syntax and this is what RJ’s comment is.

KS: We talked about a way to use some literal string for scopes. We should acknowledge on the RFC that many people have this challenge.

GC: Regardless what I need help on is what is valid in the grammer.

KS: It needs to start with a letter in the tokenizer, and we can disambiguate based on capitals. After that the grammer is pretty open.

GC: I will raise this in chat.

MM: Is there a namespace solution in the angle brackets RFC?

RJ: No.

(discussion, DG, GC)



































































