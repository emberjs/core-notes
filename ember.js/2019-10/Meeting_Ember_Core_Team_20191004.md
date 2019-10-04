# Meeting: Ember Core Team - Oct 4, 2019

## Agenda

- Determine note taker (JW)
- Determine person to upload notes (JW)
- Octane links
- Octane blueprints location
- Including ember-auto-import
- jQuery migrations

## Attendees

- [x]  Yehuda Katz
- [x]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [x]  Igor Terzic
- [ ]  Matthew Beale
- [x]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [ ]  Ricardo Mendes
- [x]  Chad Hietala
- [ ]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber
- [x]  Chris Garrett

## Minutes

### Octane links

RJ: We should do a recap of the Octane Strike Team Meetings, since they cover a lot of what we discuss here

JW: To summarize, we'll keep linking to the edition page when we can, and will not go back and change blog URLs. A few weeks after Octane ships, we'll make a plan for smooth redirects etc. for the existing Guides preview pages

YK: There is a postmortem to do but not yet

JW: agreed

YK: We still need to update the wording around the links of the blog post too

JW: Yes, will do that now

### Octane Blueprints location

RJ: There are two main options, we can go with standalone package as blueprints, or have ember new without a flag do whatever is in Ember CLI. Some community members seemed surprised by keeping the app blueprint and the addon blueprint in CLI vs doing what we show in the guides now. I strongly prefer to keep blueprints in the cli package, and think an RFC would be good to make blueprints into their own package.

YK: We need a place where we enumerate what things go together

RJ: Possible changes to blueprints should be disconnected from Octane so we can hit the 3.14 target

YK: We can put the list of package versions that go together in the release blog post (which versions of Ember source, data, etc)

Conclusion - release Octane blueprints how we always have, and changes like putting blueprints in their own addon should go through an RFC process.  The release blog post should have a list of dependencies.

### Including ember-auto-import in Octane

RJ: The question here is whether to include ember-auto-import in the Octane blueprints. This was included in the initial feature list of Octane. It has been in the preview blueprints so far

EF: I don't think it should be rushed in. I think most people should add it but the difficult thing is that it's hard to guarantee that we won't break people's things in the future. Using it in apps is safe, but addons are tricky

YK: a compromise could be to leave it out of the addon blueprint

JW: Do we need to worry about the webpack polyfill configs? How would we help people through it if it was in the defaults?

GC: Not a super big deal that we leave it out for now

EF: We don't polyfill anything right now but we could add them and not break things

YK: The reason it's in Octane descriptions is that it was a highly requested feature. If it is just fine, we should do it. If it's risky, we shouldn't do it

JW: If we decide to use it, we should update the Guides descriptions of using dependencies, as well as the README for auto-import.

EF: It's extremely popular so it doesn't introduce much risk

RJ: We will need some guidance in the addon guides

EF: One sentence advice is, if you can just do it with JS, do it. If you are writing a custom webpack config, you are putting yourself in danger of breaking in the future

Conclusion - we plan to include ember-auto-import in the Octane blueprint for apps, and not for addons.

### jQuery migrations

RJ: There seems to be confusion around jQuery handling

YK: we should create an octanify command. The mental model is NOT that we are deprecating jquery, it is that we are not including it automatically in the build

RJ: Coupling using Octane with your app's jquery status is painful

YK: we should change the error message to say "please include @ember/jquery in your package.json"

RJ: JQuery changes also change event dispatchers in subtle ways

RJ: I think we should not make jquery required to enable Octane blueprints

YK: Why don't we make @ember/jquery turn on that flag?

GC: That addon has different responsibilities

JW: Agree, the requirement was difficult for people who are relying on old addons that need `this.$`. It's not good if that blocks their migration until they aren't relying on that library anymore or it's been rewritten

YK: I think it's still a major problem that flipping the jQuery flag seems to be talking about using jQuery at all. We might want to rename the flag to something like `jquery-event-dispatcher-integration` to avoid an intrinsic assumption of what it means.

Conclusion: We want to enforce that you have the flag on or off (must be defined). If it is true and you have added the addon, you can use Octane. We want people to know that jQuery is decoupled from Octane usage
