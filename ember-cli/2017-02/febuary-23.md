# ember-cli Meeting Notes - 2017-02-23

## Attendees

- Katie Gengler
- Robert Jackson
- Jake Bixby
- Kelly Selden
- Chad Hietala
- David Hamilton
- Stefan Penner
- Tobias Bieniek

## Agenda

- [#6724](https://github.com/ember-cli/ember-cli/pull/6724) (remove sri and uglify from addons)
- Discussion: Do RFCs need a core team champion?

## Discussion Notes

### ember-cli-sri and ember-cli-uglify removal from `addon` blueprint

- KS: sri and uglify seem unnecessary for most addons unless they actually have a demo site
- RJ: blueprint churn is bad
- SP: should ember-cli-deploy install those?
- TB: propsal was only for addon, if ember-cli-deploy installs them should we remove from app too? responsibility for version updates would shift from ember-cli to ember-cli-deploy
- RJ: version updates would no longer be part of ember-new-output and ember-addon-output
- SP: we should keep sri and uglify in addons for now since we can't come to a conclusion
- SP: we should remove the "deploy" section on the Ember CLI website and point to ember-cli-deploy instead
- KS: ember-cli-deploy should install sri, asset-rev and uglify if the app/addon doesn't have them yet

### RFC champions

- SP: RFCs should have a champion from the CLI core team
- champion is not responsible for implementation, but for pushing the RFC forward
- RFCs without a champion should be labeled with "Needs Champion"
- RFCs without a champion and without activity should decay and be closed after a certain amount of time
- RJ: experienced contributors might not need a champion
- SP: they could still have a champion but that champion just delegates to the de-facto champion aka. the experienced contributor
- SP will open PR against the RFCs repo with this proposal
