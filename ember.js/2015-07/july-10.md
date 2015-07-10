# Ember Meeting Agenda 2015-07-10

#### Topics

* MB: Can we get basic agreement on `<ember-component is={{someComponentName}}>` It would be good to land it in the current master cycle (for 2.1)
* MB: https://github.com/emberjs/rfcs/pull/71 - "Action services"
* MM: https://github.com/emberjs/rfcs/pull/66 - "Outlet focusing"
* KS: https://github.com/wycats/handlebars.js/issues/1050 - "Splat operator"
* SP: https://github.com/emberjs/ember.js/issues/10272
* SP: https://github.com/emberjs/ember.js/issues/10209
* SP: https://developer.mozilla.org/en-US/docs/Web/Events (https://html5sec.org/)

####

Attendees: Alex, Martin, Peter, Trek, Matt, Tom, Leah, Yehuda, Igor, Robert, Stef, Kris

#### Minutes

MM: "Action services" can probably just be actions on services.

YK: I haven't had a chance to review it yet, but closing seems ok.

TG: Can we give locks & Michael access to Swiftype?

TD: Sounds good to me.

MB: I'd like to have a dynamic component API ship with the angle components.

YK: Angle Brackets will ship without a few things we hoped for originally.

KS: Why are we punting fragment components again?

YK: I would not be happy to couple shipping angle components to all the things we wanted to do.

KS: Can we opt out of two way for curly components?

YK: Probably not, that is a transform and it would be difficult for 2.1. In theory we could do it in 2.2.

YK: we do want a way to opt out of specific parts of what a component does.

TD: Specifically for addon authors. We want to give them the benefit to invoke legacy style components that are still performant.

YK: We really don't want app authors to get into transitional nastiness unless they have a massive app with a lot of uses in a component.

MB: Let's shelve the `<ember-component>` discussion until later on.

YK: We should pare back the component RFC to exactly what will ship in 2.1, and open additional RFCs for things like the dynamic component lookup item.

SP: Thanks for looking at those memory leaks.

YK: Yeah with a test case they are an order of magnitude difference in how long it takes to fix.

TD: It was a good opportunity to cleanup as well

YK: I hope people read those commits

MM: So is the attrs hash supposed to be public in 1.13?

KS: The attrs hash is confusing with two-way bindings.

YK: We chose not the make attrs public in 1.13 because the auto-mut was confusing. My opinion is that because we did not document it it was not made public, but several people have pushed back on that. I'm happy to say we don't plan on using it, but it is extremely dubious to use them as they were designed for angle brackets.

YK: The real goal is that they provide a way for angle bracket people to think about mutable `attrs` on curly brackets.

MM: Should we hide mutable cells in 1.13?

RJ: No.

YK: There is vinegar associated to mutable cells that <discussion and summary of mutable cells>



YK: Basically it is not a good thing to use before angle brackets. It is not good to encourage people to use it.

KS: If people use `attrs` today they will see mutable cells and need to use `value` even though they are only effectively using one-way bindings. Later they will have to rewrite their components to drop the `value`.

KS: We've had to disable the proxy on mobile for performance.

SP: Yeah, I've enumerated that in an issue.

RJ: There are no specific docs for this (`attrs`) yet. Most that are like RFCs are for future stuff anyway.

SP: One last thing, with `attrs` is there a concept of reflection? Should they be automatically be reflected in some kinds of domish way (changing capitalization).

YK: The plan is to reflect strings, and allow unquoted as an opt-out.

SP: One benefit of the current system is that we don't need to reflect everything, that saves us from some XSS vectors

YK: I don't think we need a big white-list. It seems obvious that we should disable onFoo at the onset.

SP: It is just work adding this to the constraints.

KS: at some point making these things safe requires more specific safety markers and tooling for CSS, URLs (CSS and URL equivalents of HTMLSafe). Attribute helper would need to know whether the interpolation results in a url, and a CSS attribute would need to be parsed and have render nodes).

SP: we should then enumerate https://developer.mozilla.org/en-US/docs/Web/Events
