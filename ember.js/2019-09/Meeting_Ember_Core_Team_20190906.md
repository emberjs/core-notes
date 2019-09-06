# Meeting: Ember Core Team - Sep 6, 2019

## Agenda

- (**2 min)** Determine note taker
- (**2 min**) Determine person to upload notes
- (**5 min**) Volunteering myself to "chair" the F2F meeting — meaning I focus 100% on keeping the meeting productive and don't try to simultaneously participate in topic discussion. (EF)
- EMBER_VERSION=octane ? octanify? (GC?)
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
        - (**5 min**) [https://github.com/emberjs/rfcs/pull/482](https://github.com/emberjs/rfcs/pull/482)
    - FCP to Close → Close
    - Enable
        - @model
- ember-cli colocation update (RJ)
- markdown tutorial tool update (GC)

## Attendees

- [x]  Yehuda Katz
- [ ]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [x]  Igor Terzic
- [x]  Matthew Beale
- [x]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [x]  Ricardo Mendes
- [x]  Chad Hietala
- [x]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber
- [x]  Chris Garrett

## Action Items

- [ ]  @Robert Jackson Add ember-try configuration for "octane" (enabling the flags, etc)
- [ ]  Polyfill for async observers
- [ ]  Codemod for async observers
- [ ]  Enable `@model` feature flag

## Minutes

Note taker: DG

### Notes

### F2F Meeting Suggestion

EF: After talking with a bunch of folks, I'd like to suggest that the F2F meetings have a "chair" to keep things moving along smoothly.

IT: I have concerns about leaving room for you to participate.

EF: I'll be taking suggestions this week with ideas about how this can be managed.

*General agreement that a chair would be a good idea.*

### EMBER_VERSION=octane ?

RJ: We need to:

- remove the octane environment variable (process.env.EMBER_VERSION = "OCTANE") that is used to identify octane
- provide a command to fully convert an app to octane

RJ: I will write up something about these changes and we can discuss

YK: This matters a lot for generators, but almost nothing else should care

RJ: My vague proposal is that this will be fairly intimate. I should make an actual proposal in writing.

*Side conversation between RJ and YK about async observers and how they relate to addons_*

RJ: We should make a default test for addons.

YK: I'm predicting that there will be a few old addons that aren't truly octane ready.

YK: We're basically only concerned with observers that rely on sync behavior.

RJ: I'll see if I can get this test into a 3.13 blueprint.

RJ: I added some action items to take care of these things.

### RFC to close: Deprecate hash helper

RJ: I know this was done as a suggestion from some of us.

GC: I still think this is a good direction.

RJ: It seems that the hard part here is choosing the alternative name.

RJ: I'm not sure that `obj` is clearly better than `hash`

YK: The `hash` name seems overly complicated. I think `obj` is better, but not vastly better.

RM: I helped work on this RFC. People seem more positive about the literal object approach. I want to close this to avoid a bunch of zombie RFCs.

YK: If you are not a Ruby programmer, "hash" has no real meaning.

CG: My personal feeling is that an object literal approach is better. It would be great to jump straight from `hash` to `{ }`. Plan B would be `obj`.

JW: We want to not bombard our users with a bunch of changes at once. It seems like a bad time to make a change like `obj` that would be temporary.

RJ: What is the scale of the change to allow the object literal?

YK: You could just make this work easily. There's already an internal `hash` keyword (ironically) used to signify objects.

### Enable `@model`

*No objections*

### Quick update

RJ: I've been working to finalize the work to enable co-location. I would like to confirm with GC the test cases that need to be added.

RJ: The TL;DR is that I'm trying to get this done today or tomorrow so that we can get out a new major version (4.0) of `ember-cli-htmlbars`. The reason this is a major version bump is to drop Node 6 so I can (selfishly) use `async/await` in tests.

### Markdown tutorial tool update

GC: You can now run an ember server at the beginning of the markdown. There were some bugs with the URL formatting, but I'm fixing them right now.

RJ: What is the very high level TL;DR ? The tutorial content is generated from the tutorial itself?

YK: This is very ember-agnostic.

GC: It is currently auto-deployed to the octane branch of the guides. So far the scope of the work is just an octane tutorial.

JW: In terms of timelines, I think this will be ready for the 3.14 launch.

GC: I'm still somewhat optimistic that we can get the first part up by 3.13.

*JW + GC to coordinate*

YK: One thing to note is that this does not (yet) work on Windows. GC and I had a conversation about all the things needed to do to make this work. 

YK: It comes down to a case-by-case analysis about cross-platform compatibility of each command.
