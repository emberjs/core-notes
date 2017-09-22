# Learn Team Agenda 9/21

## Topics

- TJ/JW/TD: RFC 176 API docs conversion (for 2.16)
- JW: Stack overflow updates - moving towards inviting a group of people privately to help out. Answering questions & citing sources reveals gaps in the Guides and Tutorials. Action & data passing is “missing” in one comprehensive place
- JW: collaborating with Jared to develop 60 min crash course in Ember (if accepted at a conference)


## Action Items


- [ ] RT: update on discourse+blog integration
- [ ] DB: Heroku blog post to launch by 2.16
- [ ] RT: Write CORS Primer
- [ ] RT: Write Rolodex/Contact Book Tutorial (to launch with 2.16?)
- [ ] JW: Reach out to sugarpirate about getting some blog posts into Ember Way (informal)-- update 9-21 - haven’t heard back yet, will ping Lauren and/or other contributors again
- [ ] JW: Chat with Tobias B about possibly piping Discourse Q&A into Stack Overflow. Ponder SO barriers and solutions. - update 9/21 - decided on involving a small number of people privately for Stack Octoberflow. Will reach out to them in the next week ish
- [x] RM, Teddy, Jessica: solicit contributors for js module (176) testing of ember inspector
- [ ] SK: Test if api docs works on a smaller dyno level on staging & switch away from perf dyno for api docs
- [ ] SK: Help crates.io to move to Fastboot 💀
- [ ] RM: router service and `{{mount}}` proper documentation

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- JW: Jen Weber @jenweber
- JG: Jared Galanis @jaredgalanis
- RT: Ryan Tablada @rtablada

### Notes

#### Tutorial

RT: Think its good to go (meaning the base app has been coded).  There are some things we want to do with attrs (on the edit first), but would like to get content up to that point.  We’ll be writing it in the new tutorial repo, and longer term goal is to deploy separately, but for 2.16 its likely to go out with the guides.

TJ: going out with guides

RT: we plan on breaking out tutorials separate, but requires a new infrastructure.

JG: does this change where I’m making prs for the primer?

RT: for now, not yet.

#### Primer

JG: life has quieted down so making some progress.  yaw has been reviewing.  looking at a first pass in about 1.5 weeks. Currently working on destructuring and modules

RT: I can also help review

JW: I can help out with reviews later passes as well when things calm on my end.

#### Stack Overflow

JW: (context) SO is a bit of a graveyard atm.  Trying to kickstart.  Reaching out to a handful of people privately (SO users and people interested in the prob) to try to rally.  Plan to do that this week.    Reached out to Lauren Tan about funneling contributor posts to EmberWay.  Haven’t connected yet.  Finding that the “state your sources” format of SO makes me dig into guides, is revealing places where there are gaps in the current docs.  Largest gap so far is data and action passing.  Will be writing this up and sharing so we can apply updates to the guides.  If we want to revive cookbooks as a thing on our site, SO may be a good venue for that.

#### Ember Data Overview

JW: Still working on it.  Incorporating some feedback for David.

#### Talks

JW: Submitting a Crash course Ember workshop for a conference.  I want to create the materials and share them back with the community

RT: I also have a TDD with Ember session coming up.  Hoping to have it recorded

#### Build/Status Page

RM: Got a volunteer to implement auto update of builds page. (name here).  Post 2.8 should be on npm.

RM: there’s also the status page that is nearing MVP, so we will want to deploy soon.  Will have roadmap after the face to face this weekend.

#### RFC 176 and API Docs

TJ: talked through document: +API Docs Rename (RFC 176)

RM: Using the current api app is a bit awkward for the new module format, which is why I wanted to get Tom/Yehuda to look at it.

TJ: I think we are all in general agreement of where we want to go with it, its just the compressed timeframe may require a phased approach (shown in doc), so the question I’d have for them is are the ok with the shorter term awkwardness with what might come in 2.17+.

RM: I know that each of Tom/Yehuda has ideas and requirements that I want to be sure are addressed.

TJ: One thing I haven’t done yet is go through Yehuda’s spreadsheet on the topic and compare with our plans.  Will do that this week.

JW: One concern I have is that the changes to urls/left nav will mess with search, which as already been in a bit of flux.

RM: I think its ok because the base structure would stay the same.

TJ: in theory it should be ok, but as we already know with algolia it may not be as easy as it seems.  Should be something to keep an eye on.

TJ: there are 3-4 issues that need to be created on ember-jsonapi-docs to enable it for js modules.  Will write these up this afternoon.  We need to get these resolved in the next week or so, so that we can go full forward on the yuidoc tag renames and get things tested out before release.  Once the issues are created and detailed out well, I’ll put out a plea and see if anyone wants to own any of these.

**later meeting with Tom Dale on RFC 176**

Attendees

- TD: Tom Dale @tomdale
- TJ: Todd Jordan @todd.jordan
- JW: Jen Weber @jenweber
- RM: Richardo Mendes @locks
- LS: Leah Silber @wifelette
- MS: Mel Sumner @melsumner

TJ: _demos proposal for 2.16 intermediate api docs ui_

TD: Namespaces are confusing - what’s the difference between modules and namespaces?

TJ:  Its a byproduct of the current app.  modules are defined at one or more files and say that every class defined inside are part of it.  Namespaces are simply things labeled as static classes… really as something to pin static functions to.

TD: I’m ok with the intermediate state if its a band aid until the next release.  Whats important to me is that the UI not be confusing to people.  The difference between namespace and module with 176 is confusing.

TD: What about applying the conversion data json to the emberjs docs build output?  That way you don’t have to make mass modifications to the source.

TJ: That’s an idea worth trying out.

TD: Also, is there a way to us custom yuidoc tags

JW: I investigated this earlier and found it they get stripped out.  Maybe we can leverage an unused tag?

TJ: Not too many we don’t use and it would have to be available at the right scope.

TJ: I think we can do something about namespace vs module.  Already we were planning on supporting generating a static namespace to house static functions when there’s a non-static classes using the same module.  What we can do is when we render a module screen, iterate through static functions that would ordinarily show up in the namespace and provide direct links to these functions from the module page.  Then we could remove the namespace altogether.

TD: I think that would work.

TD: Also, would like to remove the module from the classes listed on the left nav.  As a user, I think I would have the actual class name in mind when looking under classes and not necessarily know the module (otherwise would click into module)

TJ: Can strip out all but end section of the module, ex `@``ember/component/text-field` would just show as `text-field`
Group pulls up Yehuda’s spreadsheet

TJ: Locks can you explain this?

RM:  Not sure 😛 I think he is grouping items into larger categories.

TJ: Could this be something similar to the xcode docs we were looking at that have documentation split out by category on the left nav (App Services, Developer Tools, Media and Web)?

TD: I think so, also looks like it applies to guides.

TJ: I think this is doable for api docs, but not until we get a fully realized left nav.  For now I think the 176 changes should give us a big improvement on digestibility of api docs.  We can take it from there based on feedback
