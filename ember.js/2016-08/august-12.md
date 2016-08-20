# Ember Core Team 2016-08-12

### Agenda

- [David Baker's write-up on the Welcome Page](https://usecanvas.com/ember-docs/welcome-page-write-up/53KBCUTglcgWo3dK29iIzb) (LS)
- Learning Team completing shift to new (sub) org (LS)
    - Prerequisite of the [tool to copy permissions](https://github.com/ember-learn/gh-team-copy) is complete; please accept the invitations everyone received to gain access to the new org
    - SuperRentals has been moved from the Ember org to the Ember Learning org
    - Should we move the ember-website repo from the main org to the learning org? This would clarify who to talk to with issue. We'd add a note to the ReadMe to tell people where the website repo lives.
        - Only caveat: if there are people who are not core, but who have access to the website via being org members on EmberJs, they'll just need to request access to the new org. There's no specific team for these people or we'd just sync that team too.
- (RJ / DG) Lazy Loading Engines Update
    - General Attack Plan -- [dgeb/ember-engines#154](https://github.com/dgeb/ember-engines/issues/154#issuecomment-239046588)
    - RFC: Asset Loader Service -- [emberjs/rfcs#158](https://github.com/emberjs/rfcs/pull/158)
    - RFC: Asset Manifest -- [emberjs/rfcs#153](https://github.com/emberjs/rfcs/pull/153)


### Attendees

DG, EF, EB, KS, YK, GC, LS, MB, RJ, TD, SP

### Minutes

#### Welcome Page

LS: want to see what the feedback is

YK: yeah I can't tell based on chat what the arguments were

RJ: I'm not convinced there are reasons to change anything

TD: We got rid of the current application template and that accidentally trolled some people

YK: The application template is where people go when they are trying to figure out where to make a change

LS: It seems like there was no conclusion about the ideal path. David wants to figure out what we really want to do given the multiple opinions. Let's forget what mistakes were or weren't made before, and just figure out what's ideal.

SP: we should review decisions once we get closer to a thing shipping reality.

SP: there is a good path forward. We can remove the addon entirely, and we can just put the contents into application.hbs

RJ: I'm against adding a thing that needs to be changed every time they create an application

MM: and it changes on init

YK: There are new-path users who will find it beneficial to find the application.hbs

MM: I don't want ember init to blow away the application.hbs every time

YK: They don't need to do the same things. We need ember upgrade

SP: No we just need init to be more intelligent

YK: Different conversation, as a user I always forget that "init" is the upgrade command

KS: I'd rather have it in index and not need to replace it with an outlet.

SP: I think we can come to a good path on how to not ship extra assets to production, but the learning path takes precedence.

Constraints:

- Don't ship the assets to prod when you aren't using the component.
- Will someone be surprised if their deploy of the welcome page doesn't work in production (seems like it can be documented)?

EF and GC will comment back on David's doc

#### Learning team to new org

LS: we talked a while ago about moving learning team items into a new org. We said yes but that we need a tool to sync the members of orgs. Siva completed that and I ran it today and it works. It isn't automatic, but you can port over whatever teams you want on an old org to a new org.

SP: The constraint is that is must be able to be run again. The goal is that it should be something we can run as a cron job every night.

LS: Doesn't seem part of the original plan?

YK: The aim is that when someone is added to the core team or another organization they can be sync onto other repos or teams.

SP: There are like 40 people who need to be added to teams

YK: It is just about the cognitive overhead and burden of managing memberships

KS: This tool doesn't use token auth

LS: No it only uses tokens

YK: I think people have not looked at the tool, we should look at it and come back to it.

LS: Yes, at least right now Siva is still active on the tool so it is a good time to provide feedback. This is really an MVP.

YK: A one-time tool if it is under active development is totally fine.

LS: Who wants to add feature requests

SP: I will

YK: I will review it at the end of next week

SP: The tool is really close to being really useful for us, but if it is dropped it may become a piece of tech debt

KS: The Ruby tool I prototyped with had some better features

LS: Please leave a comment or issue with those items.

LS: Should be move the website to the learning org? As they are responsible it might make sense. It might keep people from opening API doc issues on the website.

RJ: The website is more marketing related and less learning related.

YK: Right this is the original idea behind "learning" instead of "docs". It is a team responsible for the cradle-to-grave experience.

SP: Given a description of learning as cradle-to-grave does that satisfy you Rob?

RJ: There is very little on the website besides docs/guides.

LS: You're attempting to make something very clear that is just not going to be very clearly divided. There isn't a specific plan for what learning team wants to do right now. It would help the learning team turn the wheels which they are already largely moving.

SP: There is some slight niceness to having similar projects/repos together. If theoretically it could be in both places would that satisfy?

RJ: Unsure there is a satisfying outcome. Let's move along.

LS: Gavin is going to get started on a getting started video, which we're optimistic about.

#### Engines

RJ: Things are proceeding and there are a few RFCs we should review

#### Glimmer

GC: We met w/ chad chris and some linkedin people. There is outstanding work in performance- needs to be reasonably fast. Historically we have a lots of silly things that made it slower. That is my on-going work. The other track is bugs. We're not getting as many as I expected. There are some related to block params. I'm not aware of other major problems (there is an each bug I will be looking at). The main track of work are the semi-official addons. They are ember inpector, fastboot, liquid-fire, and I think those are the main ones. Ember-i18n.

RJ: There are two if we fix one the other should also be fixed.

GC: We need to add another privateish API for liquid-fire. Ember inspector teddy is back and working on it.

YK: I will work with him every weekend for the next four to be on track

GC: We have no tests failing with the feature flag on. I think chad yehuda and tom are working on fastboot. Working on the ability to port tests to work in both envs.

GC: Ah and engines. Asa is working on engines support since LI use them. Asa is on a second pass, I expect it can be done next week. i18n is the one nobody is currently working on. Additionally YK wanted to reach out to Katie about testing w/ canary.

KS: We want to see if we can make that they alpha or something to test more addons.

RJ: I'm sure she can do the work to run them, I can circle around with her. Also I did the top 20 addons. Mostly they worked mostly but I reported bugs upstream, 10 or 15 bugs of random things.

SP: It seems like we may need a kitchen sink app

RJ: yeah the stress app you have might be good

RJ: I think perhaps after the current crop of issues is resolved we can enable the feature on canary.

GC: We have three more weeks before shipping

RJ: We should enable it in a week so it lives on canary, or decide we need to bump the release.

GC: Things have been more quiet since the alpha, and I'm unsure if it means things are working or if people are not paying so much attention. To enable on Canary we want to boot LI's app and Skylight, as a private goal.

GC: If anyone has an app they can boot now would be the maximally impactful time to do that.

RJ: Twitch still has views, but it boots and stuff not dependent on views runs

TD: Fastboot actually patches simpledom

YK: Chad and I have created an interface of minimal things you much implements for simpledom append mode to work. A challenge is the the simple dom helper sometimes returns objects with an interface out of its control (actual DOM nodes).

(discussion about attrs rendered in SSR vs props)

(further discussion re: RFCs and FCP)
