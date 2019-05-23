# Meeting: Ember Core Team 2019/02/22

## Agenda

- (**10 min**) [Routing RFC](https://github.com/MelSumner/rfcs/blob/MelSumner-a11y-routing/text/0000-a11y-routing.md#phase-one---return-to-the-starting-line) (just part one) (MS)
- (**1 min**) [Survey is live](https://emberjs.com/ember-community-survey-2019/), please share it with colleagues and co-workers. (MB)
- RFCs
    - → FCP
        - (**5 min**) [Add `descriptor()`](https://github.com/emberjs/rfcs/pull/442)
        - (**10 min**) [Classic Class Owner Tunnel](https://github.com/emberjs/rfcs/pull/451)
    - FCP → Merge
    - → FCP to Close
        - (**1 min**) [Original Element Modifier RFC](https://github.com/emberjs/rfcs/pull/112) - Close this in favor of [CH’s RFC](https://github.com/emberjs/rfcs/pull/353) covering the same. (MB)
        - (**10 min**) [MU Packages RFC](https://github.com/emberjs/rfcs/pull/367) - Close this in favor of a future RFC describing template imports and a future RFC covering MU layout for app/addon interfaces of services and DI APIs. Some notes: [+Quick MU Sync](https://paper.dropbox.com/doc/Quick-MU-Sync-ja1NcgAsSn1LMVaAc0bkv)  (MB)
    - FCP to Close → Close
    - Enable by Default
        - [buildRouteInfoMetadata](https://github.com/emberjs/rfcs/blob/master/text/0398-RouteInfo-Metadata.md)

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Martin Muñoz
- [x] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garret

## Action Items

- [ ] `descriptor` RFC - explore performance of more ergonomic alternative using `getOwnPropertyDescriptors` instead of `for..in`
- [ ] Classic Class Owner Tunnel - explore alternatives further in a strike team
- [x] Enable by Default buildRouteInfoMetadata @Chad H 
- [ ] [Original Element Modifier RFC](https://github.com/emberjs/rfcs/pull/112) - Close this in favor of [CH’s RFC](https://github.com/emberjs/rfcs/pull/353) covering the same.
    - [ ] Will FCP to close Matt’s RFC
    - [ ] CH’s FCP will stay open, perhaps should be done in an addon

## Minutes

### Accessible Routing RFC

MS: I’d like to do a proof of concept for how exactly to focus upon route transition. Would someone have time to help me dig into implementing a few of the prior art examples that I’ve found?

RJ: I’m happy to pair with you for an hour or so early next week.

MS: I’m concerned that most of the examples I’ve seen seem “tricksy”, taking focus then setting focus back.

RJ: I think some amount of that is inherent to the problem space. Imagine typing in a search box and doing route transition on enter. The input box *probably* should maintain focus there…

YK: Sounds good. I think we need to ensure we can find a good default (80/20 rule wise). So we may need to try multiple different things.

TD: We may need to come up with good heuristics so we know when to do it. 

KS: Its frustrating that the browser APIs don’t really exist for what we need here.

MS: I’m planning to bring a presentation to the next face to face meeting to explore what other frameworks are doing in this space.

TD: We should make sure to get our finger on the pulse in the standards world (both as a framework **and** as decision makers for some large sites).

### Survey Is Live

MB: The survey is live!! Please share with coworkers, the internet, etc.

YK: What is the long term plan for the survey?

MB: At this point the survey is in the hands of the learning team. We still have loads of prior years data for comparison. We’re doing a good job with historical data but next year we should re-approach some questions since they are stale. A good example is browser support: Supporting IE10/IE11 vs “modern” is silly. We much more care about policies, like “we only support chrome”, “we have firefox in CI”, stuff like that.

MB: MS, myself and Joseph Temple are on point this year.
