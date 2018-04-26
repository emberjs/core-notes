# Learn Team Agenda 2018-03-01

## Topics

- Deprecation App-Making the switch
- API
  - left nav options
  - api-ification (test-helpers, cli)
  - build pack hacking
  - search improvements
  - landing page :D
- super rentals 3.0
- Ember Inspector testing
- SEO investigations
- New contributors

## Action Items

- [ ] <action-item>

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- CM: Chris Manson @real_ate
- MRS: Melanie Sumner @melsumner
- SF: Serena Fritsch @serena
- RW: Robert Wagner @rwwagner90
- SK: Sivakumar Kailasam @siva
- JJ: Jessica Jordan @jessica-jordan
- JW: Jen Weber @jenweber
- MS: Michael Schinis @mschinis
- DB: David Baker @acorncom
- JG: Jared Galanis

### Notes

#### Deprecation
- S: PR for switch from chris/siva.
- CM: realized how awful buildpacks are.  Turning off fastboot not simple.  I forked the static buildpack and added a prebuild/compile step.  Now if you point it at an ember app, it works from a static perspective but does the build before the deploy it.  Happy with the outcome, url problems have disappeared.
- SK: we could go live this week, but we need to push the changes to the official buildpack.  Will need it for other apps as well. Will likely spend next week updating the main buildpack.
- CM: not sure we should upstream it, because I’m not sure about the strategic behavior we want.  Sometimes folks might want both prember and fastboot.  Maybe having 2 would be better to give people a choice.
- SK: there’s a current issue out there for the buildpack, and Terence has been helpful so I think we could get something merged.  We could do something with a “switch”
- CM: Would like to see what folks think about 2 vs fallback.
- RW: would a flag work?
- SK: Plan to try that out next week.
- CM: was also able to get the fastly purge into the script and handle a failure.  not sure how to test on failure though.  Other than that its ready to try.

#### API GUIDES

##### Left Nav

- TJ: <shared 2 possible layouts for left nav>
- JW: What did Tom initially suggest?
- TJ: he liked the xcode model of being able to drill down from package.  That’s represented in the first example.  The second example is more along the pattern we currently have, and would be less of a change.  Just wanted to get some user feedback around them.
- RM: I think we should be cognizant of people who come to api and want to browse around.  I don’t think just alphabetical does that.
- TJ: That would lend more to the first option, which is broken down by package/module
- MRS: we should consider an alphabetical toggle for methods/classes/etc.  I personally do like having an alphabetized list to work through.  Providing 2 options lets users pick what aligns best with how they want to interact with it.
- TJ: I’ll try to prototype some options…

##### Adding New Projects to API docs

- TJ: I’d like to also bring in test helpers and cli docs (the formal docs that addon devs use)
- JW: do we need to send it through the YUIdocs pipeline?
- CM: We have a way to transform markdown into json that could be useful here.
- TJ: its worth investigating.  I’ll write a couple of issues to so we have it on our book of work.

##### Search

- TJ: We’re at 99% of our search
- MS: Did you remember to clear the index? We’re probably at 50%.
- TJ: Can you add this to the readme?
- MS: Yes. Is there any other feedback?
- TJ: an easy thing we could do right away is increase # of search results. For example, “computed” can’t show you all results. I think this is just a line of code. Would be good to have a “more results” page
- MS: Three things we can do: all results page, increase # of results, tweak search formula in Algolia dash to say which attributes of search carry more precedence over others
- TJ: I get an email of common search items and which are not found. Will write up a few issues

##### Landing Page

- some attendees tried to see the landing page but were redirected to the old way (showing application package
- TJ: need to open an issue on clearing local cache.  Right now we over-aggressively cache things client side in api docs.
- JW: do we need a landing page for each project
- RM: yes, and also one overarching landing page, explaining our projects

#### Inspector Testing

- RW: lots of stuff broken, edge cases and general bugs.  Use it as much as you can and ping me when things are broken. The more people that ping me about it the better.

#### SEO

- CM: Got SEO miles training from my company.  Walked me through tests we should be doing.  I set up the ember website on my account and got some free consults for our website.  It gave me a few key recommendations, such as

    - api docs don’t show up for main website
    - ember doesn’t show up in the javascript frameworks search

- CM: we may want to track these things with a strike team.  if we use the mas account, but in order to do this seriously we should connect things to google analytics to make things visible as we change them.  I’d be interested in being on that strike team.  It plays into my interests and my company’s strategy.

