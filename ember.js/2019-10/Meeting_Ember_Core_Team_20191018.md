# Meeting: Ember Core Team 2019/10/18

## Agenda

- **(5min)** Router Service `transitionTo` QP bug? (need guidance on expected behavior) [https://github.com/emberjs/ember.js/pull/17925](https://github.com/emberjs/ember.js/pull/17925) (CHG)
- Octane Checkin (RJ)
    - ember-inspector - [https://github.com/emberjs/ember-inspector/pull/1037](https://github.com/emberjs/ember-inspector/pull/1037)
    - Colocation
    - ember-cli
    - jQuery coupling (YK)
    - Pods (YK)
    - Guides (YK)
    - ???
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable

## Attendees

- [x]  Yehuda Katz
- [ ]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [x]  Igor Terzic
- [x]  Matthew Beale
- [ ]  Edward Faulkner

- [x]  Dan Gebhardt
- [ ]  Godfrey Chan
- [ ]  Ricardo Mendes
- [x]  Chad Hietala
- [x]  Katie Gengler
- [ ]  Melanie Sumner
- [ ]  Jen Weber
- [x]  Chris Garrett

## Minutes

### Octane Checkin

RJ: I have a list of things then lets see if others have things.

RJ: The inspector has a PR, this isn't done yet. People are opening issues about the inspector crashing and stuff which is not ideal.

RJ: I think GC may be best served by just implementing things.

RJ: Next week is going to be hard for me time-wise

CG: What about the tracked properties stuff?

RJ: I don't think that is a blocker, I think it is a nice to have. The inspector thing is absolutely a blocker though.

YK: If we can't get the blockers to be green we should just push back the Octane release.

RJ: I think by the end of next week if we aren't close then we need to be hard thinking about that or pushing back the Ember release by a week.

YK: I think the options are that we either ship with it broken, or we say we missed the blocker and push the release back.

RJ: Yeah we want editions to be a thing we do more of, and if it isn't positive then...

YK: I think the ecosystem stuff could bother people, but that is in the narrative and ember inspector is not. I think is it possible for us to make work and I think it is a real risk though.

MS: I think the inspector not working may be keeping people from trying Octane in the first place.

RJ: Maybe. But can I be honest I don't even have the inspector installed.

KG: Yeah but you are RJBLUE

RJ: Ok next thing: The colocation work in ember htmlbars is working but don't have the caching working. It isn't just annoying, it is a bit intricate. The cache invalidation is tricky. I believe it will be landed by next week.

RJ: We identified a few other issues: (discussion of AST transform and babel/decorators outputting something unexpected)

YK: Yeah this highlights the limits of the AST transform approach- where things are semantically equivalent but the code differs.

(discussion)

RJ: Also ember cli, at the moment, there is an annoying bug which is annoying for final release. When you do ember new we try to re-evaluate the ember cli file without using the node modules. So if you require in there (which is what our template outputs) it errors. We're trying to optimistically update based on the .ember-cli. I'm going to wrap that in a try/catch and handle module not found.

RJ: We had a discussion 2 or 3 weeks on jquery coupling.

YK: I've not tried to update in several apps. I think that coupling is bad.

RJ: Yeah Octane doesn't care about if you're using jQuery.

(discussion)

RJ: The jQuery thing will go to beta. I don't think it will go to 3.13 because it isn't needed.

YK: There are only three flags we enable, but there is one that doesn't do the mods

RJ: Of the three features there are only two with a codemod.

YK: The root div thing not having a codemod is annoying.

RJ: There is an error to tell you what to do because it is so easy to do.

YK: But I can't remember exactly the classes etc. I think having the error say exactly what it expects to put in there would be great. Or if someone can just do it. It isn't critical but it feels weird.

RJ: It is simple to fix someone just needs to do it. The complicated codemod already has the logic. And it has it because it is hard to do by hand. But we also don't think many people care about the root element.

(discussion)

RJ: I think we should queue a discussion about route templates

YK: My hunch is that right after Octane we will have a lot of things we immediately want to fix. But then we will need to start focusing on the route.

### Guides

YK: I've been writing prose, I finished a chapter on "here's html", "here's how to break up a thing into components". Now I'm almost done with component state. Using the canonical number increment thing everyone else does. I have a lot more stuff to do. I think the way GC and I designed it we have a chapter interleaved which is...

YK: We are making a chapter for making a list, I think that is really important and would otherwise be a gap from the previous material. I pushed some of it already. What I did for the HTML section is I took a thing from MDN, a letter, and have people copy/paste it. The next chapter just breaks it apart. The send/receive address become a good simple case in configuring a component. I really am going to want feedback about the direction. I think end of next week I will think it is read to replace something, but I can also imaging people will be overwhelmed with the amount of change. But there is already a lot of new jargon.

YK: I change the pedagogy right? You can see that in what I pushed. I would like people to take a look. I can write up what I'm asking for. I want people to try and see if they have issues with the pedagogy next week.

YK: One example I use the work "tag" to refer to what we normally call a "component invocation" I did that because as I was working through it it seemed like the smallest cognitive thing. But you could imagine doing the replacement and it would work.

YK: But I think if we wait until next week it will be too late. I think JW is a stakeholder.

CG: I would be interested.

YK: The way it tries to get you to think about it is to template HTML. I think it is the right thing, but it is a really new way of doing it. The way to think about your whole app is templates and templates.

(discussion)

CG: I think this is similar to what we wanted to do. But we felt more constrained by the existing nav etc.

YK: The reason for doing glimmer components this way was itself even clear when I was doing trainings a long time ago.
