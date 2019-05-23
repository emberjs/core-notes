# Meeting: Ember Core Team 2019/04/12

## Agenda
    
- RFCs
    - → FCP
        - **(10 min)** [SFC / Template Imports](https://github.com/emberjs/rfcs/pull/454) (RJ)
        - (**10 min**) [Yieldable Named Blocks](https://github.com/emberjs/rfcs/pull/460) (RJ)
    - FCP 
        - (**5 min**) `{{on}}` → https://github.com/emberjs/rfcs/pull/471 (CG)
        - (**5 min**) `{{fn}}` → https://github.com/emberjs/rfcs/pull/470 (CG)
        - (**5 min**) [**Dynamic tags in glimmer templates**](https://github.com/emberjs/rfcs/pull/389) (GC)
        - (**5 min**) [Injection Parameter Normalization](https://github.com/emberjs/rfcs/pull/451) (CG)
    - → FCP to Close
    - FCP to Close → Close
    - Promote
- (**5 min**) [Splattributes + {{action}} + Ember.Component + event.stopImmediatePropagation()](https://github.com/emberjs/ember.js/issues/17877) 🤯 (GC / RJ)
- (**10 min**) Octane release (MS / YK)
- (**10 min**) 2019 Roadmap / Blogposts (KG)

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Minutes

### SFC & Template Import Primitives

(discussion)

RJ: I added this to suggest for FCP, but there are people who want more time to review. That seems fine and I withdraw the push.

### Yieldable named blocks

YK: I would also like to wait on this.

RJ: This make less sense to me, since I think it is always implemented.

(discussion, RJ has a blocker detail on this which YK wanted to respond to before it can go forward. Sounds related to if/how named blocks arrive in JS space, and if they conflict with arguments)

Resolution: An assertion or lint will be added which prevents you from passing both a named arg and named block with the same name.


    <Foo @title="title">
      <:title></:title>
    </Foo>

Resolution: RFC is ready for FCP pending that change being made ^^.

RJ: YK you mentioned it was basically done, what remains?

YK: I did the implementation in about two days, so I could believe that there are cases where the parsing is not correct for example. I think it is feature complete though.

RJ: Do you have a vague plan for passing?

YK: A possible plan is :foo=:bar.

RJ: I see like @foo is an arg :foo would be a block. We don’t allow that now right?

DG: This doesn’t setup this.blocks, right?

YK: It does not. It just allows yield.

CP: I want to explore putting args on blocks. For ember-table it would be good.

YK: I think I also ran into that when I looked at ember paper. There are cases this won’t handle yet. Contextual components are a thing, we should make those cases where they are useful better.

### FCP to merge {{fn}}

CP: FCP to merge.

GC: Did we consider the new comments?

RJ: They are what you might expect when you are talking about naming issues. I think the comments fall into the space of “not new information”.

CP: No objections to merging?

YK: I think we need to be aggressive about teaching it.

Resolved: merge

### FCP to merge {{on}}

CP: Ok. This?

RJ: I chatted with buschtoens about migrating his addon to be a polyfil. He is working on it!

CP: Good to merge.

Resolved: merge

### Dynamic tags in glimmer components to merge

RJ: Last time we talked about verbiage in the teaching section. You made those changes and it sounds good to me.

(discussion re: polyfil)

RJ: Anyone opposed?

GC: Is Jen happy with my docs/learning stuff?

JW: Yes that looks much improved thank you.

Resolved: merge

### Injection Parameter Normalization

CP: This is making the owner as the first arg to the constructor on Ember and Ember Data things It is specifically targeted at factories provided by Ember or Ember Data now. I searched through the ecosystem and there aren’t many people who put lots of custom things in the registry anyway.

(discussion)

KS: To close it out.. RJ what I don’t want is for people who want to have a service that just wants to be a service and not use any FW stuff do a manager for service. We should have a general manager…

RJ: To restate: I think that having a default manager with reasonable behavior (whatever it may be) is good and will let people use normal standard classes.

KS: The concern is that Ember Data and the per model serializers and adapters. That kind of escape valve creates code bloat.

YK: I think it would be a decorator or something.

(discussion)

DG: Is there an implication that there is a default manager then? Any registration which wants a different type would need to explicitly specify that?

RJ: Hold on, to be clear that is not part of this RFC. But, if we did do managers, then we could easily rationalize this behavior.

(discussion, TS and …args)

Resolved: merge

### Splattributes + {{action}} + Ember.Component + event.stopImmediatePropagation()

RJ: There is a concrete problem with splattributes. It has to do with understanding difference between stopPropagation and stopImmediatePropagation

RJ: The rough shape is when you call stopImmediatePropagation it should not call any other actions on the element.

YK: I think the summary is that calling stopImmediatePropagation in Ember in an event delegated context is a bit bizarre. jquery when it added delegation was trying to add a feature like normal event delegation as long as you are inside the system. What that means is that since jquery knows all the things you did it could stop anything. But it was unrelated to native APIs, it was a thing jquery was doing.

RJ: My suggestion here is to present the specific case with an assertion.

YK: Prevent people from calling stopImmediatePropagation?

RJ: No…. We can…

GC: Also actions don’t have a reference to the event. So they don’t have a place to call sIP

RJ: When you have.. when a component is invoked and is passed an element modifier, in debug mode we would extend the event and override sIP in dev mode only. Since we only expose it to the click handler. Otherwise we need to pick a winner. 

GC: First of all if you are no following this and think it is in the weeds you are not wrong. In the cases where you have an Ember component, lets say you have a method on the component. Say the called passes multiple actions to the component. Do you have any expectations about which runs first, is it fair to have an expectation.

RJ: I don’t think you do.

KS: My suggestion is whatever keeps the code simple we just document that order. We want people to rely more on what the browser does, not what we do.

YK: I don’t have a strong opinion for how to mitigate this. But we need a strong position on what to do so we can tell people how to avoid the problem.

(discussion)

GC: I think the assertion sounds good. My suggestion would be to run the component first. I think that matches the order of the attributes wrapper. Also in that order we can pass a proxies event to the component first and if we get sIP assert but only if you have actions on it.

(discussion)

MS: I’d like to suggest that it would take less time to write a blog post than to have this conversation.

GC: Well I think there is not a good reason for anyone to have written this. The only think it could mean is that you have another jQuery delegation thing outside of Ember.

CG: At the least it should be a breakout and we should talk about it in chat.

### Octane Release

MS: I want to find an expected release for the Octane stuff because it impacts the documentation and marketing. And we need to talk about it in context of the LTS.

RJ: I think the simplest thing to do is to choose the most aggressive release for the purposes of that work. So 3.11 is master, and that would be the most aggressive thing. All the things we have been talking about are in Octane and only need to be enabled. @tracked is the only thing that is concerning me, and I think that is looking good.

YK: I think we have a plan for bringing tracked back to just tracked.

CP: Well limited interop. We still want to interop with parts.

GC: I think JW tried to contract aggressive and realistic. I think those kinds of things are the thing we could use lots of feedback on.

JW: I want to rephrase: Are we saying something has to be on master by May 12th in order to make it into 3.11?

MS: And if we don’t make May 12th then we just go for 3.13?

RJ: That is my preference, but I don’t want to have the argument.

GC: It seems ok to me.

(discussion - Octane should not be an LTS since the goal of LTS is no new features)

JW: Yeah if the features get in on 3.11 but a later release is labeled Octane, that is pretty great from  the perspective of working on the guides

GC: Still need to be careful about how this is communicated so that people don’t think “Octane is shipping in 3.11”

JW: I will still need to coordinate with the core team and community members and share some time-based targets. I will do this carefully. Overall we should think about how to better communicate the “train model” to our community and incorporate it into blog posts etc.
