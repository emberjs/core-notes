# Ember Core Team 2016-10-14

### Agenda

(please note (private) or (public))

- (public) Review [RFCs in FCP](https://github.com/emberjs/rfcs/labels/Final%20Comment%20Period) (DG)
- (public) Glimmer 2 Status - Should we push 2.9.0 back a week (to 2016-10-24) or defer Glimmer in Ember until 2.10? (RJ, YK, GC)
- (public) `ember-welcome-page` (high priority Learning Team issue) (YK, LS)
- (public) Review ongoing Query Params cleanup work (RJ / AM)
    - Targeting 2.10 - Add an assertion when using `(query-params foo="bar"` or `.transitionTo(..., { queryParams: { foo: 'bar' } })` if `foo` is ambiguous (either because two controllers use it as a local property alias, or because one is using a local `foo` property as an alias and there is also a URL key for `foo`)
    - Targeting some future version (> 2.10) - add a deprecation when using anything other than a URL key with `(query-params` or `transitionTo`


### Minutes

#### Glimmer 2 and Ember 2.9 Stable

YK: Update on Glimmer 2 and beta. We moved Glimmer to beta because we had fixed compatibility issues in canary that we knew of and needed a bigger testing group, which beta got us. Since then, things have gone really well and compatibility has been exceptionally good.

YK: There are still two issues remaining that affect compatibility that we feel need to be addressed. The first issue is around dirtying. We implemented an optimization that improves first time render, but in some Ember apps can cause re-renders to get significantly slower in some cases. Initially we thought this was very rare and not worth giving up the optimization, but eventually everyone who saw it agreed that it could have a negative impact on many apps.

YK: Godfrey and I have implemented a fix, which causes a 1.5% dip in performance in our rael world app benchmark suite across the board. This seems worth it because it prevents many pathological cases that would be far more noticeable than 1.5%. However, we realized that our fix would not cover Proxy cases. Chad is currently working on fixing that now.

YK: The other issue is with ember-wormhole. Even though we had updated ember-wormhole to add compatibility for Glimmer 2, there were a few other cases discovered where wormholes would not work correctly depending on how they were used. There was an "intimate API" added in the last few days to address this, but Godfrey believes the fix is not correct and needs further work, and I am nervous about adding in an untested, intimate API a few days before cutting production.

MB: Stanley has raised an issue with helper destruction as well.

YK: If that is a blocking issue I would be nervous about putting the fix in for that right now as well.

YK: So it seems like we have three options. Say "damn the torpedos" and go full steam ahead with the release and deal with the compatibility fallout. Option 2 is to defer the release by a week, which I am not in favor of but am open to persuasion. Option 3 is to punt Glimmer to 2.10 beta, cherry-pick the most critical fixes into the 2.8 release version and that becomes 2.9 release.

YK: If we do do the "damn the torpedos" approach, we can tell people who care about stability to use the LTS. But I am very nervous about saying that non-LTS releases are not that stable.

RJ: We have shipped releases with regressions before.

EF: Let's not turn this into a meta-debate.

RJ: Regarding the wormhole fix, my understanding is that there is a specific case that it does not work in.

KS: If there is a `TryOpcode` before the wormhole, it will not work. We missed it because all of the wormhole tests are inside an element.

YK: The bottom line for me is that we can definitely find a fix for this, but we're only two days before the release.

RJ: I think the majority of users will be okay. A bunch of people are already running on the 2.9 beta today, and we have not received any reports of malfunctioning apps. The vast, vast majority of issues people have raised were due to the performance regression/property dirtying issue that we've already discussed. To me that is a way way bigger deal.

MB: If we do use the 2.8 release as the basis for the 2.9 release, what other things would we be giving up? Any of the router stuff?

RJ: All of the encoding stuff was already in.

RJ: If we decide to this, is anyone opposed to me resetting the beta branch to the 2.8 master, and then bring things back in? Then we will reset the new beta branch to canary for 2.10.

DG: Have we considered reducing the length of the next cycle so we have a Glimmer 2-enabled release sooner than 6 weeks?

TD: I am opposed to anything that pushes off the regular release train. The entire point of regular release cycles is so that if you miss one train you just catch the next train, and it shouldn't feel too emotionally bad. If people are feeling very emotionally bad about missing the train, we should either stop feeling emotionally bad or make the cycles shorter. But I don't think that's realistic.

RJ: Is anyone opposed to not deferring Glimmer 2 until 2.10?

*deafening silence*

MB: Addons will break if they are checking the Ember version string to determine whether Glimmer 2 is available or not.

RJ: Liquid Fire is one example of this, but there are probably other addons that have added Glimmer 2 compatibility using private APIs that will be affected.

RJ: Perhaps we should defer a week to allow addons that check the version string to update.

MB: I don't think it would even take a week to get it done. It's a handful of addons, but they are important ones.

RJ: Me and Martin have the top 1000 addons saved locally on our machines, we can take a look to see how bad it is.

YK: Me and Tom will work on how to communicate this to everyone.

EF: I don't think it's too hard to message; it's an example of the release train model working exactly as intended. People will be happy about compatibility.

YK: Maybe Matthew can do an initial draft of the release blog post and we can help massage the messaging.

MB: We need to communicate this before the release blog post. The next, last beta will not have Glimmer 2, and that could potentially break anyone using beta with addons that have the version check issue. That will happen before the release.

YK: Ah, yeah, you're right.

YK: I have another important topic to bring up. Are we all in consensus then?

*Yes, we have consensus on the plan.*

#### Helping the Learning Team

YK: There was an issue with the welcome page in a new Ember app and the `application.hbs` not being there. The last time we discussed this I thought we had consensus. Robert's objection to including the component in the `application.hbs` is that it would include the assets in production, which I agree is bad. Ed pointed out that if the user doesn't remove it, we can just not emit the assets in production builds. I also realized we could pretty easily lint for using this component. The bottom line though is that the time is ticking and I want to bring back the `application.hbs`. If we wait longer then tutorials will update to assume no template is generated, and then reverting the change itself becomes breaking.

RJ: I disagree. There are a few other issues with the addon today. These bugs can be fixed but so far no one has taken the time to fix them, although I have explained them to a few different people. But if we strip out the assets during production, then someone using the component will cause the app to crash in production but not in development.

TD: What is the case where someone would be using the welcome component in a production environment? You wouldn't accidentally leave it in because it will totally screw up your UI.

*YK angrily closes his Chrome tab*

YK: The high-level point is that people who know JavaScript but not Ember don't know where to start working. Having the first page that you load tell you where to go to start editing is incredibly important.

RJ: If the point is telling people where to start, why not just put that in the addon and make the instruction to remove the package from `package.json`?

#### Module Unification FCP

Are we ready to merge?

EF: Yes, no new objections have been raised since the last FCP process. There was a very robust community discussion and I am very grateful so many people gave us excellent feedback.

EF: The routing RFC has been relatively quiet.
