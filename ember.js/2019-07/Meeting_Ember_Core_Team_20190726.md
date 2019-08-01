# Meeting: Ember Core Team - Jul 26, 2019

## Agenda

- (public) (**2 min)** Determine note taker
- (public) (**2 min**) Determine person to upload notes
- (public) **(2 min)** Remind Rob to make/fill out the tracking issue for mouseLeave RFC
- (public) (**10 min**) `@tracked` (CG)
- (public) RFCs
  - → FCP
  - FCP → Merge
  - → FCP to Close
  - FCP to Close → Close
  - Enable

## Attendees

- [ ] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Leah Silber
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

- [ ] DG to upload notes

## Minutes

DG taking notes.

### `mouseLeave` RFC

JW: There was an RFC merged last week.

RJ: I have completed all the things for RFC 486

TD: What a boss.

RJ: I was chatting with Simon about the deprecation. Now that that's landed, I can work on making things more lazy, and not adding listeners until they're needed, so we can see perf improvements.

### Update on `@tracked`

RJ: CG - could you give us a rundown?

CG: I spent the last week or so digging in on the performance. I made a few optimizations, but also encountered a few bugs, and the fixes offset the perf gains from the optimizations. So it's a wash in terms of perf.

CG: There are a few refactors that I've talked about with YK and KS that could reduce the size of glimmer + ember. These size improvements are probably where we're going to see the most benefits.

CG: I'm probably going to be working quite a bit over the year on slimming down and improving the performance here.

CG: The perf regressions have entirely been < 10%. I think this is reasonable to accept as long as we work to improve before the next LTS.

CG: I think with 13 weeks after the 3.13 release we will probably be able to make up the difference.

RJ: One thing that I'd like to do before we branch beta - I'd like to confirm that a refactor to the new programming model doesn't include any perf regressions.

CG: We have started looking at refactoring ember-clear, Preston's project.

KS: That will involve a refactor.

CG: I think we will see that initial render will be much faster. Not sure about re-render times.

RJ: I agree. I just want to confirm.

KS: I'm not sure how confident we can be without testing. [mentioned cache-keys]

TD: When are we cutting the beta?

KG: Aug. 5

MS: What does this regression look like in actual times rather than percentages.

CG: We're talking on the order of 300ms with CPU throttling / P90

CG: This would be hard for LI to accept, which is why I'll be working on this.

MS: Where do you anticipate finding improvements?

CG: Something like `{{foo.bar.baz}}` can be refactored to use a lot fewer tags, less classes, and less bookkeeping.

CG: ember-glimmer is pretty large now - on the order of 10MB. There's a lot of low hanging fruit there.

TD: I feel like there's a lot of performance to get out of moving to native classes.

TD: My read of the ambient community sentiment is that they want us to move even faster than we are.

KS: I still think there's low hanging fruit to be picked via refactoring.

CG: I want to spend some time over the next week working on some of your recommendations, Kris. For example, with iterables.

RJ: The feature is ON. There was one issue to fix, but it seems under control.

RJ: Does anyone disagree with the general direction that CG laid out?

MS: I think as long as CG and KS write this down we can track it.

RJ: There are some community members who could jump in and help out. So writing it down would be useful for them.

CG: Right now I'm working on some small bugs that I have clearly in my head, but they are not written down and it would be hard to share this knowledge. [Sounds like these things are tractable and will be worked through soon]

TD: I don't want hyper focus on the performance improvements at the expense of forward momentum.

RJ: There are things we can in this realm (not necessarily GBX, but we could use JSON) that might yield improvements.

KS: It doesn't all have to be in one. You just need a base way to declare the offset.
