# FastBoot Meeting Notes 2016-12-02
## Attendees
*Please add yourself.*
Dan McClain, Krati Ahuja, Arjan Singh, Ryan Cruz
## Agenda
- [ ] Last Week's Action Items
  - [ ] Krati: Update the gist with short term v/s long term RFCs and/or fixes
  - [ ] https://github.com/ember-fastboot/ember-cli-fastboot/issues/289
  - [ ] Rob: Talk to Dan Geb about module RFC related concerns
  - [ ] ..?
  - [ ] Arjan: Look into memory leaks if you have time.
- [ ] https://github.com/ember-fastboot/fastboot/pull/100 - Refactor PR
## Notes
- Ember-cli decided initial approach to building was not the right one
  - Tom, Stef, Rob were going to brainstorm on approach on thanksgiving week
    - Stef was to spike
- Ember-cli updates for server were approved
  - Krati to spike out approach
- Memory leaks
  - Arjan used a trivial app without ED
    - Hit the memory leak, 1000ish requests crashed it, 
    - Rebuild the shared space app fixes the issue (To test)
  - Refactor PR - Memory use flattens out, slightly higher initial memory uses
    - Does not store an instance variable on the object, deferences cleanly as opposed to leaking handles
    - Krati: We should destroy the instance in a runloop
      - This is an ember issue
    - Arjan: Follow up PR: use execution time limits to clean up instances
  - Krati: Can you graph before and after memory usage
    - Node debug is broken
- People are using 2.10 with FastBoot (hooray)
  - Arjan: Saw higher variance in rendering time in FB, and higher memory usage with node 5
- Remove npm install from `ember fastboot`: https://github.com/ember-fastboot/ember-cli-fastboot/pull/269
  - Passes locally, fails on travis, Dan has not had time to debug
- https://github.com/ember-fastboot/fastboot-app-server/pull/35

## Action Items
- [ ] Tom please review:
  - [ ] https://github.com/ember-fastboot/fastboot-app-server/pull/35
  - [ ] https://github.com/ember-fastboot/fastboot/pull/100
  - [ ] https://github.com/ember-fastboot/fastboot/pull/102