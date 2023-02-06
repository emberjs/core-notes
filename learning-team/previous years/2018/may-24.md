# Learn Team Agenda 2018-05-24

## Topics

- Initiative Status Check
- ember-learn RFC repo (similar to emberjs and ember-cli)
  - discuss
  - implement if consensus
- https://discuss.emberjs.com/t/propose-documentation-add-css-section-into-ember-js-guide/14563
  - should this be moved to an ember-source issue? (Jen - eventually)
  - should we direct people to create issues in cases like this? (Jen - yes, we should encourage them to discuss and then ultimately open issues)
- https://meta.discourse.org/t/question-answer-plugin/56032
  - should we add this plugin to the Questions tag?
- https://discuss.emberjs.com/t/about-the-questions-category/14497
  - we need to fill in this “about the questions category” details 😂
  - https://cl.ly/0g0G2S0r2h2b ← screenshot of current content
- “Forward Porting”
  - https://github.com/ember-learn/guides-source/pull/51
- New Contribution Guide

      - setup landing page on emberjs.com about how to contribute?

- Moving the meeting time up an hour - what would be the impact? (Chris - which way is “up”? 😖  Jen - sorry I mean an hour earlier)
- Search
  - Updates & Next steps


## Action Items

- [ ] <action-item>

## Minutes

### Attendees

(Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- DB: David Baker
- JJ: Jessica Jordan
- SK: Sivakumar Kailasam
- MS: Melanie Sumner
- JW: Jen Weber
- CM: Chris Manson @real_ate
- Mike B @localpcguy

### Notes

#### Initiatives

- MS: I wanted us to look at the air table and revisit some of the initiatives we came up with in the face to face, to make sure our priorities continue to be in line.  I think it would be good at our next face to face to compare it against what we have accomplished this year.
- CM: I’ve forgotten how to read this as far as priority is concerned and how it is organized.
- MS: <explains how to assign and prioritize stuff in the initiatives tab of air table>

#### Ember Learn RFC Repo

- MS: since ember and ember-cli have their own repos.  I’d like to add an rfc repo in the ember learn.  What do we think about this?
- DB: My concern is that there is 3 places for rfcs
- TJ: I think we want the same audience as we have in ember rfcs
- CM: I think a count point is that there is a bit of a perceived skill barrier to the emberjs rfc.
- DB: What do we think would qualify as an RFC?
- MS: Lets share our stories and humanize this process. It took me a year to get up the guts to write one and it was rejected.  I think
- MB: I think us getting some learn rfcs out there will help the barrier
- DB: I think if its important enough to show up on status board its important enough to rfc and advertise.  Marketing push, jquery removal, website moderization, tutorials are things I’d like to see on the status board and things we want to get rfcs for.  Maybe a requirement for the status board is an RFC?
- MS: Meeting with locks about the status board tonight to make sure its something that continues to be active and used in the community.
- DB: a lot of people don’t know it exists.
- MS: we don’t advertise it much because of the state its in.
- DB: conceptually is it better to be incomplete to be able to include people on the process of developing it and its usage?  Maybe a blog post would be a good thing to let people know about it.
- JW: I think it doesn’t hurt to mention it as something that is going on.  I think the times is helpful for that.  Maybe we take our queues from that and mention that its on its way.  We should have a set of clear issues on what needs to be done and how people can help.
- MS: that will be the goal in my status board meeting with locks tonight.  The style guide is an example where we make good digestible issues that invite folks to help
- DB: Maybe the status board should be on the status board 🙂
- MS: Lets develop out our issues and tasks for people to help and then we can start advertising.  I think a blog post would work.
- DB: would be good to have a list of things we want on the status board, and then PR to get feedback.
- MS: I’ve been trying to figure out how we could automation this based on something like issues.
- DB: I’d suggest we wait on automation for that.  For guides we’d publish every 6 weeks, and then eventually automate it.  We’ve got so many people in different places on this that it will be tough to get buyin.  I’d say we agree on something and get it out and then automate it as we go.
- CM: For guides it was nice to use org projects vs quest issues.  If we could somehow incorporate that.
- DB: Question is do we want that to block it from happening to do we want to get something going and get there eventually.
- MS: how about we add a last updated date.  That would give feedback on what items need updates.  Then once we are automated we can take that out.
- MB: The status board is a marketing tool.  I just want to make sure we leave room to make things really nice to leave that good impression.
- MS: I’d like pattern this after Microsoft’s who does a pretty good job of it

#### Discourse issue on CSS section in guides
- CM: issue on discourse.
- https://discuss.emberjs.com/t/propose-documentation-add-css-section-into-ember-js-guide/14563

- CM: How should we handle these types of things?
- JW: sometimes I think we we talk about opening an issue right away it snuffs out discussions.  I’d like to encourage both.
- CM: Cool, I will attempt attempt a response then

#### Forward porting of guides

- CM: Already cut 3.2 guides source.  But we’ve put a couple of things in 3.1 since and need to forward port.  Should we ask them to merge into 3.2, or should we just do it?
- SK: I think we should ask them
- TJ: How about we make it like ember where we have a master branch that is forward development and then just cherry pick things back as far as we think appropriate/sane.
- DB: I think our aversion to back porting came about from how hard it was to do it before.  I’d be ok with finding a way with the new stuff to make backporting easier.
- CM: one of the underlying themes with guides was to keep things simple.  The builds are pretty fast and I’m not sure its worth adding a lot of complexity to build all the way back.  I like the fact that guides is simple a version and markdown files.
- JW: one thing we lose a little with the current structure is maybe the contributor history/evolution of a file.  I’d like to keep things easy to contribute, so I think there’s a couple of strategies we can use.  One thing is that our pr addressing is really fast.  If that slows down I think we will run into problems.  It think we should consider what is the simplest thing for people.
- CM: We can do some more complex things that make things easier to the user, like a bot that does a git merge forward.
- DB: I think it would be nice to have people go to a single release folder instead of a version number.


