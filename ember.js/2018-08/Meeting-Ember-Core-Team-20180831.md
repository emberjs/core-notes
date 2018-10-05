# Meeting: Ember Core Team 2018/08/31

## Agenda
- mmun alumnizing
  - https://github.com/emberjs/website/pull/3541
- RFCs: → FCP
  - FCP on Native Class Constructor Update RFC (TD)
    - https://github.com/emberjs/rfcs/pull/337
  -  [Modifiers RFC](https://github.com/emberjs/rfcs/pull/353) (RJ / CH)
    - `willInsertElement` - Any objections?
    - Are all concerns addressed? Move to FCP?
- RFCs: FCP → Merge
  - [Ember.merge Deprecation RFC](https://github.com/emberjs/rfcs/pull/340)  (RJ)
  - [Deprecate Component Lifecycle Events](https://github.com/emberjs/rfcs/pull/298)
- To FCP: https://github.com/emberjs/rfcs/pull/331 (MB)
- [MU Packaging RFC](https://github.com/emberjs/rfcs/pull/367) (RJ / MB?)
- Discord RFC Implementation Progress
  - When do we open the invite?

## Attendees
[ ] Yehuda Katz
[x] Tom Dale
[ ] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[ ] Dan Gebhardt
[ ] Godfrey Chan
[ ] Ricardo Mendes
[ ] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### FCP on Native Class Constructor Update RFC

RJ: We did discuss this before…

YK: I don’t think there is a way to have people use the constructor on Ember objects in the near term. the issue is that constructor is run before init, but existing code uses init to do things that are morally in the constructor. Culturally the only thing to do it only use `init`, because you don’t know what other things used `init` in the initialization stack.

YK: A consequence of this is that field definitions run morally in the constructor, so the things on the right hand side of fields don’t have access to anything in `init`. Maybe we should be writing a lint that fields don’t reference to `this`.

RJ: Right, this also seems odd in normal JS

YK: Yes some people want to lint for it in JS.

TD: I don’t think in practice this is a big deal. Once you have field initializer is to deal with things your normally use the constructor for. Setting arrays/objects to the instance.

YK: I think we need to lint against using a constructor for Ember Objects. It will seem to work most of the time, but it will break in bad ways. The way to get to using a constructor is to actually have ES base classes.

RJ: My suggestion when talking to Chris and Kris is that somewhere in the guides for the object model we should describe why this is like this. But in all the places where we normally just use this it doesn’t need introduction.

TD: We also need to decide how, once we get to ES classes, how DI works.

YK: Yeah that is the main blocker to the ES classes.

TD: So are there objections to FCP for this?

(summary of the RFC)

Agreed to not RFC.

YK: I’d like the deprecation for `new` to say that this is not considered public API, and didn’t really work before. We had some warnings like this in Glimmer.

RJ: Ok, this is also a deprecation for private API and can be dropped at the next release.

### Modifiers RFC

RJ: There are two main things: I’m not saying we should move to FCP though I am personally happy with this. The one thing I wanted to bring up. CH is on vaca so I raised this. The `willInsertElement` hook here was not previously discussed. If you have a modifier that sets things on the element before it is added to the DOM we need `willInsertElement` this has been added to the RFC.

TD: So we didn’t include this in Glimmer components on purpose.

RJ: I think we can say we do this, or that some use cases are just not supported.

YK: I don’t think this can happen. Some of this is that insertion in to the DOM is a stateful that that changes defaults. Adding a select to the DOM changes the state. The issue is that looking at the code you think it is in the right state but the element might not look like that.

YK: The way our syntax works is we mirror the tree construction. Which is tricky and involves setting state on elements. If you mutate the state on the elements it is hard to know what happens. If you change a selected thing I don’t know what will happen.

RJ: Right, this is not saying the children are created either.

YK: Anyway this thing is one potential source of risk.

RJ: Sure, either we say this is not part of the model.

TD: I wonder if we can just amend the RFC to not have it. I agree these are real use cases but I don’t know the answer yet.

YK: It is possible there is a different design that is more constrained.

TD: A problem is that “insertion” is ambiguous, if you are inserted into your parent or your children into you.

YK: There is another general issues which is that interleaving causes state shenangans.

(discussion)

### Moving to FCP

- Ember.merge deprecation RFC - Merge it!
- Deprecate component lifecycle events -

(discussion about if it is worthwhile to make changes to the lifecycle events when we think a new system is coming down the pipe)









