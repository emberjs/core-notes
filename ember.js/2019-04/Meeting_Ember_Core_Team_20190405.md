# Meeting: Ember Core Team 2019/04/05

## Agenda
    
- (**10 min**) `@ember/instrument` 
    - Context: https://github.com/emberjs/ember.js/pull/17848
- RFCs
    - → FCP
        - (**5 min**) (overflow from last week) [**Dynamic tags in glimmer templates**](https://github.com/emberjs/rfcs/pull/389) (GC)
        - (**5 min**) `{{on}}` modifier https://github.com/emberjs/rfcs/pull/471 (CG)
        - (**5 min**) `{{with-args}}` (`{{fn}}`) helper https://github.com/emberjs/rfcs/pull/470 (CG)
    - FCP → Merge
        - (**5 min**) Injection Parameter Normalization https://github.com/emberjs/rfcs/pull/451 (CG)
    - → FCP to Close
    - FCP to Close → Close
    - Promote
        - (**5 min**) [**Modifiers + …attributes**](https://github.com/emberjs/ember.js/pull/17842) (GC)

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [x] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

- [ ] https://github.com/emberjs/ember.js/pull/17848 → per @wycats this is not a public API, but is at *least* an intimate API and is reasonable to be relied upon and can only be removed with a specific deprecation RFC
- [x] Move https://github.com/emberjs/rfcs/pull/389 into FCP @Godfrey C 
- [ ] Find a “good example” RFC for the “How We Teach This” section that we can provide to RFC authors. Will help clear up fuzzy expectations. @Jennifer W 
- [x] Update https://github.com/emberjs/rfcs/pull/470 from `{{with-args` to `{{fn`, and FCP @Chris G 
- [x] Update https://github.com/emberjs/rfcs/pull/471 with specific details on how we handle the `once`, `passive`, and `capture` named arguments across browsers

## Minutes

RJ: who wants to take notes?

JW: I’ll take notes

GC: I’ll try to help where I can, but historically I’m not a very good note-take

### `@ember/instrument` 

Context: https://github.com/emberjs/ember.js/pull/17848

CH: I don’t understand what is meant by intimate API here / why does it mean that it is in the modules RFC but not “public”

(discussion of what is meant by intimate private API)

YK: impression was that everything listed in the table was meant to be public. Godfrey, do you think this needs to have some design work to determine what is public API?

GC: yes

RJ: We are being told that the community wants to use this, since it was in the RFC, regardless of what the intent of the RFC is

YK: Need to figure out what the API should be

RJ: Can someone do this other ways? Can the inspector be written without this API?

YK: The question is whether we should make this public or keep it private and consider something else for the long term. Chad, do you have a preference?

CH: It is my opinion that the point of RFCs is to enumerate the public interface

YK: In general, that is true, but the final say is whether it shows up in the API marked as `@public`

RJ: do we want to commit to designing the alternative?

YK: making something public means not only committing to maintaining, but also declaring that it is a good thing to use. 

Maybe we could mark it as intimate API in some way in the docs

RJ: that’s a lot of work for low returns

JW: regardless, the API should have a solid note about how it’s being used, like by Inspector

RJ: I would hope that people do due diligence to search for usage before removing things and pressing merge

CH: It’s already implemented so it seems weird that it’s not public, and we could remove it whenever

YK: Things are only public once they have `@public` in the docs

Next steps listed as an action item

### Dynamic tags in glimmer templates

- Questions about how strongly the RFCs should suggest docs content vs giving learning team the flexibility to do their job
    - Learning team would prefer more content overall
    - Learning team should have input during RFC process
    - GC needs to clear up the RFC to remove “debatable” wording
- MB: Concerns about claiming `element` as a name
    - local variables win over built-in helpers, mainly affecting `this.*` fallback only
    - RJ: based on [ember observer search](https://emberobserver.com/code-search?codeQuery=(element&fileFilter=.hbs), there are no existing usage (one result is using the polyfill, the other one was a false positive)
- Can we FCP this?
    - Yes (after the amendment mentioned above)

### `{{with-args``}}`/`{{fn}}` /`{{bind}}` modifier

- `with-args` vs `fn` vs `bind`
    - `bind`
        - uncanny given the difference vs javascript
        - YK: disagree that a lot of people know what it means, hard to google
    - `fn`
        - new thing to teach with nothing to lean on
        - YK: likes it because it’s short..
        - KS: I’m fine with `fn` but I have issues with the arguments for `fn` vs the arguments against `bind`… there are people in the community who wants to be more JavaScript…
    - `with-args`
        - YK: too long…

Conclusion, FCP after find/replace to use `fn` 

### (5 min) `{{on}}` modifier https://github.com/emberjs/rfcs/pull/471

YK: I am ok with “on” as a name now. I think there is some confusion over the passing of arguments

YK: `fn` is ok enough for now

RJ: Concerns about passing options through to the underlying event listener (what’s the behavior)

Resolution: We will update the RFC to explicitly passthrough/polyfill `passive`, `capture`, and `once`. We won’t do anything for any other values (no error, but no passthrough).

(Discussion - impact on event dispatching order. See Marie Chatfield’s talk)

RJ: Not happy with suggesting onclick= so an alternative is great

Conclusion: FCP! we can merge it after it’s had a tweet about it for some number of days.

### Injection normalization parameters

Conclusion: Was already FCP, but did not get a tweet etc. So we should tweet it now.
