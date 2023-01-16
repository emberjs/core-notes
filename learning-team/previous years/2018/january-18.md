# Ember learning team 2018-01-18

## Agenda

- status of conversion of guides to Ember app
- Statusboard conversion
- Deprecations app
- Adding questions section to the Newsletter
- Promoting the newsletter

## To do

- [ ] needs some native English speaker / grammar enthusiast for review on the testing Guides update (new Ember QUnit API):  https://github.com/emberjs/guides/pull/2145
- [ ] update the super-rentals tutorial regarding new Ember QUnit API

##  Attendees

- Chris Manson
- Jen Weber
- Ricardo Mendes
- Serena
- Jessica Jordan
- Jared

## Notes

- We’re using prember and fastboot to prerender guides content, so you don’t have to use fastboot in production
- Links are funky in production. Fastboot outputs the md files inside name-of-md-folder/index.md ;_; Chris & Jen will have a breakout
- Can we use fs functions in CI? Yes
- We have moved header and footer back into plain html
- We need to convert statusboard to an Ember App. It’s already a glimmer app. Serena can do this after the deprecations app.
- Deprecations app - should Serena pull out compiled CSS or all CSS?
- Can/should we make header/footer an ember addon?
- What do we do about anchorable TOC in these apps?
  - CM: We’re planning to pre-render the deprecations app and then using the “hash” part of the link should “just work” for scrolling
  - I think guides app will be a bit more complicated  😣
- Is there a styleguide thing? Yes, Mel is making this
- Can we start using the headers/footers from the Ember styleguide yet? Jen will ask Mel
- RM: It would be cool to have reader questions in the newsletter as well
- JJ: I can setup a google form for collecting questions
- JW: Need to be careful of not making newsletter too long
- What are newsletter goals? RM: People don’t have to ask about what’s going on and the future of Ember. It’s the link between community and core efforts. CM: already considered successful, good open rate etc.
- JJ: chance to give more context like Yehuda was giving. Hard to know the context just by reading through work. RM: The more we do the newsletter, the more we know about what’s going on. Helps our bus factor.
- Can we ask YK/TD to talk about the newsletter at EmberConf? RM: mayyyybe.
- Can we tweet about the newsletter? Ricardo will ask Core.
- Where is it on our website? Open PR for the community page
- JJ: need one more person to look over wording in testing PR. Maybe also need to update Super Rentals
