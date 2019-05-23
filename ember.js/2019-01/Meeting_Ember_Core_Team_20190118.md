# Meeting: Ember Core Team 2019/01/18

## Agenda
    
- addonify Ember https://github.com/emberjs/ember.js/projects/5
- FastBoot & documentation/blueprints/”What’s the deal with SSR?” (TD)
- Ember Inspector support for new features and Octane
- https://github.com/babel/ember-cli-babel/pull/260 (merged)
- RFCs
    - FCP
        - Dynamic Tags - https://github.com/emberjs/rfcs/pull/389
            - Confirm that `<FooBar {{modifier}} />` should Just Work™ ?
        - Contextual Helpers & Modifiers - https://github.com/emberjs/rfcs/pull/432
        - Tracked Properties - https://github.com/emberjs/rfcs/pull/410
        - [Deprecate Route Render APIs](https://github.com/emberjs/rfcs/pull/418)
        - [Deprecate Application Route Properties](https://github.com/emberjs/rfcs/pull/421)
    - Merge
        - Render Element Modifiers - https://github.com/emberjs/rfcs/pull/415
        - Glimmer Components - https://github.com/emberjs/rfcs/pull/416
    - FCP to Close
        - Namespaced Components & Helpers - https://github.com/emberjs/rfcs/pull/70
        - Link Component Hook - https://github.com/emberjs/rfcs/pull/230 (Router Service?)
    - Close
        - Add once-for-observer - https://github.com/emberjs/rfcs/pull/427
    - Promote
        - buildRouteInfoMetadata

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber

## Action Items

- [ ] @Godfrey C to comment on the ember-awesome-macros issue with our plan for addonizing CP macros https://github.com/emberjs/rfcs/issues/349
- [x] @Robert J add “decide who will take notes” to the weekly notes template
- [x] @Robert J to merge Render Element Modifiers - https://github.com/emberjs/rfcs/pull/415
- [x] @Robert J to merge Glimmer Components

## Minutes

### Addonify Ember

RJ: some community confusion about the divisions between emberjs codebase and official addons. In the future, more addons that are not on by default, but are officially supported

TD: What is the rule for what should be an addon vs core?

RJ: Anything that can be an addon, should be

YK: Need to be careful with what gets exposed as SemVer

TD: Should think through UX of addons. Good for “treeshaking” to remove addons. However we need to make sure that we are not making a short term decision where we have to maintain so many packages, and increasing the impressions about “look, this package.json is so huge! There’s too much going on.”

YK: we should not be diving headfirst into addons until we get further along in the story

GC: fine for macros to be delegated to an addon

TD: how do we follow semver for computed macros?

GC: we have declared bankruptcy on adding new macros, fixing ergonomics mistakes, etc?

TD: we can’t just remove them, so what is the value of deprecating them?

TD: Concrete proposal? A deprecation RFC

### FastBoot and Documentation

TD: Wanted to bring this up. JW has done work integration ember-cli docs into the website. I forget the plans for the ember-cli website itself, but anyway I wanted to discuss Fastboot which also has its own website. I think SSR rehydration is a thing people want as well. I would be happy making fastboot an addon and put the official documentation on the website.

YK: Vue puts docs for things even like routing in a different part of the website but on the same website. I think if we put SSR on the sidebar it would be overwhelming. But a lot of people come to the website looking for it. It should be linked off the main guides. The idea is you don’t need to know this to use Ember, but here it is.

JW: I have a question re: fastboot, what is the status? Can we push people in that direction?

RJ: I think the project is healthy.

JW: But the docs?

RJ: Maybe not good?

YK: I think the core technology is good. We run all our Glimmer tests against the server renderer.

TD: I’ve been using Fastboot a bunch.

(discussion)

KS: Often people don’t get their data to the client at the right time.

(discussion)

JW: My concern/challenge is that setting up the website is easy, keep the documentation up to date and having the knowledge to keep it accurate is hard.

JW: The guides are easier because they represent a happy path, almost anyone can spin up an app and see that things are true. I’m not sure teaching people that is the right step, instead getting someone who has the expertise to look at it and write is a better approach.

JW: I think it comes down to a lot of the learning team not working with Ember at that level.

TD: Yeah it just doesn’t scale that only one team can write all docs.

YK: I think turning on FastBoot and having it work should be at the same level as anything else in the framework.

TD: Right, when you add the addon now you just get SSR.

RJ: Right. The bulk of the issues I see today are people trying to fix addons or third party code that is incompatible with rendering without DOM.

JW: I think that is the part that is missing that we need to address. For instance “things that are fundamentally incompatible with fastboot” is something I’m not sure how I would identify.

JW: “when to use fastboot” is a thing the guides would need to address before we could push it as happy path.

YK: Yeah I think that is correct. It sounds like a good checkpoint is that we should use Fastboot for more of the Ember website.

TD: There is a gap between “I have a greenfield app” and using this on the Ember website. The Ember website has a lot of legacy stuff.

YK: There are two things, are my addons compatible and is my DOM compatible.

TD: I think we are saying we are ok with the docs being on the Ember website.

YK: And also that the learning team will not be able to be responsible for maintaining this content.

### Ember Inspector support for new features and Octane

RM: I think the inspector is falling behind as we add new features.

TD: Isn’t the inspector using an intimate debug API that we expose?

YK: Yes but it was based around part of the programming model that may change.

RJ: The only thing I know that is broken is custom component support and angle bracket display. How to fix it isn’t 1000% clear. I’ve been chatting with RW about this. It has been around since 3.4, we need to decide what we want. I think the inspector today is doing things it should not be doing, expecting `parentView` etc. But that is b/c there is no insight into the render roots and the tree at all. It doesn’t need to be fully public but it should be public APIs. I need to carve out some time to join the next inspector meeting to talk through these two things.

YK: There is also stuff like the view tree. The component is up to date minus the angle thing. But there is a whole column on the view tree for controller that is not often used.

RM: I think the inspector has issues with engines as well.

RJ: I also don’t usually love to use the GUI if I can type faster to find it.

TD: I think we know this is something that we want, a debug proposal / RFC. RM/RJ please do see if anyone at the next meeting is interested in helping to push this forward.

(discussion)

### Render Element Modifiers RFC to merge

GC: I’m a bit surprised that there were not new comments. Perhaps people didn’t realize it was now an addon. We talked previously about addons bringing their own version of this.

RJ: I think DG and I had a productive call this morning on being able to trust having a specific version.

TD: At some point we will not want to support it. We will need to revisit the RFC process at that point.

GC: Yes it would be public API.

Resolution to merge.

### Glimmer Component RFC

RJ: There are some comments, not sure they are on topic. First MN is concerned around the name “template only glimmer components” being at odds with “glimmer components”.

TD: We spoke about this yesterday and I think we got on the same page.

RJ: The RFC was updated in the “how do we teach this” section to talk about this a bit. The fact that the templates are the same is the important thing.

TD: Currently Ember developers like being template power users. There are a few template helpers that are powerful that create mutable side effects on the component. In template only components (pre-glimmer) you can use `mut` etc to set state even if you don’t have a component. MN’s point is that if you delete the JS file people will expect those behaviors to still work the same.

RJ: GJ also had a case like this that he thought was a bug ([https://github.com/emberjs/ember.js/issues/17202](https://github.com/emberjs/ember.js/issues/17202)). The solution is just make a helper yield a state bucket.

KS: The let helper is basically for introducing stuff in an explicit way.

RJ: Deprecating property fallback would already have helped make this clearer.

GC: I think we were too clever about magic actions that used an implicit `this`.

(discussion)

RJ: A second concern was about default values and named args. But I don’t think that is directly related. I think we are close to a future where you can read a template and know what is an arg and what is on the component. I think people not used to thinking template-first don’t think that is ergonomic.

RJ: They were proposing `defaultArgs` as a method that you could use to change the named args. I pointed out this is incompatible with the feature itself. It isn’t the point of the thing.

TD: You can use getters

RJ: Right, yes and we basically said that.

Resolved to merge.

### Dynamic Tags

MS: object to FCP, will comment – more details in teaching section, mention accessibility etc

KS/YK: some concern about security in teaching section too

YK/GC/RJ/KS: agrees that …attributes should forward modifiers and that should be allowed on <Component /> invocations, PR to update RFC + FCP

### Contextual helper/modifier RFC

YK: not ready for FCP, need to resolve the unsolved questions
