# Ember Core Team 2017-02-24

### Agenda

- Feature go/no-go (RJ)
  - [ember-testing-resume-test](https://github.com/emberjs/ember.js/pull/13663)
  - ember-unique-location-history-state - [RFC](https://github.com/emberjs/rfcs/pull/186) / [implementation PR](https://github.com/emberjs/ember.js/pull/14011)
  - `ember-glimmer-allow-backtracking-rerender`

### Attendees

RM, KS, SP, LS, DG, TD, CH, EB, YK, GC, AM, IT, MM, RJ, DG

### Minutes

#### Flags

RJ: In testing there has been a thing called pauseTest. This is resumeTest which lets you resume the testing. It has an RFC issue and not a full RFC.

RJ: Any objection?

YK: No objection.

SP: I am for doing this.

RJ: Second is the location states tracking. I would like to enable this as well. There are links for the RFC and for the implementation in Slack. There are a few addons that are roughly polyfilling the feature.

SP: I don't think we need to bake more, we can go.

RJ: On the history object we push in the history API, you get a unique representation. We talked about it in depth, how to ensure the uuid is not based on ordering etc. All that stuff was incorporated and done.

SP: I think rob, me, and kris like it.

TD: We make no guarantees about ordering at all?

SP: No.

TD: I could think having partial ordering might be good in the future, but nothing in the feature blocks this.

RJ: I would like to remove the backtracking rerender feature. This is the things that has always been off, but you need to enable it to get rerendering. We got flack for not shipping it but not too much, and it would be nice to remove the support.  This would mean, if we remove this today, that if you need backtracking rerender you would need to build 2.12-LTS.

(discussion)

KS: I think we need some of this code, especially the assertion feature, to do some of the smearing stuff.

(discussion)

RJ: It would be good to remove this thing eventually, I don't really care when.

YK: I think we need to remove it, but we need to do a blog post to say what is going on.

RJ: I just don't know why we would write a blog post about a thing we never acknowledge existed before.

YK: That ignores that intimate APIs exist and are a real thing.

YK: We attempted to deprecate the feature in full, but we messed up (we missed bindings backwards between components) but we also realized the semantics could not be defined. So we said please don't do this, we know it does something but we cannot define it.

RJ: But the deprecation message also said "this thing will be around until 3.0"

YK: Right, and that was very misleading, but it turns out we cannot define *what the feature is*, and therefor we cannot support it until 3.0.

RJ: If you have a component and call set...

YK: The end of this has to be "it will sometimes work".

RJ: They always propagated up. After some about of iteration it settles.

KS: Not it was not just two way binding, this isn't describing it right.

YK: If the feature is "people did something with a large object graph and it worked" that isn't something we can support.

KS: It was a narrow case that did not trigger the deprecation, many cases of binding backflow did trigger the deprecation correctly. If the backflow touched DOM outside of bouncing around in streams it would trigger the deprecation. The case is if the backflow stayed only in streams then hit the ember observer world without going to DOM. But in the new world, the referece system is itself rendering, and there isn't an in-between system between the observers and the world. There are only refs. I feel like bindings in your templates, even if they went to components we still in our heads "a binding in the template is rendering" or should have trigged the deprecation but it didn't in this one narrow case.

KS: The example I saw was one where it did throw the deprecation.

RJ: We went from a deprecation to an assertion and that was a breaking change.

YK: But the question is what was the thing deprecated? It was never properly defined.

KS: The way you can describe it is incredibly slow (from an implementation standpoint).

(discussion)

YK: I think it seems likely that we will remove this after 2.12. And I would still like to write a blog post for it, which means identifying exactly what the old behavior was.

RJ: I don't care much about a blog post, so I think the blog post becomes a blocker.

YK: We can do this any time after 2.12 has branched.

RJ: People on custom builds need to know they need to fix their apps. And it is a security issue as well.

YK: And apps are actually slow as well.
