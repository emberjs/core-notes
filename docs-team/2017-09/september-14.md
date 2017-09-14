# Learn Team Agenda 9/14

## Topics

- TJ: RFC 176 API docs conversion (for 2.16)
- JW: Stack Overflow…
- JW: Coordinating some Ember articles in non-Ember media -

## Action Items

- [ ] RT: update on discourse+blog integration
- [ ] DB: Heroku blog post to launch by 2.16
- [ ] RT: Write Rolodex/Contact Book Tutorial (to launch with 2.16?)
- [ ] JW: Reach out to sugarpirate about getting some blog posts into Ember Way (informal)
- [ ] JW: Chat with Tobias B about possibly piping Discourse Q&A into Stack Overflow. Ponder SO barriers and solutions.
- [x] RM, Teddy, Jessica: solicit contributors for js module (176) testing of ember inspector
- [ ] SK: Test if api docs works on a smaller dyno level on staging & switch away from perf dyno for api docs
- [ ] SK: Help crates.io to move to Fastboot 💀
- [ ] RM: router service and `{{mount}}` proper documentation

## Minutes

### Attendees (Initials: Name @slack-id)

- TJ: Todd Jordan @todd.jordan
- RM: Richardo Mendes @locks
- JW: Jen Weber @jenweber
- JJ: Jessica Jordan @jessica
- JG: Jared Galanis @jaredgalanis
- DB: David Baker @acorncom
- SK: Sivakumar Kailasam @siva

### Notes

#### API Docs Rename

TJ: Did some work on prototyping the rename.  renamed some modules in ember, as well as created some namespaces

TJ: Also created a script to generate local docs (still a bit crude): https://github.com/ember-learn/ember-jsonapi-docs/pull/38

TJ: Keeping open questions as I go: +API Docs Rename (RFC 176)

JW: There’s an issue where the path-based module routes don’t work because its taking the `/` as a network path.  We may need to change the way the docs are processed to fix.

JW: I think we should put this out in front of people soon to get feedback before its too late on this release.

TJ: Yeah, was planning on pushing through more changes this weekend and then sending it out beginning of next week.

RM: Will schedule a meeting with Tom and Yehuda to get their feedback on API docs/vision along with JW and TJ

#### Stack Overflow update

JW: Looking at some of the concerns people had plus did some exploring

JW: Going to ping a few people that were concerned and get their ideas, and commitment to see if they were willing to help make things better.  Would also help get some new people involved.

JW: We talked about having a stack overflow channel, should I do that or just communicate individually?

RM: You need a certain amount of points to do things of consequence there, which tends to be a problem because the people who want to help (or are actually helpful are often not the same).  We have some people that can do things, but we need to build mechanisms to make things happen.

DB: Potentially we could, but it would take some work

RM: People in top users aren’t good answerers necessarily.  not sure how to “bless” some and not others.

DB: There’s benefit to the effort especially since SO shows up on google high in the list usually.

RM: We can try to organize something when siva and I get back to the dashboard effort, but build in some tools to poke people to give issues attention.

RM: We keep track of folks in 2 groups: people who are answering and trying to be helpful, and people with high reputation that can close things that would be helpful move issues.

RM: with 2.16 and module unificiation lands, answers will get obsolete real quick, which should make things fun 😬

JW: can reach out to people.  If we don’t have presence I share the concern that that companies will use that as a source of deciding whether to adopt.

DB: also should think about linking with discourse.

#### Ember Articles in non-ember media

JW: What kinds of topics would we want to reach out to people to post on topics of interest to drive visibility and interest in Ember.  When I google things a lot of the results are often old, because of google indexing but also because some of these targets haven’t had articles in a while.

RM: There is emberway.io on medium run by sugarpirate, which has been used as a platform in the past.

DB: one risk is that medium is a money making enterprise so at some point they may start putting things behind paywalls or advertisements at some point.

TJ:  We should use medium because of the eyeballs/traffic, and we can always cross-post.  Maybe the blog would be a good place for some of this stuff once the blog site gets more consumable.

RM: Core team has talked about consolidating some of the good content from core members who blog such as rwjblue and mixonic.  We’ve talked about doing a rotation of blog posts on emberjs.com and not just the release notices.

#### Heroku Blog Post

DB: aiming for this by the 2.16 release

