# Topics

### Previous Action Items

- [x] David: still want to contact Trek re: SEO questions, ask for original context
- [x] Todd: will check on private api info leaking through on API viewer (waiting on this until next week)
- [x] Ryan: update on screencast
- [ ] Ricardo: will write up a mini-rfp for core-notes minutes template
- [x] David: will send in a brief issues template (https://github.com/emberjs/guides/issues/1273)
- [ ] RL to create a combination header/footer restyle PR, consolidate CSS (to eliminate differences with guides, and remove emberconf references)
- [ ] RT continues with consistent voice updates in quickstart (no merge 'til emberconf)
- [x] TJ to work on filtering private/deprecated from YUIDoc output
- [ ] RM to create a draft guides PR template (and possibly core-notes and RFCs )
- [x] LS to broach PR template subject with core team
- [ ] DB to work on Build page and feature dashboard website pages, reach out to `@miracleblue`
- [ ] DB to send a guides PR linking to cli upgrade steps
- [ ] RM to create a repo in EmberTown for a living styleguide
- [ ] RM to create a Trello or Waffle site for the docs team

### Agenda

- Ask someone to take notes.
- Review action items from last week.
- Items for Discussion - None

# Minutes

## Attendees

_Name (Initials) `slackid`_

- Ricardo Mendes (RM) `@locks`
- David (DB) `@acorncom`
- Todd (TJ) `@todd.jordan`
- Ryan Tablada (RT) `@rtablada`
- Ryan Labouve (RL) `@ryanlabouve`
- Matt Beale (MB) `@mixonic`
- Leah (LS) `w@ifelette`
- Yehuda Katz (YK) `@wycats`

## Notes

### New Action Items
- [ ] DB: Reach out to Core on deploying angolia search on just 2.4
- [ ] TJ: Reach out to RM about taking on contextual components for the guides
- [ ] RT: Write an issue on guides nav linking for Getting Started
- [ ] YK: Review/Merge API Private Class Hiding PR(s)

### Guides URLs and SEO

YK: What's the status of the URL ---? How much is tech work and how much is grunt work?

DB: We're not super sure _what_ we want to be doing yet. We have some theoretical ideas but we're not sure about the exact plan.

DB: Locks is working on an Ember app for the Guides. He's hoping to have it in a few weeks. Assuming he _does_ that, I want to wait on the SEO stuff. 

YK: We should pick a date and check in then so it doesn't become a runaway project (where we suddenly notice in six months that we haven't made any progress :p).

DB: Agreed, we'll revisit in two weeks for a more concrete status report.

### Getting Started Guide / Screencast

RT: I'm planning on jumping in this weekend and working on the script and wording for the Getting Started Guide. I want to bring it more into line with the wording of the tutorial. Last week we decided we'd use that as the script for the YouTube video so we don't break translation. On the next minor or LTS release we'll pull in the tutorial (so after EmberConf) to translate the rewording.

YK: Next LTS, so 2.8?

RT: We need to check more with the translation team to be sure. Right now the tutorials are written in first-person collective, and a lot of the Getting Started is mixed and second-person. So I'm trying to get that more in line and towards something that feels good for the screencast.

YK: I'm really glad someone is paying attention to that :) I assume you're planning on extracting this to some kind of a writing guide? Even just bullet points would be good.

RT: I'll make a note to try and do something like that along with my work. Voice-wise, the only two new items since my last refactor are the `map` and the `helper` that I did. I think between me and DB we did a pretty good job at doing it right.

YK: Are there situations where the collective voice will feel weird?

RT: When talking about the current installed voice, or the ENV. That's usually when I break collective voice.

YK: Even instructions like "please install Node right now" saying "we will install node now" should work well.

TJ: Are you sill working on the screencast RT?

RT: Yep, that's the script I referenced moving to collective voice.

#### Style Guide

TJ: I don't think the style guide stuff has happened yet, but unsure. Hopefully RL will get in touch.  RL mentioned he would be working on it tonight.

RL: (joined) Still in idea phase. Looking at the several links RM posted

DB: I have a draft on the notes template. We should iterate on it with the Guides team and then ship it upstream to core.

TJ: Ryan was also working on the header/footer stuff, and I think I saw a PR for that.

DB: It's been merged and redeployed! _cheers all around_

LS: Looks like the footer is messed up. It doesn't match the Guide and has new bugs. The Copyright word is the wrong size or font, the center copy is incorectly centered. Unsure about the background color also, it seems to be different from the Guides footer color, but it might be on purpose.

YK: I think the homepage version from before the changes is the canonical version. You can get it back by reverting the change. I think the guides version is worse.

### Hiding Private/Deprecated Classes in the API

TJ: Submitted a PR around updating the yuidoc json to filter out private/deprecated classes.  Kris Seldon also has a PR for updating the rendering side.  TJ's PR to address other docs clients as well.

YK: Send me PR(s) and I will review merge

https://github.com/emberjs/ember.js/pull/13075

https://github.com/emberjs/website/pull/2476

YK: In terms of cost-benefit, this is the highest priority thing we can do as a project.

### Linking to CLI Upgrade Instructions from Guides

RM: we should link to specific release for the guides and have it dynamically link.

DB: Inclined to just link directly to the main releases github page and let the user choose.

DB: Will send in a PR.

### Guide Navigation Link Issues

RT: Under getting started there's a quick start and installing ember section.  Installing ember is at the index root, but is the second item in navigation.  Best fix might be to use Quick start as the index and give installing a first class link.

DB: also main guides page isn't linked to on left... Can't get back

DB: Make and issue and deal with it later after translation drops (seo concerns)

### Search

DB: Lets try algolia search on 2.4 guides.  Will run it by Leah and possibly merge tonight.

### Documenting Contextual Components

TJ: Would like to get Contextual Components in the Guide so I can share.  Issue owned by RM.  Will get in touch with him to see if I can take it since his plate is pretty full.
