# Learn Team Agenda 2018-02-15

## Last Week Action Items

- [ ] JW - add Times suggestion to PR templates (will take some time to track down help across repos where I don’t have permissions… looking at Ricardo :P)

## Topics

- Ember blog posts, switch from Disqus → Forum setup (RM)
- Processes to keep us on the same page (DB)
- Ember 3.0 in review, anything we need to change? (DB)
- Deprecation-App, we are done and need volunteers for final QA :)
- Ember QUnit API Documentation Updates: Tutorial Update, new urls for Testing Guides sub sections - what has to be done before renaming? (Jessica)
- Ember Inspector (Teddy / Ricardo)
- Guides app → search (CM)
- Let’s pick one please: https://github.com/emberjs/website/issues/3166 (MS)

## Action Items

- [ ] Write up an issue on replacing blog posts commenting system ( switch from Disqus → Forum setup embed) @David B
- [ ] Setup a learn-team-rfc/process repo for us to experiment on with processes to get on the same page @David B
- [ ] <items here>

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- MS: Mel Sumner @melsumner
- RW: Robert Wagner @rwwagner90
- JW: Jen Weber @jenweber
- JJ: Jessica Jordan @jessica
- SF: Serena Fritsch @serenaf
- SK: Sivakumar Kailasam @siva
- AL: Amy Lam @amyrlam
- CM: Chris Manson @real_ate

### Notes

#### Ember blog posts/Switch from Disqus

- RM We want to remove disqus, and replace it with discourse forum discussion.  I think there’s an embed mode we can use now.
- DB: I can write up an issue about it

#### Learning about Learn Team
- DB: we are losing some decisions/discussions in slack.  How do we capture these?
- LS: do we have any examples?
- DB: yeah, yarn vs npm discussions that not all of us had context on previous discussions
- CM: had I known of the original conversation.  Didn’t know of the decision and would’ve loved to participate
- DB: I’ve heard from basecamp talk about longer term discussions verses smaller temporal things. chat is not good for the longer term things.
- DB: another example is seo stuff we decided a while ago
- RM: there’s forums now for teams in github we could try.  downside is its only for teams.
- DB: that would be good or a github repo.  my concern with github team is that there are people starting that want to get involved and learn things but that won’t have access.  Meeting notes record a decision but you don’t get good nuance of arguments.
- SK: Lets use Discourse! its got threading and there’s already a channel for us.
- LS: sounds like a real need, but don’t have any good solutions
- DB: yarn vs npm, why we are doing all ember apps, api docs decisions are all examples.  Maybe an RFC-like thing within our org.
- CM: I was interested in Mel’s experiment with gitbook, was wonder if that was a possibility
- LS: I used it a while ago, tried to write a book with it but abandoned it.  I remember having some issue with the tooling, but it was years ago.
- MS: I’m using it to teach myself RoR, and it feels kinda like onenote.  Seems to organize things well, and you can use markdown.
- LS: what advantages over a regular repo?
- MS: it looks nicer 🙂 we don’t have to make a decision now… lets us the text week to research and form some opinions.
- CM: I like the RFC idea, because it encourages discussion via PRs.
- MS: Ok, lets think on it and table to next week


#### Any things about 3.0?

- RM: we guides, apis, deprecations we will talk about, so I think we are good.


#### Deprecations

- Serena: need some volunteers to go through the app and look for any missing things that would be a blocker for an initial release.  Will the search just work? GitHub issue: https://github.com/ember-learn/deprecation-app/issues/69
- AL: I can help with that!
- CM: we can use the same thing we are using for guides in search

#### Test Documentation
- JJ: merged the updated tests docs, need to do some structural updates, plus super rentals needs an update, I can pick that up.
- JJ: some of the terminology has changed, and those names are represented in urls, so wondering how to change those
- DB: we can do redirects with our app.


#### Ember Times
- JJ: draft coming tonight, Mel you up for review
- MS: yes!
- LS: Maybe call out the contributors workshop
- JJ: I can do that!


#### Inspector

- Teddy: how can I help with the workshop around inspector?
- RM: we want more contributors for the inspector and the learn team wants to help more.  The immediate thing that would be helpful is small issues people can tackle at the workshop.
- RM: a more mid-term goal would be for us to develop a better understand the internals of the inspector and how it works
- Teddy: I’m ready to pair with someone
- DB: Robert you up for that?
- RW: Yeah, I’m ready
- CM: would be really awesome to have that recorded.
- Teddy: cool, we could build a feature together.
- DB: we don’t want to take this from you, but we do want to help, but it seems really complicated
- Teddy: willing to help however!


#### Guides and Search

- CM: guides is ready and the last thing is search.  David helped set up the default algolia search support.  Talked to siva about getting a heroku link, works within the same version.
- DB: do we want to use heroku or netlify?
- CM: we should put that into our discussion repo ;-)
- SK: we should use heroku, since we are utilizing it for our other stuff
- RM: yeah were running into some limitations with managing netlify.
- DB: sg, will need Leah to make the dns change when we are ready to go.
- LS: I’m here when you need me!
- RM: when we do the dns changes we should see if we can fix the github issue (siva will know what I’m talking about)
- SK: we can do it after emberconf.
- SK: we are just using $50 out of our $100/month, so don’t be shy.


#### Design

- MS: Changed the header for the ember blog.
- MS: the get started box isn’t conformant because font size plus contrast (shows us some options).  3 options, how can we vote.
- (slack icon vote) - picked a winner (#2).


#### Twiddle

- GM: Still looking for help with twiddle, reach out if you are interested!
