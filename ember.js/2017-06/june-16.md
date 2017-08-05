# Meeting: Ember Core Team 2017/06/16

### Agenda

- Testing RFCs (RJ)
  - Deprecate usage of restricted resolver.
  - Add new QUnit testing API.
- F2F Agenda Topics (RJ)
  - Add them here: +Ember F2F Outline and Agenda, Q2 2017 
- Node/TS (TD)
- Rehydration Update (YK)
- [Heapsnapshot](https://github.com/stefanpenner/heapsnapshot) experiment (SP)
- new Firefox devtools + ember (Stack trace collapsing) (SP)

### Attendees

DG, EF, EB, GC, IT, KG, KS, MM, RJ, SP, TD, YK, MB

### Minutes

#### Testing RFCs

(discussion, looking at ways to improve app and library test suite, QUnit)

(discussion) Discussion about whether we should move forward on introducing new API that relies on a DSL that mutates `this` (due to conflict with arrow functions which override `this` and break the DSL).
Consensus is that we will move forward with the new QUnit testing API because it allows us to lean more heavily on QUnit, and this is a problem QUnit itself will need to address anyway.
We will work with QUnit team to propose APIs that allow libraries to decorate object passed to test functions with DSL-like functions so we don’t rely on `this`.

RJ: Next week I would like to push these two RFCs into FCP. It seems a little too soon. But I’ll be working on these things this coming week.

F2F Agenda Topics

RJ: F2F is coming up in a week. I’d like people to make some high level agenda items.

TD: This meeting is explicitly around marketing/messaging, etc. I want to make sure it isn’t viewed as a cabalish things where we decide the direction of the framework without input.

YK: At a recent meeting TD gave a good presentation about how to introduce Glimmer, and it was a good presentation. But he had to come up with it on his own. The idea is that this is a space for us to come up with these ideas to share at the next code team meeting.

RJ: Right, we don’t have much on the agenda though, so I’d like to get some items.

YK: I think as the first one it might be hard to have an agenda. I want to be clear to those not attending that we won’t decide anything, we will punt hard on technical directions etc. If after the meeting people feel like things are rubber-stamped, especially technically, people should raise it so a topic gets a full discussion.

TD: At a large meeting, it can be hard to have a freewheeling conversation. I can remember a smaller conversation where I had a breakthrough on how to talk about Glimmer, and that wouldn’t happen at a full core meeting. That’s what I’m trying to recreate.

YK: I think we’ve always had two groups of a conversation and a group hacking, but we never really split the groups to avoid interruptions in a discussion.

(further discussion on how to improve running F2F meetings)

#### Node/TS

TD: Some of the pkgs written for node, some are JS some are TS. If you want to consume a dep from a TS package and it isn’t TS then you must define the types. I added types to a JS library, and RJ called it out as possibly a problem. A type definition is problematic since it is decoupled from the source. So we should think about a policy here.

RJ: It is very easy for untested type definitaions to fall out of sync, and they are then wrong.

KS: We should get them in place, but the next time we change the code we can refactor that lib.

TD: There is a way to add a test that assets the typing is correct.

KS: Right it only asserts the thing compiles, it doesn’t actually run the code and know params etc.

RJ: The problem is that TS is like a virus. If you have one TS lib it wants all its deps to be TS.

KS: But users will find out when there is a problem (or upstream tests). I think the maintenance is an overblown issue. I do thik we want out libraries in TS.

YK: There is another thing, which is TS types are definable as JSDoc comments. But for things that are no TS, you can get away with looser types in general.

RJ: Right, but the JSDoc types are inline which makes then less brittle.

YK: TS 2.3 will honor the inline comment types, so we should work with that. This is a transitional thing.

RJ: Does that mean eventually everything is TS?

YK: Maybe?

TD: I would like this to be true, but I also accept an issue RJ raised about reading types from deep in a dependency tree.

(discussion)

YK: I think this needs a strike team. We need the people who understand the problem to work on it. I’m trying to help but everything I say runs into another constraint.

TD: This is a general problem in TS and node (with any package in TS that is transpiled).

(discussion TD, SP, KS, RJ)

TD will prepare a constraint document

#### Rehydration Update

YK: tl;dr is the approximate plan seemed correct this week. I refactored to remove some things like globals, wrote tests for rerendering. GC and I also looked into what React is doing, which is interesting. I got further along with making mismatches doing the right thing. I have many __ methods on the builder that seem to point at an improved abstraction. I think there is a meta issue re: how much we need to care about mismatches. The React pre-fiber used innerHTML for everything and they generated a checksum, added it to an attribute and if the checksum was the same it would rerender. I know for  fact this caused some issues for Yahoo where there were mismatches with translations.  I think these will be common in the real world. I think it is important attributes and text nodes can be patched. The original approach was just to clear out to the end of an element if there is a mismatch, but I have made it work at the block level, like an if. The tradeoff is that there are more markers in the DOM. So we need to look at use-cases to decide which direction to go. Looks like an open question.

RJ: My main things: We intend to land this when it is green. I will look tomorrow at the yarn stuff (unrelated), but we intend to land it incrementally. It doens’t fundamentally change the semantics so we can land it in Ember.

YK: Right, now that I’ve written it I don’t know of any reason why we can’t use it in ember. There are possible UX issues, but we could do it.

RJ: Right, doesn’t look like there are major changes needed.

YK: Two things: You need to change any attribute handler code. A simple change. And you need to turn on serialize mode in Fastboot.

RJ: When you boot an app, do you need to tell it a mode?

YK: Yes, correct.

RJ: can we make it a detectable protocol? You could usually render SSR with serialize, but sometimes you don’t.

YK: We could make the top element have an attribute that hints the mode. I agree you might want something here.

YK: I think there is an open question about how we want to “dim” the UI or something. I think there is a canonical solution and Fastboot should do it.

SP: Is there yet a way to stream in the HTML?

YK: We will make it work in Glimmer first but it should work in Ember.

SP: I’ll get Krati going down that path.

YK: Does FB already disable loading states? In order for streaming to work you need you DOM to not make async requests.

TD: Right the constraint is that the Ember app on the server can only create DOM instead of mutating DOM, but that just isn’t the model.

YK: I think TD hold streaming as a short term priority. I think if we want it to work we want to serializer to build a string instead of DOM. It isn’t hard, but it wouldn’t work for Ember since it messes with the DOM. We already have flush handles in the low level VM.

GC: There is a status code (HTTP) for “early hints”? Code 103.

TD: When I looked into this no browsers really supported this. Good lead.

(discussion of HTML streaming)

#### Heapsnapshot and FF devtools

SP: On Sunday I wrote a way to parse Chrome heapdumps. KS started spiking on an automated harness to check for leaks. Programmatic memory leak testing would be handy. We met with the FF team yesterday and suggested something similar. Also the new FF devtools supports Ember stack collapsing. It is super nice. I spoke at length about adding tag stack so they can show user-land stack views (helps backburner). I think the combination of these things might make FF devtools very nice.

YK: fwiw we tried to convince them a while ago to do this and they weren’t interested.

SP: I think since they are using React to build the tools they now feel the pain.



