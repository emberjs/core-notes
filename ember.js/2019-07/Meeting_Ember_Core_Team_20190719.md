# Meeting: Ember Core Team 2019/07/19

## Agenda

- (public) (**2 min)** Determine note taker (MB)
- (public) (10 min) Are we on track for Octane? (Upcoming release weeks: 3.12 is Aug 5th, 3.13 is Sept 16th, 3.14 is Oct. 28) (JW)
- (public) (10 min) Upcoming F2F, travel etc. Sept 14-15 in Chicago pre-EmberCamp? (MB)
- (public) RFCs
  - → FCP
  - FCP → Merge
    - `@classic` Decorator [https://github.com/emberjs/rfcs/pull/468](https://github.com/emberjs/rfcs/pull/468)
    - [Deprecate mouseEnter/Leave/Move Ember events](https://github.com/emberjs/rfcs/pull/486)
  - → FCP to Close
  - FCP to Close → Close

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [x] Leah Silber
- [ ] Robert Jackson
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

- [ ] MB - upload notes
- [ ] YK - write up an Octane release plan (suggested to write it in the format of a release blog post. Present to the team in ~2 weeks)
- [ ] JW - chat about the dropdown
- [ ] CG & JW meet about docs
- [ ] MB - Nail down times and locations
- [ ] JW - add calendar to future agenda
- [ ] MB merge steps for classic decorator RFC
- [ ] RJ - create the tracking issue for RFC Tracking (put this on next week's agenda)
- [ ] CG - merge the mouse events RFC

## Minutes

### Notes

MB: I got it

JW: And you will upload?

MB: I will upload

### Octane

JW: Are we on track for 3.13? 3.12 releases around Aug 5th, Sept 16th is 3.13.

YK: What I would like to do is make 3.13 the first stable release with all the features and you can easily opt-in. And on 3.14 we can make it a default. There are a lot of users who are early adopters but not using Canary (like Tilde) and so this would give us a chance to test.

TD: What do you mean by "flipping the flag on by default"

YK: So forgetting about generated apps... I'm not sure. It could mean generated apps. It could mean when we make the official docs site about Octane. I think it is basically about new apps honestly. I need to think about it, I discussed with GC and we had a list. I think there are some difference between "I opt into Octane" and "Octane is live".

MB: What does Octane being "live" mean for existing apps?

YK: At least generators will become Octane.

CG: Native classes is one thing that new stuff will generate, but for glimmer components they will only generate if you have the glimmer/component package installed.

JW: I'd like to propose that we put an action plan like this into writing. Might as well think what it looks like for the release post.

YK: Yes I'm basically taking the temperature to see if people are into that.

TD: I'm not sure if I understand this plan.

YK: My general theory is that there are a bunch of things about how Octane works as a group of features which we have not tested very thoroughly. I think people who know it well have tested, but once these are in stable many people will test it for the first time and they will find stuff.

TD: I'm not sure if the people who would be blindsided by the new generated output will test even on stable.

YK: The hypothesis comes from the idea that we already have unreported issues.

MB: What Octane features will land in 3.13 for their first release?

CG: tracked properties and the final version of Glimmer components will land in 3.13 for the first time.

CG: This would put Octane's release in October?

YK: I think if we do this plan we talk about 3.13 as having Octane as an opt-in thing. It has all the features and it is supported.

EF: Yes, we should get credit for it being there

CG: I'll be focusing on performance for tracked properties for the next few weeks. On top of that polishing up the documentation. That is good but could use more eyes and fleshing out. And the inspector needs time as well. We need to consider how people will use the inspector on Octane, I think we need to rethink some things. I think this is a good time to create a public API for "Debugging" that things can hook into. Right now it reaches into metal for things.

KG: Oct 28th is 3.14

JW: I also want to say what this means for our documentation. Are we saying Octanified guides ship at 3.13 or 3.14?

YK: I think the options are a) yes, there by default, or b) they stay where they are now or c) they are in the dropdown.

DG: There is an alternative in that we have a "legacy flag" where you opt into the old generators.

YK: Part of what makes me uncomfortable with 3.13 is that I think it is early in terms of what will be good, meaning inspector and codemods. I think we can get to a point where eager early adopters will be happy in 3.13 but I am skeptical that it will be perfect for everyone in 3.14.

YK: For example just getting the components tree to work is probably required. Getting it to show everything correctly might not be needed.

MS: I don't think we're rushing ahead though, we intended to ship around 3.8 originally and we kept it back.

YK: Yeah it is two things. Both 3.13 feeling rushed and the idea of having a stable more tested release before going live.

CG: I'd like to release the docs in 3.13. I think there will be another wave of people who won't consider it an option until the main docs ship.

YK: I think it is in the dropdown alongside the current option. There is a technical question if it is possible. But the whole point is if you are not adopting it you shouldn't be thrown into the new docs.

YK: I think if we can say 3.13 and 3.13 Octane that is ok.

(discussion)

YK: I agree that if 3.12 effectively has Octane...

CG: But that ship has already sailed, tracked properties are just a 3.13 thing.

JW: So it sounds like we need to bring this back and hash it out next week or week after?

YK: Not next week, have TC39

JW: I'm worried about the timing then

YK: I think this is not so difficult, because both sides of the possibility require Octane be in 3.13

(discussion)

JW: OK takeaways. YK will write something up and share it with people for next week, we can discuss in two weeks.

JW: And CG we should talk about things one on one anyway.

### F2F

MB: Just want to get it figured out if this is planned: Sept 14-15?

MS: Maybe redshift again?

(discussion)

MB: I'll start an email and thread to get this put together then.

(discussion)

JW: I'll send out an email and try to get us to hold dates

### RFC Review

JW: This is ready to merge after a week of FCP. All Good?

(no pushback)

JW: So be it! MS will merge, CG will update the tracking.

### mouseLeave mouseEnter

EF: I checked our notes from last week, and there was nothing we were too concerned about upon review. I don't think anything has changed.

JW: Who can land it, and who updates tracking?

JW: Ok will assign tracking to RJ

TD: Since RJ is championing I don't want to make sure it gets lost... Can we add it to the agenda for next week? Thanks.

JW: So we can merge today?

TD: Yes

CP: I'll land it
