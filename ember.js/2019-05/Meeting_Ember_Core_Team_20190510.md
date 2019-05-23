# Meeting: Ember Core Team 2019/05/10

## Agenda

- (**2 min**) Global Accessibility Awareness Day - May 16th (MS)
- (**10 min**) Update: better modal support (MS)
    - why modals/dialogs are hard [https://github.com/MelSumner/ember-a11y-roadmap/blob/master/rfc-research/dialogs/modals.md](https://github.com/MelSumner/ember-a11y-roadmap/blob/master/rfc-research/dialogs/modals.md)
    - an addon to address it: [https://github.com/MelSumner/e-a11y-modal](https://github.com/MelSumner/e-a11y-modal). 
- RFCs
    - → FCP
    - FCP → Merge
        - [Co-Located Templates RFC](https://github.com/emberjs/rfcs/pull/481) 
    - → FCP to Close
    - FCP to Close → Close
    - Promote

## Attendees

- [x] Yehuda Katz
- [ ] Tom Dale
- [x] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [x] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Dan Gebhardt
- [x] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [x] Jen Weber
- [ ] Chris Garrett

## Action Items

- [ ] Write an accessibility blog post for Monday @Melanie S 
- [ ] Share a link to how Rust involved people in improving crates @Yehuda

## Minutes

### Global Accessibility Awareness Day

MS: It’s coming up soon, next Thursday the 16th! Please write a tweet or something to help encourage it.

YK: Can we get a blog post on it?

MS: Yes I can try to ship it by Monday

YK: Would be good to have a video of someone using a screen reader

### Better Modal Support

MS: The work done to implement this used the `inert` polyfill to make it function, but I don’t think that the best solution is to neccesarily create a new “thing”. Instead, could we make one of the major preexisting modal addons (e.g. ember-modal-dialog) better out of the box?

YK: The Rust team did a thing called “lib splits” where the teams involved picked a category and focused on improving that category of crates. That could work well here. The thing that made it work well was that they got a lot of help

MS: This gives me some direction for next steps

YK: I will share a link with how Rust did this.

MS: Is this something we are comfortable with doing? Vetting addons?

RJ: This is on the same track as what Katie has been doing, with rating addons. This is the next step where we could give people feedback on what could be improved and give them PRs. People will come out of the woodwork to help.

YK: The critical thing here is that there are always people looking for ways to help, and these could be great entry points

YK: one of the things is that we have to think carefully about how much we are “putting a stamp of approval on things” and the Rust structure was good at mitigating that concern

RJ: I think that making a modal from first principles is basically “required work” to know what should be done so it’s good that you did that and explained the main constraints. Sharing those findings with the maintainers of existing popular libraries may have a great impact. They likely want to do better.

YK: Is there something beyond the Ember community to do here?

MS: The working group has contacted me because I have a lot of practical experience, so this is a good way to help upgrade the current recommendations.
