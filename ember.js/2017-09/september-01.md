# Meeting: Ember Core Team 2017/09/01

## Agenda

- Motion to **FCP** `[Ember.String](https://github.com/emberjs/rfcs/pull/236)` [deprecation RFC](https://github.com/emberjs/rfcs/pull/236) (RM)
- 2.15 release post-mortem (RM)
- Change of `capitalize` for accented chars [emberjs/ember.js#14764](https://github.com/emberjs/ember.js/pull/14764) 

## Attendees

YK, AM, DG, GC, KG, RM, MB. RJ, EF, MM, CH

## Minutes

### Motion to FCP [Ember.String](https://github.com/emberjs/rfcs/pull/236)` [deprecation RFC](https://github.com/emberjs/rfcs/pull/236)

RM: If I recall most objections were about how the RFC was written. The comment bore this out. I took a swipe and Serabe did a few more changes. It is basically rewritten, hopefully clearer. I added sections for app and addon developers, and a timeline for when to use what. Work is also done, I did the transform and ember-cli-babel and created the ember-string repo and moved the code and tests. There is only a small issue of the `loc` method, which for translation but it going to be deprecated. Everything is good to go as soon as we FCP and merge.

YK: Any blockers/issues?

RJ: I think there is one. I’m opposed to adding `@ember/string` to every project by default.

YK: Why would we do that?

RJ: b/c it is provided by default today.

YK: ah i see it provides the prototype extensions?

RJ: there is actually a second addon for prototype extensions.

YK: I am confused.

RJ: yes that is why I raised it. We will do the deprecation using Ember.String.anything. We will move a few things like htmlSafe etc as they really are misplaced there. But dasherized etc used off the global namespace, regardless of if you use the imported or globals version, all methods will trigger a deprecation unless you add `@ember/string`.

YK: So why add it by default?

RJ: Because it is there today, but I don’t think we want that.

RM: I was for including it b/c if you don’t you get a lot of warnings, but it is both fine because that is what we want and Ember-Data will need to include it.

RJ: But to be clear the method by which we deprecate detects if you are using @`ember/string`. That ember-data uses it today doesn’t mean it needs to. There is conceptual thoughleadership to have ED be multiple things some of which will need it some not. I can imaging that you need to provide your own pluralization if you don’t bring pluralize etc. Not a proposal, just a strawman.

RM: I want to wrap up the RFC. All of Ember.String.something is deprecated, html safe stuff moves to component module. loc and fmt will be deprecated.

(discussion)

RJ: The other thing is I would like to deprecate loc even in the addon.

YK: If we deprecate it the message should point people at the two community libraries that are better. Can I raise an issue: Last time I upgraded ember-data and ember there was an issue with the order. I don’t know what to do except to note it can get you in a bad state.

RJ: The advice I would give concretely is that you should upgrade them independently.

YK: you usually can’t upgrade ember-data first. because it requires a new feature.

RJ: There are a handful of things where when we added them to Ember we still were publishing ember-data as a global thing makes it hard to use polyfill addons. Like any other addon does. So part of the pain is that ember-data has to do its own shimming independently of the curated maintained polyfil.

YK: So you say if we use the polyfil approach you would upgrade ember-data first b/c it would bring the polyfil. Just neither I nor my team had a good solution for our upgrade state.

RJ: I would look at specific details more. I would like to understand it concretely.

YK: I can sync with you.

RJ: Yeah I would like to understand it. It is also possible there are too many jumps. Nothing else has an LTS. B/c there is no LTS there is no logical place to change private feature. It still seems haphazard from the end-user prespective.

YK: At the least we should talk about it at the F2F.

RJ: Sure we didn’t do a good job of curating something.

YK: It would help if there was a description in a document somewhere telling you what to do.

RJ: With ember-data it can be hard to know why something breaks because of a change in ember itself.

### Change of `capitalize` for accented chars [emberjs/ember.js#14764](https://github.com/emberjs/ember.js/pull/14764)

RJ: KG paired with me on most of the 2.16 beta release. I noticed this PR and I am concerned.

(discussion regarding the correctness of the change and of the appropriateness of changing string camelize/capitalize code)

YK: We should revert this change, we should explore changing the internal code to not use the regex, and we should continue to improve unicode support in the new @ember/strings repo.

### 2.15 release post-mortem

RM: Just to preface the intention is not to blame. But, 2.15 was a shitshow. I’m not sure what went wrong but I want for us to analyze it and see how it can be prevented in the future. We took some actions already. Ember automation.

RJ: We need to add the automation to ember-data. From my perspective there were a few things. I was personally de-railed. I haven’t done a good job of enabling other people to make the releases. I wasn’t blocking anyone intentionally, but others are just uncomfortable since they don’t do it. Also there is some work I think we can make easier. KG sat with me for 2.16 beta1 and it was about 20 minutes. Hardest part was changelog. KG took notes, better notes.

RM: Right I was in the room for a release and my notes were not meaningful after a month.

RJ: I think CLI did not have a real issue. They blocked on Ember, not on Ember-Data this time.

MB: Can we release ember-data first?

RJ: Right we should release Ember-Data first, then Ember then Ember-CLI. Ember-Data can go out a few days earlier. We had a lot of things poised for success but still managed to delay.

RM: I know there were ember-data technical blockers.

RJ: Yeah the blocker came up and was fixed in 24 hours, but it was just too late they should have tried to release earlier. The issue was from betas.

YK: Is there something we can do to encourage people to run canary/beta on the builds?

RJ: Addons test beta/canary for ember ember-data. We don’t have a way to test ember-cli versions.

YK: I think that is a good improvement, but applications don’t use ember-try even. We have on our internal roadmap to do this.
