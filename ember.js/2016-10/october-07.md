# Ember Core Team 2016-10-07

### Agenda

- (public) Issue triage policies: [emberjs/ember.js#14339](https://github.com/emberjs/ember.js/pull/14339) (RJ)
- (public) [ember-cli blueprint for computed macros](https://github.com/ember-cli/rfcs/pull/67) (RJ)
- (public) https://github.com/emberjs/ember.js/pull/14410 (RJ, GC, YK)
- (public) follow-up about convo with @locks (YK)
- (public) Review [RFCs in FCP](https://github.com/emberjs/rfcs/labels/Final%20Comment%20Period) (DG)
- (public) ember-source vs ember-core npm module (SP)
- (public) any opposition to ship ember-core/source? (SP)

### Attendees

YK, MB, TD, SP, RJ, MM, KS, GC, EB, DG, EF, LS

### Minutes

##### PR #14339, triage team policies

TD: I think it is good if we can have boilerplate responses. Not "we don't care" but it is in alignment with our policies.

RJ: I didn't want to merge w/o discussion but I'm in favor. We've tweaked the communication style with individuals in the past, but a policy is generally good. I will review the words again and make it look good. Does core want to be in the loop on the exact wording?

SP: I think we should do a FCP style thing confirming the form of the communication

YK: the rust project has been trying to automate the consensus process and such. I have a wycats dashboard where I am told where to look etc. I will share more in the chat.

#### Ember-CLI RFC #67, CP macro blueprint

RJ: We suggested before that new blueprints should do through the RFC process, the cli team discussed, stef?

SP: I do not have a strong opinion. Do we want to encourage people to create a custom computed property or not? I like CP macros.

TD: I don't love the term "macro" being part of the learning experience. They aren't part of the core ember learning experience. I would prefer that this be moved to the ember cpm addon instead.

SP: I find that convincing. Tom please leave a comment.

TD: Yes will do.

#### PR #14410 - Concept of "rendering" changing in 2.9

RJ: I want to apologize for using the word "bet" in this discussion.

YK: A difficulty is that when we use a poor term it is often taken up as more meaningful/intended than anticipated.

GC: I'll try to explain the technical side. Imagine we added a feature for a long time where when any shallow property changes an observer fires, imagine we use that in the template system. It isn't a feature that we have "star" observers, but for the purposes of this discussion you can think of the new rendering engine using them. The consequence is that if you have a component and you are pasing properties to a downstream child components and you set a property that is none of the properties you are pasing down, the rendering will fire although the properties passed didn't change.

YK: This was an intentional change. The React model is that you rerender every time, and that works to an extent. However Ember apps are bigger and we don't want to make people learn shouldComponentUpdate, so the solution is that when you `set` we bump the tag on the object and during rendering we do a comparison of the tag.

(further discussion)

KS: On this whole issue I want to give people workaround, but I could not always track what they were worried about. I went back to look at old behavior before 2.9 and it was sometimes the same. If you have an expensive thing, you should check it on your own.

MB: However this is a new challenge for Ember devs that didn't exist before. We've historically taken care of all the fine-grained observation ourselved, and there must be communication that the model is changing, and why.

RJ: We must decide if this is a breaking change or not. Right now the topics are potentially toxic, we need to collectively decide that the official explanation is.

TD: I think we need to pitch the benefits of the pull-based architecture. GC how is the book going?

GC: The book is more about the implementation of the reference system vs. the benefits. We also need to get specific examples of what issues are. We can make some cases faster, but we may regress real world cases where other work is being done.

KS: chaining through the hash object is probably messing people up. The only reason chains fire a change event when they don't change in value is b/c before it already promised that it will change. And the whole setup/teardown of the array proxy relies on this. If we can eliminate that case we can just remove the will/did and notification. And delete a lot of code that attempts to pair those hooks.

YK: I want to give some more precision about CPs. CPs do memoization, but they are doing an opportunistic thing. If I have thousand CPs Ember will try to not run all of them, but I should try to avoid those functions have side-effects are ensure they are relatively fast. It is about amoritzing cost. If I have a thousand and only a hundred run (though I cannot control what hundred) it was still good to save the 900.

RJ: Right but people think that the dependencies changing is the only thing that invalidates the CPs, even though we all know it has not been true. Ever. We need to make the docs clear to say it will be called when dependencies change, but it may *also* be called more often than just when they change.

(lots of comments on bloom filters and amortized cost)

TD: there is a narrative we have moved away from fine-grained observation and this fits in, but we need to communicate it beyond just docs (perhaps a blog post). I think we need to all be blogging more in general. So much of what we do is ephemeral, I think having to distill into a blog post is helpful.

RJ: Last time I tried to get into blogging I just ended up becoming a super involved contributor to a blogging framework....

(discussion)

TD: Standing offer to help people with perf or optimization hooks etc. Happy to help wordsmith. I think it just needs to be tag teamed.

KS: Generally I don't think we should merge this PR. I can't imagine it being faster if you benchmarked it.

RJ: I agree it is a lot of code. I think there are smaller things you can do in your code to protect against the issues caused by the new behavior.

GC: I don't know if you could actually do this, but I think yehuda and I need to do a thing.

TD: Can you benchmark it?

GC: There is a jsbin that shows it is actually slower, but I'm not sure even if you fix that if there is a global win. Basically there are pathological cases in the system and you can exaggerate them.

EF: Yeah there is a real problem in his app though, we should try to see what it is.

RJ: there are some observers etc

YK: Right, if we do all the bookkeeping to do this the problem is you regress the initial render. If you do it in a few hot spots it is fine though. We just can't do the fine-grained observation through the whole system, this is a thing we learned from looking at React comparisons where we used to be slower on initial boot and way faster on updates.

RJ: I think this dovetails with users wanting to use real getters etc.

YK: and we're not saying it is like react and we will rerender/run things all the time.

EF: I will craft a response, and I think some benchmarks will show the initial boot has a cost to it

KS: this is my gut feeling as well

#### shipping ember-source

SP: I want to ship and ember npm module we've talked about for months. It will be named ember-source, are we gtg?

RJ: I would like the next stable version of ember-cli to be able to ship with this.

SP: and the next version of Ember?

RJ: No I don't think we should backport it. 2.10 would be the ember version.

=SP: so ember-core is the current name, becomes ember-source

RJ: Right, ember-core is basically to be reserved for a future project.

RJ: I want to align travis builds for ember beta/stable and ember-cli beta/stable, we should sidebar.

#### three RFCs

RJ: No new information that changed things

YK: I have one thing- I disagree with the general purpose dynamic variable lookup thing in the routing service. I would accept another proposal and perhaps be convinced.

EF: We are covered, there is an alternative API in the RFC. Sound good.

KS: you think the commnunity was supportive of the titlebar thing?

RJ: right people have been working on the editor plugins etc

TD: right that is a sign they are supporting it

(some discussion over titlebar etc)
