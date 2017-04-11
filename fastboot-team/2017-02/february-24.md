# FastBoot Meeting Notes 2017-02-24
## Attendees
*Please add yourself.*
- Dan McClain
- Tom Dale
- Robert Jackson
- Krati Ahuja
- Tsubomi Imamura
- Terence Lee
## Agenda
- [ ] 2/17 Meeting's Action Items
  - [x] TD: Will tell Brian it needs tests and we'll accept
  - [x] DM: Find his hacky code to make anchors work
  - [ ] Homework: Read https://gist.github.com/kratiahuja/fd073007e10abb9db0a2ec42bc1d7c17
- [x] Make a decision on how to handle the need for BodyParser for Brian's body PR
  - [x] Can't test without BodyParser, since raw body won't be provided in Express
- [x] [Serve PR](https://github.com/ember-fastboot/ember-cli-fastboot/pull/356)
- [x] Put fastboot notes in core-notes
- [x] After FastBoot 1.0, should we have welcome page also link to fastboot?
- [ ] Fastboot release schedule post Fastboot 1.0.
## Notes
- BodyParser
  - Should be able to operate on the raw body of the request
- FastBoot site: we need to review David Pett's PR to make markdown anchor tags work
- Better happy path for users (deploying, building, etc)
  - RJ: Consider generating a yarn.lock when generating app bundle
    - Allows to track transitive dependencies
  - We should dust off [fastboot-cli](https://github.com/ember-fastboot/fastboot-cli)
- Serve PR
  - PR needs review of tests
  - Ability to turn off FastBoot on demand
    - Subsequent PR to handle this
    - Possible solution: query param
      - Also have ember-inspector give you a link
  - RJ: How do we message when using ember-cli 2.12
    - KA: Added 2 deprecation warnings, would like review of messages
  - RJ: Quick smoke test + merge ok?
    - No objections
- Build work
  - RJ: we should take the meeting notes and turn it into an issue with punchlist
  - TD: Update ember-network addon for the new process
- core-notes
  - We need to do a better job of PRing the FastBoot meeting notes into core-notes
- ember-cli welcome page:
  - KA: Should we have a link to FastBoot website
    - Seems fine
- Once ember-cli-fastboot is no longer a penalty on inclusion, we should add it to the default blueprint
  - Will feel painful to addons
- Post 1.0: Following a FastBoot release schedule
  - RJ: We should have a cadence, but we'll probably have cycles where we don't commit anything
## Action Items
- [ ] Review & merge [anchor tags for the FastBoot website](https://github.com/ember-fastboot/fastboot-website/pull/65)
- [ ] Website needs review, Tom & Rob to create a punchlist
- [ ] Krati: Create a punchlist issue of FastBoot build meeting notes. That punch list will be updated for other fastboot blocker items