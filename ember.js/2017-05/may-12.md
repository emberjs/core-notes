# Ember Core Team 2017/5/12

### Agenda

- Named Blocks!
- Component manager pragma vs file path
- Update on point release
- LTS update
- remove `MODEL_FACTORY_INJECTIONS`
- Svelte update

### Attendees

AM, CH, DG, GC, IT, KS, MB, RM, RJ, TD, SP, YK, MM

### Minutes

#### Named Blocks!

AM: There is an RFC based on last weeks discussion. Things have evolved.

YK: I think the syntax has solidified around the `@` as an important part of the
syntax.

AM: Definitely doubles down on the idea that a block is just a kind of arg. It
has a lot of compositional wins. I really like where it is going to be honest.

YK: What incremental steps can we take to start making progress?

AM: I think it’s at the point where it can be polyfilled/transformed.

YK: Only using angle bracket syntax means it’s a lot easier for us to do
something.

RJ: We still have the problem where we need to take over the Handlebars parser
so we can fix some of the issues with it. E.g. we don’t have the ability to use
closure components with @-args, curly components with @-args, etc. Without
closure Glimmer components, it’s difficult to do some compositional patterns,
like the ones Cibernox has talked about.

YK: The bottom line is that internally there are: position args, named args,
…???

YK: We need to unify the parser.

RJ: To Chad’s point, personally I think this is what I was talking about
breaking things up. If we can land the Component Manager RFC, then we have a way
to implement named blocks and pass them to a curly-invoked component and play
with this and see how it works. I personally think angle bracket components have
a long way to go in terms of semantics. We still need to decide e.g. attrs vs.
props, merging strategies, onclick, other things. I don’t want to entangle all
of these things together, so nothing ships. That’s what I’m personally worried
about. I want to make things bite sized, even if it seems low-level and not
useful by itself. We want to build higher. lights come on, inspirational music
plays

YK: We want to enable the raw component manager API in canary, then make
progress stabilizing the part of the component manager API that Godfrey is
RFCing. Then we can have an unstable addon that lets you play around with that.
Eventually we can move toward including angle brackets in Ember proper. I think
just exposing the raw Glimmer component manager API in canary gets us very far.

#### Component manager pragma vs file path

CH: What’s the deal with pragma vs. file name extension?

RJ: I intend to implement both systems behind a FF, I want an implementation
that will support both and we can play with it. After some discussions I think
we need to readdress the rules around module unification and what the extension
means in the rules. And I don’t want to be in the middle of that discussion. I
want to implement both soonish, behind a flag.

DG: I feel the pragma implementation has fewer problems. The file extension has
more issues. We can’t diverge from the file path for module import, so there are
questions about the double extensions roles there. And there are concerns about
consistency. I strongly prefer pragma. Other people have other opinions about
what they think is best. We should put the issues out in the open and if someone
wants to argue strongly for extensions… if we add the complexity of both
implementations but only one is reasonable then we’re just adding complexity
without purpose.

YK: I’m hearing a number of things, some concerning. I have no strong feeling
about which we use during Canary. Most important that people get off the ground.
DG you imply that whatever we pick will have a strong status-quo bias, and I am
opposed to that.

RJ: This is why I want a feature flag. No default status.

YK: We should do the easiest thing now, but I don’t want the easy thing to be
the viewed as a decision.

TD: I think file extension is easier, b/c it doesn’t require parser work. I
don’t think we should have problems if we added `hbx` etc.

(discussion)

RJ: I agree this is difficult. I am willing to do both implementations.

YK: The actual primitive is that we have “template meta”. Whatever the quickest
path on seems good for this pass.

(general agreement YK, DG, RJ on doing pragma but continuing the design
discussion)

TD: I don’t love either design so far, and wonder if there is a better option.

DG: We talk about taking over handlebars and `hbx`, and this might lead to
something that solves both.

YK: One file extension does not give us multiple file managers.

(discussion)

RJ: Let’s discuss this at the glimmer application meeting on Monday

#### Update on point release

MM: Curious of that 2.13.1 status is.

RJ: There have been issues and bugs in 2.13. largest two are… one I’m working on
is fixing the debugging helpers. They currently fire on production. 2.13 has a
new build systems though, so it needs to be done in two build pipeline. Doing it
on 2.12 and porting most but not all fixes to 2.13.

* [Production builds are running `runInDebug` callback.](https://github.com/emberjs/ember.js/issues/15212)

RJ: I am fixing the debug thing. the other large issue is the “custom elements”
issue. If you have an HTML custom elements and you invoke them nested there are
errors. To fix it in 2.13 we need to look at the fix in Glimmer master and see
how to back port it.

* [2.13 custom elements regression](https://github.com/emberjs/ember.js/issues/15221)

KS: The precompiler parts need to be backported, not everything.

RJ: I think we need to. 2.14 is one the same glimmer engine, so we can’t let the
error leak forward into that version as well.

RJ: I also fixed and found a bug in s3 publishing.

#### LTS update

MB: do we have it? Blog post didn’t mention it.

RJ: I pushed the branch etc, but did not mention it in releases.

MB: Ok, I’ll open a PR to the blog post and we can tweet it out.

#### remove `MODEL_FACTORY_INJECTIONS`

SF: Can we land this? https://github.com/emberjs/ember.js/pull/15204

RJ: I have one or two small items. I’ll ping you this afternoon.

#### Svelte update

MB: Status update?

RJ: working on allowing apps to opt-in to building Ember themselves. CH’s macro
works, but we need ember to be built as an addon first. We’re pushing for this
at work.
