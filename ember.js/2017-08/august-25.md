# Meeting: Ember Core Team 2017/08/25

## Agenda

- 2.15 Releases (MB)
- Glimmer components in Ember (RM)
- https://github.com/emberjs/rfcs/pull/240 was FCP on August 11
- Bundle Compiler (YK)

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

### Minutes

#### 2.15 Releases

MB: We are blocking on RJ, which is perhaps silly.

RJ: I have been swamped. Didn’t intend to block. Perhaps Sunday? Anyone else could do it. I’m happy to walk more folks through Sunday or Monday. The hardest part is writing  the changelog for the first beta. It isn’t too hard.

RJ: We should make a RELEASE.md in the repo, formalize the documentation, and they anyone with push to the repo should be able to do the release.

MB: Maybe we can have a goal of having a different person do each 2.16-beta release.

#### Glimmer Components in ember

(discussion)

YK: the use case I think we’re targeting right now is that someone has already written a glimmer component and wants to use it in Ember.

RJ: I think we need the @ vs non-@ thing.

YK: I think there is a problem in the short term which is to ensure people are on the same version of the glimmer compiler as Ember.

RJ: I was under the impression we would be building glimmer components with the Ember template compiler.

YK: I want to make sure we don’t use the AST transforms for Ember templates on glimmer.

RJ: right, the pragma

YK: Even the wireformat could change. In glimmer itself it could change over time. there is a tricky thing, because transforms are performed before pragma.

RJ: My point is there is only one compiler.

YK: The AST transforms for ember templates will not be able to run on glimmer templates. I’m saying we have to use the appropriate AST plugins. In both component formats there are things that can change compilation. I think there is a solution easier than having each transform rely on pragma checking.

RJ: I think this is easy.

YK: Right. We need to say that the pragma is an actual thing. And to be clear I think the goal is to re-use shared components and those packages won’t have a pragma.

(hands waving)

RJ: I’m fine with version 0.0.1 to be “you must add this pragma”

YK: I agree, but we need glimmer apps to understand how to ignore the pragma

RJ: Yeah it is ignored today.

YK: Ah I was presuming it was not a thing.

RJ: Glimmer apps can use the same pragma Ember apps use today.

YK: I think that is great. We need to write the code that picks the right implementation to make the code work correctly. I also think it is ok for the package to be an ember addon?

RJ: Right now the glimmer component manager assumes the getOwner/setOwner implementation. We need to move it back on to the environment. Also meta is in the same boat.

YK: We should talk about this separately. We have changed this on the bundle compiler branch.

RM: I have two questions: How does MU change this?

YK: I don’t think it does. All of that is delegated to the environment at runtime. From glimmer’s perspective module unification does not exist. the only thing we added was that you can pass a referred. I don’t think MU impacts it. It would be fine if we say “if you have a glimmer addon you must support MU” if we want. If that makes it easier, but I don’t think you need it.

RJ: I would prefer that they only be MU, to create community pressure to move that forward. Also it is better to not create more backwards compat issues for ourselves.

RM: (something something CapitalComponents)

RJ: My understanding is that there would be no normalization. I still think it is a little bananas.

YK: If we decide to let glimmer components be invoked with curlies, we can do whatever we want in the macro. If you encounter a curly and don’t know what it means, there is a macro that replaces it with what you would have typed. this particular issues, the invocation syntax, is very easy. There is a macro right now that converts it to the wire format dasherized. To clarify: there is no part of the glimmer engine that cares about component naming except the syntax compiler. We currently look at the template for capital letters to know what is a component.

YK: If we don’t do curly components, then we need to discuss capital components. I think we have to support it anyway. If we want to support angle syntax we need to make a decision about what syntax. Even if we add it in nightly, it will be hard to roll back.

RJ: Right, the same with the pragma. This is why we chose something nobody would like. For me the largest problem is around the practical issues. MB and I spiked this out, had it working. The only way to make it work was to copy the whole component manager and change all the owner/meta stuff. And it just worked and was fine.

RJ: It doesn’t matter since glimmer-vm is ahead of apps, but we need to make sure writing a component it doesn’t matter what version of the VM I’m writing for.

YK: Right, just like if you upgrade v8 you don’t need to change your JavaScript code.

YK: The old compiler before I made that change, a capital component would have been just a normal element.

YK: I noticed a thing: When we see a tag we lowercase the characters, but we only lowercase the first character

(discussion)

RJ: I agree the point here is we need a plan. I think we need to fix what and where to do the concrete problems first. Things like owner/meta are very small things. 

YK: TD is working on bringing tracked in to glimmer VM proper.

YK: Chad and I need to merge work back into master. I think owner/meta needs to be thought about in that world.

(discussion)

YK: I’d like to get this all done for EmberConf next year.

RJ: I think people liked at EmberCamp where the keynote and other talks were a bit related. For example when the keynote is a reveal, the talks seem out of sync with the main message.

YK: Right, I stopped trying to make it a real surprise for a while. For example with glimmer apps there was already a public repo.

RJ: Yeah but I’m talking about the feel.

YK: I think we can just do it. We should target a few months before emberconf for a plausible glimmer component in Ember.

RJ: from when we did the work, making the AST do the right thing is pretty easy. I understand how to do that.

YK: I want to be able to get the pragma without parsing. i don’t want to do something stupid that makes the builds slow.

RJ: Right, I don’t think template compilation speed is the biggest problem.

#### bundle compiler

YK: CH TD and I have been working on a bundle compiler. It lets us do all the compilation to opcodes ahead of time. Many of the test suites that to matrix things work. In an unusual twist the whole feature works for Ember. Partials aren’t implemented but it isn’t hard. There is a more concerning issue which is that is requires a compile time resolver. It takes a referrer and a name and gives you back a module location. However there are two features you need that make it harder: The first is capabilities, asking a component what it can do. Second issue is named layout. This is basically imcompatible with late bound layouts. The tl’dr is that this is where the rubber meets the road on late bound layouts. The most ideal thing to do inthe near term is find a way to remove late-bound layouts. This is scary since many addons use this.

RJ: To be sure we are on the same page: You’re referring to the layout changing in the consturcture.

YK: Right, that you need an instance to get the layout.

KS: Internally Ember does it for things like input

RJ: You don’t need in the instance, we can just change how it works.

YK: Right, you could instantiate the component and ask it in node but that is error prone. You can maybe get away with static analysis to figure it out. But a better solution is to change the API to export… (discssion) it needs to be an RFC.

RJ: There is a thing we can do today. We can make component.layout not equal to the normal layout after instantiation.

YK: right we just need a node-friendly way to implement finding a layout for a component.

YK: TL;DR we can reasonably soon have Ember using the bundle compiler directly, which means we can avoid needing the runtime compilation step entirely (and the associated payload). We just need to make minor semantic changes to edges in Ember to support this and we should start thinking about it. We could make it opt-in, but we need addons to stop using the problematic features for apps to take advantage of this.

(YK editorial note: yet another opportunity for an Ember Observer “supports XXX” flag?)
