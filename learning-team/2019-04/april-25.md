
## Agenda

- Choose a facilitator for next week
- Review last week’s action items (facilitator copy them over here)
- Review Airtable tasks (skipped this week)
- How is our PR queue doing? How many older than a week? Tracking sheet
- Review new RFCs/RFC Tracking
- JW: component guides topic naming w/Chris G
- CM: move to merge https://github.com/ember-learn/ember-styleguide/pull/152
- Global Accessibility Awareness Day - Ember event?

## Action Items

- [ ] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions) @Chris M
- [ ] Anyone with long running branches should add WIP to the title to remove from the script
- [ ] Figure out how to do a “code owner pairing session” for PR reviews @Jennifer W
- [ ] Review the Colocation Components RFC: https://github.com/emberjs/rfcs/pull/481 @Jessica J @Jennifer W
- [ ] Create an issue on the guides-source to “propose” the new layout of the components section @Chris G
- [ ] Get #152 merged but in the releases section @Jennifer W
- [ ] Follow up with @Melanie S about the yearly split on Airtable @Chris M
- [ ] Follow up with Mel about the yearly split on Airtable @Chris M
- [ ] Put together a plan for video content production. CM has started talking to people like Gavin for help in the future. He has done a lot of great videos and is very motivated to help.   - @Melanie S will take this to the marketing team
- [ ] CM JJ: Chat about “submit your own whitepaper” style of project showcase data - Question based. @Chris M
- [ ] Core team members - sign up for “Product Champions” in Airtable. Goal of 2 people per project. Where we don’t have that, we discuss how to change it

## Minutes

Attendees (Initials: Name @Discord)

- [x] DB: David Baker (acorncom)
- [x] JJ: Jessica Jordan (jessica)
- [x] AL: Amy Lam (amyrlam)
- [x] CM: Chris Manson (Chris Manson)
- [x] RM: Ricardo Mendes (locks)
- [x] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber (jenweber)
- [x] KL: Kenneth Larsen (kennethlarsen)
- [x] RW: Robert Wagner (rwwagner90)
- [x] CG: Chris Garrett (pzuraq)
- [x] FS: Frédéric Soumaré

## Notes


- Open prs review
    - FS: should we aim for Zero?
    - JW: we might need something like “on hold” that removes things from the graph for a longer time
    - CM: discuss in Discord about the business logic
    - AL: some of the PRs we don’t know what to do
        - can we have “code owners”
        - MS: this is related to champions (as per Airtable)
    - JW: Each project should have 2 champions: 1) main one that is in charge 2) someone that is knowledgable
        - maybe we can do a session where champions go through PR reviews with someone to train them up
    - AL: code owner’s feature in Github
        - auto assign
        - CM: maybe only for lower traffic repos
- RFC tracking/review
    - Co-location RFC
        - CM: can we rely on the data-filename to figure out what needs changing in the guides?
            - probably not, there will likely be more like the tutorial that describe file locations in a lot of depth
- Component guides topic names
    - CG should we have the idea of “core concepts” or should we not use Emberisms when labeling things in the Guides
    - 2 user stories
        - someone who is not familiar with Ember (or even Frameworks)
        - coming back to the guides more than once, finding things that they know
            - e.g. “how do I use yields in an angle brackets components”
    - Tutorials can solve the first user story
        - each of these titles are a “step” in a tutorial
    - We should have people be able to find a page based on a “core concept” to Ember
        - i.e. if we remove it than we would need a major version bump
    - we can have a “cheat sheet” page that would allow you to find a section based on what you’re trying to do
    - because of the way that we have broken things down we have ended up breaking down some pages into more than one page (which seems unusual)
    - DB: right now we’re taking the narrative approach for sections but you’re proposing that we just use the Ember terms directly (maybe at the expense of some beginners)
        - the tutorials should still be narrative
    - JW: can we please have an issue that describes this situation and what the proposed titles are
        - we are sometimes doing ourselves a disservice by not using certain topics in the ToC
    - DB: looking at analytics 2/3 of the people using the guides are “new users” so maybe we should consider this in the decision
        - JW: there are other dedicated resources that might save us with this situation
    - CM: consider other frameworks as a group
        - CG cheat sheets for each framework
    - CM: what about SEO
        - CG: we can use HTML analogues whenever we can
- MS: Global accessibility awareness day
    - do we want an event?
        - last one: having time during the day to answer questions
        - get up to speed on how screen readers work
        - a few half hour slots “office hours”
        - maybe have some blog posts written in advance
    - If we’re ok with doing it then I (MS) am happy to organise it
        - we can do it every year
    - CM: when is it
        - May 16th
        - JW: we could do an accessibility flavoured May I Ask a Question
    - JW: I might not be able to help people with their apps but I can do some work on each of our apps
        - e.g. welcome page issues
        - maybe the "skipped tests” in the ember website
