# @Jun 05, 2020

## Agenda

- (public) (5 min) CodeSandbox path forward → unify with `ember-new-output` (CHG)
- (public) RFCs
    - → FCP
        - Adding `--lang` flag to ember-cli: [https://github.com/emberjs/rfcs/pull/635](https://github.com/emberjs/rfcs/pull/635) (MS)
        - `invokeHelper()`: [https://github.com/emberjs/rfcs/pull/626](https://github.com/emberjs/rfcs/pull/626) (CHG)
    - FCP → Merge
        - Prettier RFC → [https://github.com/emberjs/rfcs/pull/628](https://github.com/emberjs/rfcs/pull/628) (RJ)
    - → FCP to Close
    - FCP to Close → Close
    - Enable
    - Discussion
        - [https://github.com/emberjs/rfcs/pull/632](https://github.com/emberjs/rfcs/pull/632) string-based actions (RM)
        - [https://github.com/emberjs/rfcs/issues/634](https://github.com/emberjs/rfcs/issues/634) `@route` argument (RM)
        - [https://github.com/emberjs/rfcs/issues/633](https://github.com/emberjs/rfcs/issues/633) (GC)
        - RFC Stages: [https://github.com/emberjs/rfcs/pull/617](https://github.com/emberjs/rfcs/pull/617) (CHG)

## Attendees

- [x]  Yehuda Katz (YK)
- [ ]  Tom Dale (TD)
- [x]  Kris Selden (KS)
- [ ]  Leah Silber (LS)
- [x]  Robert Jackson (RJ)
- [x]  Igor Terzic (IT)
- [x]  Matthew Beale (MB)
- [x]  Edward Faulkner (EF)

- [ ]  Dan Gebhardt (DG)
- [x]  Godfrey Chan (GC)
- [ ]  Ricardo Mendes (RM)
- [ ]  Chad Hietala (CH)
- [x]  Katie Gengler (KG)
- [x]  Melanie Sumner (MS)
- [ ]  Jen Weber (JW)
- [x]  Chris Garrett (CG)

## Action Items

- [ ]  Explore adding branches to `ember-new-output` for each sandbox app (CodeSandbox, Glitch.me) @Chris H Garrett

## Minutes

### Code Sandbox

CG: the ember code sb is not currently up-to-date. ember is on there but old. checked with Mike North, unfortunately he just didn't have the time to work on it. Seems like a path forward is to unify it with ember-new-output so that it is always up-to-date. There are just a few hacks that needs to be fixed upstream, and need a codesandbox.json. I'm also working on a short term fix that just gets it to the latest version. We should try to keep this and glitch up-to-date in general.

RM: 

RJ: What do you put in package.json?

RM: 

RJ: Why? that's the default port?

RM: Don't remember why, something something it uses the wrong port.

RJ: let's take it offline

Questions:

- why does using ember-new-output not just work out of the box? Both for code sandbox and glitch.
- maybe we can have an automation/GH Action on ember-new-addon that patches it on a different branch whenever there is a push to master

MB: Do we have a tool-of-choice we suggest for demospace?

YK: I'd like the answer to be codesandbox

RM: The answer for better or worse seems like Ember Twiddle right now. Better b/c easier, worse b/c it isn't very nodey and how we do things.

CG: Codesandbox is very heavy to spin up for Ember, it can take a while to get a repro going. Twiddle doesn't give you a great reproduction since it isn't very realistic.

## RFC Roundup

### lang (635)

GC: Only criticism is that the error message stuff is overly specific about a particular bug implementation detail.

(discussion re: arguments to cli flags, and improving the upstream library ember-cli uses)

RJ: I think the specific error message here is not actually what we should hold ourselves to. I think it is good that there is an error when no arg is passed though.

GC: Yes agreed.

RJ: Should be block on the ideal message?

GC: As long as we consider the message non-normative that is fine.

RJ: I think it is fine, yeah.

EF: General point: There is a given understanding of a situation in all our rfcs. For example who would stop you if you changed the error message? Nobody, that doesn't require an RFC normally.

GC: I think there are several cases n the examples which are effectively solved by the same bugfix upstream.

**CONSENSUS to FCP achieved.**

RJ: I will comment on it after the meeting.

### invokeHelper (626)

CG: submitted this a while ago, got. a few rounds of feedback on it.

YK: in this low level API, shouldn't we make it return an opaque value with a getValue() method? This is a nice pattern we've used before (like in the cache API). It makes it easier to evolve the implementation. We should either stick this pattern or not, but decide that consistently for all new APIs, not do it ad hoc every time.

KS: it really does make the implementation easier to change, as new platform features become available, etc.

GC: the advantages are not that clear

CG: this strategy worked great with big refactors of tags, I had to be convinced but it really helped.

GC: a disadvantage is that you can't type it properly in TypeScript.

YK: We could pick a different strategy like properties but if we do that lets design it completely.

(MB asked a question about why the args are consumed as a function, discussion about the limitations of that pattern)

GC: This API doesn't allow you to opt out of autotracking.

YK: It's important that this new JS API is reflective of existing capabilities in the template, we should separate that from the question of adding new capabilities (to both HBS and JS). You can't opt out of autotracking in the template case.

(some bikeshedding over name of the thing returned by `invokeHelper`)

(discussion about when and how to unify our several low level APIs including invokeHelper, cache, and destroyables.)

Consensus to address the `getValue()` concern and then wait another week for FCP,.

### prettier (628)

(discussion of problems with applying prettier to templates)

YK: somebody should comment more fully explaining why "standard" is not a viable option. It's not really a formatting system, it's one locked-in set of choices.

Consensus to merge.

Action item: Yehuda will merge.

### string-based actions (632) and route (634)

### deprecating recompute (issue 633)

RJ: It would be good if somebody wants to write this RFC. We have compatibility solutions for addon authors.
