# Meeting: Ember Core Team 2018/07/13

## Agenda
- Releases (KG/RJ)
- Roadmap RFC Update (TD)
- Any update on the named blocks stuff (CH)?
- Discord RFC (RJ)
- https://github.com/emberjs/rfcs/pull/331 to FCP (MB)
- https://github.com/emberjs/ember.js/pull/16797 (RJ)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Martin Muñoz
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner

## Minutes

### Releases

RJ made some updates on the release troubles in 3.2. Katie and him have some notes. They will share.

KG: [+Release strike team agenda/proposals](https://paper.dropbox.com/doc/Release-strike-team-agendaproposals-SdhpPM0Xi6yCYojM75KZO)

(discussion, lock-step)

RJ: I think the primary problem I have voiced and feel is that the literal number being the same is silly. The goal behind having users not need to go to every readme and check the docs for arbitrary versions is painful.

RJ: There are lots of ways we can fix that problem though. And I think we should fix it.

KG: This is similar to our discussion from yesterday. We decided we would dig into pro/cons of lockstep and work on an RFC for changes.

RJ: I have issues personally that I can write down. But I want to find someone who enjoys the current system to provide a viewpoint.

EF: I don’t think anyone likes it, it was adopted as a stopgap since NPM did not have the features we needed.

YK: I think there is some middle ground.

EF: I think if you want to follow npm/yarn and just do what they do there is not a good semantic way to do what we want. You can’t specify “I’m compatible with these ranges of ember.js” or something.

(discussion)

KS: when versions are bumping people presume there are changes and that is a cognative overload. If I see there is a change to Ember and I see the ember-data version has bumped I am worried about the churn even if there are no changes.

RJ: The goal of what we currently know as lockstep is not the thing I am mad at. The spirit of the goal: That a user should not need to figure it out, is good. It is hard to talk about that one part though since we call the whole thing “lockstep”.

YK: In the current system you always need to update these numbers anyway. That we want to change is that you don’t always change to the same number, but there is still a number that is proper that it is updated to.

YK: I think a block of text emitted by ember-cli-update or something would even be a fine interim step.

YK: I think if you are using ember-cli-update this is very easy, and we should also have a table or whatever for people to update on their own if they want.

RJ: ember-cli-update I think already fetches JSON for the versions on upgrade anyway. We do need an RFC though, since we need to message that we aren’t dropping the train model or anything but we are changing the version numbers. I think the near term thing is that we are trying to do the 3.3 release on this coming Monday. For ember-cli and ember-data is will largely be a repackaging of 3.2. On the 3.2 side we’re trying to figure out the best path. We don’t want to release the packager stuff in the first LTS of Ember-CLI. so we don’t intend to land those changes for 3.3.

RJ: So we need a blog post for 3.3. Ember-Data and CLI are easy since there are no changes. Ember itself does have changes though I don’t think there are any that are no bugfixes. Angle component invocations and custom components land in 3.4 (going to beta).

### Roadmap

TD: I worked on an initial draft of the roadmap RFC and reviewed it with YK. The next step is to go through it and point to RFCs, blog posts, etc. Then we can share it with the steering committee and then to the core teams. I hope to have a draft by next week.

### Named blocks

CH: I missed a conversation Monday, and I wanted to revisit this. We talked about there being more exploration.

RJ: It was just KS and I. I don’t think there is any change.

DG: Should we keep meeting every Monday?

RJ: I think the general appetite for these meetings has dropped off.

TD: There are two engineers at LI working on rendering stuff. I’d like to invite them.

YK: I think if there is a large group of people who are working on glimmer we should have these meetings.

TD: I’m half tempted to think about a glimmer vm core team. I think there are other people we would want to invite like Serabe and bek.

YK: I think there is already a defactor core team.

TD: I think I’m not sure if there is a process for adding another core team.

YK: Sounds like a steering committee item. I think to the extent we are more or less extracting responsibilities from the core team this group should be involved.

(discussion)

### Discord RFC

RJ: I wanted to raise this. I have some questions about how to manage the transition. I don’t understand how all our transition problems are solved etc.

(discussion)

YK: I think one of our constraints is maturity. It needs to have been around for a while. It needs to have apps for multiple platforms. That tends to disqualify a lot of the noise.

TD: I think people need to make an argument against Discord at this point.

RJ: I think the transition from IRC to Slack was not so heavily discussed at the time, but we have not made a transition of this nature before.

TD: The core team has already evaluated discord, and I think my push back is that it is non-trivial for us to re-consider a large number of other options.

(discussion of constraints)

YK: the Rust team tried to use gitter as an experiment, and the android app was very bad. I don’t think there are a large number of options that really are good.

RJ: Right so I don’t know exactly how to respond to these comments about other options on the RFC, but ok. I think thats it.

### Deprecate globals resolver

MB: I just wanted to raise that I will re-enter this into FCP today. We had it in FCP previously, I rejected it upon review, but everything I wanted addressed is addressed and I think it should FCP again. Please take a look!

### RFC for re-running model hook

RJ: We have optional feature now, so I wanted to think about if this is a thing we can make an optional feature.

YK: I think it is already a subtle thing. Changing the behavior of the hook based on a flag would make it difficult to know what stackoverflow answers are correct etc.

RJ: Yeah.

TD: Could we use an optional flag and a new hook name? I would be happy to work on this RFC though I cannot work on the implementation.

(discussion)

YK: I think RJ is enthusiastic about the RFC but wants you to know what you are signing up for TD. Like we should consider if we want to do anything around async. Like do we want the hook to be async?

TD: I think it should always be async.

YK: Right, so that is a bigger thing. I’m enthusiastic about people working on an RFC here.

KS: I know everybody thinks it is a big gotcha, but really our current one is really de-serializing. I don’t see the need to add another hook just to solve this problem. I think the prefetch is a bigger problem. I’d rather see it addressed holistically instead of being focused on the model hook.

YK: I think that is what TD is signing up for.

(discussion)

RJ: I really want to RouteInfo stuff.

EF: Me to. We need to do a refactoring and re-rationalize router.js. A lot of stuff got splatted across the two since people were scared of one or the other.

YK: To the extent that people care about the router, shipping anything at all will keep us going.

### F2F planning

MB: Please start considering what you want to talk about!

### Autorun PR

RJ: EF can you talk about removing the autorun assertion? That works lands in 3.2. There is more work we want to do around this area (using async/await), but I don’t think it is anything new. I don’t want to block this ergonomic improvement on that.

KS: In fact I think the assertion makes the eventual fix harder. It tells you to do something that makes the later transition harder.

YK: Yes.

RJ: There is also stuff in tests I want to go through with EF as well. Set is wrapped in a `run` etc. I have more design work to do to push it forward.

RJ: Ok so no opposition! Will merge it.
