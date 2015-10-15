Attending:

* Michael Kaiser-Nyman
* Robert Jackson
* Ricardo Mendes

-----
MKN: Guides index PR looks nice.

RM: Will work on your comments.

-----
MKN: Preferences on linking to API methods - we need a decision. (https://github.com/emberjs/guides/pull/876)

RM: No strong position. I like the Ruby notation: Object#method. But this is not as usual in JS.

MKN: Let's just merge the PR and open an issue to do this througout the Guides.

-----
MKN: Issue with get and mut helpers - what to do. (https://github.com/emberjs/guides/issues/861)

RJ: Standalone guide on get helper is not justified. Maybe just add a reference to the API docs
which have a nice example of using it with the {{input}} helper.

MKN: I will do this.

-----
RM: What to do about hosting?

RJ: Our needs are very simple.

MKN: Let's just try Firebase hosting.

RJ: Yes, this seems the most straightforward. Trek and I migrated a couple projects from Divshot and it was trivial.

MKN: Let's deploy 2.2 to Divshot and Firebase and then we can just flip the switch and try it out.

-----
RM: API docs are moving to an Ember app. Maybe Heroku can sponsor us?

RJ: Maybe. Also Tom Dale has been working on getting FastBoot running on AWS Lambda.

-----
MKN: Is the only outstanding redeployment issue the version warning?

RJ: Too difficult to backport it. Solution is to have a single asset that all versions load - we can update that asset.

The asset should be in the https://github.com/emberjs/guides.emberjs.com repo.
Just need to add it there and then just cherry-pick a commit into older versions.
Then we can add version-detection to that file, and it will be added to older versions automagically.

-----
RJ: When do we merge in docs on new features?

RM: We have tags for versions. After review 2 weeks before release is cut, then we merge any docs on new features for that version.

RJ: Great. This will also let us re-release whenever there are fixes. But we run the risk of rebase hell.
Maybe we can just merge to a feature branch so that progress can continue there.

MKN: You can do the same thing by just pulling down the code locally by adding their repo as a remote.

-----
RM: I recently deployed master to divshot as "edge".

RJ: We could even automate that as part of the Travis build.

-----
RM: Versioned API docs Ember app.

RJ: Anything that works is better than today. Could even be beta-api.emerjs.com if it's ugly.

RM: I will get the app upgraded to the latest Ember and deal with remaining issues.
It's deployed to Divshot now. Then we can pair to finish it off.

-----
RM: Igor and Bmac are working on new stuff for the model section.

-----
MKN: Let's go over the tutorial to-dos.

RJ: What to use for backend? Very valuable to have it hooked up to a backend with real XHR requests, like the real world.

RM: Let's have the tutorial test-driven and use Mirage. (Mirage is moving to JSON API.)
Then at the end have something about connecting to a backend.
Either have a demo application they can clone, or a host set up.

MKN: I really like this.

RJ: I'll do a review of the tutorial now and also run the general structure by the core team.

MKN: Let's come up with some deadlines. By October 22, rewrite existing stuff TDD'd
 and have signoff or actionable feedback from Core.

 RM: Everything else depends on this, so let's figure out the rest of the deadlines next week.
