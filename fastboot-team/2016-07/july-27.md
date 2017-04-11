# FastBoot Meeting Notes 2016-07-27
*Please add yourself.*
Dan McClain, Tom Dale, Patrick Fisher, Arjan Singh, Krati Ahuja
## Agenda
- [ ] Last Week's  Action Items
  - [ ] danmcclain will suave ember-cli-fastboot
    - [ ] Dan has to check something with rob around testing all the files
  - [x] Tom to review/refresh path to 1.0 doc to allow people to track progress/contribute
  - [ ] Tom to RFC ember-cli RE: `concatFiles`
  - [ ] Tom - RFC for optional service injection (for addons that want to support FastBoot *if* the user has added it to their app)
  - [x] Dan to review FastBoot PR about Transpilation work
  - [ ] @arjansingh help out on documentation
  - [ ] Outstanding documentation
  - [ ] Marco to check with Stef Penner about his finding, spike up
- [ ] Rollback/disable by default `--watch`
- [ ] 1.0!!!!
## Notes
- FastBoot 1.0 should be released hopefully today
  - Need to make sure the transpilation works properly
- Make sure the website has good first-run through guide so HN doesn't crap on it :troll:
- Tom updated the Road to 1.0 issue
- `--watch` issue
  - 2 options: Temporary rollback, or make the default to not automaticaly watch
  - If we revert: We need to figure out what is causing the issues, and make a plan to fix the blocking issues
  - Watching is preferred because `ember serve` watches by default, so people will expect it
## Action Items
- [ ] Release an RC of fastboot to make sure transpilation step works properly
  - [ ] Tom & Arjan to tag team documentation/website