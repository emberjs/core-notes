# Learn Team Agenda 2017/05/25

## Topics

- Infrastructure/Heroku (TL, SK)
  - Fastly setup (SK)
  - Heroku CI
  - Heroku Previews
- Algolia search (MS)
- Route restructuring (MS)
- Fastboot support (http://bit.ly/2qnUOHi) (MS)
- `<version-select></version-select>` (JW)
- Add docs generation to ember & ember-data build pipelines (SK)

## Action Items

[ ] RM: Will experiment with statically building Guides with Ember @Ricardo M
[ ] DB: Will keep working on reworking Middleman build process
[ ] MS: Will finish route restructuring @Michael S
[ ] MS: Will research Algolia setup for beta search @Michael S

## Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- MS: Michael Schinis @mschinis
- TL: Terence Lee @hone
- SK: Sivakumar Kailasam @siva
- YB: Yaw Boakye @yaw

## Notes


### API Docs Update

MS: Working on route restructuring PR for Algolia search.  Started on it and should have something for review by next Tuesday: https://github.com/ember-learn/ember-api-docs/pull/224

MS: Also there’s an issue for us with the release candidate of fastboot that breaks stuff.  They’ve taken away instance initializers which we rely on.  There is working going on to restore but we may want to depend on the previous release (beta 16 or 15) for the time being.

TJ: Last week I created code that transitions urls pointing to the old api items to the new url scheme.  This will keep compatibility for old bookmarks.  There was one issue with transition where it was redirecting to staging when the transition happens.

TJ: Also Martin Malinda put in a feature to load the proper version of api when using urls like `ember/release` or `ember/lts`, which was also showing the redirect to staging behavior.  He mentioned he  would look at yesterday but I haven’t followed up since.  There was also an issue with the update that was only showing the currently loaded release in the version dropdown, so we temporarily reverted the update until we figured out what was happening.

### Glimmer

RM: would like to make the version select glimmer.  Possibly a ToC and nav bar in future.

RM: would like to slowly build up components, and would be a good transition to ember strategy


### Ember CLI addons Doc

RM: Sam, dfreeman and my self are going to pick back up on the addon doc addon, that allows you to deploy doc for your addon easier, taking care of the setup/inftastructure


### Heroku CI/ Preview

TL: the downside with Heroku CI is that there isn’t a public url for viewing things like Travis.  It is hooked to the heroku stuff

TL: I have chrome and phantom working so it would be easy for devs to run tests on it.

RM: we are deploying the guides through travis, but can we do the same in heroku?

TL: yeah

RM: can you work with siva to make sure things are turned on and working properly

TL: Sure

RM:  Aside.... We’ve been talking about having an infrastructure team, but I think what we want to do is just make the learning team bigger.  I’ll be drafting some stuff soon and send out invites to folks who have been consistently contributing.

TL: Heroku review apps are a way for automatically creating a new heroku app and deploying on pull requests.  When you create one it deploys with a randomly generated name and links to the pr.  The restriction is it only works on pull requests in the github org (not from forks).

TJ: Is review available for the heroku deployed ember-learn stuff now

TL: yeap

TL: also, During emberconf we set up the heroku ssl stuff to auto renew letsencrypt and autorenew.

TL: Heroku piplines allow you to have different stages, where you can promote from staging to prod.  May not work with env variables that you bundle in, (process.env), that gets baked into.  If that’s different.

### Tutorial

TJ: Speaking of heroku.  TL (hone) put out a PR to super rentals to supply the google maps key as an env variable so users could deploy super rentals and still see the maps (currently only works on localhost without a key).  I took rwjblue’s advice and created a new addon project to inject the google maps script and let the dev supply the key via env variable. See https://github.com/ember-learn/ember-simple-google-maps and https://github.com/ember-learn/ember-simple-google-maps/commit/54a191ecb3d5d99f79bab02e51cf9bf11c0f37e7 as well as the original PR: https://github.com/ember-learn/super-rentals/pull/65

MS: if we deploy an example of the super rentals app it will hit the free limit pretty quick.

TJ: Yep.  This would be more for developers doing the tutorial that want to be able to deploy on their personal server.  A “public” deployment of super rentals may have to do without maps

MS: I have a contact at google.  I can talk to him to see if there’s a possibility of us getting a premium license for this.  We could also use [leaflet](https://emberobserver.com/addons/ember-leaflet).   I think its free.

TJ: other stuff with the tutorial:  I have a fix for some of the autocomplete async bugginess, though not ideal.  The thought was to give a simple solution that works, but point folks at ember-concurrency, though now that Ryan is working on a beginner tutorial, I’m thinking I should just go ember-concurrency.

RM:  Yeah, Ryan’s tutorial is kind of a 201 level where super-rentals would be 301.  You would be open to do things like ember-concurrency then.  It also plays into work Yaw is going to do in separating the tutorials out of the guides.

TJ: Alright, sounds good I guess I’ll keep what’s there now and transition it to Ember-concurrency when the other tutorial happens.  It’ll also allow me to go into a section on forms and validation.

RM: Ryan plans to do that too, though it probably will be very simple and won’t do much validation.

TJ: Also, Last week I mentioned doing an RFC detailing the options around the tutorial backend.  I still plan on working on that next week.

RM: Yeah, Tobias also is doing one on the layout of the api doc.

