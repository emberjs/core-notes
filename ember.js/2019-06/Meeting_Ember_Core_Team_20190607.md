# Meeting: Ember Core Team 2019/06/07

## Agenda

- (public) (**2 min)** Determine note taker → MB
- (public) (**2 min**) Determine person to upload notes → MB
- (public) (**5 min**) [emberjs/ember.js README.md updates](https://github.com/emberjs/ember.js/pull/18058) (RJ)
- (public) (**5 min**) co-authoring RFCs [& commits](https://github.blog/2018-01-29-commit-together-with-co-authors/) (MS)
- (public) (**10min**) Rename hash helper https://github.com/emberjs/rfcs/pull/482
- (public) (**5 min**) Request for Times content (JW)
- (public) (**5 min**) Notion.so (CG)
- (public) (2 min) `x-handlebars` 😱 https://github.com/emberjs/ember.js/pull/18080
- (public) (**5 min**) Ember Data / Mirage / Octane 😱 (YK)
- (public) RFCs - → FCP - [Deprecate](https://github.com/emberjs/rfcs/pull/486) `[mouseEnter](https://github.com/emberjs/rfcs/pull/486)` [/](https://github.com/emberjs/rfcs/pull/486) `[mouseMove](https://github.com/emberjs/rfcs/pull/486)` [/](https://github.com/emberjs/rfcs/pull/486) `[mouseLeave](https://github.com/emberjs/rfcs/pull/486)` - [Async Observers](https://github.com/emberjs/rfcs/pull/494)
  [](https://github.com/emberjs/rfcs/pull/486) - FCP → Merge - → FCP to Close - FCP to Close → Close - Enable
- (public) Issue Review
  - (**5min**) https://github.com/emberjs/ember.js/issues/14712
  - (**1min**) [Big numbers in templates](https://github.com/emberjs/ember.js/issues/15635)
  - (**1min**) [Setting a non-existent path with two way bindings](https://github.com/emberjs/ember.js/issues/14747)

## Attendees

[x] Yehuda Katz
[ ] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[x] Igor Terzic
[x] Matthew Beale
[x] Edward Faulkner
[ ] Dan Gebhardt
[x] Godfrey Chan
[x] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner
[x] Jen Weber
[x] Chris Garrett

## Action Items

[ ] RJ will comment on the README PR, saying it was discussed and YK/TD will review/merge.

## Minutes

**README Updates**

RJ: I think this is not a big deal, but wanted to bring it up. Someone asked if we need an RFC etc. I don’t think we do. I think the changes here are overall pretty good.

(discussion of alternative to “immortal” which have punch but less mortality issues)

RJ: I raise it here so the tone can match the website, or in general can be on the same level.

YK: I think TD and I are kind of responsible for this. I think we should merge it. I think TD and I could read and make edits to it later.

RJ: Action item is for TD and you to do a review then?

YK: No we should change the word and have TD look at it, but hopefully merge it quickly without too much process.

(URI v URL discussion)

**Co-authoring RFCs and Commits**

MS: I’d like to figure out a way to put co-authors on RFCs. I’d like to have a uniform way to add other authors. Also please to check the github docs to preserve ownership of commits.

RJ: I think it can be super important. There is a Chrome extension which will show all the authors. “Refined GitHub”.

(discussion)

**Rename hash helper**

RM: GC mentioned this in an issue. I worked on it at a contributor’s workshop. People have been raising a lot of questions on it. So this is a request for help, especially from GC if he can take a look at this.

RJ: I haven’t read through this. I’m personally more interested in changing the names of default arguments than changing this. Changing it in apps seems like busywork.

YK: I basically agree but I’m still slightly in favor of it anyway.

RJ: Right if we will eventually have a syntax for arrays and hashes anyway, maybe we should not push people through a deprecation cycle.

EF: The statement of the problem is very good. But if we want to align our template lingo with JS just changing the helper name doesn’t do that.

(discussion of native syntax options proposed by YK)

**Request for Times Content**

JW: The Times is interested in covering some of the internal workings of Ember again, but the reason they kind of stopped working on that is that it is very difficult to find issues etc to read and research with. So if you are reviewing/writing a PR please talk to them and let them know. I think when they were writing more about what was happening in Ember itself it communicated something helpful, and shared a feeling of progress etc. It doesn’t need to be freshly merged work or anything. Please feel free to drop it into the times chat or DM me etc.

RJ: To clarify, you would like to make this a thing we do on a regular basis.

JW: Yes! It is not expected that people do the writeup, in fact that is an important part of what that group is interested in doing.

**Notion.so**

RJ: I think CG mentioned this. I like Notion.

KG: I can’t remember, now that it has export that is something which was missing.

RJ: Notion has markdown export now. It also has public for read, private for write with a team. And it isn’t “a company”, it is just a list of people. The ED team has been using Notion for a while and it has been convenient.

CG: (some reasons Notion is nice)

RJ: Folks should try it out. We can talk about it more at the F2F.

IG: They gave ED a non-profit account. So we can add people to a workspace for that. I can give people 10 minute walk through as well.

RJ: The account is actually Ember.js, it was intended to grow.

RM: I also have some experience with this. There is a TOC thing etc.

YK: Is the tldr that it has the features of Dropbox but the permissions model is better for us? I can suspect that those things are true.

**x-handlebars**

RJ: We still have this code hanging around.

(discussion about how this might still be used)

RJ: It is hard for me to reason about, but I think this is public API. So it will need an RFC etc. Well maybe it is

**Ember Data / Mirage / Octane**

YK: I ran into an issue upgrading SuperRentals. Ember Data closes over window.fetch early in evaluation. Mirage and pretender modify those global variables.

RJ: Right, yes it is a bug that it is closed over.

KS: It should maintain the indirection.

YK: There is a question about if there should be a more official way that Mirage does this.

RJ: Right the motivation was just to decide which thing to use, I didn’t mean to close over it. It could just as easily be a function that calls it.

YK: I think we might want to have a more canonical way for other parts of the ecosystem to interact with fetch but be resilient to this kind of failure.

RJ: The rough thing is that we had jQuery for a long time. And we’re rebuilding the interaction so we made some mistakes.

(discussion)

YK: Let’s continue in chat. I just wanted to raise it since this is a blocker for SuperRentals and Octane.

**FCP: Deprecate mouseLeave mouseMove mouseEnter**

RJ: This deprecates the methods on Ember components and with the action modifier. And eventually you can’t have it by default in the event dispatcher.

RJ: There are a few things this addresses. First of all these events don’t bubble. So we were leveraging jQuery which did bubble them. But when we dropped jQuery we had to add code which did the thing jQuery did. It would be great to drop that code and/or svelte it out.

RJ: Second these trigger the warning about the listeners not being passive. It is clear how to migrate away from it in an app. But I think it makes sense to get rid of these by default.

RJ: There are a couple screenshots of an app when moving a mouse around. We are doing a ton of work during those handlers.

(discussion)

- The RFC shouldn’t use bind, just use an arrow function
- The migration suggested to Ember components is maybe not often the best approach. For example moving to {{on would be better, or using something other than mousemove anyway
- The Ember.Component version as written even still causes the Chrome warning (it is not passive)

**FCP: Async Observers**

(summary)

YK: the RFC should talk about how this optional feature would be enabled in Octane by default.

CG: RJ did a dive to make sure we can polyfil

RJ: We can polyfil it backwards, basically forever. Monkey patch Ember.Observer and schedule.

RJ: FWIW This isn’t just the end of observers. I think we should still move down the trajectory of killing them off.

YK: Dependent key compat. If you add an observer to a thing which is dependent key compat you would get the sync observer. But it sounds like you are saying you will not?

CG: Yes, we are not firing property change on the tags on each change.

YK: I think on ever tag bump you could fire the change, but I don’t think you want to.

(discussion)

YK: Seems good.

RJ: Anyone opposed to FCP? I think the only tweak is to make it clearer that in Octane we will enable the feature by default. And I will leave a comment about polyfil.

(discussion wrt alternatives section)

YK: I think we are just OK with sync observers being much slower. They should be prepared for the possibility that if they use sync observers it will be slower.

(discussion)

CP: I’ve got a blog post on this as well to publish after this lands.

JW: Yeah we should sync up. We go off the RFCs to create guide and other content.

YK: I think it is similar to when JITs arrived and made with() { slow. It was just too bad, don’t use with() {.

YK: I agree if you are not using observers you should not expect code to get slower, but eventually we expect to see speedups.

KS: The async form of observers isn’t even that bad. It is essentially like our rendering process. You’re just doing revalidation.

YK: Yeah I think that is good to call out. And if you’ve migrated to Octane you don’t need to worry about it.

RJ: And we tested this thing (async observers) in lots of apps and most of them worked. It was a minority that had an issue.

**14712**

https://github.com/emberjs/ember.js/issues/14712

[emberjs/ember.js#14712](https://github.com/emberjs/ember.js/issues/14712)

(discussion)

RJ: I think if someone has a failing test case we could dive into it.

YK: Anything around attribute ordering is hard to fix. We’re already doing some fixes around the type attribute.

RJ: We should probably make a IE11 bug label.

YK: I talked to the Chrome people about an API for adding all the attributes at once. But they said no, they would rather just fix the bugs. Which they did.

**Big numbers in templates**

RJ: This is something, the table we use to look things up in constants.

YK: There are two versions of the problem. One where we literally don’t have enough space in the opcode, then there is another version where JS’s numbers are not just big enough. Good news, now we can use BigInt. But it is unclear to me that we want to silently create BigInts.

RJ: I don’t think the fix GC suggested would fix the thing. parsing from a string.

YK: It is possible we didn’t raise it to 52 bits which is JS’s number size.

KS: It might be that we haven’t updated Ember to include the fixes. It was pretty recent.

YK: My suspicion is that we set it to 32.

(discussion wrt fixing problems in Glimmer v Ember)

RJ: It would be nice to have Ember’s AST transform system in Glimmer itself.

YK: I think to the end that people are doing source transformations having an API for compatible ones is a good thing.

**non-existent paths**

RJ: (summary)

RJ: In this case the issue is without mut. To me the big issue is how it goes boom. I don’t think we can fix sending invalid paths.

YK: It is an outlier in terms of how soft-fails works in handlebars. You could just make the set a no-op.

RJ: But if it is a mistake, we should not black hole it.

YK: Right, no. I think there is some reform of how the mut system could change.

RJ: I think we need a thing which is what mutable cells were. But that is the thing we need. You could imagine it was just an updatable reference, seems fine.

(discussion)

YK: It is interesting that react references are exactly what this is. I think the mistake in (mut is that it was half-working half-zombie and caused a lot of problems. In a perfect world the (mut syntax would desugar into the (fn syntax and I think that would solve a lot of problems.
