# Learn Team Agenda 2019-02-14

## Topics
- Review last week’s action items
- Review [Airtable tasks](https://airtable.com/tblhuFSRZQWkf4BWb/viwJLkNEFKxGeMk7z)
- https://github.com/ember-learn/guides-source/issues/330
- Using public channels/issues better
- EmberConf prep - discuss agenda for F2F? Or push this discussion off
- Getting on the same page about Octane plans (JW & others)
  - https://github.com/ember-learn/guides-source/projects/4
- Angle brackets deployment! (JW)
- Contributors Workshop (locks do you want to cover this?)
- Community survey update (Mel)

## Action Items

- [ ] https://github.com/ember-learn/ember-website/issues/158
- [ ] All core team members - Add content to the Learning Team F2F Agenda https://github.com/ember-learn/agendas/blob/master/2019/03.md

## Attendees (Initials: Name @Discord)

Attendees (Initials: Name @Discord)
- [ ] DB: David Baker (acorncom)
- [x] TJ: Todd Jordan
- [x] JJ: Jessica Jordan
- [ ] SK: Siva Kailasam
- [x] AL: Amy Lam (amyrlam)
- [ ] TL: Terence Lee
- [x] CM: Chris Mason
- [x] RM: Ricardo Mendes (locks)
- [x] LS: Leah Silber
- [x] MS: Melanie Sumner (melsumner)
- [x] JW: Jen Weber
- [x] RT: Ryan Tablada
- [x] DM: Dan Monroe
- [x] JD: James Davis (jamescdavis)

## Notes

### RM: markdown links inconsistencies
  - we decided to do every link inline
  - JW: we have a styleguide somewhere, if it doesn’t say it there then we should add it
  - RM: we don’t enforce the styleguide
  - We should revisit this topic after emberconf - any enforcment of the styleguide would require a “big bang linting update” and might hold back current efforts

### JW: public channels
  - Reminder to people working on Octane stuff - try to have discussions in issues to help coordination
  - Let’s try to help remind each other to break out of private messages 🎉

### LS: (aside discussion)
  - Is “new website” the same as RFC redesign thing?
    - CM: no it’s just emberifying the ember website
  - the deliverable of the redesign is likely to be “one composition” (i.e. just the homepage)
  - MS: the way that we’re planning to do this is to do this through the ember-styleguide
  - Should have a new “comp” (short for composition) soon

### JW: agenda for f2f
  - there is a repo for agenda https://github.com/ember-learn/agendas/blob/master/2019/03.md
  - deadline for agenda items is the first day of emberconf
  - please PR agenda items to the repo
  - if you have a presentation start prepping now!!!

### JW: Angle brackets
  - when will other things be released?
    - JW cli and super rentals we can just merge
    - RM api will update when ember is released

### Contributors Workshop
  - MS has been helping reach out
  - there is a channel with internal discussions
  - Tobias is triaging ember-cli
  - we have been “curating” with the DecEmber event 🎉
  - Robert Wagner and “NullVoxPopuli” will be helping out

### Community Survey Update
  - moved to Github https://github.com/ember-learn/annual-community-survey
  - going well
  - truncated timeline - so we are going for a MVP so we need to get the survey out by Monday
  - [CodeAllDay](http://codeallday.com/) is sponsoring


### JW: Octane plans! 🎉
  - start with a summary of the current state
    - learning team’s deliverable for Octane is a preview of the “Octaney guides”
    - this means there is a publicly accessible URL where people can take a look at the new style of guides https://deploy-preview-455--ember-guides.netlify.com/release/
    - Octane is not planning to be a “stable release” by EmberConf
    - There is a tracking issue that is tracking the content that will go into the Octane Guide
    - note: let’s prioritise PRs from @Ricardo M and “Chris Garret”
    - we need to decide what is MVP for these guides 👍 we may not need to make things perfect for the first pass
  - Questions:
    - when are we going to have a decision on the actual content in the new guides? Specifically around the class syntax support
      - best way forward is to write an issue to open the discussion
    - note: if there is something that has been decided already but you have an issue we need to come at the problem from a place of action i.e. a proof of concept as an example to explain their point
  - RM: Roadmap for the guides for octane
    - proposed roadmap?
      - we will document the new application model
      - we will add documentation about Glimmer components
      - Guides ToC work
      - then we remove stuff
    - All of the “assessment” issues have been completed and relevant new issues (that require writing) have been added
      - All issues that we want help with are tagged as “Help Wanted”
  - CM: is the reordering rfc branch tied in with the Octane branch?
    - RM: no the rfc branch can be merged independently and the octane branch is branched from the rfc branch.
    - JW: this is in line with my expectation too
  - MS: questions about Octane tracking issues or Projects?
    - JW I will turn my attention to these tracking projects now that the Angle Brackets is merged
    - https://github.com/ember-learn/guides-source/projects/4
