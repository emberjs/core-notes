Attending:

* David Baker
* Michael Kaiser-Nyman
* Ricardo Mendes

---

MKN: Lots of new people contributing. HTML Proofer is awesome. Thanks locks for guiding @grapho.

---

LK: I will have a PR for tutorial today.

DB: I'll look over PR. Also people at Denver meetup would love to help.

MKN: Help Wanted label is where to go.

LK: For some things, we need the core contributors to do 80% so that everybody else knows where to go

MKN: Maybe after first 1/2 of tutorial is done, we could chunk off the rest.

DB: What about the model of contributors writing and editors making print-worthy?

LK: Quality can vary dramatically, we might not be able to merge some people's contributions at all, and coordinating the editing after something has been merged.

MKN: What about just trying this out with a few people from Denver?

LK: That works. Let's bill it as they are writing a rough draft.

---

DB: What about having the first page from `ember new` be more styled and give more info/direction?

LK: Already some people think Ember CLI does too much. Also this is a core decision.

MKN: Maybe have it give a link to the Ember Guides?

LK: And maybe other resources?

DB: Even just styled with image or something.

---

DB: I'm happy to help out with the redesign here and there.

LK: Sounds good. The style will be slightly different from what Thoughtbot delivered - improved contrast, slightly different layout, etc.

DB: Can we have the CSS live in one place, rather than split among Guides, API docs, and website?

LK: There is different infrastructure for everything - YUI, Middleman, etc. Work would need to be done to sync everything up.

---

MKN: I need to open an issue for the old version warning.

LK: saladfork is the one to take that on.

---

LK: DB - another thing people can help out with are deprecations in the API guides.

MKN: See https://github.com/emberjs/website/issues/2256

---

LK: Also this: https://github.com/emberjs/website/issues/1994

MKN: That should be closed.

---

DB: There's no central place to know where to go to help out with things.

MKN + LK: That's true. Things are confusing and split out all over the place.

DB: Maybe we should have a list of where to contribute somewhere?

MKN: DB if you are passionate about trying to organize the mess, you could start by mapping things out and opening an issue just to document what the status quo is.

---

MKN: Change highlighting (https://github.com/emberjs/guides/issues/624) - should we do this?

LK: We don't really have a standard of how code snippets should look - most are always incomplete for brevity.
    Also some continue previous examples. Some use elipses.
    Best would be to point to a repo with the full file.

MKN: Let's standardize on always using elipses except for `import Ember from 'ember'`.

LK: Yes, until Ember CLI 2 is released - then we will always include `import`s.

MKN: I will open a PR on the contributing guidelines, and also an issue to audit all the guides.

DB: What about just code snippets that aren't in files?

MKN: Let's make this standard only apply to things with filenames.

LK: Line numbers make things confusing if it isn't a complete file.

MKN: Let's take the line numbers off.

---

DB: https://github.com/emberjs/data/issues/2905#issuecomment-152032438 points to a problem in the Guides around model metadata.

MKN: I'll ping bmac and wecc on this.
