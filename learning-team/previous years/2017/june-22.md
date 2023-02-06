# Learn Team Agenda 2017/06/22

## Topics
* Status Updates:

## Action Items

- [ ] RM: Will experiment with statically building Guides with Ember @Ricardo M
- [ ] DB: Will keep working on reworking Middleman build process
- [ ] MS: Will finish route restructuring @Michael S
- [x] RM: Create an issue for adding heroku logo to site
- [ ] DB: Infrastructure blog post

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- MS: Michael Schinis @mschinis
- SK: Sivakumar Kailasam @siva

### Notes

#### Michael Schinis:

Fixed the tests except one (need help)  moving from one class route to another.  Not scrolling to the top.

TJ: I can look at it this week

MS: siva merged his stuff with mine, so its ready to merge once the test is fixed.

TJ: is search ready once this is merged?

MS: We will need to get Algolia to update their script.  I can contact them once merged.  They’ve been helpful.

SK: DB wrote an issue for supporting the old urls is that ready?

TJ: I think it should work though there may be an issue around namespaces.  Will verify that it is good to go.

MS: will have some bandwidth after api-docs app stuff gets finished.  Willing to pick up things from the guides issue list.  Need to know what is high priority.

TJ: will make a pass and consult the team.  See if we can tag them

MS: Feel free to assign stuff to me if you like.

#### Sivakumar:

SK: Working with Dave Wasmer to get Help Wanted deployed.

SK:Right now we are overriding the hostname in fastboot, which is hacky.  Will be cleaner using middleware.  Should solve some of the odd redirection stuff we are seeing.

SK: Also we are using fastly addon for heroku.  will remove and use a fastly service.  For every instance of heroku app we deploy we have to add a fastly addon which is $50 each.  if we use the service instead we can take advantage of our allowance with

SK: Also now with every glimmer styleguide branch we deploy to fastly.  will eventually want to move more pieces of the website over.  See https://glimmer-styleguide.global.ssl.fastly.net/glimmer-styleguide/master/index.html

#### Todd Jordan:

Have a couple of open Tutorial PRs

- Replacing maps integration with an addon:

  -- https://github.com/emberjs/guides/pull/1980

  -- https://github.com/ember-learn/super-rentals/pull/72

- Get tutorial autocomplete to handle async requests

  -- https://github.com/emberjs/guides/pull/1918

  -- https://github.com/ember-learn/super-rentals/pull/56

#### _Status Updates From Chat_
----------

#### Ryan Tablada

No blockers for me just time management and need to sit down and write the actual tutorial for the app I've been working on.

Something I'd like help on is getting some more :eyes: on the code for the contact manager: https://github.com/rtablada/ember-rolodex

I can't make the meeting today, had to be on another call

#### Jen Weber

Still working on glimmer styleguide.    No blockers other than my day job.

#### Ricardo Mendes

RM: I'm working on getting crates.io to be fastboot-compatible, so both communities get some good cred. would love some help PWAing it up

RM:  started a PR for Deploying section https://github.com/emberjs/guides/pull/1983
and for SSR (FastBoot) https://github.com/emberjs/guides/pull/1982 we have some things to discuss with @kratiahuja

RM: https://github.com/ember-learn/glimmer-styleguide/pull/3 the glimmer footer is updated with fastly/heroku, I'll replace in guides+website ASAP


