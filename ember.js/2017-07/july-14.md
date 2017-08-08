# Meeting: Ember Core Team 2017/07/14

### Agenda

- https://github.com/emberjs/ember.js/pull/15125 (RM)
- https://github.com/emberjs/ember.js/pull/15119#issuecomment-294360861 (RM)
- named blocks RFC home stretch https://github.com/emberjs/rfcs/pull/226 (AM)
- deprecate Ember.String
  - native extensions
  - all methods except isHTMLSafe, htmlSafe

### Attendees

AM, CH, DG, EF, GC, KG, TD, MB, RM

### Minutes

#### Remove ember-metal/map https://github.com/emberjs/ember.js/pull/15119#issuecomment-294360861 (RM)

MB: I talked to Serabe about this. I will note that he needs to create an addon before we can deprecate this.

#### https://github.com/emberjs/ember.js/pull/15125 (RM)

RM: there was a goal to remove jquery.

Adds a dependency of https://github.com/topaxi/ember-jquery

CH: At LinkedIn we’re using the native event dispatcher and you null out the import from jquery. but they’re also working on decoupling jquery-ajax from ember data.

TD: It sounds like all that is required before we can remove jquery.

CH: for `this.$()` we’re using linting tools to help prevent access.

KS: Many people use this.$() 

(discussion)

TD: I think we should add Rob’s event dispatcher stuff to Ember

EF: I think I’m ok with saying this is not exactly what we want. It doesn’t solve our problem until Ember doesn’t require jQuery itself.

#### named blocks RFC home stretch

AM: I got closer to the finish line on this with YK. It seems pretty finalized besides a few syntax considerations. I’m saying that it is officially ready to take a look. I and YK are thumbs up. It unifies a lot of APIs, so I think you might be surprised by how ambitious it is.

EF: I think you’re talking FCP?

(discussion)

#### deprecate Ember.String

RM: PR that intends to fix camelize

- Formatting methods should be extracted into an addon
- The addon should not put methods on the prototype
- Deprecate the string prototype extensions
- Move the isHtmlSafe and htmlSafe export to the @ember/component module (and out of @ember/string)
- Remove `@ember/string` entirely
