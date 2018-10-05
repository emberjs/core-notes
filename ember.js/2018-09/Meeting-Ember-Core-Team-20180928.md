# Meeting: Ember Core Team 2018/09/28

## Agenda
- Followup on F2F items
  - MU import/use
- codesandbox.io work ([demo here](https://codesandbox.io/s/qvxol5zmk4)) [RJ]
- Storybook work ([PR here](https://github.com/storybooks/storybook/pull/4237)) [RJ]
- Hacktoberfest
- Pre-RFC: `{{wut[on][earth]}}` https://github.com/emberjs/rfcs/issues/379

## Attendees
[x] Yehuda Katz
[x] Tom Dale
[x] Kris Selden
[ ] Stefan Penner
[ ] Leah Silber
[x] Robert Jackson
[ ] Igor Terzic
[ ] Matthew Beale
[x] Edward Faulkner
[x] Martin Muñoz
[x] Dan Gebhardt
[x] Godfrey Chan
[ ] Ricardo Mendes
[x] Chad Hietala
[x] Katie Gengler
[x] Melanie Sumner

## Minutes

### MU Use/Import Discussion

YK stating current problem

- community comments like Sam’s didn’t have no info, but in conjunction with shifting requirements & ecosystem it caused more of us to rethink.
- MU design has been going on long enough that JS & TS adoption of ES modules with node_modules resolution has grown substantially stronger.
- EF’s build work has also pushed our thinking toward modeling more of the Ember ecosystem as ECMA modules.
- this should not be conflated with rejecting
  - having a strong convention for the filesystem
  - dependency injection as a separate valuable concern from modules


DG: a major discovered requirement was that we can’t control package name syntax. That motivated `use` but it was a late addition to MU and that has made this harder. Also CapCase components happened and further impacted the design.

YK: feedback from Sailfish was also relevant. MU worked and as the app got bigger it delivered benefits. But there were some aspects of the design that needed adjustment based on experimentation. Examples: exporting many helpers from a single file, easier lightweight grouping. MU opened possibility of named exports but didn’t include that in the design.

TD: Initial Sailfish feedback was that people didn’t like MU strictness, like lack of ad-hoc grouping. Filesystem-as-scope was hard to learn, compounded by bugs. People would put a component somewhere and try to invoke it and it would not be found and they would be confused and have no clear next step to debug.

YK: none of this was fatal, just refinements on top of MU, but those refinements haven’t happened because MU itself has been unable to ship over a long period of time.

EF: our instinct was good, to not re-litigate a design that was a hard-won consensus without at least letting things ship first.

YK: strawman idea for the import alternative is: what happens if you could literally import values into templates. After discussion at f2f it seemed plausible, but there’s work to be done to figure out the real impact.

YK: open questions list:

- if we have import syntax, do we still want local lookup?
- if we have import syntax, do we still want application lookup (the src/ui/components folder)?
- is there a way to restrict this change to components, or does it need to apply to other things that MU is talking about?
  - controllers
  - routes
  - services
  - components
  - helpers
  - models
  - adapters
  - serializers
  - stores
  - transforms
  - extensibility story for MU (custom resolvable collections)
- does the syntax extension cause us to call this something other than hbs? Do we need to reserve some space for future single-file-component formatting?

YK: a strawman proposal would be to implement the front-matter syntax for components, eliminate local and global lookup for components, but more-or-less leave everything else (types other than components) alone. Maybe also a prelude-like thing. Don’t take this too seriously, we need a written proposal. We need to define what happens when you import a component and you get the pieces of the component. We could potentially not solve custom collections and lean on the app-directory backward compatibility for a while.

YK: Ability to swap out services is an example of a reason why DI is still needed and not a good fit for modules.

DG: a key question is whether we think swapping out components (in tests or for different configuration) is an important feature.

YK: a more precise question is whether it’s important to swap things *per test*. Because having the build system swap modules is maybe OK as long as the answer is constant for a complete build.

EF: I think it’s usually bad to try to swap components, because people generally do it to instrument things and inspect what is not really public component API.

YK: a more principled way to do that is probably fine, but what components my component calls are not public API.

KS: these patterns make brittle tests. People often have acceptance tests that pass but tons of intrusive tests that fail.

DG: I brought this up as a deciding factor and I agree with what people are saying. Single file components drive this point home. It’s not consistent if ECMA imports into your component’s Javascript are not swappable while invocations in the template are swappable.

YK: I think everybody still agrees that we should have a conventional file structure. But the design we’re discussing doesn’t actually impose one. We could say that doesn’t matter, but we should probably be more careful. If the only thing imposing structure is the generators that’s probably not enough. An example of a rule that’s good is: if you have a component that’s only invoked in one place, it should be nested inside.

TD: we also don’t want components reaching into other components to pull out children.

YK: There is some design space for preserving the good things that MU gave you in terms of conventions leading to less typing, so there’s an incentive to follow conventions.

KS: the conventional file structure is valuable because it’s much easier to move from app to app and be productive.

YK: Everyone agrees with this, and even the Sailfish feedback agreed once the app got bigger. But people get mad at it when they’re just starting out. We have to figure out what will happen in terms of people turning off lints.

TD: People seem willing to disable lints in a much more fine-grained way, which causes them to at least think about it.

RJ: It’s not clear exactly what lint we’re talking about. The exact details matter a lot.

YK: strawman lint to illustrate the problem: limit import specifiers to only ones starting with  `./` or `$src/`. or an actual NPM package name, and only one level deep. This would be the same as what MU had before.

RJ: people could do their own nesting by making packages, so the lint would push them into doing the right thing.

