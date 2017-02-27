# Ember Core Team 2017-02-17

### Agenda

- Chrome 56 passive touchstart/touchmove by default, [should we treat it as a bug ](https://github.com/emberjs/ember.js/issues/14927#issuecomment-280536034) (MB)
- Survey going out for public review today [link](https://docs.google.com/document/d/1ZzgAH2Q08hvNqQ4wbwjpYGq2Xl4NuuxxeDryBdHRNoU/edit#) (MB)
- Stack branch (RJ)
- I'm working on an RFC for Component Manager (GC)
- I'm working on an RFC for using ES class (RJ)

### Attendees

IT, KS, RJ, EF, DG, MM, GC, EB, TD

### Minutes

#### Chrome 56

YK: I think the obvious step is to set `passive: false` for now, and we can start the design process for an alternative. so how far back?

RJ: I think at least 2.8. And yes we should rethink the event dispatcher so these listeners are only added when we need them etc.

YK: Yes there is design work, but we should not couple it to the current fix. We can consider making an alternative proposal to Chrome as well. We need a statement that is better than "Chrome was making things fast and you just made them slow".

KS: There are issues on almost every framework that uses event delegation

RJ: I don't get how they don't see it is an issue.

KS: They have a lot of confirmation bias in their bubble.

EB: So what is Chrome doing?

(they are not doing anything)

KS: Many of the issues are developers talking about apps they used years ago and wondering what happens to them.

YK: I think we should address the issue then engage them.

RJ: I can do a release for 2.8 and 2.11 to make passive: false on the event listener for the event manager. We need to make a statement though.

MB: I can write a statement to the bugfix, I think I have the context.

TD: The irony is that they are lead by the same bad data re: performance tracking at large that led to the years of bad v8 optimizations.

(some coordination)

#### Survey

MB: It is going public for review today.

RJ: the demographic questions are tricky, and maybe make me feel slightly uncomfortable.

(some discussion, suggestion to add "how likely are you to recommend Ember to your friends" type question)

#### Stack Branch

YK: (technical discussion of how YK and GC changed the strategy for stack VM work in glimmer )
