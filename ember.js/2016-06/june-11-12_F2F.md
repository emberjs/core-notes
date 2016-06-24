# Ember F2F Vegas, 6/11 - 6/12

Attendees: MB, RJ, GC, IT, EF, YK, SP, KS, LS, DG, EB, MM

### In other conversation

- performance issues with module loaders, pojo as hashtables, too many small caches, maps in general and Chrome's typing and IC cache (and its small size), leaking partially initialized types (KS)
- Named blocks / capturing blocks

### Saturday Morning

- [Notes](#notes) - How to best share F2F notes
- [Subteams](#subteams), what works what does not
  - ember security (sub?)team - procedures to ensure timely responses and clear decision making process (15m, YK)
  - router subteam (KS)
- [Committers](#committers)

### Saturday Afternoon

- [Glimmer 2 update](#glimmer-2-update)
- [Removing double extend](#removing-double-extend)
- [mandatory setter and the future of potentially-expensive, development-mode features](#mandatory-setter-and-the-future-of-potentially-expensive-development-mode-features)
- [Glimmer 2 external contribution retrospective: How can we scale community contributions?](#glimmer-2-external-contribution-retrospective-how-can-we-scale-community-contributions)

### Sunday Morning

- [Trademark enforcement](#trademark-enforcement) (LS)
- [1 year roadmap discussion](#roadmap)

### Sunday Afternoon

- [Visioneering Strike Team](#visionering-strike-team)
- [ember-data / orbit collaboration](#ember-data-orbit-collaboration-orbit-walkthrough) (DG) (orbit walkthrough)
- [lazy loading strategy for engines](#lazy-loading)
- [Release coordination](#release-coordination) (SP)
- [@foo stuff](#foo-stuff)
- [isHtmlSafe RFC](https://github.com/emberjs/rfcs/pull/139) :-) :-) :-) :-) (no notes, we just agreed to merge it)
- [Router Service](#router-service)

### Notes

MB: Should/can we stream notes live or something?

YK: Seems difficult to keep occasionally private comments private when necessary. We want to make sure we report on what we said in a timely manner, but it's also important that frank private comments don't end up being pushed into a secondary conversation just so they won't be minuted.

GC: Like company specific items (specific details of apps that aren't public)

EF: Seems like the value of realtime vs. quickly publishing detailed notes is low

MB: Right, just trying to capture the lead we used to have w/ notes. Other projects are starting to do really well with this now :-)

Action items:

- Keep on with the F2F note strategy from last time.

### Subteams

RJ: Current subteams are ember-cli, learning, ember-data. Many are autonomous.

YK: Core is a bit too tactical in my opinion. It seems like some things like performance should be subteams. We should assume that the teams have done well and mostly we don't need to look at the super-tactical things that they've done in detail. Core team members are on the sub-teams, and there are still multiple gates where the core team has an opportunity to re-direct work, but we should generally assume the sub-teams have the fine-grained details under control.

YK: when you look at our agenda it is quite tactical, core should probably not be so in the weeds for these items.

MB: Glimmer feels a little different just because the code is entangled so closely w/ ember

YK: ember-cli is deeply entangled, but the boundaries between the projects are clear, so we can leave a lot of the internal decision making to the subteams.

SP, YK: A good example is RSVP: it can easily be autonomous despite being deeply entangled into our codebase.

YK: Core team is usually in control of gating public API as a process point, which should allow a more decentralized process of doing the work, and using gating only as a spot check that everything is on track with the big-picture plan.

EF: It is important subteams are not actually tied to repos. They should be cross cutting, opening issues elsewhere etc

SP: a team should be robust enough to survive people being gone (ala release)

YK: Suggested changes:

- **the core team should become aware of being too tactical.** For example, we often get too much in the weeds on performance issues; a performance subteam would be better for those items
- subteams should feel empowered to push a features through to the finish line, with members the core team involved at focused points, like the RFC and API design/approval

EF: this is the significant part of being a core subteam/project; that you participate in the "Ember process"

YK: A strategy that we've used that I'd like to keep using is: implement the kernel of a feature in Ember proper through the full RFC process, and implement the full API in user-space as an addon. Once the addon gets usage and feedback, we can fold that functionality back into core.

YK, KS, EF: In practice, this has meant that the "experimental addons" use a certain amount of not-yet-public APIs to bootstrap (we can't always write a complete kernel before experimentation begins).

YK: I think that's ok since the addon itself is absorbing the use of intimate APIs, so the public API of the experimental addon can change slowly, even if the underlying low-level that isn't yet public changes quickly.

KS: A possible problem with with this strategy is that Intimate API usage makes it through the initial design (because it's not mentioned in the RFCs) and don't get pulled back into the kernel quickly enough. This can also mean that the wider ecosystem begins to depend on the intimate API rather than the high-level addon. We don't do enough follow-up and refactor towards the end of a design to make sure we've contained accidental leakage.

EF: One major part of the technical solution is that we still need way more ecosystem-wide testing. If ember-data uses private API that might be ok, but we should know ahead that it breaks.

YK: I think there are three concrete proposals:

1. intimate APIs that are used in experimental addons should be marked (in the source code) and tested (in ember.js)
2. we should CI the QuickStart to make sure that the entire ecosystem works together
3. Final Comment Period (RFCs and "go"ing features should have a one-week period for people to raise concerns before we finalize advancing the feature)

MB: Additionally, it can be useful for people to open an issue describing the API usage and use-case before opening an RFC.

YK: I am concerned about the fact that they are issues.

YK: Rust core has a final comment period- when a subteam wants to merge it thing pops up as a tag etc. When FCP is closed there are no unresolved questions. It forces a spurt of core team engagement.

Action items:

- [ ] Write a blog post regarding how to use an intimate API (mark it, ensure it is tested, open an issue on the emberjs/rfcs repo with use-cases) (ala how to write something like engines that touches a lot of internals, DG)
- [ ] Create a "final comment period". Update the README.md of the RFC repo regarding this (lifted/inspired by Rust). Tweet and share. Process is that the core team liason needs to bring it to core and have them respond. Expand Subteam RFC process to include "going" into FCP.
  - [ ] Should be focused in public API, however in practice core will often delegate to the subteam
  - [ ] Also document good commenting practice, like how to critique and suggest changes.
- [ ] Add documentation to the RFC repo about how to RFC a strike team, and the requirements for a strike team
- [ ] Create a **@each-subteam** on GH for each subteam
- [ ] Create a SUBTEAM doc or guide.
  - [ ] Suggest that notes be stored in core-notes
  - [ ] Suggest that after notes are created a link is posted into `#core-notes` on Slack
- [ ] New subteam: *Performance Team*
  - [ ] Kris will create, liason. Goal of this team is to automate and make following good perf practices easy.
  - [ ] Kris will propose members
- [ ] New subteam: **Render Team**
  - [ ] wycats will create, liason
  - [ ] wycats will propose members
- [ ] Module name strike team
  - [ ] create a charter via the RFC process
  - [ ] wycats wants ed/dan on it to manage constraints "square the circle" ;-) Ed is foolish enough to volunteer.
  - [ ] Current progress https://github.com/emberjs/ember.js/pull/13022
- [ ] Security team strike team
  - [ ] create a charter via the RFC process
  - [ ] EF will become the security contact
  - [ ] EF will take up a strike team to improve the process (https://hackerone.com/)

### Committers

YK: Other projects have different team structures, perhaps we should consider two things:

- path to core is a poor term. Perhaps "committers" (cargo culting the rails term)
- the second circle of people, what we have called path to core, should likely be widened and allow those people access to #core

YK: One of the issues with expanding #core a lot is that we have to pay for Slack, and it's currently funded out of donations.

(Several people expressed a lack of clarity on how companies should contribute to Ember directly)

LS: The most significant financial contribution to Ember is hiring people, and that is fairly decentralized

YK: I really like the fact that this significant financial contribution doesn't need to go through a central decision making process, but that hiring someone doesn't automatically mean that that person is on the core team or has any special authority (of course, hiring someone will give them a lot of time, and if that time is used well, they'll earn up quickly).

LS: Other contributions are fairly scattered and case-by-case.

(Questions about how to fund something like Slack)

YK: if you have a thing to do that is focused and bounded, Tilde will manage the accounting and logistics. There are no concerns about Linkedin etc paying for SauceLabs, but to the extent that we can have Tilde do the busy-work and invoice LinkedIn, it'll be easier to manage all of the accounts, authentication, etc. in one place.

YK: Quite often, the process of getting a big company to pay for something directly is more cumbersome than invoicing the big company, so we should do that if possible.

(People felt that would work very well)

Action items (proposed!!! Really needs a proposal doc):

- [ ] Do it! "Committers"
- [ ] Access to #core #core-ot
- [ ] Options for leaving:
  - [ ] Yearly opt-in to renew your status in the next year's class "Class of 2017"
    - [ ] Remind them that the acct costs $100 a year (or whatever)
      - LS: We'd discussed making sure this process involved a couple different options up front, like "you can bill my company, they'll cover it" (which some people won't otherwise think of) and "I need scholarship for this." Definitely don't want this to be a meaningful barrier to entry for potential committers, just a means of helping us scale up that will most likely be covered most times by generous employers for whom it's insignificant.
    - [ ] Perhaps every six months?
- [ ] Nomination based
- [ ] Count doesn't include alumni

### Glimmer 2 update

GC: Burndown list https://github.com/emberjs/ember.js/issues/13644

GC: Importantly the voyager app at LinkedIn is pretty much running. Unfortunately, at first glance, it didn't perform as well as we expected.

YK: But! It turns out chad was testing some wrong things.

GC: They had some turbocharges that they forgot to apply to the Glimmer build. If you correct that problem the Glimmer2 engine is 25% faster end-to-end time to paint (+network time and eval).

YK: 25% end-to-end improvement is quite remarkable, since it includes so many things like network and evaluation that are generally harder to make progress on. Things like the better representation of templates seem to have improved those metrics.

YK: I expects apps with lots of components will see a bigger improvement

YK: glimmer 1 v 2. Perf analysis: LI provided snapshots approximating htmlbars boot, glimmer boot etc. Ran it on multiple devices and chrome and got reasonable profiling data. We're on the build w/o turbocharges, and an apples-to-apples comparison gives us a 25% improvement.

YK: In terms of LinkedIn-specific turbocharges: two optimizations help:

- eager module optimization 10-15% end to end
- String module optimization (app and addon): about 5% end to end

YK: Combining the 25% end-to-end win from Glimmer with these optimizations is a very significant improvement over stock Ember running pre-Glimmer.

KS: string optimization is hard to measure. Locally we saw good results, prod the number are quite different. We originally saw much bigger numbers than 5%, but in production we're seeing something like 5%, and we think that reflects reality.

YK, KS: It's also worth noting that these numbers seem to scale linearly across modern Chrome on various kinds of devices. Last year, we saw non-linear growth on devices with low memory, and the fact that this seems not to be true at this point is a large improvement. (editorial note: Safari always seemed to have linear growth)

YK: TLDR the two turbocharge optimizations (eager and string optimizations) are low hanging fruit. Krati and Chad at LinkedIn have already done a significant amount of work bringing the optimizations out into the open, and we should try to fast-track upstreaming them.

(prezo by YK and GC)

YK: TLDR LinkedIn already has some good wins from Glimmer 2. There is also low-hanging fruit in container lookups and in the way `link-to` and URL generation are structured. We still have some good headroom before we run out of room to optimize.

YK, GC: Interestingly, the "rendering time" is only about 20% of the total end-to-end time, and while optimizing it is still very important, we haven't focused enough attention on the other 80%. LinkedIn's work is relevant here.

YK: I'm quite optimistic that we will see this number improve. We should make a burndown list of items that will have a big impact with relatively little work.

### Removing double extend

TLDR: The way the ecosystem uses the (private) `_factoryFor` API makes initial eval inherently slower than it needs to be in a macro way. We discussed what we can do to fix this with minimal ecosystem churn.

Action Items:

- [ ] Stef will write up an RFC for `factoryFor` , and replacing `_lookupFactory` (edit: Matt is working on this)
  - [ ] Deprecate `_lookupFactory` in 2.8
  - [ ] Add `factoryFor` in 2.9 with `{class, create}` as a return value
  - [ ] In `_lookupFactory` in 2.9, throw if using anything other than `.create()` (or other API's on `factoryFor`).
  - [ ] Release polyfill addon

### Mandatory Setter and the future of potentially-expensive, development-mode features.

YK: how should I think about dev-mode overhead?

RJ: I think that the quality of errors outweighs perf. If you are concerned about perf use prod.

EF: 20%

YK: I don't want a number. For example, could I make every object in Ember a proxy

YK: It seems like I should just do stuff and see how people react and complain

KS: There should be a log-level for instrumentation. And devs don't always use it for instrumentation.

YK: seems good. I'm more concerned about catching bugs though, which should not require opting in.

MB: Please lets not use the Ember.Logger API, any of that stuff. That should go away in 3.x when IE9 is dropped.

TLDR: As long as a good dev-mode error message doesn't make apps impossible to use, prioritize good error messages over dev-mode perf.

### Glimmer 2 external contribution retrospective: How can we scale community contributions?

GC: Or, "what have you done for me lately?"

YK: GC should talk about it b/c he has spent a lot of time mentoring people

GC: YK and I worked on the foundations of Glimmer. We presented an early revision and people wanted to help. For a while the answer we gave them was "not much to do yet" because we needed to land primitives. Eventually they were done and there was a bunch of work to do.

GC: A lot of that work was "port all the tests to run on htmlbars/glimmer". We did a bunch of work to create a new test harness that would push people onto the right path. Once the harness was done we rolled in more people via the quest issues describing how to do the work, and what was left to be done. That was very successful, and the tests got burned down much faster than we could have done on our own.

GC: The second wave was LI adding a team to help ship Glimmer. Chad runs it at LinkedIn. We needed to figure out how to incorporate another group of community contributions into the process that was adding a lot of high-throughput firepower. At that point tests were mostly done and people were shipping features. Very quickly the low-hanging stuff was done. After that they got more comfortable.

KS: I did a bunch of pairing when things got more complex

GC: then I took vacation. I brought back pineapple cake.

YK: A big part of the success was having a few mentors who understood which parts of the system were sensitive and required questions to be sent back to Godfrey or me, vs. most of the system which could be worked on without a lot of bottlenecking.

GC: I've spent more time mentoring since then. 60-70% of time is working with people. My own time has gone down, but my effective impact has gone way up.

(discussion)

EB: Could we have done anything different to gather efforts?

YK: I think no. It was a smashing success, and I don't think we could have spent more time on documenting the way to do the work that was still open. The amount of code review effort is "painful", but the result of it is that we now have more than five active contributors to Glimmer, which is great!

MB: I've had this work well mentoring an individual as well, helping them succeed as a first contrib.

IT: How did you guys get new people?

RJ: Big company! (editorial note: the assumption was that we could get a lot of people easily because LinkedIn was willing to fund people to work on the effort)

YK, SP: No no. We had lots of non LI people that participated significantly, including people who are now very active contributors.

EF: any time you can put in the time for the harness and documentation, that is clutch.

YK: Yes. The more you can use the leverage of the people in the core of an initiative to make tools like CI, harnesses, documentation, etc. the more effective everyone contributing can be at every level of involvement.

EB: Is there a blog post or retro we can prepare to help new people be contributors? "what you should expect when you are expecting to contribute"

EB: There is a problem with the works-for-me mentality. Has anyone written something on being "framework-minded" or the value of contributing upstream

(editorial note: YK gave a talk in 2012 about this topic that may be interesting: [On Building Frameworks](https://www.youtube.com/watch?v=UpFIqITRXtk))

SP: I think it helps to make sure issues/PRs don't linger.

KS: my wife says I must say "yes, and..."

YK: I prefer "WWCSRD"? What Would a Customer Service Representative Do. There is always interaction, always people watching in those cases.

YK: Always assume that someone's pain is real, and always attempt to understand and empathize with it. Always start by acknowledging frustration and never talk down to it or reject the emotion they are feeling. Once you have done that, you can try to drill in to what the real issue is.

YK: My favorite example is: if someone says "your docs suck", they really mean "I am feeling frustrated now". Only by acknowledging their frustration and trying to understand their head-space can you drill in deeper to figure out where the concrete failure is. (hint: it's rarely "your docs suck").

MB: I really like [contributors-on-github](https://chrome.google.com/webstore/detail/contributors-on-github/cjbacdldhllelehomkmlniifaojgaeph?hl=en) for building empathy

(agreement)

YK: One good trick is to try to repeat back a frustrated person's own words in the maximally charitable way. If you've done that,  and they accept your summary, you're instantly in a way better place for further discussion.

IT: I've had success reaching out privately to people after one or two things to offer support, kudos and more work ;-)

YK: I think the thing is that you know this stuff was true, but focusing on it during Glimmer 2 was **still** surprisingly successful. It's almost impossible to over-invest.

EB: Can we automate this better?

YK: I think the quest issue is the format of this thing, especially when combined with the automatic harness for the work to automate the "simple parts".

EB: If we had a roadmap we could nerd-snipe people on these things and make progress

SP: We've had failure delegating big complex things that are under-thought

YK: The quest issue tooling (harness) and docs made it easy to give people feedback and get work back on course.

(discussion)

YK: One of the goals we have is to help people to convince their boss that the work is valuable and will be accepted. By giving a very clear roadmap for a specific contribution, it's a lot easier to get work time to work on things, and then show success to your manager so you can get more time.

YK: Pitching toward a person in a higher-bandwidth medium to demonstrate appreciate and process guidance and work guidance is helpful.

### Trademark enforcement

LS: People send stuff regarding how we do enforcement of trademark. So far, I politely reach out to people, and no legal enforcement has been necessary so far at all.

EB: Why do we have a trademark etc?

YK: Trademark, and brand control, allow us to control and maintain a coherent vision and gives people a simple way of understanding when some message is coming from that coherent vision. *Most violations are not intentional.* They just don't realize that a particular thing that they're doing could lead to confusion about who is sending the message.

LS: I will keep following up. For example there some projects that have incorporated the Ember logo into their own logo. More training companies and whatnot have popped up. Please keep sending things, but don't expect a quick response b/c they take a lot of time to craft.

LS: Using the Tomster for a logo/advertisement etc is basically no-go.

RJ: We talked about the corporate Tomster thing last time?

LS: I'm blocked on design, getting someone to work on page design for that. A lot of people want a prop, I'm also trying to figure out how to do that. Main reason it isn't moving forward is lack of design resources.

YK: FWIW, a lot of people have expressed that our policy isn't very clear, but we do have quite clear, in-English (and in-legal) versions of our policies:

- [Ember.js - Legal](http://emberjs.com/legal/)
- [Ember.js - The Ember Logos](http://emberjs.com/logos/) (with high-res art for compliant uses)
- [Ember.js - Tomster FAQ](http://emberjs.com/tomster/faq/)
- [Tomster Commission Request](http://emberjs.com/tomster/commission/)

YK: And these *do* come up when you search "ember.js trademark" on Google.

Action items:

- [ ] Keep sending in uses of our trademarks that could cause confusion (and be patient as Leah reaches out)
- [ ] Please feel free to point folks at the logo usage page if they have questions

### Roadmap

YK: We need to increase clarity in the community, and improve the vision.  The fact that the community is confused means that our best marketers are not able to properly help.

SP: I think one example of this working poorly, is with routeable components. Everyone I have spoken to have entirely misunderstood the situation.

SP: I propose that we do not talk about the solutions to specific problems, and instead discuss the issues.

YK: I totally agree, and is one of the primary reasons I wanted to discuss the roadmap. However, on the flip side of this, the deprecation process means that unless something is specifically deprecated it isn't really something to avoid.

YK: By definition, if there is no deprecation of a feature, that means that we have not finished designing the future yet in the general case.

YK: When people say "I want to future proof my app", they are completely misunderstanding the way the project works.  There are a number of techniques that we now use that make it *extremely* clear what is "bad" (deprecated) and what is good (the thing that the deprecation tells you to do).

SP: I think this comes down to not properly defining the problems. We tend to use the RFC to describe the path forward, but instead we should focus on the problem/issue first.  This will make it much clearer where we are in the process.

YK: The motivation section of the RFC is intended to make the issue fully fleshed out.

SP: In most of our RFC's we tend to reverse engineer the problem space, but instead we should focus on the issue first.

YK: The main proposal I have about this, is that we increase to focus on the motivation section. We may want to suggest folks to submit an RFC PR with just the motivation section.

SP: People tend to gravitate on the "title" of the RFC, and somewhat ignore the motivations.

EB: Perhaps we should make the title of the RFC just a summary of the motivation.

YK: The prefetch RFC is a great demonstration of this.  It would have likely progressed much faster if the motivation was more fleshed out, and the focus of the proposal.

SP: Exactly, I think that prefetch and routable components RFC's exactly needed to start as an issue with a thorough discussion of the issue.

YK: I believe that routable components are an especially bad case.

(discussion ensues)

DG: Having the RFC's be the place where community members attempt to provide "color commentary" (and that we cannot write about it in blog posts/etc) is not great.

YK: Does anyone really think that if we are much more conservative about our progress announcements that people will be less confused? The problem seems to be too little information, not too much. If we say fewer things, that just creates an even bigger vacuum for confused community members to fill.

MM: It isn't about not talking about your progress, its about doing it correctly.

KS: We just messed up during the 1.13/2.0 roadmap cycle.

YK: I agree with this!  But that has already happened, what do we do **now**?

EB: I believe we need to have more agreed upon talking points for how the core team generally talks about our roadmap and in-progress features.

YK: I think we all agree that we should do the "problems not solutions" case is how we should move forward.

SP: We also need to ensure we do not preface that things are "going to land", and that we are talking about is speculative.

DG: We need to write a blog post after RFC's are landed that make it clear what the future is, and properly explains the timeline/etc.

YK: Totally agree. We need a dashboard and blog posts that tell the community what is going on as a feature progresses through the stages.

YK: I also think that we may need an additional stage during the implementation phase which expresses "the implementation is complete and ready to test". This is important for features like Glimmer 2 (or the MIR compiler change in Rust).

Action items:

- [ ] Update RFC repo README to describe issues as "Motivation section" of RFCs
- [ ] In Dan's blog post re: writing something big like engines, call out the "describe problems first" as a thing
- [ ] We need to frontload in the RFC process the "problems" (motivation section) not the solution.
- [ ] When we merge an RFC we should write a blog post about it with the proper talking points.

### Visioneering Strike Team

YK: A big diverse code team is ++, however some of the people are more concerned with narrow items than broad. The narrow voices are important and nothing is wrong, but a strike team for visioneering can iterate faster.

Action Items:

- [ ] Make a visioneering strike team

### ember-data / orbit collaboration (orbit walkthrough)

DG: orbit has been around. Some uptick, more outside ember than inside. We brought in immutability and observables. Kept most of the public API pretty much the same.

DG: I wanted to bring people up to date- even if orbit isn't directly part of ember-data there are a number of good lessons. I'd also like to share a much as possible w/ ember-data and hopefully collaborate.

DG: sources can contain data. they have common interfaces to communicate and a common format to pass data between sources. Sources are queryable and updatable, as is appropriate.

DG: some sources likely to be used by devs, others likely to be used internally as part of an Ember network (internal to  orbit or your app code)

DG: (explanation of some sources and interfaces, new Orbit stuff)

### Lazy Loading

DG: would like to land this in the next iteration. engines route map needs to be delivered together with the main app's vendor js. The engines core code need to be distinct from the route map, and that is what is delivered lazily w/ the engine's route map and vendor.

DG: tricky part is diffing the engine deps vs the app deps. engine bundle of dep need to be exclusive to the engine.

SP: I don't think we can do better before "bundler for JavaScript" arrives

DG: router js get handler method needs to return a promise

YK: seems good to me. It is already quite crufty in that part of the code but in theory I am +1.

DG: also don't rebuild engines bundle to be rebuilt if there is no change in the engine, or don't rebuild app.js if there is an engine change.

DG: The engine urls are stored in meta

SP: no mention of QPs?

RJ: want to defer

SP: ok

### Release coordination

SP: reduce bus factor etc

- #release channel in community slack
- by end of the week, release members of teams announce themselves:
  - share relevant blog post material
  - they then coordinate with other releasers on times. (Often ~11:00AM Mondays PST)
- ember-cli release
- common blog post
- release success

### @foo stuff

YK: I want to  ensure the consensus we had last meeting is good.

Discussion about merging and shadowing attributes. Discussion about whether to allow interception of supplied attributes.

Problem we are trying to solve is to get HTML attributes on components to not behave weirdly and behave like HTML and Web Components

Another constraint is to communicate to the component arguments which are not required to be strings

Ebryn arguing for interception.

Interception is like a merge strategy++ (SP)

Intercepting is a slippery slope, seems familiar to overuse. (RJ, YK)

People use attributes as selectors (SP)

Glimmer components are coupled to the Root element(MB), but Ebryn doesn't buy it.

We could've chosen the web component strategy which makes it feel more like feel like an element but it's a non full abstraction.(YK)

How do we throw if people are providing attributes they shoudn't.(EB)

YK no personal objection to allowing components configure attr shadowing. Nervous about people doing it a lot. If you have to teach @, seems ok to tell people what arguments to use.

HHWWGT for coopting html component syntax (YK)

Lots of possible trolls, this set of tradeoffs has the least amount (YK)

Problem if top level element is a button, attributes work, but if it's a div it doesn't work.(EB)

We have not considered the refactoring problem. The problem is if you want to implement a button. Relocating a root hasn't been discussed yet.

Intercepting concept might need to be extend for reprojecting, something like \__IAmDoingAVerySadThing (SP)

YK asking if there is a general objection to the strategy. Ebryn does not object to the overall strategy.

Need a side conversation for event handling (YK)

RJ curious about booleans.

Boolean behaves like a boolean with and without "", thats how it works now. (YK)

Ebryn is biting his lips.

If boolean doesn't work, this whole proposal is bust. (YK)

In HTML "" and not "" doesn't mean different things. Imagine you're talking to a new developer check="{{boolean}}" , what do people expect? People expect the attribtue to not be set, it's a source of confusion in HTML.

YK doesn't argue we are not fixing HTML. HTML has no concept of booleans in a middle of string, so we need to figure out what to do. We have have to decide what this thing is, and interpolating a boolean string is confusing and nobody wants it.

This doesn't work with Aria and content editable

No matter what we do people will write checked={{boolean}}

Behavior right now in Ember if you put quotes it turns into concat. The quotes mean coeerce to string.

YK believes there is inertia about the current system people are ok with special rules. People don't expect the diff  between "" and no "". Its a thing you can learn and you can teach people but its not a thing people expect.

Ebryn argues everyone learns this quickly, RJ point we will have more new users than existing users.

There are browser differences?(KS)

We can argue how "" works separately. (YK)

"" means nothing in HTML

Points HTML is dumb. We should be like HTML. We can't do both. (KS) "{{ }}" looks like a string.

Frowning is frowned upon. (there was frowning)

SP likes the if statement approach instead of booleans.

SSR and rehydration is important and a useful constraint. (SP)

Everything is a string in SSR. (EB)

YK argues SSR has no effect.

Breaking change not a good argument due to deprecation.

Aria can have special whitelisted rules

Ebryn worried about args having a weird connotation. Are we gonna have positional parameters?

YK HTML doesn't have positional params so we aren''t gonna have them.

Ebryn arguing for a blood pact to never have them.

Ebryn likes @, but doesn't like this.args

Motivation for .args is for saying in docs to say they are arguments.

In JS args is in array so weird for them to be a hash

Intent for this.args is to be flat

RJ, EF4 think args mean makes more sense

EB thinks it's learnable

## Router Service

EF: Reviews RFC for new Router service and deprecation of lookup('router:main').

EF: Reviews `isActive` method which takes args `routeName, models, queryParams`

Group: `link-to` and `isActive` need to avoid controller lookups to optimize efficiency. We should not consider default query params on controllers when considering a route's query params as well as whether a route is active.

RJ: So `isActive` should not account for the presence or values of any query params if the `queryParams` arg is omitted.

YK: Let's consider a different name for `isActive` - perhaps `isRouteActive`.

EF: Reviews `url` method in RFC.

YK: Suggests `urlFor` as an alternative.

Group: General agreement on `urlFor`

DG: Suggests `matchesActiveRoute` as an alternative name for `isActive`

Group: General agreement on `matchesActiveRoute`

RJ: We need a helper info to get params out of route info.

EF: We can do that.

EF: Reviews new properties `currentRoute`, `currentRouteName` and `currentURL`

YK: I'm nervous about `currentURL` diverging from URL bar.

KS: Can you Google "navigation timing API"? Once you get past `redirectEnd` in your browsing and you get to `responseStart` and you reload. A lot of things don't match in this space in Ember.

YK: We had a debate about timing. I thought we only changed the URL once we got into the loading state.

KS: Navigation starts. Once it gets an unload event, and you respond, the URL is updated.

SP: Once a link is clicked, we should change the active mode.

KS: If you use the route event, and opt out of changing the outlet, you don't want it to change until you get to the end.

YK: There is async work that could be done at any point. The time to update the URL is whenever you change outlet state.

EF: When the state flows to the view, the URL reflects it.

EF: I'd like to add two keywords - `getOutletState` and `setOutletState` - pro-level APIs to help with this. Liquid Fire uses these concepts now.

YK: This should be easy in Glimmer 2.

EF: Let's review `RouteInfo`

KS: I am sad about dot-separated names of routes (as opposed to slashes).

YK: There is the potential for confusion with route names vs. URLs - often they would be the same, but sometimes not.

EF: The model is no longer in the `RouteInfo`, which is now timeless. Params are serialized.

KS: It would be nice if model were a separate bucket.

RJ: If you are going into a route, you'll need to call serialize.

Group: Agreement. We need a solution for this and for lazy loading engines.

KS: We're talking about public API for Transition. I'm proposing we need a `currentTransition` to the routing service.

SP: That must exist internally already

YK: Yes

EF: There is an important issue to discuss in `RouteInfo` related to `parent` and `child`.

EF: If you're leaving your current route, the `Transition` object will need four properties. I'm proposing adding `from` and `to`.

YK: I'm nervous about on-by-default levels of tracking.

KS: The only invasive thing tends to be around paging and scrolling which can kill performance.

YK: I think someone should write a detailed list of constraints.

YK: Right now people who want tracking say that `willTransition` should not be broken. But we should know more detailed needs than this. We need to do a more detailed design.

KS: The use cases are business metrics, ad impressions, etc.

YK: We need to define constraints around these use cases. We need new hooks for non-legacy apps.

KS: Every company wants the current state of the interaction - the current route, component, etc.

EF: Do we think that the `willTransition` and `didTransition` semantics are broken and need to be re-investigated?

Group: Yes. But we're out of gas.

MB: Let's decouple those issues from the rest of the RFC if possible to get traction.

YK: We have options - whether we want to skip implementation or design new API. Let's not block the RFC over this.

EF: We have an action item to investigate this further.
