# Meeting: Ember Core Team 2019/05/03

## Agenda
    
- RFCs
    - → FCP
        - (**15 min**) [Co-location](https://github.com/emberjs/rfcs/pull/481) (GC)
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Promote
        - (**5 min**) `[{{on}}](https://emberjs.github.io/rfcs/0471-on-modifier.html)` [Modifier](https://emberjs.github.io/rfcs/0471-on-modifier.html) (RJ)
        - (**5 min**) [Inject Parameter Normalization](https://emberjs.github.io/rfcs/0451-injection-parameter-normalization.html) (RJ)
- (**10 min**) Impact of making observers async. Breaking change? 🤔  (RJ)
    - [Some public documentation on them firing sync](https://api.emberjs.com/ember/3.9/classes/Observable/methods/incrementProperty?anchor=set)
    - Issues in common addons: https://github.com/DockYard/ember-composable-helpers/issues/318
- (**5 min**) Remaining TODO’s for Octane feature implementation (MS)

## Attendees

- [ ] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [x] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [ ] Chris Garrett

## Action Items

- [ ] RJ: Will label/comment FCP for https://github.com/emberjs/rfcs/pull/481

## Minutes

### Co-location to FCP

RJ: https://github.com/emberjs/rfcs/pull/481

RJ: So there has been some conversation. I think it has gone pretty well. A week and change ago I left a comment, GC’d last round addressed my concerns.

RJ: There are a few comments re: we should split this up. I don’t agree. I don’t think there are outstanding questions/concerns. I nominate for FCP. Concerns, questions?

RJ: I’ll do the label + comment.

RJ: Timing-wise I don’t think this will make 3.11.

GC: I’m fine with that.

RJ: I’m not keen on rushing it into 3.11. There is coordination of a few packages, ember, ember-cli-htmlbars, things like that. It is just easier to coordinate that not on a rush.

### Enable by default: `{{on}}` Modifier

RJ: There is already a polyfil for this. People have been using that for a while. This is to enable it.

RJ: There is a semi-related bug wrt the destroy modifier hook being called in Fastboot, but that isn’t directly related to this. CH I will pester you for review on this. We previously didn’t nail down the semantics of the hooks re: the parent component.

No objections to it going enabled.

### Enable by default: Inject Parameter Normalization

RJ: This is in an open PR, but there is nothing to stop it from being enabled. For FW classes it passes the owner as a constructor arg.

RJ: The Octane guides will use native classes for these, and it will be nice to teach the owner argument consistently.

RJ: But this doesn’t change the recommendation wrt should you use native classes/Ember classes etc.

MS: Were the Ember Data updates done for this?

RJ: If you look at the implementation PR there is a function Ember Data will use to set the thing. They need that function to opt-in.

MS: Do we have a commitment or idea of when they will ship it?

RJ: As soon as I land it in Ember I will land it in Ember Data.

MS: Last release there was an issue wrt Ember Data..

RJ: This isn’t a bugfix though. It can ride the train and sit on the beta channel. It will be enabled in Ember and will be six weeks before Ember’s release.

SP: And to be clear it doesn’t require any coordination.

RJ: Correct, ED users get a new feature once ED opts in.

(discussion)

RJ: I’ll push those through.

### Impact of making observers async

RJ: We merged behind a FF the updates that provide tracked interop with observers, and removes chains. Folks testing the Octane preview period noted a bunch of issues.

RJ: For example ED tests fail when we enable the flag. The thing that is breaking if the move from observers firing sync to async. I think there are a number of things we can do to mitigate. But: It is being reported as a breaking change and I think we need to do something to mitigate.

(discussion)

SP: I want to point out that these things, sync observers, are holding us back.

RJ: I agree, but it is unclear how you deprecate this. you either need to provide a way to opt-in, or just deprecate the entire observer API.

RJ: Either way to cannot rely on this to go ahead with the tracked implementation.

(discussion)

KS: We’ve done timing changes before, I feel like we were making good progress on mitigating some of the edges.

RJ: I think we can continue to do that. In the end we need to decide if changing them to be async is a breaking change or not. I’m not saying it is a bad change, but it is a breaking change.

RJ: We could make it an optional feature, and make people opt-in. Or have observers have a different behavior if observer observe paths.

KS: That doesn’t work with tracked though

RJ: It works to enable tracked, but it doesn’t enable tracked+observers. The people complaining about this arn’t using tracked at all.

(discussion)

KS: I would like to actually see some more examples of issues before we jump…

RJ: I’ve linked a few in the agenda. You’ve dug into a few as well.

KS: In tests we can do something to force them to reconcile. People already have tests different than real apps by forcing the runloop to flush.

SP: Are you saying we don’t need to do a breaking change release?

KS: I would like to see us get the breakage down to a reasonable point. I’ve mainly given this feedback to CP.

GC: Is it free to say we have two releases to shake it out anyway?

RJ: I think at least one. There is also the performance stuff, but Kris and Chris already got that down by like half.

KS: The majority of the perf issues to be clear was to do more DOM work. In most apps today the second pass of rendering does practically nothing. And a few cases… Auto-track tends to poison a lot of things and make the second pass do a lot more work. We found one case that removed most of the changes in the rerender.

RJ: I think an optional feature for async observers would be the best path.

KS: We’re bifurcating the internals in a way that will be difficult to maintain.

SP: I think RJ is saying get people from sync → async then land other work. Do you still think there is a breaking change?

KS: … if people aren’t going to make a big deal of bumping a major version I am fine with that. But that doesn’t solve the issue, we need a migration path. If it breaks 90% of whatever making it a major is not going to solve it. Any relying on timing being a breaking…

SP: We think relying on timing is a bad idea but..

KS: Right, but if we could mitigate it to being 1% of users I don’t care if we bump major or not. I want to understand the scope, I think there are workarounds for many of the cases.

KS: This is a mitigate in the CP code. And there is another in the test helper code.

KS: If we get it down small enough, then bumping the major is no big deal for people to upgrade.

GC: Can we spin this off to Monday? I think there is not a lot of urgency here.

RJ: Right, I’m not sure people knew there was an issue. I think it is a big issue. We do have plenty of time, we are not in a rush. It is a little unfortunate that people were happily using Octane and now they are not. It has been hard to get experience in apps, we have relied upon addons a lot. It is hard to know the scope in app space.

GC: I think YK is taking two weeks vacation but maybe he would join to discuss this.

### Last weeks dependency compat RFC

RJ: We did change the name on this and add a path.

(discussion)

RFC to merge?

### Octane feature implementation

RJ: I think all CP’s items have been handed off, nothing was dropped. I think there is a big checklist of things to do, I don’t know where it is.

JW: There is a tracking issue.

MS: At learning core I asked all team members to put time on their cal to read through Octane guides and, do they make sense as you read. If you had to implement something could you do it. So I’ll ask this group to put time on your calendar and do this as well. Please be encouraged to schedule time.

(discussion)

JW: Another opportunity here is that we have added HTML comments in the markdown in the past. The user doesn’t see these. I’ve encouraged people to leave HTML comments in the markdown if they think something needs to be addressed.

### GC co-location docs comment

GC: For things like file layout and component invocation, currently there is nowhere in API docs to discuss that. We document a lot of things on Ember.Component, but it is hard to put things on there. I think having all the invocations in there is difficult, and the guides should have the invocation syntaxes.

RJ: I agree physical location is not a thing Ember is super good at, it is the resolver. But the onboarding guide etc should of course document that stuff. I think the API docs should attempt to enumerate all options, but it isn’t always possible.

GC: I think API docs are actually for documenting API, and some of those things are not clearly API.

JW: The most useful thing would be to look at examples of those things. There are different categories of things. Say something has code that goes with the explanation. Does it need to be listed in native class syntax and not? If it doesn’t have an impact on what it does? And there are others were we need to show the options available. The other thing is if this is feeling weighty, if there is too much to explain when explaining API surface, that might be a clue that a deprecation is the right way out.

JW: Would you list off a couple examples?

GC: Yes I think so, off the call.

(discussion)
