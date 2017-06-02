# Learn Team Agenda 2017/06/01

## Topics
- Infrastructure/Heroku (TL, SK)
  - Fastly setup (SK)
  - Heroku CI
  - Heroku Previews
- Algolia search update (MS)
- Tutorial Update (TJ, RT, YB)
- API Docs Update (TJ, SK, MS)
- Route restructuring Update (MS)
- Fastboot support (http://bit.ly/2qnUOHi) (MS)
- `<version-select></version-select>` (JW)
- Add docs generation to ember & ember-data build pipelines (SK)

## Action Items

[ ] RM: Will experiment with statically building Guides with Ember
[ ] DB: Will keep working on reworking Middleman build process
[ ] MS: Will finish route restructuring
[ ] TJ, RM, DB: Feedback on RT's tutorial repo
[ ] RM: Create an issue for adding heroku logo to site
[ ] DB: Infrastructure blog post
[ ] DB: Contact Leah about moving to ember team heroku

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- DB: David Baker @acorncom
- MS: Michael Schinis @mschinis
- TL: Terence Lee @hone
- SK: Sivakumar Kailasam @siva
- YB: Yaw Boakye @yaw
- RT: Ryan @rtablada
- JW: Jen Weber @jenweber

### Notes

#### Algolia update

MS: Finishing off restructuring.  Update to 2.13 when done scraping.

MS: Got a contact in Algolia that I can work with on things.

DB: I have one too if you need one.

MS: If your guy is quicker we can use him.

#### API deployment

SK: S3 is still on my account, and travis is set to publish to ember’s, so I need to work that out.  Travis doesn’t allow you to run builds past 50 minutes.  Thinking of running in an app on heroku with a cron.

DB: will it timeout on heroku CI?

SK: will talk to Terence about adding it to CI.

TL: no idea what you are talking about

SK: you’ll hear from me shortly ;-)

SK: Aiming to setup a heroku pipeline. Saw that TL did guides.

TL: also have done it for website and super-rentals.

DB: LS working out contract with fastly

SK: need to get permissions set up so that I can have access to do this stuff

TL: at some point we should transition off the emberconf team to the official Ember team

DB: Do we know how to do that.

(silence)

DB: I’ll contact Leah and figure it out.

TL: We need to set up the logo stuff too.

DB: which is higher priority logo or blog post

TL: Personally I’d prefer blog first, but that’s me

DB: for the logo, we could use some design help (putting in footer of website and guides.

JW: I’ve been doing some work with the slack ember women channel and we’ve been wanting to find ways for people to contribute.

RM: Will write an issue and jen can find the right person.  Also need to look for other issues that newcomers can work on.

#### Tutorials

RT: Started a Contact Manager tutorial. I have a small gh repo that I will share.  Would like to get some eyes on it to get some feedback on

RT: I’m staying away from ember data for a first good part of the tutorial to show that you can get benefit without it, and avoid the complex layering that introduces.  The goal would be for it to end in refactoring it to ember data

#### Glimmer Select Menu

JW: FYI: locks made a glimmer style guide repo, containing various components to use.  I have a minimal select menu working and will be looking at getting it into our website. https://github.com/ember-learn/glimmer-styleguide

DB: we currently have a library in the guides that’s rebuilt for every version.  It might be good to have that outside the repo.

RM: Yeah we have a repo for components that we can point to.

RM: on the train I worked on a grouping capability I want to show you

JW: sounds good.

#### Roadmap

RM: I started a roadmap strike team, with people from each team to give a short weekly report.  I’ll gather those and create a newsletter, plus use that info to seed a public roadmap.

#### Separating Tutorial  from guides

TJ: Do we know where the tutorial separation work is?

RM: Not sure.  There’s a possibility we can use the ember-cli-prerender to host the tutorial. Someone offered looking at getting the tutorial rendered with it. If that works out maybe we get it off the ruby stack.  But that shouldn’t affect any current work, since we don’t know when or if that will happen.
