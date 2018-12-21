# Meeting: Ember Core Team 2018/12/21

## Agenda
  
- review https://github.com/emberjs/rfcs/projects/1 (LM)
  - https://github.com/emberjs/rfcs/pull/272 should we push through?
  - https://github.com/emberjs/rfcs/pull/298
  - https://github.com/emberjs/rfcs/projects/1#card-8410102
- Triage (RJ)
  - `…attributes` forwarding through contextual components
    - https://github.com/emberjs/ember.js/pull/17146
    - https://github.com/emberjs/ember.js/pull/17160
  - Radio button bindings not working in IE11
    - https://github.com/emberjs/ember.js/issues/14712
- F2F Action Item Review (RJ)
  - Template import progress?
    - First-class value everything (GC)
      - https://github.com/emberjs/rfcs/blob/3dbd22eeab5b15e6aa0d8c9651e71b639040fe61/text/0000-contextual-helpers.md
  - Recordings of F2F…
- Curry attributes and possibly modifiers with `(component`? (RJ)
- Quick notes reminders (I’ve been cleaning up old notes for release -MB)
  - Please flag all agenda items with (public) or (private). If you don’t flag it, you’re asking someone else to follow up with you or make a judgement call and that isn’t a good use of our time.
  - Use (private) sparingly. Most things are probably (public). Private topics and their discussion are deleted from the public notes.
  - Use (aside) in notes instead of `<aside>` or `[aside]`. The angle bracket version doesn’t copy-paste into github markdown correctly.
  - Please try to come and check yourself off on the attendee list. If this isn’t useful and people don’t do it, we could consider dropping the list.
  - Please put your initials in () at the end of any topics you add.

## Attendees

