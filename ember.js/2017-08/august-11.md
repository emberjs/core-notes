# Meeting: Ember Core Team 2017/08/11

## Agenda

- 2.15 stable on monday, 2.16-beta (MB)
- FCP Custom Component API (RM)
- FCP for ES Classes RFC

## Attendees

YK, RJ, GC, KG, KS, MB, DG, TD, MM, IT

### Minutes

#### 2.15 stable, 2.16 beta

RJ: Scheduled for Monday, need blog posts. I have people on the CLI part of the blog post. I think the rough summary is bumping glimmer-vm and landing phase 1 of the routing service. Matt I don’t want to volunteer you..

MB: I will work on it this weekend, and thanks to RM for making the release date very visible!

RJ: Right, and thanks to people for fixing the issues in beta.2

(discussion)

YK: bekzod is awesome

RJ: No blockers from my perspective, just the blog post. I’ll confirm with RM and the learning folks to check in about the learning team. 2.16 is the first version where we want to update all the docs to the new modules.

YK: Sounds like we did update the API docs to be module based?

RJ: No, but that is the plan for 2.16. need to update the blueprints etc. We haven’t done the work we talked about last week.

YK: Ah he mentioned it was done in Discord.

RJ: It might be

YK: It is a blocker for 2.16

RJ: Right, it can’t be that much time. Anything else?

 MB: Go/no-go?
 
 RJ: There isn’t anything, I just checked. Great.
 
#### Custom Component API

YK: Need to ask GC when he gets back. Need to reconcile with what Glimmer does.

RJ: That’s right: One of the unresolved items is an implementation issue, the other is about capabilities we want to offer.

YK: We still want to expose this in Canary behind a FF.

RJ: Right it is. I’m under the impression that some of this is part of the VM now, the capability stuff.

YK: Yes, in glimmer master capabilities are a public API.

RJ: Right we should confirm it is compatible with the Ember API design.

YK: The difference is that the Ember capabilities are versions. We can layer it on top.

RJ: so no FCP this week, we will wait on GC. I will comment saying we talked about it and list what we would like to see to wrap it up.

#### ES classes rfc

RJ: last week we said this was basically ready, there has been no additional changes since last week.

(discussion, some things like concatenatedProperties will not work out of the box)

RJ: We changed this to punt on mergedProperties etc to the next RFC. But made clear those issues are not part of this RFC.

YK: And with this we can use decorators etc?

RJ: Yes we have a library but we cannot do some things without the changes in this RFC. Specifically events. I’m asking to move it to FCP and plan to talk to KS about implementation this afternoon. I maintain much of this is just bugfixes or changes to internals (maybe no FF), we’re just making this public API explicitly.

RJ: I will put this in FCP.
