# Meeting: Ember Core Team 2019/02/08

## Agenda

- (**10** **min**) tracked feature on by default as part of merging https://github.com/emberjs/ember.js/pull/17572 with observer interop being added afterward (sent on runloop tick via validating tags)
- RFCs
    - → FCP
    - FCP → Merge ([GH](https://github.com/emberjs/rfcs/pulls?q=is%3Aopen+is%3Apr+label%3A%22Final+Comment+Period%22+label%3AT-framework))
        - (**10 min**) https://github.com/emberjs/rfcs/pull/418
    - → FCP to Close
        - https://github.com/emberjs/rfcs/pull/298
        - https://github.com/emberjs/rfcs/pull/202
    - FCP to Close → Close
        - https://github.com/emberjs/rfcs/pull/427
    - Promote
        - buildRouteInfoMetaData
    - Current Status?
        - https://github.com/emberjs/rfcs/pull/314
        - https://github.com/emberjs/rfcs/pull/284

## Attendees

- [ ] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [x] Stefan Penner
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
- [ ] Jen Weber

## Minutes

### Tracked feature flag

KS: I’d like to enable this FF when the PR is merged. I think we need it to be easy for people to try out. There is no observer interop right now, that is the only issue. There is a plan for that but I think it is better to let people try to use it. And it is already opt-in since it only applies when you use @tracked. I’m not sure the FF buys us anything since it is already opt-in.

RJ: I think enabling it to be used in classic classes, `.extend`…. I personally would prefer that we merge it then enable it, usually we enable after a thing it on canary. What I am worried about is enabling decorators for Ember without having an RFC. So it think if we enable it here it should only be the non-decorator version.

KS: I think this is all additive API since… there is something to be said for getting things in Canary and working them out early.

TD: KS you are saying merge and “go” the feature?

KS: I don’t care about going, I just want it to be easy for people to test.

(crosstalk)

GC: I think on alpha build is fine, but I don’t think we can expect to go it by the beta period.

RJ: there are two things. One is tracked in legacy classes, the other is the decorator version.

TD: This has both right?

RJ: Yes.

RJ: There are two PRs open now. The base implementation stuff is the same in each. The other one to use computed as a decorator…

GC: Isn’t it a pending RFC to change the decorators anyway? I think unless we are ready to land that RFC it seems good to not enable…

TD: When does the next beta cycle start? Not for a few weeks?

GC: I think merging anything is fine.

RJ: I reviewed this. I think it is good to merge.

TD: I suggest we merge this. Then separate tracked properties and tracked property decorators into two flags. Then we try to go the first thing.

RJ: The problem with go-ing the non-deocrator version is that this RFC https://github.com/emberjs/rfcs/pull/442/files is a fix to the non-decorator version.

KS: I’d rather have two weeks of it… If we think there is no chance we want it in the next beta I don’t care what we do here. If there is any hope that this gets in I would rather get it in.

(discussion)

SP: Isn’t the least friction just doing an alpha build?

GC: I would very much be in favor of an alpha build. Most of the time we don’t need it. But there are a couple of times it would have been helpful.

TD: I think it is… alpha build helps for benchmarking. Whether it is an alpha build or behind a FF I think we need to document/market it.

TD: How much work is it to publish an alpha build?

MS: I think they are still published.

RJ: Hm.

TD: So MS/RJ are you ok with us messaging “this is how to use the alpha build”?

RJ: I think we should not encourage people to use alpha/canary in production.

GC: Yeah I think it is just about if you want to try it use alpha build. It might make sense to have ember,,,

(discussion)

TD: I think we can land this PR. I think Chris can split the decorator into another FF.

RJ: I think it is already working that way.

TD: so lets merge, enable to version with no FF. Let’s make sure the alpha goes out.

(discussion)

KS: I’m concerned… observers are rare. Where people resort to them there are a lot of weird things going on. The power select concern… yes there are issues that I would like people to try and work out. I believe people need the observer interop. Our plan might fix a lot of issues around observers.

SP: Can we just kill them?

RJ: No.

TD: So I think we want to learn about is bugs, and that people can use them in an interesting way without having the observer interop.

(discussion)

TD: So merge the PR, enable the flag for non-decorators.

(discussion, we basically want feedback on if the planned observers stuff even needs to be implemented)

### FCP → Merge https://github.com/emberjs/rfcs/pull/418

RJ: When I looked at this there were new comments and I wanted to check on it. Most comments are the `in-element` thing is more confusing etc. I think it is massively less confusing.

CH: I didn’t read this yet since I thought it was landed. I’m not sure what to say. We don’t need a better solution or more ergonomic, we just need a way to suggest the same thing?

KS: Is it still hyphenated? I get the sense people are still confused.

RJ: You don’t need to use the dash, but the RFC for in-element needs to have its implementation completed.

(discussion)
