# Learn Team Agenda 11/20

## Topics

- Finishing the API/Guides mapping x_x Todd wants to do this, yay
- Navbar (https://codepen.io/melsumner/pen/fdbbf151c4989bbadbd05dc0b9b14a72)
- Ember Guides POC

## Action Items

- [x] Staging env for API docs is badly needed
- [x] Need to continue updating content in Ember itself
- [x] Finishing up redirect work
- [x] Redirect with Fastly in staging too, or drop Fastly - talk to @amrylam to see if there are any clues
- [x] Find out what @mixonic did to the buildpack to get around previous bad deployment
- [x] Breakout w/Todd Jordan and Michael Schinis on search structure
- [ ] ID 2nd contributor to help with search - Jen will reach out to wmattgardner and connect with TJ/MichaelS
- [x] Burndown list of everything that would need to be ported into a staging env
- [ ] DB: Heroku blog post to launch on 10/23, DB- my focus now, dedicating time next week.

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- MS: Michael Schinis @mschinis
- MelS: Mel Sumner @melsumner
- CM: Chris Manson @real_ate
- DB: David Baker @acorncom

### Notes

#### Guides/API Mapping

JW: What do we do about legacy URLs → 2.16+

TJ: There’s plans on the books to use the json mapping file to properly transition it.  Just haven’t dedicated time over the last few weeks.  My intention is to complete it out over the next few weeks.

#### Navbar

MS: Shows: https://codepen.io/melsumner/pen/fdbbf151c4989bbadbd05dc0b9b14a72

MS: API and guides first?  what do you think

DB: core team didn’t like it

RM: didn’t want to hide the guides under a click

MS: guides under docs is pretty standard across ui frameworks.  Maybe we should reopen the discussion.

RM: agreed

MS: is Ecosystem the right word?

RM: We tend to think addons when using ecosystem.  This would be something else.  Need a better word

MS: I can talk to some friends who are experts in naming things

RM: I like current builds, status bar, contribute.  remove previous releases

JW: I’d think that contribute and status should be under community

MS: shows vue js ecosystem dropdown

DB: do you think liquid fire, ember data, etc should be separate under ecosystem

RM: maybe when we consolidate api docs we can link from each

DB: with ecosystem are we talking about ember code or the community as a while

MS: should probably change the word, I meaning code, as to differentiate people and code.    Need a better word

MS: what about security?  about or docs?

RM: fine the way it is (about)

RM: I think the name Releases would work for now in place of ecosystem, and have each release shown (beta, canary, stable, lts)

DB: not sure release needs that much visibility

CM: Agree with locks from company perspective that release train is a big deal

JW: would like to add that this refactor is excellent and necessary so excited to see it move along

DB: how do you get to the community page when community is a dropdown?

RM: Community link under community?

DB: would like to see splash pages for each release.  The lts blog post was very useful for explaining what it is, but has since been buried under other posts. https://emberjs.com/blog/2016/02/25/announcing-embers-first-lts.html

RM: For releases put stable first and call it “release”, and rename heading from “release cycle” to “channels”.

JW: for marketing purposes I think LTS should be first, its the one I’d like to highlight the most (as a differentiator)

DB: I’d actually like to remove the word “channels” because it would not jive with non in-house folks

RM: its pretty standard for developers (like an exec)

DB: I don’t think it is

CM: an exec may not be concerned with the “Releases” dropdown in the first place.

MS: I have to explain this at JP Morgan to different types of people, so its important to consider in the web site.  Lets add a Why Ember page. https://gist.github.com/MelSumner/971ba6b7a3c0b01a4cb3a43d3b962dac

JW: That’s a great start

#### Search Update

MS: Siva sent me a script that pull stuff from s3 to download the assets and seed it local.

MS: api docs would use the json files directly

DB: how would this work for guides?

MS: haven’t considered guides yet.  How does it work?

DB: depends on Chris

DB: does algolia give us the index.

MS: they are donating it do the ember OSS, not me.  If someone wants to be involved I can make them an algolia admin on the project.

#### guides

CM: shows current project source

CM: converting page to json.  Markdown goes in content property, yaml stuff gets its own properties.  Should be possible to do that with next/previous links.

CM: prism library doesn’t support handlebars syntax highlighting atm.

CM: Illyia just linked  to a thing called team discussions that aren’t necessarily issues, maybe we can use that to doc/discuss these types of things.

DB:  looks like they do have some support for handlebars, maybe we are giving it the wrong identifier (handlebars vs hbs)?

CM: also prism doesn’t have a concept for showing the filename in the header, that’s something we’ll need to customize

CM:  for line numbers there is a way to tell each block in md to add a class, which can enable line numbers

- https://github.com/PrismJS/prism/pull/409

DB: also support line highlighting (add/remove), and there is also an addon for that.

- http://prismjs.com/plugins/line-highlight/
- https://github.com/emberjs/guides/issues/944
