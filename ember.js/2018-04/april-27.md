# Meeting: Ember Core Team 2018/04/27

## Agenda
  Previous week: +Meeting: Ember Core Team 2018/04/20


- Homepage Strike Team (TD)
- Router / Screen Reader Issues (MS)
- MU Namespace Scratchpad +Module Unification Namespace Scratchpad  (MB)
- [Angle Bracket RFC](https://github.com/emberjs/rfcs/pull/311) (RJ)

Next week: +Meeting: Ember Core Team 2018/05/04

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Pennter
[x] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[ ] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[ ] Katie Gengler
[x] Melanie Sumner
## Minutes

**Homepage**

TD: There was a steering committee meeting before this but it sounds like it wasn’t super attended anyway. I talked with Sam and Ryan about homepage stuff. I want to propose creating a sprint team that has a rep from a number of teams and grant a mandate to update the homepage. I want it to not be a boil the ocean redesign task, but focus it only on the homepage.

MS: I think some of this is already happening. We have a style guide and a ui themeable addon. And the idea has been to create a theme for each of the Ember sites. Sam at least has been on some calls regarding that effort. His plan is to maybe do three designs for the homepage for people to consider. I think there is a big leaning toward shipping things incrementally.

MS: We talked about splitting the learning team into a learning and marketing team. I think locks is focused a lot on the api docs, where my work leans away from that toward the website and stuff.

YK: I think there are two blocks of work, but I do think that marketing and docs are part of the same problem: how to people understand Ember. I wouldn’t want a new top level marketing team, but we can identify when there is confusion or failure and navigate it into one of those sections.

(discussion)

TD: I think there was concern that myself and YK don’t delegate authority on things like the homepage to people who are interested. Would people be ok with an effort to focus on the homepage?

YK: I think MS was saying we should fold it into the styleguide effort.

(discussion)

YK: I have a proposal: Any teams working on this are part of the learning team. And TD I think you want to create a team for working on the homepage.

(discussion)

TD: I don’t understand the coupling between the style guide and the homepage.

YK: Let’s say the homepage team starts opening PRs, they may make changes that are in conflict with the styleguide efforts. For example they introduce some new style for buttons.

TD: Ok. I am desperately hopeful that MS is part of this effort. I‘m a bit worried about time for you and others.

(discussion)

**Router / Screen Reader**

MS: I need some help from someone who can validate and focus ideas.

KS: I can do that.

RJ: It is an outlet thing.

KS: It is a little more complex. An outlet doesn’t always have an element for example.

YK: If we need to create a measure hook I need to be part of that. MS we don’t currently have a way to know rendering is done.

KS: We did add a settled promise for fastboot which is good enough. If you don’t care about forced layout issues. We moved this to spaniel at work.

YK: Yes we need to do something that addresses the interleaving. What is the forced layout issue:

KS: You don’t want to interact with other things, like ember cli lazy image…

YK: We could do the settled promise as a first pass to get it better.

KS: Pages can have multiple actors, and you need to coordinate them

(discussion)

KS: One easy step would be to find out where people are monkey patching and make sure the APIs are stable.

RJ: We could also add the existing addon.

YK: I think we already have a heuristic for when fastboot must flush, why is that not good enough for the notification stuff.

EF: Some things like focus have side effects. I would really love to participate in the spec and see if there is a way to tell the browser what to do. We might need to get changes to the spec to better handle this, which could take time for sure.

**MU Namespace Scratchpad**

(discussion)

**Angle RFCS**

RJ: Are we good?

GC: I think we are. Someone was saying they would make small changes to address some comments?

RJ: ah yeah that is me. I will do that and land it.

**Ember data**

RJ: FYI the ED team is in Greece looking at the onramp and other things. But I want to land the record data RFC, it has been FCP for several months.

YK: Why are they not merging it?

RJ: Right, yeah.

**Ember modules API**

RJ: In progress. Kris is doing the yeoman’s work of untangling things. I think we are about 50% done, half are in the new official locations. I’m playing with emitting the APIs to rollup and seeing what we can shake out



















