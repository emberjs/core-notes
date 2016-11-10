# 2016-11-03 Agenda

Previously

- [ ] 

Topics

- Bringing on new contributors
  - There are several people that want to help and tons of work to go around.  What are ways we can provide clear paths for them?
- Making the tutorial friendly to new beginners - Widen our audience
  - https://github.com/emberjs/guides/issues/1708
  - Some ideas thrown around
    - Revamp solely for new beginners
    - 2 Tutorials (beginner, SPA developer)
    - Multi-Track, Layered
    - Improve/clarify existing text (see checklist in issue)
- javascript module api RFC + API Doc Emberization
  - RFC: https://github.com/tomdale/rfcs/blob/js-modules/text/0000-javascript-module-api.md#api-documentation
  - Notes: https://usecanvas.com/ember-docs/rfc-javascript-module-api/7LDXYx8qz3I0jPXCgk80Dd
  - api ember repo: https://github.com/ember-learn/ember-api-docs
  - Agreed upon API behavior back in March (private, etc): https://github.com/emberjs/website/issues/2452
  - feature toggling behavior: https://github.com/emberjs/ember.js/issues/13101
- Using a non-mirage backend in the tutorial
  - https://github.com/emberjs/guides/issues/1695
- TDD in the tutorial
  - https://github.com/emberjs/guides/issues/1718
- Using Tilde online education videos

# Action Items 

- [ ] 

# Minutes

## Attendees

- TJ: Todd Jordan @toddjordan
- DB: David Baker @acorncom
- RM: Ricardo Mendes @locks
- LS: Leah Silber @wifelette

## Notes

---

### New Contributors

RM: Lets maintain a list of people and interests.   We can keep this page to make sure contributors have direction and work to do.

TJ: Would be good to get people that express interest, have conversations with them on interests, and make sure they are fed work.

DB: May need to have responsible learn members to contributors to make sure people are getting attention.

### API Doc

RM: API work is becoming one of our most urgent needs.  Especially with [RFC 176](https://github.com/tomdale/rfcs/blob/a1c1b2db26fc10de71f0c6fffbe11667764c4cff/text/0000-javascript-module-api.md) coming down the pipe.

TJ: I know guarav has started to help some, and I can make that more of a priority for myself now. 

### Tutorial

TJ: The core issue around the current set of issues is that the tutorial doesn't address developers that are newer to front end development and SPAs.

DB: What keeps us from using the single tutorial with updates to satisfy most of the issues?

TJ: Well there are a set of issues identified with 1708, that we can address immediately that would start to address some confusion, but there are some more structural issues now tracked by 1695 (mirage vs hosting) and 1718 (TDD).  

DB: For the mirage yes we would like to host, but the blocker right now is money.  

TJ: Yes I can certainly move introducing mirage to later in the tutorial, so that its more seperated from the introduction to ember-data.

DB: its worth articulating among ourselves who our audience is, what we expect them to know, and articulate that in our guides.

TJ: One option is to just start from scratch with a beginner-focused tutorial, while keeping/improving the current, tailored to more experienced web developers.  Seems that the 2 personas want the tutorial structured in different ways.  

A new beginner would want a tutorial structured inside-out, meaning very basic building blocks first, and then layering concepts on top.  For example introducing simple components early, and then routes late.  This would resonate for web developers that might be somewhat familiar with React, but not experienced enough to have worked with the concepts around routing.

An experienced developer might want to see a an example that is more outside in.  The example would show based on some application requirements, how someone would leverage the ember framework and common parts of its ecosystem to develop a professional app.

DB: Another option is that we could combine both methodologies into one example.  We could start the tutorial as a beginner tutorial, and then later provide a part of the new app done for more experienced users.  Advanced users can skip ahead.

RM: There are some upcoming changes to ember which will cause us to change the way we do the tutorial.  We would need some control over how a new beginner-centric tutorial is structured, so that we can make sure it aligns with it.

TJ:  We should use the RFC process for the new tutorial.  That way we can get all interested parties and stakeholder input.

RM: I can work on this.
