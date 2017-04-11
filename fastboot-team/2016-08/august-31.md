# FastBoot Meeting Notes 2016-08-31
*Please add yourself.* 
Dan McClain, Tom Dale
## Agendas
- [ ] Last Week's Action Items
  - [ ] Ember Data needs to expose way to create snapshot for `this.store.query` 
    - [ ] We may want to have a semi-rfc for this prior
    - [ ] Arjan may have time next week to tackle
  - [x] Tom & Dan to review [fastboot-express-middleware#11](https://github.com/ember-fastboot/fastboot-express-middleware/pull/11) regarding error handling in fastboot middleware
  - [x] Tom to discuss FastBoot at Ember Core team meeting
- [x] 404 Handling
## Notes
- Error Handling
  - `SendStatus` sends the response
  - Default Handler?
    - Does not blow up resilient mode
    - We should probably let the handler set/send status, rather than us handling
    - We should possibly only use `res.status` rather than `res.SendStatus`, so that other middlewares can alter the response when handling the error
      - Dan commented as such
    - `next` should be called after we do any manipulation to `res`, so that downstream middleware can recover from our errors, and thus we should not call `send` or `SendStatus` when we are going to call `next`
    - TD: In resilent mode, should we be able to catch the error?
- Tom missed a chunk of the Core Team meeting
- ED
  - Want to create a query and capture the result to rehydrate without having to hit the backend 
- 404 Handling
  - FastBoot's Location should mark the status code 404, which would allow PR#11 addition of statuscode + location logging to handle the 404 case
## Action Items
- [ ] Arjan to update the readme and PR#11
- [ ] Arjan to follow up PR#11 with handling 404 in location none
- [ ] To be addressed next week:
  - [ ] Ember Data needs to expose way to create snapshot for `this.store.query` 
    - [ ] We may want to have a semi-rfc for this prior
    - [ ] Arjan may have time this week or next week to tackle
    - [ ] Tom can put Arjan in touch with someone on ED when work starts