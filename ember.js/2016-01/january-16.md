# Ember.js Core Team 2016-01-16

#### Agenda

Sat Morn

- API Docs/Guides. But, no, really this time (Trek) 20min
  - Code School Getting Started Guide (Yehuda)
  - Glimmer2 changes so much
- Attribute Actions (Matt) [emberjs/rfcs#100](https://github.com/emberjs/rfcs/pull/100), [slides for discussion](https://emberjs.slack.com/files/mixonic/F0JJKQ9MG/attribute_actions.key)  (40min)

Sat Afternoon

- Ember Engines (Dan)
  - Long term future of ember-engines addon.
  - Lazy Loading
  - Feature flag timeline
  - Open questions for RFC [dgeb/ember-engines#33](https://github.com/dgeb/ember-engines/issues/33)
- Pods Discussion and Status (Yehuda and Robert)
- Stable Dispatcher that can be shared across multiple apps in a page
- RFC process tweaks (Yehuda)
- Alumnization Policy (Yehuda)
  - "Homecoming Dinner" (maybe combined with EmberConf Speaker/Core Dinner)
- Branding and Trademark stuff (Leah)

### Notes

#### Morning Session, Day 1

## Docs

LS: There are some documentation people who are great and seem willing to help, but who didn't feel comfortable taking the lead because they didn't want to step on anyone's toes and had difficulties getting info out of the core team when they had questions/doubts. We should make it even clear to them that they can take lead/responsibility. More Core Team members need to show up to the calls to keep the docs team feeling the inertia and answer questions along the way. It would be tactically helpful but also just make everyone realize how important they are and how much we value their contributions (because we do!). 

KS: It seems like no one on core wants to work on docs.

Many: DENY

KS: I've seen stuff go out without docs.

YK: There's a ton of work going on with docs, but there's no one there to ATV (articulate the vision) to focus all that work. ATV includes articulating what you want to do, building consensus, and also doing/helping do the bootstrapping work. There's a ton of work happening even without that (the docs is probably the most worked on part of Ember), but we really need that too and that'll help keep everything moving and in the right direction.

LS: So what do we do about it?

TD: I would like to do it but I cannot do it until after FastBoot shipped.

YK: The Rust core team is structured similar to our team except that each subteam is more empowered. RFCs get managed by the subteams up to the point that a decision is made to actually include it in the project. The idea is that the subteams feel like they are the ones making the decisions.

SP: I can't review every PR or issue, but if someone can provide a triage list I can provide good feedback. I need someone to prepare that for me.

LS: Maybe that's a standing TODO at the end of each docs meeting: build a list of issues/PRs that need review by core.

YK: Rust uses Discourse a lot more for subteams to put their thoughts.

EF: We have enough people to help if we had a reliable way to distribute the work. Maybe a bot like `homu` to distribute docs review?

KS: There's a lot of things that we made public that we didn't intend to make public.

\<side conversation on public/private APIs in Ember CLI>

\<side conversation on who has interrupted who; we need an interrupt queue :p >

YK: After the 1.13 period, we did not do a good job of documenting any deprecations.  Leah wrote a big checklist and took responsibility for shepherding that issue through to completion, by nagging the right people and making sure PRs got review.

YK: \<points out weird thing in API docs> I think Leah could manage cleanup like this.

KS: There's some things I care about like hooks that are exposed that I'm carefully paying attention to.

\<conversation on `content` property on PromiseProxy and whether it's public or not>

YK: We should try to make a list of things in the docs that need to get reviewed.

YK: I don't have the time to do the grunt work to create the GitHub issue but we should find obvious problems.

RJ: We need to suppress private classes from the sidebar. It's an easy fix that will solve many issues.

EB: I'd like to raise the issue of poor search.

YK: We should consider adopting Algolia, the results from eslint search are very good.

EB: I'd also like to improve interlinking between guides and API docs.

YK: At minimum each guide should link to a few different API classes. I like how Cocoa's API docs work; there are "Common Tasks" that group the APIs by task. [EXAMPLE link]( https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/)

RJ: David Baker (Acorn Computer) has been investigating integrating Algolia.

TD: We should talk to Stanley to see what the status of his offline API viewer Ember app.

YK: We are failing very hard at doing a Getting Started Guide. We always get it out but fail to maintain it and keep it updated.

TG: I disagree. There have been a lot of efforts but all of them have been slowed down by bikeshedding.

YK: Code School has offered to do a free course to serve as our Getting Started tutorial. They will own it as a part of the Ember project. By giving them official status, they become a part of the docs team and are responsible for keeping the course up-to-date as framework changes.

LS: They already have a bunch of people working on it right now

YK: I told them my major criterion is that they need to keep it updated and not do "one and done." They have done this successfully for Angular and jQuery. I also want to make sure that it's sufficiently in-depth that people can use it to actually get some things done and not just be a teaser for the full course.

EF: Will the content be open source licensed?

YK: I doubt it but unknown.

\<discussion about format of Code School courses>

MM: How much say do we have over the curriculum?

YK: As much as we want if we move fast.

\<discussion about plants and/or circles>

TG: How do we deal with transition periods? Guides want to tell people "the right way" to do things, but they still may encounter older style patterns.

YK: We need to also make sure Google does not link to old versions of the docs and always go to the current version.

### Action Items

- [x] Open issue on filtering private classes out of API docs list (Stef)
- [ ] Get in touch with Algolia RE: search (Leah) -> [issue](https://github.com/emberjs/website/issues/2452)
- [ ] Talk to Acorns about "Task" oriented API docs (Yehuda / Leah / Tom)
- [ ] Create a checklist issue for adding links between API docs and guides
- [ ] Make sure that Googling for "Ember Component" does not point to 

## Better Actions

MB: \<presentation on better actions> https://github.com/emberjs/rfcs/pull/100

\<discussion on normalization of events and if we need to consider it for the RFC>

SP: We should be aware of security implications of interaction of bound `get` helper and the `action` helper; it may allow the user to invoke arbitrary methods.

\<heated discussion about whether onclick={{foo}} is "documented" or not>

MB: \<presentation on actions RFC continues>

###  Open Questions

- WebComponents have no specification for event handling. In a perfect world we should be able to set a property like we do with DOM and the WC would call it correctly.
- Or we do the opposite or we tell people not to call the method and intercept property sets and `addEventListener`
- We don't actually know what an WC's events are so we cannot do the property -> `addEventListener` binding automatically, YK says we need to discuss it

### Points of Consensus

- We do not want to change any of the semantics around `onclick` without a dash (at least the mental model for end users)
- No gratuitous differences between `<foo>` `<foo-bar>` as a web component, and `<foo-bar>` as a Glimmer Component.
- GlimmerComponents and Custom Elements should be able to consumed by users without having to know which it is (at least in 90% of cases)

### Actions Items

- [ ] Close the Attribute Actions RFC. The `onsomeevent=` style of usage should Just Work as well as possible across native elements, custom elements, and Ember components. This requires further exploration though.
- [ ] Introduce an element modifier RFC. `<div {{(someHelper)}}>`. This would allow the creation of something like `<div {{add-event-listener 'click' (action 'baz')}}>` in user-space, and provide an outlet for those who need to do custom things with elements in the immediate future.

#### Afternoon Session, Day 1

## Ember Engines

DG: Introducing this based on talk for Boston Ember

DG: Initial list of features was basically too long. Went back six months ago to refocus. (In the RFC)

DG: The key benefit goals: Distributed dev, integrated routing, ad hoc embedding, clean boundaries, lazy loading. Similar to mountable engines in Rails, but not similar to "app mixin" engines in Rails.

DG: \<intro to the addon https://github.com/dgeb/ember-engines>

MB: the map exports a bare function, which is an upgrade hazard, should just export something. <RB strong agree>

DG: \<moar intro>

YK: We should ensure that engines don't work with beta, since they are doing some funky monkey-patching and using internal private `require`

DG: \<moar into, routable engine and route-less engine>

\<can route-less engines have internal routes? For ergonomics or state serialization?>

DG: <moar intro, dependency mapping>

```js
initialize: function(applicationInstanceInstance) {
  applicationInstanceInstance.inject(
    'engine:ember-blog-engine', 'service:store', 'service:store'
  )
}
```

\<debate on the using the DI system vs. a declarative solution for DI. Some consensus about the mount point defining the services passed in to an engine> 

SP: Using the current DI APIs or improving them instead of the proposed syntax would be preferred.

RJ: For ensuring dependencies are correct, a hook may be preferable to the limited config options presented.

DG: So what is next. How do we get this upstream.

RJ: Some things should be moved to inside Ember (monkey-patches). Perhaps need feature flags. I think there should be an addon in the long-term. The actual code goes in Ember, but the blueprints, config etc should live in the addon.

YK: FastBoot is a good example for "works with canary" while it does monkey-patching etc but then, when Ember has the right APIs, begins to work with beta, stable etc.

RJ: We're going to do a poor-mans version of lazy-loading with the features available in Ember-CLI today, but want to do it right with the linker etc later.

RJ: Addons just work, but they are globals. We can do work to make them lazy load it is just work.

SP: dependency injections passed to `mount` cannoy change, if they are bound then they throw

IT: routable engines might also use the template "mount" helper, and just use the route map for the routes

DG: I'll move forward on moving the patchy bits into core, and look at the dependency injection APIs

### Points of Consensus

- Route-less component should have internal routers. This internal router can serialize its state back to a two-way-bound prop, etc. This makes route-less components much like an iframe with their own navigation, etc.
- Services/DI for engines should be defined at the mount point (be it route or template).
- Let's be careful about adding APIs (such as route serializers in separate files) just to scenario solve. We might end up with some warts. 

### Action Items

- [ ] Route map should not be a bare function export. A bare function export is an upgrade hazard, and there may be other API reasons to have a more robust API. Let's wrap it in a function call (not something that registers, just something that tags the function)
- [ ] Ensure the addon only works with Canary (detect feature flag?) (robert)
- [ ] Remove mounting into outlets (`this.mount()` in `Route`)
- [ ] RFC for lazy loading engine serializers, or at least explore the space
- [ ] the main RFC can be closed!

## Pods

RJ: Current status of pods: there are several sub-parts that are not pods:

- Local lookup (not enabled, in Canary, would like to enable after 2.4)
- New Resolver that does the right thing

RJ: We made it so you have to opt in to the behavior with the new resolver. If we change to pods as the default structure we will have to change the default resolver.

YK: Is your mental model that pods is purely resolver work remaining?

RJ: Yes, all the work in Ember is done. We need to enable the feature ASAP as soon as 2.4 ships. That way we can make sure it gets in for 2.5. In that time frame I'll release the new resolver.

YK: What do you call non-pods mode?

RJ: *Classic*.

YK: So you can have classic mode app you can rip out the full component paths and it will just work.

\<[The PR has a demo](https://github.com/emberjs/ember.js/pull/12673) in a twiddle>

RJ: We maintained the existing behavior, so if you happen to have a global component and pod component with the same name, the component doesn't change and the global one wins. With the current implementation, the local one wins.

YK: We may need a warning mode in case you hit that situation.

SP: I'm concerned that if you add a component to a pod that has the same name as a global component, it may break local templates that were using that global.

EF: Generally you should be very protective of global scope and try to keep things pod-local as much as possible. Remember local lookup is only two level (local, global), not looking up the tree.

RJ: I will add API documentation for the resolver but it's sufficiently low-level I don't think it requires any changes to the guides.

RJ: The pods resolver itself is pretty simple. I need the local lookup feature for it to work. The other concern that I have and that others have voiced, and that I want to verify we're on the same page is, is the depth of filename of pods stuff. For example:

```
app/routes/posts/routes/edit/components/show-post/helpers/title.js
app/routes/posts/edit/show-post/title/helper.js

pod dir would be:
app/route/posts/routes/edit/
                            component.js
                            template.hbs
                            routes/
                            helpers/
                            components/
                                       show-post/component.js
                                       show-post/template.js

```

\<discussion on whether Windows developers may hit the MAXPATH issue>

RJ: I just wanted to present this because it was the elephant in my head.

YK: Important to introduce the benefits in RFC: being able to understand a route/template at a very local level. No naming conflicts for local lookup. relocatable.

TD: A good way to talk about it may be "componentization" of app structure.

YK: Yeah that is even kind of the point.

### Points of Consensus

- Local lookup followed by global lookup
- Deeply nested paths (Windows users will have to avoid extremely deep hierarchies)
- Migration path, tools?

### Action Items

- [ ] Add API documentation for new resolver hook
- [ ] ^ Enable the local lookup feature. This is a "go" in 2.5-beta
- [ ] RFC for this must be written. Robert will do the tech bits, perhaps Tom can finish it.

## Stable Dispatcher

YK: It would be nice to have a shared event dispatcher between apps, so that multiple Ember apps can co-exist on the same page (e.g. embedding Intercom inside Skylight).

TG: We should extract it and make it usable with other libraries that do event delegation. Would be great if we could create a dispatcher that would be shared among multiple Ember and React instances on the same page.

RJ: There are backwards-compatibility things an RFC would need to address.

### Action Items

- [ ] @wycats to write an RFC

## RFC Process Tweaks

YK: I would like someone to sign up to implement the process tweaks. They are as follows:

1. A new RFC section "What should we name this?"
2. New section: "How does this change the programming model?"
3. All RFCs must actually include drawbacks and alternatives ("N/A" will not be accepted)
4. Sync up the Rust and Ember RFC templates from time to time
5. Introduce Final Comment Period

YK: The idea behind FCP is that RFCs are "owned" by some subteam, and when they feel like the RFC is ready to go, they initiate a FCP as a warning to people that the period to comment is coming to a close.

MB: Would be cool to add tests to RFCs and auto-close RFC PRs with empty sections or other automatable tests. Also great for documentation.

YK: Rust has subteams like "tools" and "language." It would be great to have strong subteams. We only have Ember Data and docs. It would be nice if we could formalize the other groups we have like Ember CLI, tools, etc. Each team should keep Discourse updated with their progress.

YK: You can think of Final Comment Period as a "async go/no go" for RFCs.

YK: I think we could do with a little more process around teams and little more process around RFCs.

### Action Items

- [ ] Define subteams and membership in each

## Alumnization Process

YK: There's a problem with most of the core teams I've been on, which is when and how you decide to leave. There's no impetus to leave on your own, and it can feel bad to be asked my other people on the team to step down.

YK: I want to introduce a "Path Off Core." The problem is that it feels  bad to make a decision to leave because it feels sudden (even though it's usually following an extended period of inaction). I would like to introduce a "countdown" of sorts, which is that you decide to leave but have a period where you can change your mind if you end up becoming more active in that period.

RJ: Is it important to define what active means?

YK: I don't think it's important, or that we could really enumerate it all in advance; however I do think it needs to be defined enough so that we could reach consensus on whether someone is active or not.

RJ: Stef mentioned at one point in time there was an actual number of commits required per month.

RJ: YK had previously put together a list of what it means to be alumnized and it's basically like being a core team member with all the rights and none of the responsibilities.

RJ: What happens if you are alumnized and you become active again?

YK: DHH always says "you're welcome to rejoin at any time" but in practice no one has ever asked to rejoin. I think in reality in makes sense to wait a bit to make sure they remain active.

TG: I'd guess that face to face and other travel would not be covered for alumni?

YK: Yes, we would only cover what we're able to cover for core team members.

TG: EmberConf?

LS: Depends on the size of the group. We'll have to play it by ear.
