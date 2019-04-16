# Learn Team Agenda 2018-08-02

## Topics

- Decision on where topics like the Removing JQuery guide should go (Jen) PR https://github.com/ember-learn/guides-source/pull/64/files  -  Make a page called Optional Features (different than feature flags bc they aren’t experimental).
- Ember Optional Features: https://github.com/emberjs/ember-optional-features
- Features that links to a blog post or whatever
- Info gathering - sections of the guides to point people towards for contributing (Jen) - Ember Engines (talk to Mel - 9am Central Fridays), Ember Data (ask Sam about this), Optional Features
- Next release of Ember? (Jen) August 27th
- Hosting CLI guides on emberjs.com/guides/cli or similar - ok. Subdomains are easier than subfolders for the structure. Has implications on service workers cli.emberjs.com is the way forward
- Some news (cryptic! Chris) - congrats on joining Simplabs!
- Guidemaker as a thing? Tutorial App (Chris)

## Action Items

- [ ] Make a page called Optional Features (different than feature flags bc they aren’t experimental).  Link to https://github.com/emberjs/ember-optional-features
- [ ] Fix features.json link on https://guides.emberjs.com/release/configuring-ember/feature-flags/
- [ ] RFC for overall website structure - needs to say “this is what we are planning to do” vs asking for permission. “Is there something we missed?” is the question, not design by committee - Mel wants to take the lead! Want to be able to report back next week!
- [ ] Next week - a topic should be writing down some recent decisions

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RW: Robert Wagner @rwwagner90
- CM: Chris Manson @real_ate
- JW: Jen Weber @jenweber
- JJ: Jessica Jordan @jessica
- DM: Dan Monroe @danmonroe
- F: Frederic @hakilebara

### Notes

#### Where should “Removing JQuery Guide” go?

- JW: only one guide issue left.  Simon wrote a “removing jquery guide” and was wondering where it should go in the TOC.
- CM: There’s already a feature flags section and has link to an emberjs json file that has the flags and its currently a 404.  Wondering if we do merge this, we should start a conversation about the larger ecosystem.  There are ways to “modernize” your ember (some in RFCs), and want to see if its worth a general place to configure these things.
- JJ: Maybe we could convert the feature flags section to do something like this
- RW: Would be nice to have a breakdown of what the difference is for enabling these feature flags.
- JW: I wonder if we put the jquery stuff there through.
- CM:  My impression is its a temporary thing because jquery will be gone.
- MS: What if we make it into a blog post?
- TJ: I think there should be an “Optional Features” section that details the actual optional features we have (I think there are 3-4 of them undocumented)
- JW: ok lets do that

#### “Guidemaker”/Tutorial App

- CM: The experiment to make a generalized guides system is looking pretty good.  I’m going to put some work into making it something others can use.  My questions are a) does anyone have a better name? and b) is there value in getting others looking to write guides to get more eyeballs on it or is it something we privately use for a while and then advert.
- JW: once my rfc is a go I think we should advertise
- CM: There’d be 3 things using it then
- JW: putting more info out on things we are doing is helpful
- MS: helping people see behind the curtain is helpful for people to gain confidence in contributing. One approach would be to expand on this idea and put out some details and roadmap to this.
- CM: one detail is the guidemaker is on the stonecircle site at the moment.
- TJ: github org is really about access control.  If you want to maintain it you can keep it under yours, as long as its open source.
- JW: also it might be used more general purpose and have a broader community, which would be more conducive to having its own org.
- TJ: yeah, so its up to you.

#### Releases

- JW when is the next ember release
- MS we are trying to stick to schedule now, so in six weeks.
- JJ: Release page claims aug 27
- JW: would like to be prepared.

#### Guides help

- JW: got a message on twitter from a company that wants to help with guides.  Anything about guides bugging anyone that I can put in a list?
- TJ: optional features ;-)
- MS: ember engines and ember data need help
- MS: we have engines meetings friday at 9am central

#### Guides

- JW: How do we feel about guides not being its own site
- MS: I think its in plan, lets make sure its somewhere where its recorded and we can revisit.
- CM: A technical consideration is now that we are using guidesmaker, it doesn’t like being a subfolder.  Subdomain is easier.  Service workers is another consideration.
- MS: would be good to be part of a larger website rfc
- RM: we don’t want design by committee.  if we do an rfc it should be like this is what we are doing, are we missing anything.
- MS: agree that its the way we should do it.
- RM: the team is more than happy for us to take over cli docs.  The main website would be what do you need to know if you are using ember/ and addon.
- RM: would be cool to have subdomains.
- MS: I’m determined for consolidation under emberjs.com to happen.
- CM: subdomains are slightly better for seo.  moving ember-cli.com to cli.emberjs.com would be a big boost.  service workers would improve lighthouse score which would improve google score, which would help each other.
- JW: would anyone have an interest in doing the rfc for this?
- RM: I’ll help with it.
- MS: I’ll take it.
- MS: Can we have an action for next week?
- JW: done!

