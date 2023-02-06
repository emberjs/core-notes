# 2017-03-23 Agenda

### Previously

- [ ] All: Mark items in each learn repo as "good for new contribs" (by Friday!!!)
- [ ] RM: Make issue about Core Concepts missing Controller
- [ ] SR: send locks link to emberitas workshop materials
- [ ] RM: Create an issue to improve component layout api docs.
- [ ] Contact the Tomster designer (Lindsey) for twiddle logo
- [ ] Add design process document to the twiddle repo#
- [x] DB/RM: Give Todd feedback on tutorial, let's get it merged
- [x] DB: Talk with Terence re: Heroku / S3 / json files
- [x] RM: Bring up API fastboot stuff at core team meeting, get a decision there

### Topics

- api docs
  - Remaining tasks and MVP
    - Appcache/service workers
    - Search
    - Project switching/Build issue
    - Fastboot
  - Deployments
  - Rollout
- tutorial
  - Proposal: New user feedback goes to "Discuss" forum
  - Mike North and API server

# Action Items

- [ ]

# Minutes

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- SK: Sivakumar Kailasam @siva
- RM: Richardo Mendes @locks
- MS: Michael Schinis @mschinis

## Notes

---

##### Guides

TJ: After merging PR [1818](https://github.com/emberjs/guides/pull/1818) closed out [1708](https://github.com/emberjs/guides/issues/1708) on new user feedback and created issues for the remaining action items.  Labeled them help wanted or good for new contribs with some direction in case folks want to contribute back making the tutorial clearer.  Also created a [github project tracking tutorial consumability feedback](https://github.com/emberjs/guides/projects/1).

TJ: So github is proving to be not so good for tutorial user feedback.  The amount of comments from a tutorial run can be large and needs sorting, and doesn't lend itself to being actionable.  At the same time if a feedback issue lasts a while then it attracts un-constructive comments.  So piggybacking on a suggestion RM made on slack, I think we should start directing people willing to offer feedback to the [learning category on the discussion forum](https://discuss.emberjs.com/c/learning).  That way we can collect user feedback and then from there parse through it and create actionable items.

RM: Agreed. We also have better moderation mechanisms on that site.

TJ: should we make feedback collection a single thread or a new thread for each person.

RM: we should do a new thread for each person.

TJ: Sounds good.  That way we can have a discussion focused on specific feedback.

TJ: Mike has offered up an API server he's using for his training materials to host super rental data.  This might be a good option for addressing [https://github.com/emberjs/guides/issues/1695](https://github.com/emberjs/guides/issues/1695), pushing back mirage usage in the tutorial and reducing some confusion while new users are trying to grok ember data.

RM: I think another option is now that we are getting free dyno(s) from heroku we can have one of our fastboot servers route to that data.

TJ: The third option is that since super rentals data is static, we can just stick json-api compliant json out on our S3 instance.  Ok, we have 3 options now.  Will start looking into it after EmberConf.

RM: want to include tutorial in the long term roadmap. I'd like to move the tutorial outside the guides, and from the learn page separate things out.  That would leave room for a possible additional tutorial.

TJ: Agreed that that super-rentals is more intermediate level, because of the amount of content it covers, even with additional work around consumability.  So we are saying that between the quick start and super rentals, there's a spot for something in between.  Something more newbie friendly than super rentals, but that dives in a little more than the quick start.

RM: Yes.  Also, I'd like to add merging ember-cli docs and ember guides

### API Docs App Status

#### Todd

TJ: Currently working on getting the service worker/appcache implementation working well.  Had to make a couple of updates to keep the appcache download from failing.   If anything is wrong in your manifest the whole thing craps.  Now looking at a few issues I see as well as trying to get are lighthouse PWA score good.

RM: I think Kris Seldon commented on some things in slack.

TJ: Yeah, its seemed like it mostly had to do with fastboot and some with we should look to reduce module size.  Sounds like the solution he suggested to make fastboot not slow would make us not SEO friendly.  Doesn't sound like a good choice.  My hope is fastboot gets continually better perf-wise over time.

#### Michael

MS: Down to just a couple of minor fixes to get the algolia search ready.  Would like to also propose adding a search results page.  This would open up much more feature potential such as integration with openSearch.  Would also allow us to better handle results for various versions. Created an issue on it in the repo.

TJ: I think adding a search page would be great.  Lets finish out the base implementation for this week, and then you can go for it.

#### Siva

SK: still having problems with our data on S3 that's cause project switching in the api docs app to fail.  Since I don't have ember s3 access I plan on working through the issue on my own heroku deployment and getting Godfrey to update once I know how to fix.  Once we get around this issue it should free up travis deployment, and we should be deployed to api-new fairly quickly!

TJ: How are you doing with the background service worker functionality?

SK: Since performance is pretty fast between the current caching and static fetch of files, I've been focusing on getting the build working deployment going.

TJ: I think your priorities are spot on.  The s3 issue is the biggest blocker.  I may get around to it tomorrow myself.

#### David

DB: To roll this out to the main `/api` URL, we will need to ensure links to the old api docs redirect to the new routes.

TJ: I don't think we should immediately deploy to `/api` but rather start at `/api-new` and announce we are in "beta".  That way the change won't be as jarring to folks, and we don't have to rush a deployment in the next couple of days.

MS: We've done a similar redirect strategy at my work and didn't end up being too bad.

TJ: would still feel more comfortable holding off, plus there are `#` links in the current api docs that are handled with query params in our ember app, like when you click on an item in the index tab of a class.

DB: yeah that sounds like there may be some work there, especially since `#` URLs aren't sent to the server, but just processed on the browser.

TJ: we would have to add javascript code that read the hash off the url and transformed it to query params.

MS: so if we didn't deploy immediately, we should hold off of reindexing algolia.
