# Learn Team Agenda 6/29

## Topics

- API Docs v1
  - modules PR: https://github.com/ember-learn/ember-api-docs/pull/242/files
    - algolia
    - hashes
      - other?
      - Glimmer Conversion
      - Help Wanted App
      - Hearth
  - Tutorial

## Action Items

 [ ] DB: Will keep working on reworking Middleman build process
 [x] MS: Will finish route restructuring @Michael Sk
 [ ] DB: Infrastructure blog post

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes
- DB: David Baker
- MS: Michael Schinis @mschinis
- SK: Sivakumar Kailasam @siva
- DW: Dave Wasmer

### Notes

#### API Docs

TJ: Put in a PR to route legacy module urls to the appropriate page.  There’s a regression in routing legacy hashes to new query param approach to navigating individual methods/props/events.  Will be working on that over the next couple of days.

MS: Contact to Algolia and sent them the URL.  It will take them a few days to scrape the new UI.  We could ship earlier but we would lose search functionality until this is done.

TJ: Better to wait.  We need to review remaining issues over the next few days and make sure everything is address that we want to be before ship.

MS: I have some bandwidth, so I can also look at remaining issues.

#### Glimmer Conversion

RM: concerned we may get SEO penalized  from glimmer.

DB: I have google web master tools, and it looks ok, but it looks like googlebot does not render header so that could cause us problems

RM: <why we want to move to ember server rendering>

DB: is glimmer a stop gap

RM: my hope is we meet int the middle and move stuff over.

DB: google only crawls to guides with the current glimmer header atm (not rendering header or footer)

DB: not sure if its a problem bc google _should_ handle JS.

MS:  Maybe Google is taking the page before post processing javascript.  There may be a way to tell google to wait.  I’ll take a look.

RM: `@glimmer/web-component` breaks in Firefox because of custom elements v1. I changed the footer and nobody complained, but the header is more visible and we got a report. added a custom element polyfill to fix it.

#### Help Wanted

DW: Working on the back end got a test suite running with out data persistence (testing web hooks to github api). Going to swap out with data. Next onto looking at integrating the front end. Also need to verify signatures on web hooks (instead of blind trust).

SK: Front end is just essentially a table right now. Should have some time next week for the front end.

#### Hearth

RM: Need to get Siva back on hearth ;-)

SK:  We need to set up CI for it.

RM: Need to get things automated end to end. need to build in 2 places atm for different platforms. May be tricky.

RM: Sam S has some ideas for hearth, will ask him to join next week. he’s also been working a lot on ember-addon-docs

#### Tutorial

TJ: I have 2 PRs.  One around maps and another around a concurrency patch (until we move to ember-concurrency). Would like to get this approved and merged.

RM: I’ve already approved the maps one.

TJ: Will go forward and merge that one then.

RM: Really want to remove tutorial from guides.

TJ: and put it in an ember app?

RM: Just putting it into the website would be fine. Eventually using CardStack would be ideal, but its still got a ways to go.
