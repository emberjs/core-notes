# FastBoot Meeting Notes 2017-02-03
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Ryan Cruz, Arjan Singh
## Agenda
- [ ] 1/13 Meeting's Action Items
  - [ ] Ryan: Continue update debugging instructions on `ember-cli-fastboot`
  - [ ] Rob to peek at https://github.com/ember-fastboot/ember-cli-fastboot/pull/269
    - [ ] Dan to coordinate with Rob
  - [ ] Dan to add tests for https://github.com/ember-fastboot/ember-cli-fastboot/pull/250 (probably not for next week)
  - [ ] Tom to look at memory leak issue ([PR: fastboot/103](https://github.com/ember-fastboot/fastboot/pull/93))
  - [ ] Rob to add failing test around AfterModel transition issue
  - [ ] Kelly is going to try to repro the redirect issue
## Notes
- FastBoot Schema
  - Krati integrated changes and has been released
  - Ember-cli-fastboot bumps for fastboot-express-middleware
    - Some random failures hard to debug
    - There was an error in handle 404s which is now fixed
- najax had a serious flaw that merged headers between requests
  - Fix has been released in a new fastboot release
  - Tom is working on a CVE with najax maintainer to be released on the ember-security list
  - Sometime next weekish?
- Memory leak debugging
  - Tom may not have hit the non-trivial route
  - Trying to figure out what is actually causing the memory leak
    - Initial thought was around the `visit` method
    - Could be an Ember memory leak that is happening in something that is held on by FastBoot which is long lived
      - after 500 requests, in theory, this would be visible, but nothing like this was seen
    - V8 heuristics for GC may have differed, so causing a GC between runs helps show this
    - As long as sandbox gets GC'ed, globals referenced by ember should be GC'ed
    - Linting could help catching issues around memory
    - setTimeout infinite loop caused `visit` to never finish and consume memory
    - when we pass capabilities into the container/sandbox, we should have a way to cancel them on destruction/deterimined visit has failed
      - Applies to not only memory, but resources (if we access files in fastboot, they should be closed)
      - Guides should call these out
## Action Items
- [ ] Dan ping David Pett on anchorable docs