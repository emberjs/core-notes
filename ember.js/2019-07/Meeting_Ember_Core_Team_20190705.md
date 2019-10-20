# Meeting: Ember Core Team 2019/07/05

## Agenda

- (public) (**2 min)** Determine note taker - JW/MB
- (public) RFCs
  - → FCP
    - [@classic decorator](https://github.com/emberjs/rfcs/pull/468)
    - [Blueprints Update](https://github.com/emberjs/rfcs/pull/477)
  - FCP → Merge
  - → FCP to Close
  - FCP to Close → Close
  - Enable -
- (public) (**10 min**) Path forward for default model implementations (including `store`)? (RJ)
- (public) (10 min) Should we rethink how we do blog posts? (JW)
- (public) (10 min) Octane To-do list from F2F - who will do what, when? (JW)
- (public) (5 min) Notion, sharing, and privacy model (CG)
- (public) (5 min) status of async/await (MB)

## Attendees

- [ ] Yehuda Katz
- [ ] Tom Dale
- [ ] Kris Selden
- [ ] Leah Silber
- [x] Robert Jackson
- [x] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner

- [ ] Dan Gebhardt
- [ ] Godfrey Chan
- [ ] Ricardo Mendes
- [ ] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [x] Chris Garrett

## Action Items

- [ ] Fix generators/Babel bug in latest Ember

## Minutes

### Blueprints

Agree to move blueprints to FCP

### Should we rethink how we do blog posts?

RJ: We should default to asking talking about writing blog posts in the public #dev channels in Discord

JW: Are we blocked on the 3.11 blog post? Generators bug, new application is broken

RJ: No, we should just fix it ("it's a 3 line change")

RJ: Babel 7.5.0 is fundamentally broken with TS parsing, completely out of our control

RJ: Could be fixed in ember-cli-typescript

(discussion)

JW: I don't think we've gotten the specific information we need for the blog posts.

RJ: I think the generated changelogs for data and cli can be better, I'll take that as a note.

### Octane To-do list from F2F - who will do what, when?

JW: We got to the end with our TODO lists but we didn't talk about..

JW: Big ones are codemods for angle brackets, `this` codemod, and classic classes

RJ: There was a weak initial implementation of `this`, but we have a much better version in progress. We improved a bunch of stuff like with whitespace control, and those fixes are in angle brackets as well. YK/GC know of some other issues, but I don't know their whole list.

RJ: GJ and many others are working on the codemod, we have a relatively large team working on it. For example I just landed fixes in Glimmer VM yesterday to fix the whitespace ~ stuff. It meant passing more things through the AST, but we have to do it. In general our ability to codemod is still much younger than the equivilent in JS, so you're seeing the kind of issues we would have seen 5 years ago.

RJ: It is not ready to suggest people use in their apps today but it is ready for testing.

RJ: There are three codemods, all distinct. Two live under ember-codemods org, we're working with the third.

JW: Also we talked about having a deprecation workflow-like app/thing.

RJ: A coworker of mine was doing a thing called ember checkup, it is basically a general purpose thing. It would have a —octane flag which could tell you progress. He/we are working on the initial release version. It is still private but I am pushing to make it public.

RJ: It will do things like: this is how many templates are missing `this.` etc. You can get a status and track it over time. We specifically want it for tracking this migration in large apps.

RJ: As far as where to document it I have no idea.

JW: I think we will come back around to this and I will add it to our tracking.

### Async/await

MB: What is the status of this in stable Ember?

RJ: async in a model is fine, async in an action needs special handling to make your tests promise-aware. Unless you are doing a test waiter, you will miss the async result. TLDR - for example, tests will not wait for \$.ajax. Fine to use async await anywhere when you're not testing. The framework will do the right thing.

MB: Can we add a waiter for actions?

RJ: ember-test-waiters addon has a waitForPromise API that helps. There is an RFC for test waiters in the works. The current test waiter system is too opaque.

EF: async/await is just a syntax which means you could use it anywhere, but that doesn't mean you should. We could talk about what async actions should look like, as an RFC. Have to be careful with magicalness

RJ: generally opposed to changes to actions

MB: we are teaching actions in the guides, so should we call out the testing caveats or say not to do it?

EF/RJ: we should remove that example

MB: so do we have to explain in a section of the testing guides about async await nuances?

EF: there is no change compared to promises

JW: to beginners, async action looks like something special so I think it needs a note

MB: ok, I will follow up on this PR

RJ: We should be showing async/await instead of promises, in general

RJ: Important to me that we get this right so feel free to ping me. We are working to make sure we flush the micros but it breaks tests because of the runloop integration. Still need to come back to this PR. Backburner has a next or flush function.
