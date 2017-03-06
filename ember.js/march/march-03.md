# Ember Core Team 2017-03-03

### Agenda

- Component Definition RFC (GC, YK)
  - [WIP] https://gist.github.com/chancancode/f2c060ee61cb4e3dfe05af6a7561be71 
- Router Service (RJ)

### Attendees

YK, GC, TD, KS, DG, CH, RJ, MM, MB, RM, EB

### Minutes

#### Router Service

RJ: scalvert has been working on the router service. There is an open PR to implement the next major milestone (`urlFor`). There are a bunch of hairy things in general going on, so I have some questions for the group.

RJ: I was surprised that controllers are always eagerly generated because of URL generation, which was really surprising to me. I thought the problem was isolated to `{{link-to}}`, but it seems like there are other cases.

YK: It sounds like you're saying are there a few different cases that cause eager reification that you're addressing.

RJ: Right, I just thought there was a single thing triggering a performance cliff, so my mental model was wrong.

RJ: So my next question is something not discussed in the router service RFC. Right now to generate a URL we have to look up all of the routes, their parent routes, etc. That shouldn't be surprising to anyone.

YK: It sounds like you're leading us towards the "separate URL serialization out from `Route`" discussion that we have discussed in the past.

RJ: Currently we go and grab the route (Kris, even in engines we do this work still—once an engine is laoded anyway). I would like to lump the `serializeQueryParam` in with the main `serialize` method. Query param serialization is very odd right now. All query params serialization happens in Ember while all other serialization happens in router.js.

TD: Are you suggesting moving QP serialization to router.js or moving all other serialization to Ember?

RJ: Right now we have to do a bunch of normalization of QPs before passing them into router.js. Whereas router.js invokes `serialize` on the handler for the path part of the URL.

YK: Are there any changes needed that might affect public API?

RJ: A few things [ed: I missed this]

RJ: `urlFor` generation in the Router RFC doesn't specify whether query params should be serialized in these methods.

RJ: Separately, do we ever see a time where we don't have to look up the `Route` object to do serialization like this?

YK: I think that is definitely true if we can move URL serialization out of the route, as we have discussed earlier related to how to support large apps with many lazy engines.

(discussion)

DG: At a very high level I want to advocate for a declarative route map that can be used to generate routes and such without Ember objects etc.

YK: I think that is the static quo. We should not add more dynamism to the route map.

DG: yes if we can keep the map declarative and pure then we can avoid slipping into entanglement.

YK: And unfortunately the router map precompile step wasn't on the right path.

#### Component Definition RFC

GC: This is a WIP but I hope to wrap it up soon.

YK: Constraint #1: you should never be required to re-enumerate all components just to specify what manager you want to use. It isn't good enough to say you only want to enumerate the glimmer ones, or only the ember ones.

YK: Constraint 2: The information about which component manager you wnt to use should be require dynamically requiring the component file

YK: Constraint 3: all this needs to work with bare template components

YK: I don't think in glimmer components JavaScript only component are a thing. In ember the JS-only would be needed for the root element, in Glimmer Components I cannot think of an instance where you want that.

YK: In glimmer components there is no way to have anything in the DOM at all without a template. You can't have a div with out a template. This is not a crucial part of the point, but it is part of it.

YK: I think what this means is that in the low leve of the system we need to have som emeta data that is.. I will start on the tempalte meta.  There it tells you which component you want to use. You can see if the tempalte meta has the component manager it knows which to call.

TD: Uncontroversial.

KS: agreed.

YK: So how to we get it in there? Extensions?

YK: First a very simple thing we can do: If all we say it needs to be in the template somewhere, the compile function need to be able to have it.

YK: Two ideas: Have a thing, a magic comment etc that says "engine: glimmer". Racket does something like this. Another solution is an extension. .glimmer.hbs or something. There is a reason I like that personally- we need to do syntax highlighting by file name. We don't want to break the hbs. The syntax is handlebars, the semantics are glimmer.

RJ: I think there is a titlebar thing in a new way, it makes the file name long.

YK: I think Rails has this, html.erb is not causing mega issues.

RJ: But it is short. We don't use .handlebars, but we used to.

YK: You can shorten it. I think the idea you need to use a whole JS file is worse though. And I think the pragma style (magic comment) is bad b/c it could cause more collisions in the future.

TD: Over time there will only be glimmer components. In two years you will have glimmer.hbs everywhere.

YK: In the future, if glimmer is always used, we could do a switcheroo in the future.

TD: We could use the src/ directory to flag glimmer components by default

(discussion, negative vibes)

YK: You can imagine a .react where someone makes integration with react better. the point of the component manager is that people could change the semantics.

(discussion of a .turbo, yuck)

(discussion of pragma, e.g. `{{! engine: glimmer}}`

(discussion of using module unification)
