#Learn Team Agenda 5/18

## Topics
- API Docs
- Issues
## Action Items
- RM: Will experiment with statically building Guides with Ember
- DB: Will keep working on reworking Middleman build process
- MS: Will research Algolia setup for beta search
Minutes
### Attendees (Initials: Name @slack-id)
- TJ: Todd Jordan @todd.jordan
- RM: Ricardo Mendes @locks
- DB: David Baker @acorncom
- MS: Michael Schinis @mschinis
- TB: Tobias Bieniek @tbieniek
- RT: Ryan Tablada @rtablada
- JW: Jen Weber @jenweber
## Notes

### Ember API Docs Proposal (TB)
TB: I think its annoying that the methods/events/properties are on tabs
TB: I would prefer it to flow like Ember CLI api-docs
RM: Pages Might get really long
TB: most/all doc sites have single column
RM: Tom really likes the xcode layout
TB: I roughly modeled cli docs after esdoc/android/java docs
RM: not opposed and would eventually want to bring other docs together.
TJ: I think its something we’ve talked about doing and want to do, we’ve just had a priority order we’ve been doing things in.  If someone wanted to work it sooner we would be willing to accept it.
TJ: do we want to start doing rfc type process for learn things?
RM: I’d like to pattern things after rust, who uses rfc process for a lot of things.  been meaning to talk to core team about this.  Would like to open up a bit more about things going on. would be good educating people about what’s going on as well.
RT: are the all the same repo?
RM: think so, many go cross project.
RT: I think it will be a headache at first for folks not used to it (intimidation). Having them in one place will be nice.
TJ: Do we want an rfc for this?
RM: I think it might be good to get the process run through with it
TJ: Should we combine with the js module rfc redesign
RM: I think they can be kept separate since the js rfc involves the left nav and this the content
TJ: sounds good
TB: worried an rfc may be quite a bikeshed
RM: we’ll try to keep it on point.  Seemed that the twiddle redesign one didn’t go too bad
RT: I think based on seeing the rust community it hasn’t been too bad even though it might feel
TB: should it be a PR to the rfc repo.  What template?
RM: We should make a design doc template in the course of doing this
JW: I like the idea of having an rfc for something like this as a contributor to keep up with things going on.

### Algolia (MS)
MS: There is some work to be done around getting algolia to index the new urls for API.  Will write up what needs to be done in an issue/PR
TJ: is this blocking /api-beta from shipping to /api?
MS: if you want search functionality it will
TJ: ok, well lets get it out there.  The ember code pieces for redirect are about there (in prs), so we are super close.  excited to get it out there as its been a couple of months since ember conf.

### Tutorial(s)
RM: The RFC Process might also be good with the “using mirage” issue on the tutorial which as seemed to be infinitely discussed.
TB: I’d prefer to work with json as much as possible and not bring in mirage.  The feedback I’ve heard is that for new users to javascript that the tutorial makes you need to understand too much background.
TJ: Yup.  We’ve been hearing these criticisms for a while, and we do start the users out with pojos, and switch to xhr requests once we get into ember data, which is where mirage comes in.   As far as the expertise required, we are also working on creating a beginner tutorial, and plan to make super rentals a best practices intermediate tutorial.
TB: One thing I hear from people is that Ember has a “lot of magic”.  Mirage is a technology that adds more “magic” on top of this.   Ember CLI has a node server so you could just have someone add express middleware and serve basic json.
RM: which is kinda what the mirage server functionality is going to do.
JW.  One thing that I did while learning ember data was just to use `createRecord` and `peekRecord` off that bat.  That way I didn’t have to deal with setting up an api server, but still learned the basics of ember data.  Might be with considering as an intro to ember data.  The downsides were that you didn’t quite use it in the same way since you are avoiding the apis that make server calls.
TJ: We’ve been going over the various alternatives here for a long time now and most options have been mentioned and discussed prior to this meeting.  There are pros and cons to all of them.  I think what we need to do is make an RFC with a proposal, with a really healthy alternatives section.  Make a proposal, let folks air grievances, make a decision, and move on it.  I can work this after a roll off of api (which is hopefully within days), unless someone else is really passionate and wants carry this torch.

----------

### PR Triaging
[ ] https://github.com/emberjs/guides/pull/1530
  Ask David
[ ] https://github.com/emberjs/guides/pull/1654
  Discuss with CLI team cc @Tobias B
[ ] https://github.com/emberjs/guides/pull/1751 @Ricardo M
  Make meta issue, ship MVP
[ ] https://github.com/emberjs/guides/pull/1938
  Ember Data review

