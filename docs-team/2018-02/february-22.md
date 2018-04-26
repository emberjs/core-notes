# Learn Team Agenda 2018-02-22

## Topics
- Update on ember-styleguide (MRS)
  - Clarification on purpose and goals (since this affects development) (MRS)
  - Determine whether or not to npm-publish early or not (MRS)
- The api docs app landing page
- Issues for contributors workshop
- Deprecations app
- Guides app

## Action Items

- [ ] <action-item>

## Minutes

### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- MRS: Melanie Sumner @melsumner
- CV: Charles Villard @Charlie
- RW: Robert Wagner @rwwagner90
- SF: Serena @serena
- AL: Amy @amyrlam
- CM: Chris Manson @real_ate

### Notes

#### Styleguide

- MS: confusion this week about the styleguide addon.  Not just for the main ember website, also for cli, engines, etc.  We need to make sure that when we have to add a website specific thing to the addon that we make note that we need to change it later so that it can be used elsewhere.  Please file an issue so we don’t lose track.
- JW: Can you give an example
- MS: Sure… Navbar links.  each site has different links, so they need to provide a datafile for details of specific links.  That data file should not live in the addon.
- JW: So look at this as a “real addon”, like ember-powerselect
- CM: this is probably because of some stuff I was doing to the navbar.  When we added it quickly to the deprecations app, we noticed for deprecations and guides it would be the exact same links and didn’t realize about the other sites.  Should we provide some sort of default links?
- MS:  This will all eventually be in one app, so eventually it will be ok,  but right now there are several apps.  I’m ok making an exception for now, but I want to make note to correct it because we will need to soon.
- CM: I’d love to be part of that discussion
- MS: definitely!

- MS: someone brought an issue that we need to npm publish this.  I think we can do a pre-1.0 version so others can use.  I was trying to avoid writing something that would be obsolete, but I can be flexible and keep moving forward.
- CM: I’m not as concerned about deploying with git dependencies.  Siva mentioned it was slower, which it is, but not by much.  I’m ok with saying with the git deps.
- RW: Doesn’t installing with yarn mitigate this?  I think it uses somewhere else other than github?
- TB: When you use a github dep with yarn it depends on the package json.  you can specify a hash.  Be careful bc it can go away if you are pointing to a feature file.  Otherwise it should be fine.
- JW: I like having one less thing to worry about when deploying. i.e. worrying about npm credentials.
- TB: you can do it through travis, which takes permissions out of the equation.
- JW: Maybe go with github for now, until we need npm?
- MS: ok, we wait then, until we find that the slow down part is affecting us.

- MS: we are making great progress and getting new contributors which is really exciting.


#### API Landing Page

- JW: UX question: when should the landing page be shown?
- CM: we have same problem in guides. you’d get a 404.  Maybe there’s a default page if not?
- JW: we will do it on ember/release for now, as the default is already redirecting there

#### Issues

- JW: only 2.5 weeks out from emberconf, so if you see any issues for the workshop plz mark them.  After the conf, if we are successful, we will have a lot of PRs.  Will need some folks to help us with reviews.  If we can give them a good experience with 1st prs that would be great.
- JW: Talked to edF about the “learn team tornado”.  I’m putting a lot of effort into new contrib entry points, so that we can get folks to stick around.

#### Deprecations

-Serena: need some qa to make sure links aren’t broken.  WE are sometimes getting internal server errors which should be 404s.
-CM: siva and I have had numerous threads around fastboot for deprecations app.  We keep getting internal server errors.  locks says its a fastboot error.  this won’t work with fastboot in its current state.  Fastboot should not be run in production.  I’d like to get the deployment static like we had for s3.
-RW: Yeah if you have fastboot in your package json then the buildpack will make you use fastboot.
-CM: I’d like to see if I can get some permissions on heroku to start playing with what I can do
-MS: you can also use a personal heroku account to try things out.
-CM: oh yeah, that’s a great idea.  Will do that.
-TJ: you should reach out to Terence on slack, who is on the learn team and works at heroku and was involved in the creation of some of these buildpacks.  This shouldn’t be an impossible problem.
-CM: Yes will do that.

#### Guides

-CM: Guides is feature complete.  A couple of open issues.  siva had a question about moving some stuff to the styles addon.  I don’t want to reduce the css until we are ready to transition over to it.  I don’t want it to block us so will hold off.   Will merge for now and improve later, so if anyone wants to approve that pr then great.
-JW: will try to take a look this weekend.  What’s your timeline on the video demo for emberconf?
-CM: will be ready
-JW: cool


#### Readmes!

-JW: will be improving readmes across the ecosystem, so look out for those PRs
