# Meeting: Ember Core Team 2019/04/26

## Agenda
    
- **(10 min)** https://github.com/emberjs/ember.js/issues/17962 debugger in template-only glimmer components
- **(10 min)** Discuss enabling Tracked Properties and Args Proxy canary flags (pending perf analysis and tuning) (CG)
- (**10 min**) Discuss [Component Templates Co-location](https://github.com/emberjs/rfcs/pull/481) (RJ / GC)
- RFCs
    - → FCP
    - FCP → Merge
        - **(10 min)** [Tracked Properties Updates](https://github.com/emberjs/rfcs/pull/478)
    - → FCP to Close
    - FCP to Close → Close
    - Promote
- **(2 min)** Volunteers for call for blog post seed posts
- (**2 min**) UPDATE YOUR RFC-TRACKING ISSUES 😡 (RJ) 

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [ ] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Minutes

### Meta

GC: hello

TD: If I volunteer to take notes, how long is the meeting for?

JW: I will also help take notes if TD wants to be the primary note taker. I want us to rotate the note takers.

RJ: If the person taking notes want to jump in, feel free to ask for help. Anyways.

### {{debugger}} with template-only components

[Issue](https://github.com/emberjs/ember.js/issues/17962)

RJ: If you put {{debugger}} in a template-only component, the helpful comment is not very useful or relevant.

RJ: We should fix it.

RJ: I consider this a bug. A regular old bug. I left a comment describing my recommendation for how we address this by offering a better message with more information available.

GC: I don’t know if I would consider this an urgent bug.

RJ: I consider ergonomic problems to be a bug.

*consensus that we should fix it whether this is considered a high priority bug or not*

### Discuss enabling Tracked Properties and Args Proxy canary flags (pending perf analysis and tuning)

CG: There are two feature flags we are talking about here.

CG: I’ve finished the PR to remove chains. Performance is problematic so needs some investigation.

YK: How bad is the performance regression?

CG: 400ms on Ember Observer

YK: Other than the performance regression, are there other reasons why it may be problematic?

RJ: Performance regression is enough of a reason to not GO it. That being said, I would like to merge it as-is, even with performance regressions, because it fixes a lot of bugs in the programming model. We should just not go the feature until we address the performance regressions.

YK: Why was the work not happening on master behind a flag anyway?

RJ/CG: It’s just a big atomic commit. It touches chains so there are many changes needed across the codebase to make the change work.

YK: Is is possible that the regression was caused by the usage of features that we don’t want to support in the future anyway?

KS: No, Ember Observer does not use `observers`. 🎺

TD: Lulz the irony

YK: I wasn’t suggesting that we not deal with this. I’m just wondering if this is something like the `with` statement in JavaScript where it caused a lot of slowness and we could push people away form that.

CG: The other feature flag is to add a proxy to the glimmer component args.

CG: The current way we do things is prone to causing infinite re-rendering. We tried a couple of other things but this seems to work best so far. Ideally what we want is to only mix in the tags for the args you actually use, instead of doing it for the entire args object whenever it is touched. On IE11 we are falling back to defining getters. There have been some concerns about using proxies in general, but likely not real.

TD: this would be the first time we have a proxy in a hot path in our prod mode.

RJ: it may be tricky to measure well.. but we can try.

RJ/YK: (brainstorm measuring)

YK: Where is infinite rerender coming from?

KS: Something something we end up dirtying the args…

GC: We looked at this last time, we can talk about the details another time.

YK/KS: Let’s talk about it after the call.

RJ: We need to solidly confirm that we don’t see a regression while the flag is off

IT: I can help test too.

### Tracked properties FCP to merge?

[RFC](https://github.com/emberjs/rfcs/pull/478)

Would be good if we can get it into 3.11, whether or not 3.11 is Octane. We would not put this feature into 3.12 because of LTS reasons.

(Concerns about changing name just before merge, rather than letting it FCP for a week)

TD: the measure is whether or not the discussion has settled and we are considering the comments

## Roadmap blog posts!

KG: We need seed blog posts. Ping me if you want to write one! May 12th-ish is the target for announcing the roadmap. What is being asked for is basically the same.
