# ember-cli Meeting Notes - 2017-06-01

## Attendees

- @chadhietala CH Chad Hietala
- @hjdivad DH David Hamilton
- @kategengler KG Katie Gengler
- @kratiahuja KA Krati Ahuja
- @locks RM Ricardo Mendes
- @rwjblue RJ Robert Jackson
- @stefanpenner SP Stefan Penner

## Agenda

- Weekly meetings documentation
- New team member
- Node 8 support
- NPM org for ember-cli
- Public roadmap


## Discussion Notes

### Weekkly Meetings Documentation

- sp: With canvas gone we need something for handling notes for these meetings.
- rj: Google docs or dropbox paper.  At ember-core we put a link in the topic to the agenda doc.
- sp: Putting agenda items on a github pr for the notes repo lets us use our normal workflow
- rj: We can try that for a while and then re-evaluate.
- sp: Let's re-evaluate at the end of june.

### New team member

- sp: Krati has joined the ember-cli core team, focused on fastboot.  Much of that work is basically in ember-cli anyway.  Eventually fastboot may have its own team if fastboot discussion is eating up too much of our time in ember-cli meetings.
- rm: We do something similar in learning for learning infra.

### Node 8 Support

- sp: Working on getting ember-cli with  node 8 a happy experience.  yarn errors instead of warns if engine doesn't match, unlike npm, which is the source of some recent sadness.
- rj: We can change to list previous versions and use `>=` for the latest version.  The ember-cli warning will still be correct (it reads `travis.yml,` not `package.json`)
- sp: Sounds good, just want to bikeshed for a moment so that we have a good practice for ourselves and to suggest for addon authors.
- sp: Should we specify minimum version of 4, 6 &c.
- rj: Recall the 4 LTS is 4.2 or 4.3 or something.  Importantly it does not include the lower minors.  Specifying minor generally is more work than it's worth.
- sp: We should recommend to the yarn team to make this not an error 
- sp: When do we remove them from package.json?
- rj: When they go out of maintenance (ie when support is dropped from node).
- sp: Okay; these changes to `package.json` will just lag because they'll follow canary.  Should we add the support blog post in our docs repo?
- rj: Yes but we need to rethink our docs.
- rm: We could put the ember-cli supported versions on the ember website.
- rj: Seems fine for the ember website to show the matrix, but to link to the ember-cli repository as the source of truth.
- sp: The website could read the support matrix directly from the `package.json` of `ember-cli@latest`.


### NPM org for ember-cli

- sp: Babel has started using npm organizations.  We should do the same thing for ember-cli.  The site ux is unfortunately not great, but we should still do it.
- *everyone +1*
- sp: This is probably a fair bit of work.  Likely has to be rob & stef.
- rj: We have to keep in mind Tobias's process.
- sp: It's unfortunate that npm orgs don't mirror github orgs.
- rj: There's probably a script that does this already.
- sp: I'll spike on one if not.

### Public Roadmap

- rm: I've started st-roadmap to create a public roadmap, for ember as well as aux projects.  Can we have someone from ember-cli meet regularly?
- kr: When are you planning on doing the first post for this?
- rm: Probably next week.
- sp: It will likely be easier to work this into the regular notes.  Let's make sure the meeting notes contain enough context to be useful for updating a public roadmap.
