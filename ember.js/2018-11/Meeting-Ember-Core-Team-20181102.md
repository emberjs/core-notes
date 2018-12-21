# Meeting: Ember Core Team 2018/11/02

## Agenda

- RFC Roundup
  - FCP
    - Router Helpers - Go for FCP
    - Logical Helpers - Go for FCP
  - FCP To Merge
    - Deprecate String Lookup `setComponentManager` - Go for Merge
  - Needs Champion / Response
    - Route Action Helper - Decline to Champion
    - Deprecate Component Lifecycle Events
    - Move QPs To RouterService
  - “Go” / “No-Go”
    - `array` helper - https://github.com/emberjs/ember.js/pull/17054
    - Modifier Managers - https://github.com/emberjs/ember.js/pull/17143
      - DOCS https://github.com/emberjs/ember.js/pull/17176
- Topic: Route Metadata
  - General problem that typically you want to attach metadata about a page transition that is application specific. Today there is not a super obvious way to do this. Want to confirm we are not foreclosing on something.
- Topic: `{{use` or alternative MU import system

## Attendees

[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

Promises out of the actions queue

YK: Has some concerns that moving promises out of the actions queue as a bugfix will have unintended impacts

KS: The idea, the abstraction is that the runloop was always as the root of an event. But in fact in apps it is sprinkled all over. We do want to change backburner scheduling to make rendering/router transition to happen… We want to have the effect of the actions queue settling before rendering. As backburner is today we only do that for the first level of nesting. In the end, that isn’t going to render in the browser it will just be in glimmer

YK: DOM churn

KS: right DOM churn.

EF: So we don’t ever flush in a microtask queue. We can’t know when microtasks are done

YK: We have our own implementation of zones that basically has the right time. I don’t think this is what is implemented. I want to separate two things: what we want to build, and what we will be doing to peoples apps.

KS: I think we’re underestimating the impact, yes. Especially on tests.

YK: I want to talk about apps. So GC and I discovered that our app had a condition that was causing the app the crash. When we dig in we found a related pathology: In ember data is you loop over a bunch of lazy loadable things and use .every then you may lazy load one thing, then wait (the every read one thing), then you enqueue another “please wait”. But if you loop through them you continually keep going back to the backburner queue. So what happened was we triggered 10 backburner queue loops which was flagged as an infinite loop by glimmer.

YK: At every step we got one further, but backburner noticed there was something new to do, went back etc

RJ: Right, the renderer in Ember does this. Not backburner alone.

YK: Yes good clarification. Anyway that would be fixed if it was based on promises.

YK: This creates a worse DOM churn problem with promises. You may render a bunch of DOM in Glimmer but then go back to do more once data loads based on a render pass.

KS: If you look at the React router stuff it just does the DOM churn and lets the browser handle it.

KS: b/c backburner moves from task queue to task by microtask at least the first promise resolution happens first. I wish the promise spec resolved resolutions right after their parent. the fact that nested promises get put at the end… I know it is simpler but it doesn’t make sense from a priority standpoint.

YK: but basically us giving control over this stuff to the browser means we don’t control it.

EF/KS: that is what people want!

YK: I think it will be painful.

EF: So we can do things. First there are already promises in apps floating around and we need to do something with them. We could leave RSVP promises with the current timing, and people could move over on their own schedule. YK seems concerned about changing RSVP to promises and it causing pain.

RJ: I would like to do this, I think it is right to do.

YK: Can we make it an optional feature?

RJ: Let’s make it canary first? I don’t want it to trickle down as an optional feature. I want to push back on the vague “oh it feels bad”

YK: that is all I have.

RJ: I understand. We need to gather new information. We should play with it in real life.

YK: I agree.

TD: Who is taking the action item?

RJ: I will since I care about it passionately.

(discussion)

YK: this is very similar to the jQuery migration. They have a lot in common.

FCP: Router helpers

TD: Can we talk about this change? https://github.com/emberjs/rfcs/pull/391/commits/130ae28006294c9771abd01114ec525ff21bdecd

RJ: This is already what link-to does today.

TD: There is a line here that the model hook will always run.

RJ: So the thing is that url-for will always generate a string, so there is no object model to pass

CH: There is an attribution thing that you can use to weakly associate metadata about the component

KS: He is saying that the event and the element get to the transition. The event delegate has the event, so if you want to use an element modifier to associate something with the element you can. This is less magical to me. If you have serializable date you can use a data- attribute. CH had some example cases where it was needed.

YK: The biggest thing that came out of the last meeting was that “don’t break the web / urls are important” has been a core thing of Ember, so we should explain that and this is why using a URL is good. href makes SSR and accessibility just work without shenanigans. We should push that.

TD: so we are asking CH to note this in the RFC?

CH: It is noted.

TD: Ok, so we are go for FCP? Great I will take this one.

FCP Logical Helpers

CH: I added this. People like it. It has a champion. We should do it.

(discussion about neq, and if composing with parens is annoying)

RJ: I wanted to make sure Matt was persuaded to my answer in the RFC. This is about short circuiting and having a helper have knowledge about when things are evaluated.

KS: We need to come up with a ref API.

YK: There’s “should this look different?” and “should there be infix?” Infix would be a big change so let’s not propose that without doing it. We can discuss if we want the left hand version to look different.

RJ: One of the motivations for this as stated in the RFC is that we can do smarter optimizations like short circuiting.

EF: Does the manager API expose the raw References so you can do evaluation lazily?

RJ: No, the helper manager RFC explicitly said we would explore that in a future RFC.

KS: One problem is that this may clobber existing user helpers and break them. Also why are some of them abbreviated but not others?

YK: For terseness.

RJ: I think these are the helpers already used in a popular addon.

KS: So if you’re using that library you can just drop it if you’re only using these helpers.

RJ: We can update the truth helpers addon to not ship duplicate helpers with the appropriate version of Ember.

FCP to merge "Deprecate String Lookup `setComponentManager`"

YK TD RJ: No objections

RJ: I’ll take care of merging it

Route action helper

RJ: I appreciate the RFC and effort here. I don’t want this to happen though. The idea here is that you have a way to access route actions from the template. I don’t think this is the direction we want to go, you should…

KS: My biggest issue with route actions is that b/c routes are a class they use this. for state, and the route no longer is the deserializer of the URL etc. The idea is that route actions were supposed to transition or set session state, something that wouldn’t violate “right click new tab” but that is not how people use them. Your controller right now is your root state, and your actions to mutate that….

RJ: FWIW the majority of route actions I have seen in use would be solved by CH’s RFC. “I have an action that is transition to” for example. A handy way to put an action on a non a-tag.

TD: Ok, I will volunteer to decline to champion this.

MS: This may have come from a list of things we wanted RFCs for, beware.

RJ: It might be, but I don’t think so.

TD: From a process perspective I think I can say we don’t want this. But I should FCP to close.

RJ: Yes, though I think that process change is still in process.

YK: I think the community wants to deprecate controllers, and this is an attempt to move that forward. People are saying here is our plan, if core says “we have a plan” they maybe deserve more than that.

(discussion about controllers)

TD: Should I still FCP to close?

YK: Yeah please just reach out to me and lets talk about language.

## Action items

- [ ] Add mode for taking Promises out of the action queue behind a feature flag (@Robert J)
  - [ ] It will not work with the old test API which we need to document if we “go to market”
- [ ] Summarize the group’s thoughts on QPs (@Edward F)
- [ ] FCP to Merge
  - [ ] Router Helpers - @Tom D
  - [ ] Truth helpers - @Robert J 
    - [ ] @Robert J to leave feedback on including `not-eq`
- [ ] FCP to Close
  - [ ] Route actions - @Tom D
    - [ ] Routes are intended to be stateless serializers and deserializers
    - [ ] Route actions encourage people to put state on the route
    - [ ] To eliminate controllers, need to solve the QP problem. Once that’s done we can deprecate controllers.
