# ember-cli Meeting Notes - 2017-04-06

## Attendees

- Katie Gengler
- Robert Jackson
- Kelly Selden
- Gaston Silva
- Jake Bixby
- Miguel Madero
- David Hamilton
- Romulo Machado
- Tobias Bieniek

## Agenda

- [#6916](https://github.com/ember-cli/ember-cli/pull/6916) (Watch-detector clean up)
- [#6914](https://github.com/ember-cli/ember-cli/pull/6914) (Remove test retries)
- [#6903](https://github.com/ember-cli/ember-cli/pull/6903) (remove npm experiment refs)
- [ember-cli-mocha#182](https://github.com/ember-cli/ember-cli-mocha/issues/182) ember-cli-mocha broken with CLI 2.13 
- [#6927](https://github.com/ember-cli/ember-cli/issues/6927) CSS handling broken in CLI 2.13 

## Discussion Notes

- watch detector
  - RJ: code seems cleaner in general
  - someone needs to check for race conditions
  - DH: do we have a test case?
  - RJ: yes, stef added one a while ago
- remove test retries
  - PR originated from contributor workshop at EmberConf
  - CI is failing due to network issues
  - problematic scenario where retries produce different errors for first and second run: module scope caching that something was called
  - solution: remove retries, add only to tests with network 
- npm experiment
  - aka. loading `ember new` blueprint from npm
  - issues: "yarn global add ember-cli" not working for people due to not having PATH correctly setup
  - new blueprint from ember-cli-deploy maintainers was created
  - RJ: in favor of merging to remove feature flag
  - further work:
    - make `-b` work with `ember init`
    - write original blueprint path somewhere (probably the`.ember-cli` file) so that `ember init` can auto detect and use it
- ember-cli-mocha issue in CLI v2.13
  - RJ: npm is undeterministic and this is likely what's causing it
  - TB and RJ will investigate further
- CSS handling
  - RJ: vendor.css no longer created if empty?
  - TB: should we remove the `<link>` from `index.html` in that case?
  - RJ will ping Trent to ask about this issue
- minification of ES6 code
  - uglify can't handle ES6 code at this point
  - uglify `harmony` branch exists, but is not production ready yet
  - using babili instead is an option and will have to be explored further
