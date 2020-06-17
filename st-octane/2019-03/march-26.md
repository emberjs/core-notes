Meeting: Octane Strike Team 2019/03/26

Overview
Location

BlueJeans: https://bluejeans.com/236115101
WebRTC: https://bluejeans.com/236115101/webrtc
#st-octane on Discord

Attendees
[ ] Chris Garrett (CG)
[ ] Jen Weber (JW)
[ ] Melanie Sumner (MS)
[ ] NullVoxPopuli (NVP)
[ ] Robert Jackson (RJ)
[ ] Tom Dale (TD)
[ ] Stefan Penner (SP)
[ ] Izel Nakri (IN)
[ ] Yehuda Katz (YK)
[ ] Ricardo Mendes (RM)
Agenda

Last week’s agenda: Link


[ ] Review last week’s action items
[ ] Agenda item 1 (TD)
[ ] Next steps for the Octane Guides
[ ] How are we gathering Octane preview feedback?
[ ] What remains for Octane to be feature complete? Or turned on since they are behind feature flags
[ ] Quick retro
Action Items
[ ] Ember Data docs


Notes

Conversation Topic (Usually an Agenda Item)

TD: Blah blah blah.
CG: I agree wholeheartedly.


Next steps for the Octane Guides
- Simplify language
- Hard look at URLs - find the balance between general web concepts and discoverability when someone already knows the term
- Write down the tone & voice we are looking for, define the audience as a next step
- Work on redirects at some point
- Important to get the outdated/incorrect info out of the API docs - should make a quest issue, and instead of individual



Getting Octane feedback
- ping Tom about making a discuss forum post
- CG will follow up with Mike North about getting some people to try the docs together with Octane
-


What remains for Octane to be feature complete? Or turned on since they are behind feature flags


https://github.com/emberjs/ember.js/issues/17234


emberjs/ember.js#17234


1. Need to get ember-cli-babel to transpile decorators. Has PR, needs benchmarking bc Stef needs to know the impact to make sure we don’t regress people’s builds
2. Turn on feature flags for decorators and tracked properties. Decorators could be turned on now, CG will talk to the rest of the framework team on Friday. Tracked properties, found an infinite cache busting bug. Worst case solution, disable computed properties being able to watch tracked properties. The opposite would still work. tracked could watch CPs and it would be fine.
    1. Ideally we don’t need to do the worst case solution. Linting for it is hard
3. Injection RFC should be settled. Kris Selden is ok with the plan. This Friday, hope to FCP it
4. Build out on, bind, with args helpers
5. Classic decorator RFC - will warn people if they are using “classic” features like mixin, maybe CPs but not sure yet
6. After these, can focus on upgrade guides

Help needed?

- Implementation for on and with args once FCP’d, and classic decorator. Anybody could help with some of this. If these are FCP’d Friday, we want to have them ready within a week
- Feedback on RFCs (not the writing/wordsmithing of them but commenting on the API design itself)
- +Partial Application Helper Breakdown
- Actually testing out Octane and giving feedback


Quick retro
- How did we do?
    - CG: Pretty good! Could have used a more thorough preview site but also would be good to have the website redesign. We are catching bugs! Need to lock down the Inspector stuff.
    - RM: Would have appreciated if it wasn’t such a scramble. Unsure of what to document at one point, MU dropped. MU dropping was low impact. Only after EmberConf we solidified a few things.
    - RW: Nothing to add. Have more availability now!
    - JW: MU dropping was minimally painful. End scramble went well with lots of help from lots of people. I didn’t close the loop with the quest issue because I was running out of time to just keep up with PRs. Will do that now!

