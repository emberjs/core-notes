# Meeting: Ember Core Team - Jul 12, 2019

## Agenda

- (public) (**2 min)** Determine note taker
- (public) (**2 min**) Determine person to upload notes
- (public) Glimmer-VM Integration When? (CH)
  - Named Blocks
  - in-element (Blocker for Impl on RFCs)
- (public) RFCs
  - → FCP
    - [@classic decorator](https://github.com/emberjs/rfcs/pull/468)
    - [Deprecate `mouseEnter`](https://github.com/emberjs/rfcs/pull/486)
  - FCP → Merge
  - → FCP to Close
  - FCP to Close → Close
  - Enable
    - Colocation
    - Tracked

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [x] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner

- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [ ] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

- [x] FCP [https://github.com/emberjs/rfcs/pull/468](https://github.com/emberjs/rfcs/pull/468)
- [x] FCP [https://github.com/emberjs/rfcs/pull/486](https://github.com/emberjs/rfcs/pull/486)
- [x] Enable tracked feature on canary
- [ ] Enable template co-location feature on canary
- [ ] CG to join TC39 frameworks meeting

## Minutes

### Glimmer VM Integration

**CH**: When are we updating ember to the newest glimmer-vm? It has things like `in-element`. I think there was a branch of ember that attempted to integrate?

**RJ**: We planned to upgrade glimmer.js first to get a better understanding of the changes. That is done, but AFAIK nobody has tried to update ember.

**CG**: I want to do this after we ship 3.13.

**KS**: Don't we need a fix?

**RJ** & **CG**: we are doing a backport.

**RJ**: We could choose to make sure this gets into octane (for named blocked, etc), but we haven't done all the surrounding work and it's a lot of scope creep and we should avoid that. Shipping octane is more important.

**RJ**: The polyfill for in-element is smaller scope than the full RFC. But it is a spec-compliant subset.

**CH**: Deprecating features in core and telling people to use a polyfill seems bad.

**RJ**: We could choose to ship the polyfill as "ember" if we wanted to, and leave the refactor for later.

**RJ**: The named blocks RFC implementation is basically done in glimmer-vm. "All we have to do" is upgrade glimmer-vm in ember.

**KS**: Does glimmerJS have template imports?

**CH**: No, but there is a LinkedIn custom thing like that.

**YK** et al: it's hacks on hacks, not the real template imports proposal

### RFC Review: @classic decorator

**RJ**: is implemented as an addon and RFC has been updated to match. I suggest FCP.

**RJ**: tl;dr it's a combination of lint rules and hard errors.

**YK**: people opt into hard errors, but we have deprecated not opting in.

**KS**: I assume the extra dev mode code is removed in prod?

**RJ** & **CG**: Yes, it's all inert in prod, if anything is left that's a bug.

**_Consensus to FCP_**

### RFC Review: Deprecate mouseEnter

RJ: RFC has incorporated our feedback. The examples in the RFC were just confusing, and that's fixed. Recommends using `on` and `@action`, etc. Do it the octane way, because when this lands we will already be all on octane. Suggest FCP.

**Consensus to FCP**

RJ: We should strongly consider deprecating and svelting out the event dispatcher infrastructure. It's not small.

### Feature Review: template colocation

RJ: All implemented in ember. I want to enable feature on canary, so it's easier to work on the implementation in ember-cli-htmlbars and ember-cli.

TD: What is the actual public API?

RJ: `setComponentTemplate` `getComponentTemplate` API for build infrastructure. Also gives the ability for addons to use template-only glimmer components.

TD: should we make this be namespaced under `@ember` or `@glimmer` since it's a component thing?

RJ: we can do either/both and adjust in the future, as this is not really end-user authored code, this is tooling-generated code.

YK: you actually need both "set component manager" and "set component", and "set component manager" is already under ember namespace, so we can just move both together at some point.

RJ: Some of this stuff will eventually get hoisted into glimmer-vm as we bring ember and glimmerJS into alignment.

YK: The plan for putting things in glimmer is pretty clear already.

**Consensus to enable feature**

TD: We should meet and discuss the glimmerJS/ember compat plan.

### Feature Review: tracked

RJ: I want to enable tracked feature on canary, so we can have a longer test cycle and make it easier for people to test without inconvenient hacks. There are no known correctness blockers. Main open issue is possible performance regressions.

TD: I think we should go the feature but pair that with a specific call to action to get people to test their apps and look for performance problems. Can we give people instructions on how to user tracer-bench?

KS: Yes, tracer-bench is all good and a lot easier and more generic to set up for any app. But the documentation is somewhat LinkedIn-focused and needs updating. Needs newer instructions. The reporting that comes built in to the tool has work to do, using our custom report is still preferred. But fixing that is vey close.

TD: How do we want people to measure performance deltas and report back to us? Should we tell people to use ember macro benchmarks?

KS: It would need to be updated to the latest.

RJ: There are some gnarly bugs that had to get fixed upstream in various places. It's kinda painful to run. It's probably less work to update it than to document how to workaround all the issues.

KS: All the current work is about polishing and documenting and getting feedback. It would be nice to get it automated on some open source apps. We need more open-source apps to test than just ember observer.

EF: Maybe some learning team apps.

JW: Yes, we have lots.

TD: But are they all read-heavy like ember observer?

KS: My biggest concern is that ember observer extremely heavily stresses a few code paths and they end up overemphasized. But you'e right that they might not be typical.

TD: Isn't it amazing that this is all working correctly even though it replaces so much (chain nodes, etc)?

YK: It was more incremental than it seems.

KS: It's also the power of declarative templates.

TD: Should we pre-register our study in the sense of deciding what an acceptable performance metric would be before we get the data?

RJ: We could but would we really choose to slip octane anyway?

CG: It may be better to release and followup incrementally.

TD: I think we all agree there is some extreme limit that would block release.

RJ: All of this is why I want to turn the feature on now and get a nice long testing cycle.

KS: Of the apps we've measured, none of them were extreme, and with a couple days of work we improved it substantially. The typical issue was being a little less stable and causing more DOM updates.

YK: We might want to consider teaching people about faster patterns. We don't want to lean on that too much, but there's a new normal in terms of what's fast and what's slow.

RJ: And the things that are fast are more idiomatic anyway.

YK: We don't want to go to the extreme of blaming users for being slow, but there is a balance. It depends a lot of whether the slow things are deprecated features.

RJ: emberobserver was like a 10% regression from enabling the flag.

YK: Is the new API on parity or faster? Asking because if the old stuff is a little slower and the new stuff is faster, that's fine.

KS: I have doubts. There's low hanging work in the new implementation.

TD: Just moving to the glimmer base classes could probably make up for it.

KS: Especially if you only target modern browsers. Even with just old classes just migrating to normal super is a performance win.

EF: It would be good to have a conversation with Discourse about helping them be easier to upgrade and test so we can benchmark for their app.

TD: To summarize, we're enabling the feature and we need to make it easier for people to test performance. Can we do a blog post about the new benchmarking tools?

**Consensus to enable feature**

RJ: We can also blast it out in ember times. And make a discourse thread, etc.

RJ: Ember Inspector needs support for tracked properties, needs to be designed. It's a new feature, it would be different from what's already in inspector. Today the inspector is fragile and breaks a lot because it hacks in support. We should design this within Ember to make the inspector much better and more stable.

JW: Can you make sure to ping other Robert once that feature is enabled in canary?

RJ: Yes. Though the inspector doesn't inspect chain nodes directly, so I don't think it will break.

RJ: Co-location will also affect inspector, but it's not really ready to use anyway, because the ember feature alone doesn't make it usable.

### TC39 Framework representation

CG: Now that Stef has alumnized, he was on the invite list for a TC39 frameworks meeting and we should make sure somebody else is. I can do that.

YK: Yes, you should definitely go.
