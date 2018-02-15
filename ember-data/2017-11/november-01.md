# ember-data Meeting Notes - 2017-11-01

## Attendees

- bm @bmac Brendan McLoughlin
- cm @pangratz Clemens Müller
- ct @runspired Chris Thoburn
- dh @hjdivad David J. Hamilton
- dg @dgeb Dan Gebhardt
- it @igort Igor Terzic
- rj @rwjblue Robert Jackson

## Agenda

- addon transitive-unload
- addon soft-delete
- emberjs/data#5247 createrecord
- data#5230 multi-table inheritance
- unique indexes against simple attributes

## Discussion Notes

### unloadRecord

ct: I want to follow up on the unload addons we discussed previously

dh: No progress on either of them.

dh: We'll want to restore `destroyRecord`'s implicit unload

it: We had this before because of the `firstObject` `lastObject` bugs

dh: Those have been fixed in ember

it: When did those fixes land?

rj: They landed in ember 2.15.  Keep in mind the 2.16 lts releases soon.

### createRecord async

rj: I wanted to discuss something I ran into while working on the codemod for the new testing APIs.  The issue is that there's a runloop assertion because [createRecord](https://github.com/emberjs/data/issues/5247) is async.

it: I'm not sure why it's async.

bm: It's using a runloop for record array optimization

rj: What's the best thing for me to do for the testing codemod?

ct: We could `run.join`

rj: The downside there is it changes semantics.

rj: one way or another the codemod will probably have to wrap `this.subject` for model unit tests in a runloop to be consistent with old semantics.  Unsure about long term semantics.

it: it seems odd for `createRecord` to be async

ct: When exactly do we guarantee live arrays contain the new record?

it: The optimizations are useful for `push` but they don't make much sense for local changes.  We could do async for push and sync for local.

dh: seems good, but we'll have to be careful about the brittleness of sync and async code paths for live array updates.

rj: seems good to me although we may need to have sync state transitions

it: are state transition really the thing that causes async?

it: `updateRecordArrays` is idempotent so it should be fine to call it in `createRecord` to get sync updates in this case

### new qunit api

rj: we may want to spike out test helpers for unit tests now that we don't need to do `ember-qunit` specific stuff.  This makes it easier for addons to expose helpers.  See [my blog post](http://rwjblue.com/2017/10/23/ember-qunit-simplication/#why)

it: it may be a bit tricky, eg consider setting up a record that was loaded from the server but has a dirty attribute.  How would a helper for that look?

rj: I don't know, that's why I'm bringing it up.

rj: for sure there's a difficulty both in setting things up and enabling the user to indicate what they want

ct: the difficulty is in unit testing

it: this is easier to do via `record.serialize()` in an integration test

dh: it's almost always better to test serializers in integration tests precisely because of these setup concerns

*Some discussion around unit testing vs integration testing serializers*

dh: whether we add test helpers or not, it seems like we should have a blueprint as Rob suggests, that shows a recommended way for testing serializers via `push` and `record.serialize`

### multi-table inheritance

ct: i'll pair with @hjdivad on this we talked out of band and it looks like we have a path forward

### custom indexes

dh: this can be enabled via hooks for "saw record" and "record went away" for the case @runspired wants, ie static non-compound keys.

dh: a common use case for this is unifying the id-space of polymorphic types.

ct: yeah that plus the create case.


