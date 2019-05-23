# Meeting: Ember Core Team 2019/05/17

## Agenda
    
- (**2 min**) Publish team meeting minutes? (RJ)
- (**10 min**) Accessible Routing (what do we think of the [updated RFC](https://github.com/emberjs/rfcs/pull/433)? What do we think we should do next?) (MS)
- (**5 min**) [RFCs as an Ember app (deployed to rfcs.emberjs.com)](https://github.com/emberjs/rfcs/pull/489) (RJ)
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Promote

## Attendees

- [ ] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [ ] Chris Garrett

## Action Items

- [ ] Matt will publish backlog
- [ ] RJ will add “determine note publisher” to the agenda

## Minutes

### Rwjblue Dictatorial Powers

RJ: I am going to jump the agenda queue.

*(Ed: Who has granted him this power?)*

RJ: Someone brought up why we are not publishing the core notes. We are taking pretty good notes but it requires someone to go back and sanitize and update.

MB: I’m happy to fill in the backlog. Sounds like we should update the checklist to include a note publisher.

RJ: Yes I will do that. Electing a note taker has let us take much better notes in general.

### Accessible Routing

MS: I think this RFC is ready to read and consider. What would be the most useful? Should we ask people to read it now, or have people and read it next week?

RJ: The RFC currently proposes two solutions. First thing is we need to pick one. Would be useful to describe the two solutions at a high-level for people to understand, then ask people to read the updated RFC.

MS: There’s now two potential solutions. The answer might be one or both or somewhere in between. The first one is based on Léonie Watson describing how you use a screen reader. First thing you learn is how to stop it talking. Taking our cue from that, we developed a way (not using ARIA live) to let the route transition has occurred. I wrote an addon where you put the component inside your appication.hbs and when the page transition happens, a message is read to the screen reader user: “Navigation is complete, you may now navigate” and focus is reset to the top left of the page and the user can continue as they wish.

MS: This solved two very big issues with Ember apps and screen readers. Page focus wasn’t moving at all and there was complete silence if you have a screen reader turned on. However this would require putting some extra stuff into the DOM. We could put this in an addon and include the addon in the blueprint.

MS: I floated this solution with screen reader users. It meets the a11y requirements and “works better than I thought” which is great.

MS: The other approach is content focus. Ember self focused and ember-a11y do this in different ways. After a lot of digging, it turns out we have this private renderSettled API where we can get an event at the right time. I wrapped a main element around the outlet in the application.hbs, lokoed for it after the render had settled, and put focus on it. There’s also the idea that we could do something with the primary outlet for the application. Do we want to treat that differently than other outlets. Then we wouldn’t be users the ID that they could do stuff that would be bad.

MS: There are probably other edge cases I haven’t thought of, and I’d trust that everyone here already has 5 in mind. I can go through those one by one and make sure we have an answer.

RJ: So we have two plausible solutions for refocusing something in the DOM that causes screen readers to read it. My gut feeling is that refocusing the main outlet is closer to the original goal, let’s not make it worse. My personal take is that’s a good default starting position. Doing something more specific at a particular outlet when something changes, it seems like assistive tech users pushed back on that being better because it’s something new they have to learn. Because it’s different it may be hard to understand what’s happening or that you’re in the middle of the page. I assume that’s why that’s not in here as a proposal.

MS: Correct, it’s not considered better.

RJ: It would be great if we did that and got consensus among all SPAs. But that’s a different story. I don’t feel strongly about which of the two solutions. The second one seems like the most obvious starting point. Did you cross-link your notes from the RFC?

MS: I didn’t, but I just shared them in the core team channel. I think people might be surprised at the journey we went through. It ended up being a lot more complex than I thought it would be. Last night we had a call with the developers who wrote NVDA. Yehuda feels like he understands the problem space a bit better. I’m thinking the navigation approach could be used by developers today who need an unobtrusive way to have accessible routing in their applications and we could evangelize that. Talked with Chad and there’s more work to be done for routing in general, and doing the focus stuff should be part of that. I think Rob mentioned it would be nice if renderSettled could be used for a few other things.

RJ: Yes.

MS: Feels like there are more conversations to be had. But I’m not sure how to get this to the next step.

RJ: We need to review the RFC and be ready to talk about the merits of each approach and try to make a decision next week.

KS: The only hesitation we’ve made about making renderSettled public is that people don’t use Ember.set or set a tracked property in it. That defeats the whole point of render being settled. Your use case of focusing something is ideal.

RJ: The same is true of the testing use case I want it for as well. Where you set a thing and want to know when it’s done.

MB: What’s the difference?

RJ: Right now renderSettled is an internal thing. The renderer will keep looping until it’s settled. So you can do some updates in the hooks and those aren’t considered backflow re-renders. It doesn’t mean done after rendering is done, just after the next time the render queue is flushed. renderSettled is an API on the renderer that’s used by things like the visit() API internally. So we can provide a Promise that only resolves once everything is flushed and settled.

KS: Any API like this creates an arms race. “When are you really really done?”

KS: I think we need to expose it, but is there something we can do that there are only certain kinds of work you should do in it?

MB: You could at least assert that nothing gets added to a runloop.

KS: The problem is you’re in the microtask queue and there’s no way to know when the microtask queue is also done-done.

MB: Mel, is there a reason afterRender works for the first case and renderSettled wouldn’t be needed for that case?

MB: It seems like option 2 requires renderSettled.

RJ: Both options require renderSettled.

KS: In a simple example afterRender *might* work.

MS: The reason I used afterRender is because I didn’t want to use private API from my addon. So I used schedule and afterRender even though it’s not reliable.

KS: You may have been able to use requestAnimationFrame.

EF: That’s what I use every time I have this use case. That might be a good use case.

MB: Could you implement the message approach by making the message the first item in the outlet?

MS: There might be some more permanent long term work we can do to make the message approach less different.

DG: So the expected experience is re-reading the content after a transition? I’m not sure we want to go out on a limb with this unique behavior as a signature of an Ember app.

RJ: In the second solution I’d rather have a component solution instead of a special ID. At which point the two solutions are basically the same, in terms of usage. Underlying details are different, but it’s about focusing after a transition. I think having a component is the right level of composability. Let’s you select what element it is, and makes it clear where to go look for things if you want to understand what it’s doing.

TD: Point of order. We are 37m in.

RJ: Folks, try to read through the RFC. One of these is totally doable right now.

MS: I tested the second solution in NVDA and in VoiceOver. I need to test it in JAWS. But I know for sure the first solution does work.

RJ: I’d encourage folks to actually try the addon out in VoiceOver or whatever screenreader.

### RFCS as an Ember app

RJ: Chris Manson opened this PR yesterday. There is a hook that compiles the Markdown files using Gitbook and publishes them to GitHub Pages. I’ve taken to linking people to those rendered files for consistent URLs. This PR makes RFCs an Ember app that is deployed to Netlify. One problem with GitHub Pages is it’s not on our domain, so we don’t have as much control to do things we might need to do like redirects. I’m in favor of this but I wanted to discuss it before merging.

KG: I’m concerned about PR noise here. For example, the PRs area shouldn’t be full of dependabot dependency upgrades. I’m wondering if we could separate the RFCs app into a separate repo that consumes the RFCs repo.

RM: We set up something similar for guides and it worked pretty well. The guides-source is relatively empty and most of the code is in a separate app repo.

RJ: I will talk to Chris and see if this is feasible.

JW: One benefit of this is automating deploys and preview published links.

RJ: We can have the CI of the RFCs repo trigger CI jobs for the other repo. Which is only a relatively recent Travis addition. I’ll chat with Chris Manson to figure out if we can do separate repos. I am sensitive to the PR noise issue, especially since people subscribe to notifications for this repo to learn about RFCs.
