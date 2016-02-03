# FastBoot Meeting Notes 2016-02-03

## Attendees

Robert Jackson, Ron White, Ruslan Zavacky, Terence Lee, Tom Dale, Miguel
Camba

## Agenda

- Introductions
  - Who are you, how are you using FastBoot, how would you like to
    contribute?
  - Minute notes will be public
- [Road to 1.0](https://github.com/tildeio/ember-cli-fastboot/issues/98)
  - People should claim work in that thread
  - EmberConf plans
- Meta tags / Open Graph / Twitter cards
- Use default value for `configInMeta` (rwjblue)
- Deployment & revision keys (rwjblue)
- Expose HTTP as `FastBoot.request`
  - Low-level primitive
  - `ember-cookies` - universal addon for accessing cookies
    - Needs champion

## Minutes

- Robert Jackson, random things on the internet, works at Twitch.
  Questions about caching etc. at scale. Specific pet peeves and bones
  to pick.
- Ron White, engineering manager at Ibotta, love to have website use
  FastBoot. Using prerender.io but would love to use FastBoot instead.
Wrote an ember-addon that does meta tags for FB, Twitter.
- Ruslan Zavacky - Frontend Software Engineer @ Kayako. Doing pet
  project - Vetoza. I want Google to be able to index it. I use
prerender now but it's not great.
- Terence Lee, Heroku, want a great experience for FastBoot users

RW: Got an existing addon that exposes a `head` service. Trying to get
this to work in FastBoot.

(discussion about how to render component in FastBoot page's `<head>`)

RJ: Long-term, I hope support for `<head>` stuff should be baked into
the FastBoot addon.

RJ: Last week, "my friend" made some changes and deployed to QA. QA
approved deploy, we promoted it to prod, and by the nature of npm, my
builds were broken and the thing that was approved does not match the
asset output at all. And I broke production. :'(

RJ: `storeConfigInMeta` is set to false by FastBoot addon, because we
don't want to take the meta tag out of the `index.html` compiled to
disk. That causes the config to be written into the app.js file. That
means that promoting one asset from one environment to another means you
have to recompile, and there's no guarantee that you are getting a
similar build.

RJ: My plan is change Ember CLI to generate the config as a JSON file.
The `<meta>` config should be generated from the JSON; the opposite of
current solutions that actually reverse engineer JSON by parsing the
`<meta>` tag. It's useful for way more stuff than just FastBoot.

RJ: This should be useful for Heroku as well.

MG: Maybe it's useful to have a crawler that hits various pages of your
Ember app to verify they all work without failing in FastBoot.

TD: I think we should just rely on automated tests, especially those
generated automatically for each route.

MC: `ember-cli-fastboot` should hook in to generators and add a
FastBoot-specific test.

RZ: I've been testing stripping script tags from FastBoot pages, for
people who are targeting just SEO/Googlebot. All the JavaScript does is
increase load time. I will work on an option to disable script tags for
that case.

### Action Items

- [ ] Ron is going to update the `ember-cli-head` to try to
  render-a-component approach.
- [ ] Robert is going to work on ember-cli internals to make generating
  the config to JSON as the primitive instead of generating index.html.
- [ ] Miguel is collecting pain points for dual testing addons in both
  FastBoot and the browser
- [ ] Tom will expose `FastBoot.request`
- [ ] Ruslan will submit a PR for disabling `<script>` tags that point
  at the JavaScript payload for the SEO case
