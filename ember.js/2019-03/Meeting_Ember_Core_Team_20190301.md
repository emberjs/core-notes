# Meeting: Ember Core Team 2019/03/01

## Agenda
    
- (**5min**) review [RFC tracking issues](https://github.com/emberjs/rfc-tracking/)  (KG)
- **(5min)** `DS.Model` + native class + decorators
- RFCs
    - → FCP
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Promote

## Attendees

- [x] Yehuda Katz
- [x] Tom Dale
- [ ] Kris Selden
- [ ] Stefan Penner
- [ ] Leah Silber
- [ ] Robert Jackson
- [ ] Igor Terzic
- [x] Matthew Beale
- [x] Edward Faulkner
- [ ] Dan Gebhardt
- [ ] Godfrey Chan
- [x] Ricardo Mendes
- [x] Chad Hietala
- [x] Katie Gengler
- [x] Melanie Sumner
- [ ] Jen Weber
- [x] Chris Garrett

## Minutes

### RFC Tracking Issues

MS: Please champions of RFC tracking issues go in and update the tracking issues.

KG: I updated the Octane RFCs since they are high priority. At least we will have the list of work well stated at EmberConf.

https://github.com/emberjs/rfc-tracking

KG: Fill them out with what needs to be done on what repos.

TD: Can we get people actions items to do these by next week? What are the top three we should think about.

KG: I think the ones that are almost done. in-element since it is almost done. Deprecation for computed overridability, and computed volatile. Maybe CP can take over the champion status since RJ was basically the proxy champion.

TD: This should be a high level list of things to do.

KG: There is a description of what to do in the readme. As for Octane MS/TD might have a better idea of what is a priority.

TD: I think MU?

TD: Yesterday I started working on an RFCish thing.

(discussion)

TD: I think/thought we generally don’t want to use the term Module Unification as a term. So we should have a new name anyway.

RM: I think Octane Layout maybe.

MS: I think we should write a blog post summarizing how we pivot away.

TD: Yeah that is the frame of the RFC I’m writing

MS: If someone says Ember doesn’t ship things we should push back on that perception.

YK: It sounds like TD needs to write the RFC, but we should also write a blog post. I think we need both. The problem with another RFC is partially there are so many and it is hard to follow along.

TD: I think we talked about doing this last week and we did not.

MB: I didn’t think we were going to have a new filesystem anyway.

(discussion)

YK: I think it is an option that you have a src directory and we move thing into it over time.

### DS.Model native class + decorators

RM: Question from today: Using classic ember components and… Do you want to say in the guide if you want to use ember data model you should use decorators? I just want to make sure we have a communications strategy.

YK: There is a question about if you should use native classes with old base classes?

CP: My opinion is that we should use native class syntax for everything except components.

YK: You say that for everything even if the parent class is an Ember class?

CP: Yeah.

YK: I am only OK with that if you don’t use a constructor, and we lint for it

(discussion)

CP: The only edge case that I think exists is init, which is why I was suggesting a tunnel.

YK: I suggest we have a decorator for “classic” that will let us effectively lint, and will provide a visual identifier that you’re using the old object model.

YK: I agree it is fine to subclass. What I am saying is having a clear marker is good. I don’t think it is a high cost.

CP: Yeah I think people will dislike it if they need to do it for every single class.

YK: A source of pain in the real world is people who could not tell at a glance that a thing is not classic and will get confused.

YK: If you subclass from a superclass that did something in `init`. In your subclass you had an init method that assumed that was already set up and concatenated to it. And this is common since you don’t want to put mutable values on the prototype.

YK: So in your head you see a native class and say: “I can just put this in the constructor” and you will be wrong.

CP: You can just teach init as a lifecycle hook

YK: But if you cannot visually identify that something is classic how do you know when to think about the lifecycle hook

YK: It seems like a perspective is that it mostly works and drawing attention to the edge cases just causes confusion. But I think it probably doesn’t mostly work.

TD: I think we have some leading decorators, and a lot of people have tried to migrate to decorators already. It seems like that in practice people have just dealt with it. So does it really not happen that much (seems like the answer is largely no)…

YK: There is a source of confusion for me, but when I ask people how people just say “I think of it like a lifecycle hook”. But that explanation isn’t sufficient for me.

YK: The confounding item is that for the major lifetime of ember decorators most people were subclassing from Ember classes, but once you have new classes people will try to use `init` when it doesn’t exist for example.

CP: KS suggested we could use `init` as a hook on components instantiated by the DI

YK: Sure.

(discussion)

TD: We could try to avoid putting the brand everywhere, like in routes/models

(discussion)

TD: Do the Ember Data CPs work as decorators?

(discussion)

TD + YK are going to discuss this today and try to reach a reasonable position.
