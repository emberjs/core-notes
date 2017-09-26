# Meeting: Ember Core Team 2017/09/08

## Agenda

- 2.15 regressions (YK)
  - [{{link-to}} inside a partial stopped working](https://github.com/emberjs/ember.js/issues/15621)
- Ember.String RFC - where should `isHTMLSafe`, `htmlSafe` go
- Blog posts for emberjs.com (RM)

## Attendees

YK, RJ, RM, GC, KG, KS, MB, DG, TD, MM

## Minutes

### 2.15 regressions

(discussion)

RJ: I think this issue is related to #each

YK: #each is the only place we create a child scope.

RJ: I will try to reproduce with KS.

YK: If you can write a test that would be extremely helpful

RJ: Any work I do will be on the old branch though, since that is what Ember.js is running. Not master.

YK: I suspect the issue is still on master as well. I think we want some messaging here to identify that this is the kind of thing that you can avoid on LTS. I consider these breaks larger than usual.

RJ: I don’t like the idea that features that are breaking are “legacy”

YK: They aren’t that. They are specialized features that are specialized for Ember, and so they are not as well tested. For example partials are eval and eval is a special expression.

RJ: I think the only real path for partial deprecation is to figure out a glimmer component solution. I think the performance argument for partial is bunk already, more concerned about the lack of element.

YK: You could do this already with a component super-class of tagName: ‘’. I still think there is a way to get to an automated fix.

RJ: In our app the usage of dynamic partials is very rare. Often you can do static analysis to figure out the partial name.

RJ: there are three issues related to glimmer updates:

- Partial one - https://github.com/emberjs/ember.js/issues/15621
- Number one - https://github.com/emberjs/ember.js/issues/15635
- Another I have confirmed: https://github.com/emberjs/ember.js/issues/15640 https://github.com/emberjs/ember.js/issues/15618 If you have a component and you pass an argument twice you get a mutable cell.

RJ: I think the latter is related to Ember component. We have a for loop and we’ve seen the same attribute twice. `{{my-component componentVar=myStringVar componentVar=myStringVar}}`

YK: Can we identify and deprecate passing two arguments with the same name?

RJ: I think we should error on it immediately.

YK: this is the equivalent of having multiple entries with the same key on an object. Which is permitted in JS strict mode (aside).

RJ: I think those two issues are related but the second author disagrees, so we just need to dig in. I plan to fix the actual bug.

YK: It would be fine to have an AST transform that kept the last one and raised a deprecation. It seems bad that glimmer should have to think about this situation at all. We’ve gone back and forth between arguments being an array or object and it seems bad that the behavior here would change based on that. I think we should do the check in transforms.

RJ: I would prefer the transform to be in glimmer itself. AFAIK there are no AST transforms on the glimmer side right now.

YK: You don’t need the AST transformation. Basically there is a parser that walks the original AST and you could do it there.

(discussion)

YK: One of the things we encountered upgrading ember-glimmer to use typescript means you want other things to become typescript. Things like get and cache. b/c they aren’t TS you need to use any or write a stub type for them. I don’t know how to contain the TS changes to just Ember-Glimmer itself.

RJ: Well there isn’t a reason we can’t have it elsewhere.

YK: What I thought would work is that most things in ember-glimmer are dependent on leaf things like ember cache. If we could just change files to TS as we need them that would be acceptable. We just don’t want to write d.ts files since we have the source in Ember.

RJ: I’m in favor of the pragmatic but distasteful thing. If we write the d.ts files we can fix them later.

YK: So for now let’s use d.ts files, and after we get ember-glimmer we can look at porting to TS. Every file has some TS and some non TS stuff, so you end up typing more stuff that you don’t need. But also if you are typing something like cache you end up wanting to restructure the code itself. And that is out of scope.

GC: I think that stuff is good for a sunday afternoon, but you don’t want to block ember-grlimmer on it.

GC: It is especially scary for things like cache. Or Ember object.

YK: the thing is that most stuff in metal is by definition very generic. And ember-glimmer is very concrete. I made the d.ts files but I wasn’t sure if it was acceptable, but I wanted to check on it. Last time we only had a day to work on it and we didn’t know what to do so we just didn’t make much progress.

YK: To repeat consensus: Make ember-glimmer use TS, it will still be based on old glimmer like it is now. If there is something in ember-metal we will d.ts it for now. Then we can upgrade ember-glimmer for the new version of glimmer. Then we can look at TS for ember metal.

### Ember.String RFC

RJ: Basically people are confused about htmlSafe and why it goes on ember component. Basically we need to change this or provide an advocate.

TD: I would prefer if people just import htmlsafe from handlebars.

YK: I don’t think it is the right thing. And I don’t want to leak handlebars into Ember.

(discussion)

Consensus:

- htmlSafe and isHtmlSafe should be exposed as `@ember/template`
- General concerns re: where ember built-ins (link-to etc) live in API docs
- RJ: compile and template (currently on Ember.Handlebars) are not part of the ES export docs. They need to be added. Also Ember.Handlbars.Utils.escapeExpression ([globals exports](https://github.com/emberjs/ember.js/blob/master/packages/ember/lib/index.js#L488-L497))

### Blog posts for emberjs.com

RM: We talked about having more blog posts to make the blog seem more active. Haven’t seen too much, wanted to raise it.

TD: Are people OK with me writing a glimmer post for the Ember blog? RM please nag me to do a short Glimmer thing. If you want to syndicate Glimmer related posts from my blog we can do that, I’m not sure about that though.

RM: There is a learning team post by David has been tied up at work.

DG: I have some JSON-API stuff but I’m not sure how much it an tie in.

TD: I think there is a problem of all of us are doing interesting work, but it feels like things stagnate because the blog is only very dry updates.

MM: I’d like to do stuff on named blocks but there are just open questions.

RM: We could have one on named blocks, we could do one on module unification.

RJ: I think it would have been great to syndicate that content. A few paragraphs and linking back.

DG: I don’t think it is too late. We haven’t syndicated anything yet right?

RJ: No we haven’t.

DG: It is a shame we didn’t link to those etc.

YK: we could consider doing a rotation for blog posts.

(discussion)
