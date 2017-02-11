# Ember Core Team 2017-02-10

### Agenda

- State of named blocks/slots - AM
- Quick survey update: Will share a draft today for internal review. Public review 2/17 - 2/24. - MB
- FastBoot build update - SP
- newsletter feedback + items for today - RM

### Attendees

DG, EB, MM, IT, GC, YK, AM, TD, RJ, SP, RM

### Minutes

#### State of named blocks/slots

AM: I have a canvas I can share with core re: my latest thoughts about named blocks/slots. I need YK feedback on some of these things. Perhaps one of them can talk about it. Canvas: https://pro.usecanvas.com/emberjs/4maccGCa3zVo5a1m2X3LUF

YK: I've been paying attention to the conversations and have been flagging things I like. I think the as prefix is looking like a good option. I don't think we should worry too much about the implementation complexity of the interleaving (angle bracket syntax + curly syntax for passing named blocks), though it will be hard.

YK: I think people think the curly version is better, but that the interleaving will be hard. But as long as we think that problem is tractable (it is) then we should focus on the design. Both of the options might be fine though. I think we need a more broad scale iteration.

AM: At some point I need to make an RFC, but I think getting core team feedback first is good. I will open up the private chat to get more feedback.

RJ: w/ Module Unification there was pain then the champions has disregarded many iterations, and getting others up to sync was hard.

YK: This document with the constraints up front is very helpful in showing why we arrive where it is.

RJ: The examples here make it feel real, as when we ran the module unification conversion on real apps.

#### Fastboot build update

SP: RJ, TD and some other linkedin people found a path forward for the build performance issues. I wanted to share that there is progress. Previously there were two issue: One krati solved with a public API. The second was instead of duplicating the build to share a build. We've come to API adjustments to an addon to make this work. Krati is going to raise them at the fastboot meeting today.

RJ: The only blocker was the server public API think on ember-cli. The rest has a path forward.

SP: So the fastboot team is unblocked.

RJ: I have some concerns about versioning but lets talk about it at the fastboot meeting first.

SP: Also, we've been dropping internal build steps in ember-cli to improve build speeds. We're going to be in a place to evaluate better linker stuff.

SP: Also there is a drive to have broccoli use change notification. And we think it will reduce rebuild times by an order of magnitude.

#### Newsletter

RM: I sent a newsletter last week and I wanted feedback. If I should change things of if I should add anything.

(discussion)
