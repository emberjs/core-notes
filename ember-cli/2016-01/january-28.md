# ember-cli Meeting Notes - 2016-01-28

## Attendees
* Erik Trom
* Jake Bixby
* Kelly Selden
* Nathan Hammond
* Robert Jackson

## Actions

### Everybody
* Identify something you want to be a champion for.
* Find people who want to participate in this effort in ways other than writing code.

### Robert or Stefan or Kelly
* [ ] Release a new version of ember-cli.

### Nathan
* [ ] Send an email connecting Rob, pangratz, and Katie on the topic of ember-try + ember-cli for ember-cli-qunit.
* [ ] Send an email connecting Ed & Kelly on the topic of JSCS and ESLint running against ember-cli.

### Kelly
* [ ] Build consensus around using a CI tool or integrating the results of ESLint/JSCS into ember-cli's test suite.

### Erik
* [ ] Identify specific problems surround code reuse with fastboot, document, propose solutions.

## Discussion Notes

### Updates
* Rob: Working on extracting ember-cli-test-loader from bower.
* Kelly: No update.
* Jake: PR landed for ember-cli-blueprints.
* Erik: PR opened on node-portfinder and not passing CI upstream.
* Nathan: Maintaining this group.

### ember-try
* We want a story for ember-try to work with ember-cli.
* pangratz has a spike in ember-test-helpers.

### JSHint/ESLint/JSCS
* We're planning to move from JSHint to ESLint. We're also going to add JSCS.
* (Open Question - Kelly) For running JSCS/ESLint against ember-cli should we use a CI tool or integrate the results into ember-cli's test suite?
* Ed has a branch for ESLint somewhere.
* We're going to build the infra for this by adding an innocuous rule. Bikeshedding on what the rules should be will be deferred.

### Blueprint Extraction
* PR landed in ember-cli.
* Some weirdness left in ember-cli-blueprint-test-helpers in install.
* Will be made easier if we cut a new version.
* Nathan is available to help review a final PR to move toward landing.

### Portfinder
* PR open on node-portfinder, but failing their CI.
* The ember-cli-livereload has magical ports that it uses during testing, we should check that out.

### Pods
* First pass was awkward.
* Stalled on ember-cli-(mv|rename) is stalled awaiting resolution.
* Once we know what to do Adolfo and Martin will be good resources for those utilities.