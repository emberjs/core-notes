# Ember Core Team 2016-09-30

### Agenda

(please note (private) or (public))

- (public) Action items for pushing Module Alchemist forward (TD)
- (public) [Ember Inspector Video](https://www.youtube.com/watch?v=6Yl1j2thKac) feedback (LS)
- (public) Nesting Guides and/or API under Learn in website nav (LS)
- (public) ES6 Module API/RFC (TD)
- (public) ember-core package name (DG)
- (public) restart module unification FCP? (DG)
- (public) TC39 Update from the Gentleman from Portland

### Attendees

LS, YK, GC, EB, KS, RJ, EF, TD, MM, DG

### Minutes

#### Module Alchemist

TD: RFC for standardizing on layout and module format/builds. Are there open concerns on the core team or can I start moving this to FCP? [https://github.com/emberjs/rfcs/pull/155](https://github.com/emberjs/rfcs/pull/155)

RJ: I would like the RFC to specifically note that `dist/` does not get checked in.

#### Ember Inspector Video

LS: Feedback on Gavin's new video? [https://www.youtube.com/watch?v=6Yl1j2thKac](https://www.youtube.com/watch?v=6Yl1j2thKac). We want to start adding these videos to the website.

Everyone: Looks good.

#### Unifying Guides and API Links

LS: Learning team wanted to merge API and Guides link into a single "Learn" link, with API and Guides as sub-items. There was concern that people looking for the API specifically would be confused because it's somewhat unique terminology, and also that API is just very commonly what people are looking for. So the compromise position is that we'll nest Guides under Learn, so we have that main Learn directory page with resources and things, and while API will be one of the things that page directs to, API will still *also* maintain it's top level link in the nav bar. Thumbs up all around.

#### ES6 Module Public API

TD: I signed up for writing the RFC for what the module API is going forward (named exports, default exports, package names, etc.) Two proposals that people were against when we discussed informally at the F2F were:

``` js
import { Component, computed, get, set } from "ember";
```
and:

``` js
import get from "ember-get";
import set from "ember-set";
import computed from "ember-computed";
import Component from "ember-component";
```
