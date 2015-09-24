# September 24, 2015

## Attendees

* MKN - Michael
* LS - Leah
* TD - Tom
* RM - Locks / Roberto
* BM - Brendan McLoughlin

**MKN**: Things are in good shape for our next ship date. Just the Initialized Snafu. There’s a reform to the registry and no docs for it. There’s someone who said they’re on it and will open a PR over the weekend (@dgeb).

There are some other things it would be nice to have for 2.1, but nothing urgent on my radar.

**LS**: Not emergency, but the Missing Deprecations work has stalled. Reminder, we could use more help to keep chipping away at it. https://github.com/emberjs/website/issues/2256

**TD**: What’s the status of the new design?

**RM**: Nothing’s happened since the last time we chatted about it. The redesign expects all the guides in a section to be in the same page, and I don’t think we’re going to do that, so I have to tweak the code a bit, and adjust some styles.

**MKN**: New style is nice, but I don’t think it’s more important than the content, like documenting clojure actions.

**RM**: Mixonic was signed up to work on clojure actions, but we haven’t seen anything on that in a while.
**TD**: I’ll work on clojure actions and try and get it in before the release next week.

**RM**: I’m going to start working on feature flags. The problem with punting the design stuff to someone else is that it’ll take more time than it’s worth to bring another person up to speed. I just need to sit down and do it.

**MKN**: ToddJordan is working on switching components from unit to integration tests, and is going to do a little audit of that whole section. There’s an open PR he’s working on.

**MKN**: MattW59 is almost done reviewing all the Ember Inspector stuff. One section needing love is components, no one’s really looked at it that much. It ties in with the issues of us not having clojure actions documented yet two months after shipping it.

**MKN**: There’s one area I need to chat with Mixonic about. We haven’t been on the same page with our approaches so hopefully we’ll talk in the next few days and iron out the kinks.

**RM**: I’ll coordinate with Tom and between the two of us we’ll get some components stuff out for 2.1.

**MKN**: I can work on the “working with relationships” guide if no one else picks it up before Monday.

**MKN**: That leaves [this one issue](https://github.com/emberjs/guides/issues/621).
**RM**: We removed the handling events from the guides, in the views, and we might want to bring back the handling events.
**TD**: It should be pretty easy to move.

**TD**: I’d like to revisit grouping initializers and services into the same category.
**MKN**: It was a bit of a rush job.
**TD**: It’s not fatal, but we should improve it.

**MKN**: The stateful helpers stuff could use some love.
**TD**: Someone wrote a really great blog post, maybe we can recruit that person. I’ll send the link after the meeting when I can find it.

**RM**: I got some of the people who wanted to help to start on Infrastructure stuff. Someone’s working on fixing some of our linking issues, and someone else is working on some warnings stuff. So we have some new people and stuff happening there.
**TD**: We should try and rope in some existing infrastructure people.

**RM**: There’s a current problem where we use some versions and we say “if the output is something like this, Node is probably installed.” People complain that the version the guides is checking for doesn’t match theirs. [This issue](https://github.com/emberjs/guides/issues/788) is because they’re using Node 4.1.0 and we say something like 0.12.

**MKN**: Can we make it more generic? Something like… the output should say a version number. How about we do a quick PR for this and get it knocked out?
**RM**: +1

**MKN**: Stef doesn’t like that Runloop is in components section.
**TD**: Me either.
**MKN**: Nobody likes it, but where should it go?
**TD**: Let’s have a chat about it after next week’s release and figure out something that makes sense.
**RM**: This ties into the open issue, [Improve Guides Organization](https://github.com/emberjs/guides/issues/639).
BM: Could the core team discuss it this week?
**LS**: I’ll put it on the agenda.