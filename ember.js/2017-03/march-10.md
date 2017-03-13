# Ember Core Team 2017-03-10

### Agenda

- Browser support matrix - https://github.com/emberjs/ember.js/issues/10566 (RM)
- Component manager RFC - https://gist.github.com/chancancode/f2c060ee61cb4e3dfe05af6a7561be71 (RM, GC)
- `<input type="range">` https://github.com/emberjs/ember.js/issues/14958#issuecomment-285466753 (RM)
- Resolver migration - via Isaac from 201C https://github.com/201-created/dangerously-set-unified-resolver/wiki/Expand-Local-Lookup-Notes (DG)

### Attendees

MM, GC, IT, EF, SP, CH, TG, TD, AM, DG, RJ

### Minutes

#### Browser support

RM: A request was posted for an official browser support statement. It is recurring theme, so I just need to know what versions we support and we can add it somewhere.

RJ: It is hard to list concretely every browser we support.

SP: I think the algorithm is "we support the latest version of evergreen browsers and the last few versions of non-evergreen browsers."

RJ: "We support more than current evergreens."

SP: A good starting point is N and N-1 for evergreen browsers and IE back to version 9.

MB: Where should we communicate our browser support matrix?

SP: Can we add a new page and just link to it from the homepage and the builds page?

(discussion about putting something on the builds page, in the guides, or building a separate page) (regardless needs cross-linking from several locations)

RM: I have some paths forward, we can discuss in the issue before moving forward with changed.

#### Component Manager RFC

GC: I'd like to post it after this call if there are no major disagreements.

(discussion, sorry)

#### input range

RJ: YK and GC opened an issues on the whatwg repo. if you set range and value in different orders your get different results. I think we can do a few things: for ex. say it is a browser bug

YK: Not a brower bug. We should just special case input types.

RJ: right, special case input type=range, or just explain it to people

(YK explains the issue is related to lazy-set type on inputs when setting a value and range).

YK: We should just always set the type last. By setting type last, we can at least match the semantics of HTML which is what our templates imply. There is a risk that there is a symmetrical issue in the other order, putting the type last will itself sometimes cause an issue. I can say the spec authors know about these issues and want to fix it over time (they want the order that you apply attributes to the DOM to not matter). I discussed this and I think the thing is that constraints should just not be performed on disconnected DOM nodes.

RJ: I'm not a fan of backporting since this doesn't seem like a new thing, just found behavior. And for now the manual fix is to put the type last in their attribute list.

RM: We can perhaps write a template AST transform to move type to last?

YK: but often type comes from attributeBindings, for example. The simpler thing is that we already have a place where we flush, and we should just do it there.

RJ: yeah I think we just fix it in Glimmer and recommend the manual fix for now.

#### Resolver migration

DG: Goal here is to merge this into the standard resolver. The migration steps aren't super clear, Isaac wrote up notes. We allow the standard resolver to work in dual modes, we need to keep the resolver API consistent through 2.x, but the resolver in the dual mode (module unification and legacy layout) won't be very performant. You should use it for migrating, then change to "turbo".

SP: We can agree the term "turbo" is not good though.

DG: yes. It is a strawman.

(some perf thoughts)

DG: The current version of the ember-cli resolver is constrained by the system itself

SP: I theorize we could remove a bunch of features from the ember-cli system and it would be faster.

KS: I was talking to someone and they use system js and they said in one case that the config/mapping it generated was so big that it ruined the performance issues.

DG: there are a lot of points there. To SP, there is a possibility to write a svelte legacy/class resolver that ignores all of the pods etc in the current resolver.

MB: The focus of the module unification work was never performance during the integration phase.

SP: but I keep hearing about performance, which we haven't tried to fix the current thing yet so how would we know?

YK: I think when the code itself is not so big, rewriting it can be a good way to experiment

(vigorous debate)
