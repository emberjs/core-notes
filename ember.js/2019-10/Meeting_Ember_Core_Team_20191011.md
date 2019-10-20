# Meeting: Ember Core Team 2019/10/11

## Agenda

- (**10 min**) @Yehuda Katz docs updates
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable

## Attendees

- [ ]  Yehuda Katz
- [ ]  Tom Dale
- [ ]  Kris Selden
- [ ]  Leah Silber
- [ ]  Robert Jackson
- [ ]  Igor Terzic
- [ ]  Matthew Beale
- [ ]  Edward Faulkner

- [ ]  Dan Gebhardt
- [ ]  Godfrey Chan
- [ ]  Ricardo Mendes
- [ ]  Chad Hietala
- [ ]  Katie Gengler
- [ ]  Melanie Sumner
- [ ]  Jen Weber
- [ ]  Chris Garrett

## Minutes

### Core docs

YK: I'm working on the docs for Octane on the branch.

CG: I rewrote all the component guides, it is in the Octane branch

YK: The section on components right?

YK: GC was pointing out there... I've been teaching the Octane model and it is surprising how the thing I explain is a paragraph but the thing in the docs is much more complex. We don't do a good enough job of saying "Here is a starting point, you have the model, if something doesn't fit here is more documentation"

CG: I think the idea is quickstart is that, and the tutorial is the deeper thing

JW: Yeah that has been the model

YK: Yeah the quickstart is hard to just jump right into, like to go straight to templates where the guides are.

JW: Your main goal is to shore up the introduction for sections?

YK: I think if I had a day that is what I would reach for. But if I have more time I think it is a bit more...

YK: MDN has a "how would you write a letter to a colleague" as a high level thing to learn HTML. I'm kind of showing how you can start with that and break things down.

JW: If you can submit incremental PRs that would be helpful for reviews.

YK: Thanks for asking, there is nothing problematic with me doing that. I think there will be a little bit of incoherence as I work.

CG: Or put each commit on a PR one at a time.

YK: Or just submit each page as another PR. I think it is ok b/c the guides don't reference each other.

CG: I also want to know what works and doesn't in there, it would be helpful for me.

YK: I think it carried over a lot of things as a default. I think that was fine as a default but it added a lot of stuff.

CG: I think the main things was trying to organize around "Core concepts"

YK: I think merging the template and component section... I'm trying to order it by concept and also what you except to cover.

YK: For example you don't need to cover `{{each-in` before how to handle a button click.

YK: GC also suggested things like the list of helpers could go into guides as a "reference section"

YK: There are a few other things, like if you use `(array` `(hash` teach them as literals.

YK: I think another thing is the state management section. It feels like a dumping ground of ideas, not a coherent thing.

CG: Yeah that section can use more work.

YK: I think it is inline with the rest of the docs right now, but I think if they do this now they want more on tracked properties and contextual components.

CG: It might be something for atlas as well.

YK: There is also a version called "what is the recommended path", but I'm looking for "what is the minimal collection of concepts you need to be successful"

### Classic mode docs

YK: We don't have a rosetta stone thing

EF: That is the cheatsheet

YK: There is a missing thing of "how do I interact with classic code" that isn't there. Like if I have an addon which is classic what are the ways to interact with it.

YK: The main thing I think is important is this is not the upgrade guide. ...

(discussion)

JW: It sounds like maybe YK you and CG can meet and go over stuff, and anywhere that it doesn't require lots of depth.

YK: it is good that we're working on docs.

### Inspector

YK: How is the inspector going?

RJ: The work you and GC did is released, there is still work on the component tree. There is also a bunch of work on tracked properties and visualizing them.

(discussion)

CG: (discussion of some cool inspector features)

(discussion)

RJ: For example when you have an error thrown in glimmervm you can get a bad stack trace five lines away from the real issue.

YK: I think probably the right thing is you have a handle API, and in normal window mode you don't need to dispose of it. This conversation does suggest that we should add debugging to the roadmap.

RJ: Either way I think we need a debugging RFC. This is the thing I've been talking to CG about. There are a few features you can say are part of svelte but are notish... For example deprecation workflow it doesn't have a good way to hook into addons really. I think the tooling should be good enough that there is no pushback for the 4.0 deprecations landing.

RJ: I'm not saying we should deprecate all the things or not, but that the noise should not be an issue.

YK: I think GC is right that by adding a deprecation we are telling people "this is a good time to move away from x"

CG: We also talked about...

(discussion deprecations)

(external packages as build-time flags)

YK: We need to figure out what it means to svelte out ember object. You can't break the routing, you can't break link to. I think there are just a lot of work to do before you need to worry about the messaging.
