# Learn Team Agenda

## Agenda

- Guides-App
  - Images PRs - decision needed
  - Anchorable toc - any advice or references before I jump in
  - MD linter - try to catch specific issues in the Quest issue but generally useful. Happy to be part of CI?
  - Search (owner?)
  - Code example styles (owner?)
  - SEO, thoughts here (David has a volunteer to help with this here or on old guides)
- Guides-app-ja
  - branding issue
- Deprecation-app
  - Move to ember-learn
  - Ancorable toc
  - Timeline ( 9th Feb )
  - Deployment (Cloudfront style “behavious”? ember-cli-deploy index with s3 resources?)
- API App
  - Search https://github.com/ember-learn/ember-api-docs/pull/290/
  - 176 Cleanup
    - Quest: https://github.com/emberjs/ember.js/issues/15723
    - Rouge Items: https://github.com/ember-learn/ember-api-docs/issues/419
    - Mapping discrepancies: https://github.com/ember-learn/ember-api-docs/issues/423
  - API.next
    - ToC epic: https://github.com/ember-learn/ember-api-docs/issues/344
      - Step 1: functions get own page https://github.com/ember-learn/ember-api-docs/issues/424
      - CSS re-evaluation (+ type icons) see typedoc https://github.com/TypeStrong/typedoc-default-themes/blob/master/src/default/assets/images/icons.png
  - Visioneeeeering - outcome from the 2018 impromptu brainstorming in slack

      - Step 2: tree nav
- Organization: Process Proposal (+Process Proposal: learning objectives for core initiatives)
- Website:
  - project use (https://github.com/emberjs/website/projects/2)
  - update for newsletter? (+Website Updates )
  - integrating styles to Guides & API
  - search- next steps
  - current build is failing, need some help
  - new navbar progress
  - “Why Ember” section/progress
- Blog post on api docs app:
  - current draft: +Building the new Ember API docs platform
  - what are our main takeaways from doing things here?
  - any feedback on the draft above?

## Action Items

## Attendees (Initials: Name @slack-id)

> Add yourself below and check attendance off
[ ] TJ: Todd Jordan @todd.jordan
[ ] RM: Richardo Mendes @locks
[ ] DB: David Baker @acorncom
[ ] CM: Chris Manson @real_ate
[ ] MelS: Melanie Sumner @melsumner
[ ] JJ: Jessica Jordan: @jessica
[ ] SF: Serena Fritsch: @serena
[ ] JW: Jen Weber @jenweber

## Minutes

### Guides

#### Images moved to guides source

- CM: I moved the images into the guides source
- DB: this will be good for dash
- CM: If we are ok we can merge that now
- DB: yes!

#### supporting hash (#) anchors

- CM: Not sure best practice around anchors and remembering spots on pages.  Doesn’t seem to be a best practice around this
- RM: Have brought this up to core.  if anyone wants to write this up and pitch to core as an rfc
- CM: There are some addons that do this.
- CM: 2 choices - Release without this or use one the addons and just do it.
- CM: I think I’ll just try a few solutions and move on

#### quest issue

- CM: only 4 big things left
  - achorable ToC
  - Search
  - coded sample styles
  - a few issues around markdown - I could include a markdown linter (group: yes)

#### search

- DB: concern I have with algolia is that there’s an index limit.  If we do guides too I’m afraid we’ll bust it.  I’ve had the blog post stalled for a while but Dave Wasmer may be able to help me.
- DB: with MS’s current impl, there are 2 separate indexes so they will run separate.  To get it out the door I’m fine running separate.  Any objections?

#### code examples

- CM: Not sure how best to proceed.  works with prizm stuff.  Had conversation with Mel in Dec and conclusion was we need a prizm plugin/theme that gives a good style for Ember flavored handlebars (outlet, etc). We are currently using a diff style (add/remove lines).  I don’t think there’s a prizm plugin that supports this.  Not sure I’m the best person to write a plugin for it, but could help.
- MelS: I recommend we create an issue and break down.  WE currently use highlight and coderay (a thing dgeb made to support handlebars).
- RM: We need a syntax highlighting grammar for ember handlebars, for editors too.  Not sure coderay is the best thing to use
- MelS: yeah rather than use it I think we should learn from it.
- RM: do we even highlight outlets
- CM: currently is in legacy guides
- JW: is this even a blocker?
- DB: I don’t think so, though we should do something about diffs.  Looks like diffs are supported if we use a diff syntax definition.
- JW: would we just comment out removed code instead of diffs?
- CM: currently using regex to translate whats currently in guides to new thing and works for file name/ribbon.
- CM: I’d be curious about the diff support if I could convert it in the same way.  Question is how much change do we need in the guides source.
- JW: could use contributors workshop if we had to.
- RM: diffs are only in the tutorial and tutorial is going out of the guides, so don’t worry 😛
- DB: ok, we’ll kick the can down the road.
- JW: lets circle back when guides app is out.
- CM: I can go ahead and do a pr to clean up and make everything ok with the source highlighting, and then we can shake out blockers from there.
- RM: sounds ok.

#### Guides SEO

- DB: Last thought.  got contacted by a guy willing to help with SEO.  We can have him start with the old guides.  I think we’ve explored all options on old system at this point, and he’s willing to do it wherever, so my inclination is to point him at the new guides. Objections?
- <crickets>
- DB: K, new guides it is :-)

