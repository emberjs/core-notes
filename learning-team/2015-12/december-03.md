Attending:

* David Baker
* Leah Silber
* Michael Kaiser-Nyman
* Tom Dale

---

MKN: Let's give David write access to the Guides repo.

LS: Who usually does this?

MKN: Trek used to.

LS: Okay, I'll give him access.

---

MKN: Thanks all contributors to redesign. Just one bug blocking.

DB: I'm not having the errors on Travis locally.

MKN: I am. I will try to fix this weekend.

---

MKN: Version problem is only thing holding back guides.

TD: I am upset about that Ember CLI is not released. I thought it was imminent.

DB: See https://github.com/ember-cli/ember-cli/issues/4671#issuecomment-161527953.

MKN: Apparently you can't just upgrade Ember with Bower... there are other deps.

TD: Let's at least document the steps.

MKN: DB have you done this?

DB: Yes but a while ago. I will figure it out this weekend.

TD: I will work to get Ember CLI released.

---

DB: The quickstart is great. How do we fit it in with the tutorial?

MKN: Let's release the tutorial and then release the quickstart.

TD: I didn't realize how far along the tutorial was when I wrote the quickstart.
  Let's add a transition at the end of the quickstart without changing the content.

MKN: Yes, and then let's change the quickstart to transition into the tutorial.
  But not let that block the releases

---

DB: Can we move the glossary out of the middle of things? I've been working with a lot of 
  newbies lately and I think it will intimidate them.

TD: Hopefully it will be more helpful, since newbies will run into these terms very quickly. 
  But yes, let's move it to the end

---

DB: What about updating the homepage styles?

TD: It's not a big deal. The sites will be out of sync but oh well.

MKN: Who owns the homepage?

LS: Me. Robert helps me when needed.

MKN: Who should drive the homepage redesign?

LS: Big blocker is the design is not done. Thoughtbot might be doing a bit more work on that. There's also another front-end developer who is helping out with little things here and there. I also have another call with another designer who wants to help out. Tom and Yehuda have a bunch of things they want done with the content but Thoughtbot hasn't done anything on that.

TD: They did a first-pass comp on the first page. Yehuda and I have been discussing the 
messaging we want for 2016.

LS: We could create an RFP process to get somebody to finish the designing in exchange for a 
logo on the homepage. I'm not sure if there's something else we can give. We'd need to figure that out. And also we need to figure out how to manage the project when/if it happens.

MKN: Docs team can probably help out when things are ready, since we (ie David and Locks) 
implemented the design for the Guides, so we could probably be helpful for the homepage too.

DB: Jose Marluedke who helped out a lot with the Guides implementation and might be able to 
help with the homepage

---

DB: Is there a long-term goal to shift Ember properties to Ember, or stick to Middleman?

TD: No. Not the right tool for static sites.

---

MKN: Any progress on Firebase hosting? We are nearing end of life for Divshot.

LS: I haven't heard back from our contact there. Do we know anybody else there?

TD: Yes. I will ping our first contact, and if I don't hear back in two days I will ping the 
others

---

MKN: I suggest that we open up the rest of the tutorial to-dos for general help.

TD: I'm not sure about that, but I'm open to the idea. Problem is if somebody starts working 
on it, they may not finish, and if somebody says they're working on it, others will not. We could identify people in the community who write good content and ask them to do it. There are some great technical writers in the community.

MKN: Great idea. I think if we have small pieces of work it is more likely to be successful.

DB: Tom, if you ask, you will probably be the most likely to get a yes because you are a 
superstar.
TD: Okay, I will ask.

---

MKN: getOwner has been merged but does not have Guides documentation.

TD: Matthew Beale could probably do this. I'll ask him.

---

MKN: What about deploying the latest version of the Guides to /current as well as /2.x.x? Only 
hiccup is that if a page is moved/deleted, we'd need to make sure a redirect was in place.

TD: Ideally there's an automated tool that checks if there are file movements, and then add it  to a list of known changes or errors if the file hasn't been updated.

DB: This is a good idea.

MKN: I will update the issue for this.

---

MKN: I am going to step down as a docs leader at the end of the month.

TD: Thanks for your work.

MKN: No prob. It's been a blast.

TD: Please make sure there isn't a leadership vacuum.

MKN: Agreed. I wish there were one more leader. Let's use this push on getting more people on the tutorial as an opportunity to bring more people in.
