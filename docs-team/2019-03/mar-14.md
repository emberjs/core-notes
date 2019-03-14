# Learn Team Agenda 2019-03-14
Facilitator: AL

## Topics
- Review last week’s action items 
  [ ] @ everyone - try out Octane and/or watch Gavin’s video! 
  [x] @ Chris M will work with @ siva to set up the Octane url
  [x] Ask for consensus on merging Contributor Guides RFC @ Jessica J 
  [x] Banner for the Octane Guides - @ Jennifer W deadline for next week!
  [ ] @ everyone Make issues for Contributor Workshop!
  [x] Review new website. @ everyone
  [ ] @ all core LT - Add content to the Learning Team F2F Agenda https://github.com/ember-learn/agendas
  
- Review Airtable tasks 
  - Tasks tab > Select “Kanban for Ember Conf” from dropdown on lefthand side
  
- Select new facilitator for post-EmberConf March 28
- Ember Infrastructure in other countries @ Chris M @ Siva @ Amy L 
- Heroku http to https redirect hitting heroku directly 😭 
- Adjusting to new Octane Preview ship dates: (JW)
- EmberConf learning team activities

## Action Items 
[x] The facilitator adds today’s public notes to the Core Meeting Notes repo (instructions)
[ ] Find new facilitator for post-EmberConf @ Amy L 
[ ] heroku http to https redirect hitting heroku directly, Chris M write as issue, then notify @ Todd and @ Siva 


## Attendees (Initials: Name @Discord)
[x] DB: David Baker (acorncom)
[ ] TJ: Todd Jordan (todd.jordan)
[ ] JJ: Jessica Jordan (jessica)
[ ] SK: Siva Kailasam (Siva)
[x] AL: Amy Lam (amyrlam)
[ ] TL: Terence Lee (hone)
[x] CM: Chris Manson (Chris Manson)
[x] RM: Ricardo Mendes (locks)
[ ] LS: Leah Silber (wifelette)
[x] MS: Melanie Sumner (melsumner)
[x] JW: Jen Weber (jenweber)
[x] KL: Kenneth Larsen (kennethlarsen)
[x] DM: Dan Monroe
[x] JD: James Davis (jamescdavis)
[x] RJ: Robert Jackson (rwjblue)
[x] TD: Tom Dale
[x] JG: Jared Galanis
[x] Ryan Tablada

## Public Notes/Minutes

### Review last week’s action items 
  [ ] @ everyone - try out Octane and/or watch Gavin’s video! 
  [x] @ Chris M will work with @ siva to set up the Octane url
  [x] Ask for consensus on merging Contributor Guides RFC @ Jessica J 
    - Gone into FCP / merged
  [x] Banner for the Octane Guides - @ Jennifer W deadline for next week!
  [ ] @ everyone Make issues for Contributor Workshop! 
    - Link to the file that work needs to be done in, low hanging fruit but very helpful
    - Mark as “help wanted” or “good first issue”
    - Core repos will show up, addons send link to Jen
  [x] Review new website. @ everyone
  [ ] All core team members - Add content to the Learning Team F2F Agenda https://github.com/ember-learn/agendas
  
### Review Airtable tasks 

### Select new facilitator for post-EmberConf March 28
  - AL made action item

### Ember Infrastructure content blocking problem in certain countries CM AL SK
  - Repos: deprecations, guides, main website, blog
  - Lots of other strange things getting blocked e.g. AWS IPs, issues with IPv6
  - Pick this back up after EmberConf, potentially start new infra team CM SK TJ RM AL

### heroku http to https redirect hitting heroku directly 😭 
  - thanks to Robert Jackson for finally finding the issue 🎉 
  - api.emberjs.com redirects to Heroku URL e.g. something-herokuapp.com
  - @ Chris M write as issue, then notify @ Todd and @ Siva 
  
### Adjusting to new Octane Preview ship dates: (JW)
  - Shipping the Octane Guides to https://octane-preview-guides.emberjs.com. Right now it’s at https://deploy-preview-455--ember-guides.netlify.com/release/
  - Octane Landing Page https://emberjs.com/octane
  - JW: Coming very soon, we are shipping the technical preview of Octane, think of it like canary
  - Within emberjs.com domain, will show Octane version of guides, has “warning” banner at the top
  - Keep an eye on the PR queue, PRs will be merged into the Octane branch on master
  - TD: `deploy-preview-455` URL, ppl thought this looked broken, so we had to do a last min URL change
  - JW: how to handle this kind of stuff in a more scalable way in the future, e.g. Editions → F2F topic? 
  - CM: Octane landing page, use TBA Ember homepage redesign as style inspo? CM and JW chat after meeting. 
  - DB: Has Octane app working on Nelify, DNS next. May cause double PR problem.
  
### EmberConf learning team activities
  - Some staying at house, sponsored by LI (thank you!)
  - Use house to discuss LT initiatives for LT and friends - ping MS, RM, AL, JW to get into house
  - Core: Thursday after conf, have F2F meeting
