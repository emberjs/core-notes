# ember-cli Meeting Notes - 2017-08-03

## Attendees

- @kratiahuja ka krati ahuja 
- @rwjblue rj Robert Jackson
- @hjdivad dh David Hamilton
- @trabus jb Jake Bixby
- @kellyselden ks Kelly Selden
- @turbo87 tb Tobias Bieniek
- @kategengler kg Katie Gengler


## Agenda

- ember-cli/ember-cli#7137 (link to tests in welcome page)
- ember-cli-qunit


## Discussion Notes

### ember-cli 7137

rj: my concern is that the environment is wrong

dh: personally I find /tests much more convenient than using testem

rj: my POV is that the only official way of running tests is `ember test`

tb: can we combine `ember serve` and `ember test --server`

dh: I find the dev ergonomics of using testem painful, eg on getting the right profile, opening in the right browser window &c.

rj: I don't like the launchers either but you can just command-click the URL in the terminal.

tb: why do we even have different builds for test?

rj: there's `test-support` &c. although that happens in both dev and test.  The thing that's missing is people checking `EmberEnv`.

tb: what makes testem more correct?

rj: because there are addons that depend on checking `EmberEnv`

tb: can we deprecate that?  It seems very strange to have a different build between dev and test.  Runtime config should of course be different, but not the build.

rj: I'm trying to check ember observer to see who is using it but I'm getting the dummy app's config.  

kg: There's already a PR for limiting search to files.

rj: I'm :+1: on deprecating this but it would need to be part of the RFC for environments.

ks: I think it has to be different because of the "how do we teach this"

rj: this is clearly a breaking change; how do we deprecate it properly?

tb: the first step has to be to find out what addons are using this

rj: how do we even identify that people are checking `process.env` to output a deprecation warning to the console?

dh: not sure how it helps but we could write a linter for this; likely too slow to run at each build.  But we could do it at upgrade time or it may be enough to deprecate in the RFC and reach out to addon authors 

rj: linting would have to use a different eslint config for addons.  deprecating in the RFC and aggressively reaching out to addon authors should be enough

dh: conclusion is basically next step is to figure out what addons actually depend on this?


### ember-cli-qunit

tb: when the changes happen to ember-qunit what will be the point of ember-cli-qunit

rj: none; it will go away

tb: upgrading will be easier if it's the same package

rj: we can make ember-cli-qunit a minor bump that just provides things from ember-qunit and then change the default app blueprint


