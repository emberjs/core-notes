Attending:

* David Baker
* Michael Kaiser-Nyman
* Ricardo Mendes

---


MKN: https://github.com/emberjs/guides/issues/853#issuecomment-153623259 - are action names dasherized or camel cased?

DB: I just made a Twiddle showing that they are camel cased.

MKN: I updated the issue to ask for this to get fixed.

---


MKN: Good job on the redesign!

RM: I made some color tweaks to improve the contrast. The background color is still a little weird. I don't like the new header - too big and not enough contrast.

DB: I agree about the contrast and size, but I like the new feel.

MKN: Can you just make it smaller and higher contrast?

DB: Yup. I will fix the header.

RM: I really don't like the new header.

DB: I can make the header smaller and higher contrast.

MKN: I don't think we should ship with the old header, and I don't think that we should let the header block the release.

RM: Okay.

DB: I'll fix it and then we'll ship it.

MKN: Thanks both of you for making this happen.

---


RM: Also syntax highlighting is terrible for the dark background and not ES6 compatible.

MKN: We're using CodeRay.

DB: We're using a fork that support Handlebars.

MKN: There are very few recent commits. I'll open an issue to find a new highlighter.

DB: dgeb looked into this recently and couldn't find much.

MKN: I'll open an issue for this.

---


RM: I forgot about the tutorial. I'll try again today or tomorrow.

MKN: I'll remind you.

RM: In the tutorial, we'll make Tomster introduce things.

DB: I like that.

RM: I'm thinking we should have the Tutorial separate from Getting Started.

MKN: All of the Getting Started concepts will be covered by the Tutorial, so I'd say just subsume it.

RM: I'm okay with repetition for the sake of people not wanting to dive into the Tutorial.

MKN: What topics are in Getting Started?

RM: Installing and Core Concepts.

MKN: *If* we have both, I think Getting Started should have prerequisites, installing, ember new, core concepts, dev server, and building.
  But then duplication and getting out of sync.

RM: People won't look in the Tutorial if they aren't brand new, and they won't find the content they need.

DB: We have two sets of users - brand new, and more experienced looking for specific info or Ember CLI stuff.

MKN: What if we just had all of the Getting Started stuff in its own section, and then the tutorial picks up where it left off?
  That would DRY things up and make it easy to find stuff.

RM: That works.

---


RM: I wish we had separators like Trek proposed.

MKN: After we release the tutorial, we can explore that more. Somebody should just open a PR so we have something concrete to talk about.

DB: Also after we release the redesign.
