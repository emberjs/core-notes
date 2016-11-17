# ember-cli Meeting Notes - 2016-11-10

## Attendees

- Nathan Hammond
- Kelly Selden
- Robert Jackson
- Katie Gengler
- Jake Bixby
- Tobias Bieniek
- Miguel Madero
- Dave Laird
- Chad Hietala

## Actions

- [ ] Nathan - Draft a blog post regarding Yarn.
- [ ] All - Prepare for next meeting:

    - https://github.com/ember-cli/ember-cli/issues/6350
    - https://github.com/ember-cli/rfcs/pull/75
    - https://github.com/ember-cli/ember-cli/pull/6395
    - https://github.com/ember-cli/rfcs/pull/77

## Discussion Notes

### Yarn

- Ember CLI intends to adopt Yarn as our primary package bundling tool.
- Known blockers for shipping our adoption of Yarn:
    - Private repositories.
    - [Node.js LTS RFC.](https://github.com/yarnpkg/rfcs/pull/1)
    - January 1, and the drop of support for Node.js 0.12, which Yarn will never support.
- As a caveat `npm` has [no detailed Node.js LTS policy](https://github.com/npm/npm/wiki/LTS), but based upon previous behavior it was assumed that it would extend far into the future. [That has proven to be inaccurate.](https://github.com/npm/npm/pull/14503)
- We should feel free to begin experimentation with adoption of Yarn.
 
### [RFC #50 Production Code Stripping](https://github.com/ember-cli/rfcs/pull/50)

- Intentionally skip the idea of feature flags.
- Needs to ensure that plugin works in Babel 5 and Babel 6.
- Handles destructuring and reassignment.

### ember-cli-css

- Working to extract default CSS behavior from Ember CLI and move it into an addon.
- Once proven as a concept will open an RFC.
- Things to watch out for:
    - Account for `baseURL`/`rootURL` with `content-for`.
    - Watch out for external token replacing.

### ember-cli-template-lint

- Default inclusion? Should be controlled in part/whole by CLI people.
- Adoption by Ember CLI? Not yet. If included by default, yes.
- Move to RFC for discussion after Ben Demboski's hinting API change.