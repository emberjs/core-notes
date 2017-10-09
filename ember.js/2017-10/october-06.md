# Meeting: Ember Core Team 2017/10/06

## Agenda

- Checklist for Ember 2.16 on the following Monday (RM)
  - API Docs
    - https://ember-api-docs-staging-pr-353.herokuapp.com/api/ember/2.16/modules/@ember%2Fapplication preview
    - Todd working on `ember.js` documentation PR
  - rfc-data
    - https://github.com/ember-cli/ember-rfc176-data/pull/36 `htmlSafe`/`isHTMLSafe`
    - https://github.com/ember-cli/ember-rfc176-data/issues/12 missing public API

## Attendees

CH, YK, IT, MM, RM, TD, MB, GC, RJ

## Minutes

### Self-congratulations

Oh my, that Ember 3.0 announcement went pretty well and the status board was also well received.

### Checklist for Ember 2.16

RM: I’d like to see 2.16 go out on Monday or Tuesday.

RJ: Now that we have put up a blog post with dates we should release on those dates.

YK: Are the API docs matching the new module API?

TD: Will that be ready to do?

RM: I think so. Todd and Jen have been working hard on it. Todd changed to the ember source locally to try out the modules and has the docs updated.

RJ: Will there be a large PR to Ember for the final release?

RM: yeah changing the ember module to @module

RJ: So we should not change anything b/c that will be hard to merge?

RM: I think he has a branch, but there is no PR. We could generate the API docs without merging anything to Ember.

RJ: To do the things I’m looking at on heroku staging, I presume that would be a large PR to Ember itself to make it do this.

YK: What is on staging is not even the thing?

RM: On staging is a customized build of the API docs.

YK: If you click on any of the packages there is still a lot of `Ember.blah`. That staging sites seems to have nothing to do with the new API.

TD: I suggested to Todd to use the JSON data as we have today to generate the mapping.

RM: That might be how he is doing it, I haven’t been following.

YK: Maybe I don’t understand how this works, maybe these are default exports. But all the docs still say Ember.everything

RJ: I’m not terribly worried about the PR to update this. But it will be vaguely difficult to coordinate. It is fine if we deploy the thing to to docs site without it being merged into Ember master. We don’t want it to diverge long-term of course.

RJ: The problem is YUIDoc has no affordances for modules. It has a thing called “modules” but it has nothing to do with ES modules. I expect this will be a long iteration process.

RM: Not all our public API is in the new system, so it generates a lot of garbage on the output.

(discussion)

RJ: Some things in https://github.com/ember-cli/ember-rfc176-data/issues/12 were not in the list of new modules. Some were just caught by looking at the exports on Ember. Some are just interfaces, not APIs.

TD: I thought we added some of these.

RJ: It is possible some have not been updated. For example Ember.testing is a thing we are still wishywashy on. We agrees to setTesting/getTesting but I was cautious about it being adding public API. Another is Ember.version. The other is Ember.onError. We need a way to do get/set on error.

YK: GC noted to me that service and controller export a named export `inject` means you need to rename them.

RJ: we recently did some work on this. We revamped the mappings JSON object to handle more cases. We will try to add a “suggested” import name.

YK: why not call it service?

RJ: It is not a service.

KS: I think it is a helpful eslint rule I think to warn on shadowed variables. I think using verbs decreases the likelyhood of a collision.

YK: we’re basically always renaming this thing. I think that illustrates something is not right about the name we chose.

KS: It is not that bad. I just don’t like it when imports are named things I would name a variable.

YK: I’m saying I don’t have a very strong opinion but that fact that we’re renaming automatically in a short amount of time isn’t the best.

(discussion)

RJ: We’re adding all this API, and we’re going to find problems. No matter what we do we won’t find the best decisions in discussion. I agree that inject.. I call it injectService b/c I find it clearer.

YK: I have no disagreement that we shipped.

TD: I think there is no action item here. At some point we will want a decorator API for these things, and lets remember this discussion at that time to do better.

YK: I think we could collect feedback on the module imports. I want us to tell users that there might be rough edges and they should bring them up.

RJ: About the 2.16: I was going to try and release Ember itself on Sunday. Then we can release the blog post on Monday after CLI has 24 hours to release.

RM: FYI I opened https://discuss.emberjs.com/t/q-a-rfc-176-javascript-modules-api/13664/2 for discussion about the modules API. ED was released and bmac updated the blog post. We don’t have anything on the ember blog post. It will be tricky b/c of the modules. We are thinking about adding a section to the guide. Perhaps in the primer which is going to get released this weekend. For Ember-CLI tobias listed links to blog posts and bug fixes. I said I would fill them out. So that is where we are at. We are mostly good on modules, so I think we are in a good place to ship on Monday.

TD: I am close to being done with a blog post on Glimmer stuff. It explains capital components and trys to roll up that discussion, but also talk about all the stuff we’ve done on Glimmer since the release.

RJ: I’m thinking we could do it Wednesday…

(discussion)

MB: Maybe on Tuesday so people at EmberFest can update their talked etc.

RM: also perhaps we should release a new blueprint for glimmer.

(discussion re: glimmer apps and blueprints)