[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[ ] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner
[x] Jen Weber

## Minutes

### Review project RFC

RJ: This is long. The deprecations list is long, there are a lot of things here. Some are todos, some are notes. The in progress column are things where the RFC is open but pending for this reason, finished is what is done.

### RFC 272

RJ: The next RFC on here is #272 deprecating function prototype extensions for `on` and `observes` etc. I think this is a good idea. I recall having agreement.

RJ: I haven’t read through this in detail.

YK: I think the question is that if this is commonly used, is this a good time to deprecate/remove it.

RJ: It is different than some things like the component lifecycle hooks where you may rewrite your components.

RJ: We wrote a codemod for this as well, for porting away. We also have an addon that defaults to turning these extensions off and most apps seem to leave that installed.

YK: If most apps don’t do this I could be ok with it.

RJ: There is some kind of purity to not mucking with the prototype. Like the smoosh thing?

TD: Flatten.

YK: I think it sounds ok but the pitch is that you should migrate to a new thing, if we churn the old thing you feel it…

TD: I think this is a good time. The imports API makes it a lot nicer. Many places lint against this actually, the guides…

YK: Is there a lint? Do the guides remove it?

TD: I don’t think the guides use this form and they discourage it. Now is a good time to do it and it gives people 3 months to do it.

RJ: TD I had not put it together but I think the imports sell it hard.

KS: How does it deal with mixins?

RJ: Ember.on and `on` for a function are the same.

YK: It is basically modifying the function either way. It is a step before…

KS: I think you are misunderstanding my questions, not all events are hooks…

YK: We’re not talking about removing `on`, just the prototype extensions.

KS: Ah ok, that is a different RFC.

MB: Why did we not do this earlier

RJ: The first version had some prose issues, RM and I cleaned it up and it just never got brought up again.

(resolution to FCP)

### Component events, #298

KS: This still has the issue wrt not changing something if users are being nudged to something else.

RJ: We should FCP to close I think.

YK: I think TD made my point here…

RJ: Yes but I think he was maybe still trying to move it forward…

TD: No I was the messenger at this point, but I did try to summarize.

YK: I think we should FCP to close.

TD: I will change this to FCP to close.

RJ: Yes crosslinking to the glimmer components RFC. We don’t think this is a good time to add churn for developers etc.

### Deprecate {{#with}} helper

RJ: with as a name is bonkers for the name here. I’ve historically gotten feedback that the behavior is useful.

YK: Even rust has `if-let`. It is reasonable to want it.

 RJ: I will note here and bring it up in the dev-rfcs channel in discord.

### Issues triage

RJ: I went through things that are outstanding as bugs for visibility.

RJ: One item I am working on: passing …attributes through contextual components doesn’t work correctly. It is 100% certain that I made a mistake in the dynamic invocation implementation, in the opcodes. I need to dig into the thing. This has been an issue since 3.4.

YK: In a branch I have I have refactored that logic into the precompiler.

(discussion, YK wrt work on a branch that may have fixed the bug as a side-effect of a refactor)

RJ: I’ll get a failing test and I can run it on your branch.

YK: I am curious if I fixed it.

RJ: For backport reasons I would like to fix it looking backward.

YK: what is the tldr?

RJ: The test is straightforward. It invokes a component with `…attributes`, but if that thing is yielded the attributes are not applies.

YK: I think it might not be a bug with your work. We intend for it to work.

RJ: I wrote many test permutations but not for curried components.

YK: I can imagine curried component definition is a thing we missed.

(discussion)

RJ: TD you added this other one wrt IE11. Seems like a pain to debug.

TD: Yeah. We had a bug with input type range where setting the property after the attribute reset… we fixed that bug. According to what people are saying in the GH thread that fix breaks radio buttons in IE11.

YK: The real thing is that in the spec all the attributes are set at the same time. And there is no API for doing that. What we do works in all other browsers, but in IE11..

TD: It seems like it should be easy in that the fix doesn’t look at what kind of tag you are doing

YK: but it might break checkboxes. It might be a catch 22.

(discussion)

YK: Somebody who care about this needs to figure out what behavior is different in IE11, look at the original bug, and see if IE11 also shares the behavior for type=range. Then we can look at it.

(discussion)

KS: Do you have the original issue linked?

TD: In the agenda.

RJ: 14712.

RJ: I’m happy to do work to make it happen. In some of these cases there is no positive solution that solves all the constraints.

YK: I can provide spec support.

TD: We have not identified who is a good candidate to do this work.

YK: I think if you could describe the case and divergences I think we could fix it quickly.

KS: This is a part of the spec that is not strict as well.

YK: No. If we need to set all the attributes at the same time we can use innerHTML. Sometimes we are not able to do everything the parsing spec says we need to do.

(discussion)

### Template import progress

RJ: GC added this maybe he is back.

GC: Hi. I have an item but someone else should share a status.

YK: I can give a general status.

TD: So EF did a great job writing up a proto RFC. I have a list of open items and constraints that need answers. I have been working through a backlog. These things are all kind of related, SFCs etc. I am going to pick up EF’s RFC and try to understand open questions etc.

YK: I think that is the same as my thing. I think you said the abstract version. We will try to get the ducks in a row and see if we think that works in a short timeframe.

RJ: I added this to the agenda because in my head it is emergency mode, so it is good to check in.

YK: I think TD and I tried to pick up the ball and run with it. I got some responses. I want to make sure Chris is happy wrt TS.

TD: I talked to TB about this as well to derisk. He is interested but has other responsibilities coming up as well.

(discussion)

### First class value everything

GC: I think is is basically what people want for helpers today. You can just yield a helper. But also in there is that you can have local helpers hanging off a class and invoke it. But the way it relates to imports is that currently helpers and components are not really a first class helpers. Like in JS you can use `concat` as a value and call it with arguments later. And in glimmer we want to move more toward treating these things as values. To the extent this relates to imports this RFC tries to lay out what that looks like.

YK: Another point of intersection: When you go from a global name to an import, my feeling is that should be more or less a transparent change. At the minimum that teaches us the constraints to know if that is possible.

GC: Where it is not transparent the RFC attempts to deprecate. I think we need to use the new rules with imports or it doesn’t make sense.

KS: We only have the ambiguity on…

GC: It is a few places. Imagine you have a curly invocation and you pass `concat` is basically is read off `this` as a value. I think we can make it work but there are details. It is not totally done but it is ready for review and thoughts.

EF: We really want to close the eval hole.

(discussion)