#### Guides Japan

- CM: part of Dopin’s problem is that he’s forked the old guides app and is deploying that.  What should we tell him and others.
- RM: I’m worried about the footer.  If he gets that right I’m fine
- DB: are we still doing translations
- RM: No, it just wasn’t sustainable/scalable.
- MelS: its a nightmare (coming from seeing this in a large org)
- RM: We’d need way more person power to make it work
- CM: I propose that we say its a great way for ember contributors to be involved in other countries.  We should encourage others to do it and own it.
- DB: is there a we we can do this and show it in the new app
- CM: yeah we are allowing for folks to fork it and point it at their own source

### Deprecations App

- SF: Met Chris M in a starbucks and got going on it and got pretty far 😃
- SF: we can put it online and proxy people to it from emberjs.  Have the same anchor/toc issue as guides.  everything else could be ready in a few days.
- SF: with the ember app it makes it easier for contributors to add them.  no more middleman 🙌
- CM: one md file per item too!
- DB: can we prerender and just deploy it to emberjs?
- CM: I suppose we could but what does that look like in a CI situation?
- DB: we’ll have to work that out with siva 😛
- CM: could do something like ember deploy lightning, but would SEO be a problem?
- DB: the toc links would be the problem
- TJ: sounds like next steps are finish out the app and get it deployable.  DB reach out to siva?
- DB: yeah I’ll do that.  would be good to move it to the ember-learn
- SF: yes. will add it to my todos.

### Website

- MelS: linked to some notes I had on impromptu brainstorming.  Feel free to add new things please, and I’ll keep working to get things pushed through
- MelS: should mention it in the next embertimes
- RM: do you have a personal blog? we could put a link on embertimes and expand on things there.
- MelS: sure!
- MelS: also the build is failing around nokogiri, that has taken me off some of my other ember stuff until its fixed.
- MelS: got some friends joining me to write docs for why ember! Goal for that is middle of Feburary.

### Blog Post

- DB: included a draft of the new blog post.  Please review and add stuff as necessary.
- JW: do we want to aim to have it out next week.
- DB: Dave was thinking about having it done this or next.

### API Docs

#### Search

- DB Search is in final stages Michael is creating the index for 2.18 and we're looking to merge a pr with client changes for it.
- TJ Will need to do some test around it.  I noticed 2 issues we should address.
  - One was that that when you search for a class you get all of its methods, which combined with the cap on search results limits what you can see. For example, if you search for "Application", you get "ApplicationInstance", and all its methods, but it gets cut off before you see "Application" as a result.
  - Other was search results show private methods, but when you click on them they do not show up.

#### 176 Cleanup

- TJ There's a quest issue to convert links in API documentation to use the new "release" URL. A couple of developers have volunteered to contribute
- TJ I've also created a couple of other issues to deal with remaining 176 issues (links in agenda)

#### Next Steps

- TJ Once issues with 176/search taken care of, next step is moving towards an update in the look of the api docs.  There's an existing issue (link in agenda) around updating the ToC to be collapsible from package, and show class/function.  First step in that is to show functions on individual pages. At the same time we need to do some stylistic updates, such as add icon decorators to indicate methods/functions.  See example from typedoc...

![](https://d2mxuefqeaa7sj.cloudfront.net/s_DE260B563DE35EE1D7D82FC815A6380572A661A4AEC8673B2FC8E73A3683F396_1515688341231_image.png)

