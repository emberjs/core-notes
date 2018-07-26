# ember-cli Meeting Notes - 2018-07-26

## Attendees

+ [Robert Jackson](https://github.com/rwjblue)
+ [Alex Navasardyan](https://github.com/twokul)
+ [Kelly Selden](https://github.com/kellyselden)
+ [Katie Gangler](https://github.com/kategengler)

## Agenda

+ Broccoli 2 in 3.4-beta cycle
+ Changes in `ember-template-lint`
+ Bugfixes for jQuery via `@ember/optional-features`
+ Introduce travis stages
+ Run eslint during build time
+ Package

## Discussion Notes

+ move forward with landing broccoli 2.0 in 3.4-beta cycle (our first LTS)
+ land changes in linter for angle bracket components (support for ember 3.4)
+ backport fixes for `optional-features` to beta branch
+ change `travis.yml` file (for add-ons) to use stages since it's no longer a beta feature (it
  will increase the job time, but overall time of CI will decrease); it's not
  that big of a change to have an RFC for it.
+ move eslint out of build; requires an RFC; generating extra modules (for
  tests) is very expensive; it is executed upon every rebuild; ember-cli-eslint
  uses private APIs.
