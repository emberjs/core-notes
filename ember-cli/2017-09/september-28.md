# ember-cli Meeting Notes - 2017-09-28

## Attendees

- @hjdivad dh David Hamilton
- @rwjblue rj Robert Jackson
- @twokul an Alex Navasardyan
- @turbo87 tb Tobias Bieniek
- @kratiahuja ka krati ahuja

## Agenda

- warn about npm 5
- ember-cli-shims warning
- dev/release script
- std/esm
- fastboot

## Discussion Notes

### npm 5

tb: we still warn with npm 5, but I'm not sure if it actually works

rj: `ember new` certainly works just fine.  Everything should be compatible.

rj: there are some caveats, eg with using `ember-try`.  I'll open an issue about these kinds of known issues.

### shims warning

rj: can we remove the warning in 2.16 if ember-cli-shims is not present?

tb: does everything work without shims?

rj: yes.

an: should we wait until ember 2.16 is released?

rj: the point is we'll save 3k from final size.  I'm not suggesting we remove it from the blueprint: only that we remove the warning.

tb: sounds good.

rj: likely there are apps that are still using babel 5.  Maybe we'll try to remove it for 2.17 but we should at least not disincentivize users from upgrading in 2.16.

tb: to be clear, apps working without ember-cli-shims is independent of the ember version?

rj: yes, it depends only on using ember-cli-babel@^6 instead of @^5.

tb: This is because `import Ember from 'ember'` is not transpiled?

rj: yes.

---

rj: long run we should aim to remove shims from the blueprint in 2.17.

rj: we need to decide on some mechanism for deprecating things internal within ember-cli itself as well as supporting deprecations in addons.  There isn't really a game plan for this right now but thus far everything has been done ad-hoc and we will need a bigger picture solution.

### dev/releaes

tb: the release script now builds with yarn but publishes with npm 4.  Publishing with npm 5 is broken.

### std/esm

dh: we had a rollover for deciding whether or not to pull the trigger on std/esm

tb: how does exporting work?  does it export something with `default`

rj: yes so people requiring our modules wwould need to call `.default`

tb: I'm thinking about `ember-cli-build.js` since it imports from the local install.

rj: there's also test helper stuff like mock project.

rj: we should merge the PR but we will have to do some testing and check for some iterop mode.

dh: are we still stuck on lockstep?

rj: probably until there is a metapackage that manages versions.  There is an RFC in the works for this.

*(general agreement that this would be a breaking change if there is no interop, and then require 3.0)*

### fastboot

rj: there is likely a bug in which the error template is not rendered; the error bubbles up and you get basically a 500

an: that is unexpected

rj: I agree we should address it, but the right behaviour is not obvious.  For example if you get a 302 we don't render the template we send you a 302.  If your API returns a 500 it doesn't seem totally unreasonable to return a 500 to the client

tb: can we return a 500 but still render the error page?

ka: that sounds like a good approach

rj: we are still missing a repro though

ka: what about rehydration?

dh: It won't make a difference: it's just that the document request will be a 500, so the impact is for dev tools

rj: I think it should just be consistent, eg between 302 and 500.

ka: we will need to fail `visit` with the content to return with a 500 and also show the content.

*(general agreement that the error template should render, some disagreement about the status code, 200 vs 500)*
