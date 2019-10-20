# Meeting: Ember Core Team 2019/09/27

## Agenda

- (**15 min**) Octane Preview Checkin (RJ)
    - Messaging around what "opting in to Octane" means
    - Common issues / pitfalls
        - missing colocation aware version of ember-cli-htmlbars
    - Other feedback?
- (**10 min**) Versioning issues with `@glimmer/component` (RJ)
- (5 min) Updating glimmer-vm on master (RJ)
    - Can haz glimmer-vm meeting time for coordination?
- Linking directly to the octane guides? (GC)
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable

## Attendees

- [ ]  Yehuda Katz
- [ ]  Tom Dale
- [ ]  Kris Selden
- [ ]  Leah Silber
- [ ]  Robert Jackson
- [ ]  Igor Terzic
- [ ]  Matthew Beale
- [ ]  Edward Faulkner

- [ ]  Dan Gebhardt
- [ ]  Godfrey Chan
- [ ]  Ricardo Mendes
- [x]  Chad Hietala
- [ ]  Katie Gengler
- [ ]  Melanie Sumner
- [ ]  Jen Weber
- [ ]  Chris Garrett

## Action Items

- [ ]  Make a plan to add a FAQ for "Octane"
  - [ ]  what is "setEdtion('octane')" for? What does it do?
- [ ]  @tomdale & @rwjblue to sync RE: @glimmer/component version conflict issues

## Minutes

### Octane Preview Check-in

RJ: What's going on? Dealing with the broad scope of work going on. I've been trying to be available in the community Discord in the Octane migration channel.

There is some confusion about what exactly opting in to Octane means and what setting the flag does.

YK: Would it be useful for me to clean up the all hands presentation?

RJ: I think the major confusion is around what `setEdition` means. E.g. people wonder if they have to do this before they can use tracked properties.

GC: We can have an FAQ blog post. I'm not sure if that's the right place for it but there seem to be restrictions about what can and cannot go in the blog.

RJ:  I think having a permanent location to link to is pretty important.

YK: Ideally it fits into the migration guide, but its super massive and somewhat hard to add a FAQ style section to.

CHG: I am working on making the migration guide have sub-sections so that might get a bit easier.
