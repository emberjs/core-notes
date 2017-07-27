# ember-cli Meeting Notes - 2017-06-22

## Attendees

- ka Krati Ahuja @kratiahuja
- rj Robert Jackson @rwjblue
- tb Tobias Bieniek @turbo87
- ks Kelly Selden @kellyselden
- mc Miguel Camba @cibernox
- bc Brian Cardarella @bcardarella
- an Alex Navasardyan @twokul
- dh David Hamilton @hjdivad
- sp Stefan Penner @stefanpenner


## Agenda

- ember-cli-7207 (default lang attr in html to en)
- ember-cli-7137 (add link to tests on welcome page)
- ember-cli-6661 (ember search)
- ember-cli-6451 (rootURL null)
- ember-cli/rc 109 (environment selection)
- ember-cli-7245 (custom transform with app.import)
- native symbol
- fastboot-457
- dependency graph analysis


## Discussion Notes

### ember-cli-7207 (default lag attr in html to en)

rj: seems bad to default to en

tb: i agree

bc: i agree

rj: eventually we may have to bite the bullet and make it handlebars

bc: ember-cli-head doesn't inject inside html tag

mc: if fastboot solves this problem  we're good

dh: if anything we shouldn't use the most common one to force ourselves to test the "custom lang" scenario


### ember-cli 7137 (add link to tests on welcome page)

rj: stef wants this to work IIRC; we should table this until he's here; the problem has to do with the test environment

### ember-cli-6661 (ember search)

tb: what should we do for next step?

rj: it should be enabled; we need an rfc for global addons

tb: someone should express this view on the issue; we are silent which is not good

### ember-cli 6451 (rootURL null)

tb: `rootURL = null` eg for electron apps, tests won't work unless you set them to `/`

rj: can't you use empty string?

tb: the default is annoying because it doesn't tell you that it should be `'/'`

rj: we could detect this bad situation and warn

### rfc 109 (environment selection)

rj: tl;dr is that non-interactive will be production, interactive development and test commands test.  `EMBER_ENV`, `NODE_ENV` work.

ks: what's the motivation?

rj: feedback from speedometer team and others that the default being dev trolls people.

bc: so we're optimising for a benchmark suite?

rj: people apparently troll themselves.  They ran a bigtable query against the web archive and found a bunch of sites that were using dev builds instead of prod builds.

bc: is this a public API change?

rj: it is unspecified

bc: what about changing this based on an ember-cli file that we get from `ember init`

rj: the rfc is the right default

bc: i agree

rj: in other areas we've required a flag

tb: i like the plan of having the flag in the ember-cli file

dh: the default environment is dev per `--help`.  It's a pity that the version numbers for the CLI are mixed up with the version for the runtime

mc: a warning is enough

ks: doesn't solve the problem for existing apps

bc: did google give any insight about the versions of the apps that are running in development.  For example, how many are running since before even ember-cli

rj: unknown


### ember-cli 7245 (custom transform with app.import)

rj: seems good i just have two outstanding questions: should we put new api behind experiments and also api docs

ka: i don't think it needs to be behind experiemnts; it's just extending the existing API

rj: we could put the addon hook invocation behind a flag.  Does anybody feel strongly?  I don't

dh: previously when we were using experiments the API was larger and we were uncertain about the end result API


### native symbol

rj: should we start using actual symbols to prevent monkeypatching?

tb: in general I'm not a fan, but there's an exception for the `index.js` file of an addon for eg `this.options`.  The problem is there is no real private right now

rj: Symbols will do it.  So your point is you're :+1: in areas where we merge with userland?

tb: yes


### fastboot-457 (expose body & method in fastboot service)

*(generally people are +1)*

ka: what's the point of body if the method is `GET`?

bc: it will be null

ka: okay so we should update the documentation so it's clear to the users

bc: tom had mentioned there may be security concerns; i'm not sure what those are but if there are any we can make it opt-in

rj: the security concern would have to be using the same middleware in prod.  We absolutely do not support using ember-cli in prod


### Dep graph analysis

bc: is there something on a roadmap for getting a pre-transpiled dep graph for static analysis?

rj: we will need to do the work for this to even be able to do module level tree-shaking.  I was pairing with @twokul this morning on moving the concat into a separate class that will have an API that's responsible for the dep graph stuff

bc: will app owners have a hook to get access to that graph pre-transpilation?

rj: right now the graph is determined post-transpile, not pre-transpile because that's what we need for the tree-shaking.  we want to get tree-shaking badly, and we need to make sure engines is not the way to get lazy loading; they're just for isolation.  we will need eventually to have access to the raw files anyway in order to do just in time per-target bundling (eg for code that doesn't need to be transpiled)

bc: what i want is to generate a template dynamically that depends on eg modules it finds within the graph.  Think `{{#form-for}}`

rj: it depends on who will provide the items.

### rfc 108

ka: can we merge this?

rj: looks good, only question is whether we need to add options; i don't think we do as we've said in the past rfcs are non-normative

sp: cross-posting is fine



