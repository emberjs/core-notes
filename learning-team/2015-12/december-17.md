Attending:

* David Baker
* Lead Silber
* Michael Kaiser-Nyman
* Ricardo Mendes
* Ryan Tablada
* Todd Jordan

---

DB: I accidentally pushed to master.

RT: Can't we make a protected branch?

DB: We don't have access.

MKN: Ask Leah.

---

MKN: Should we move troubleshooting for Windows devs into Troubleshooting.md?

DB: Sounds good.

---

DB: Someone wants to help translate into other languages. Maybe we could do it on the major releases?

MKN: We would need to figure out infrastructure. They should open an issue with a suggestion for the infrastructure.

DB: Do we have Google Analytics so we can see where our visitors are?

MKN: Ask Leah.

---

MKN: There are the tutorial issues. Ryan and Todd, you have two of them. Can you finish by the end of the month for the next release?

TJ: Yup.

RT: Yup.

MKN: I'll follow up with mattw59 about his page.

---

MKN: No word on hash helper and contextual components. I will ping Slack channel.

---

DB: Should we update the tutorial for Ember CLI beta?

MKN: I just saw an issue where somebody tried to use the beta but there was a problem with Ember Data. Let's hold off until a release.

---

DB: Someone opened a PR to make the menu collapse on the phones.

RT: It uses 3 up, which takes a lot of room. I'd suggest 2 down.

DB: Comment on the PR.

---

MKN: Ryan opened this issue about not use "e.g.". How much do we try to enforce a consistent style guide? Right now our style guide is pretty general. There is a trade-off between consistency and making it easy to contribute.

RT: We should probably clean up before we try to enforce.

LS: Why is "e.g." bad?

RT: It's not friendly to some people, e.g. non-native English speakers.

LS: I'm not sure that "e.g." is actually really bad. People come from a lot of different backgrounds and speaking styles.

DB: Since we have more people contributing regularly, maybe we want to have more strict guidelines for regular contributors.

MKN: Having a style guide is a bit of a rabbit hole. If we're going to do so, we should probably use an established style guide, e.g. MLA.

LS: Maybe say if you're unsure, defer to the style guide, so that it's only used when necessary.

MKN: We don't need to decide on this now. It's a big thing, so let's think it over and discuss more. Also we should ask Trek, since he has a lot of experience.

---

DB: We should document how the team works, e.g. how deploys work.

MKN: Good idea. We should also include release cycle and if you need permission who to talk to (push access). Let's put it in the readme.

TJ: We should add to readme about build checks, e.g. spellchecking.

---

DB: We should prioritize exposing latest guides without version.

MKN: Good idea.

---

LS: I need help with some deprecation PRs, e.g. https://github.com/emberjs/website/pull/2428

MKN: That's Todd's.

TJ: I am working on all the remaining deprecations release by release. I will poke Robert to review.

LS: There are 17 deprecations left.

TJ: Some are done but not checked. I can't check them.

LS: Just tell me what to check.

TJ: Let's sync up after the call.

---

LS: Some of the issues on the website repo are actually Guides issues, e.g. https://github.com/emberjs/website/issues/2359.

RM: I can't close them but I have commented on many of them.

MKN: The ones about search aren't fixable. I'll comment and you can close.

MKN: Do you want to give docs team members write access so we can close?

LS: Sure. Done.

---

LS: I had a promising call and have another tomorrow with the designer who wants to help with the homepage. They will also revisit some of the leftover stuff from the Guides, like the footer.

---

RM: We have homu now. It will do cool things, e.g. test before merging and automatically squash commits.

DB: Can you document that?

---

DB: We worked on the API app some last night. Things are working better. There are some problems, e.g. no tests, so we need people to try it out. The documentation is mostly right now.

RM: We need to figure out how to get it deployed with multiple versions. The readme only says how to point it at the version you want. Only Trek and Rob know how to use it with multiple versions.

MKN: Can you open an issue and ping Trek and Rob to see how to do this/what needs to be done?

---

MKN: No call next week or the after.
