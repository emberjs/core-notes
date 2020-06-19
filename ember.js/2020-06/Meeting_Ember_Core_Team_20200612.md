# @Jun 12, 2020

## Agenda

- (public) (10-15mins) [Draft RFC review for wizard workflow](https://gist.github.com/MelSumner/df8f0bedd3725935089f8a74258d1346) (MRS)
- (public) RFCs
    - → FCP
        - [Allow customization of `setupTest*` functions in testing](https://github.com/emberjs/rfcs/pull/637)
            - Alternatives: classes (GC)

        - `[invokeHelper](https://github.com/emberjs/rfcs/pull/626/files)` RFC
    - FCP → Merge
        - `[ember new --lang](https://github.com/emberjs/rfcs/pull/635)`
    - → FCP to Close
    - FCP to Close → Close
    - Enable
    - Discussion
        - RFC Stages: [https://github.com/emberjs/rfcs/pull/617](https://github.com/emberjs/rfcs/pull/617) (CHG)
        - What's the plan for [https://github.com/emberjs/rfcs/pull/507#discussion_r418910747](https://github.com/emberjs/rfcs/pull/507#discussion_r418910747)? (GC)
- (public) Outcome/next-steps for ember-inspector meeting (GC)

## Attendees

- [x]  Yehuda Katz (YK)
- [ ]  Tom Dale (TD)
- [x]  Kris Selden (KS)
- [ ]  Leah Silber (LS)
- [x]  Robert Jackson (RJ)
- [ ]  Igor Terzic (IT)
- [x]  Matthew Beale (MB)
- [x]  Edward Faulkner (EF)

- [ ]  Dan Gebhardt (DG)
- [x]  Godfrey Chan (GC)
- [x]  Ricardo Mendes (RM)
- [ ]  Chad Hietala (CH)
- [x]  Katie Gengler (KG)
- [x]  Melanie Sumner (MS)
- [ ]  Jen Weber (JW)
- [x]  Chris Garrett (CG)

## Action Items

- [ ]  RFC Stages Action Items
    - [ ]  Describe the actual process (when are PRs made? When do they get merged?) in more detail
    - [ ]  Add title naming conventions PRs that advance an RFC
    - [ ]  Add description of how users should figure out the current status
        - [ ]  Should be able to figure it out some way from the text of the RFC itself, after it has been merged

## Minutes

### Draft RFC for wizard workflows

MS: Follow up to the lang flag is the wizard workflow. If you type `ember new`... The idea is that the wizard is a thing which makes it easier for new users specifically, or people who like wizards, to get what they want out of Ember CLI. We discussed a question rubric: How do we decide if a question is worth asking for the wizard.

MS: Question we landed on: App v. Addon. Name of the thing. Provide the content language defaulting to `en` or would present the other option based on the language of their computer. Yarn/NPM. CI system.

MS: Originally the wizard would be used if you don't name the thing you are generating.

(discussion)

YK: My mental model is that I want to type whatever flags I can remember, then use `--wizard` to get the rest of them.

(discussion. Agreement all wizard options are things which are available as flags)

(discussion of invocation options)

GC: I think this should also prompt you at the end to save your selections as a set of defaults. Then you would need to reprompt to use the defaults.

YK: I think GC is saying is that there is another feature we want which is saving settings.

GC: So you can put things in `~/.ember-cli` regardless, so I think we should have a mechanism for saving those things into it.

RJ: I think either we force the .ember-cli fixes to be part of this RFC, or we say we don't support it to skip questions...

GC: I think the other option is that we don't skip questions for now.

RJ: I agree. I don't think it is important to answer it for now.

GC: I'm saying for the foreseeable future we can't see the difference between the arguments on the CLI and in the config file.

RJ: We need to fix that but yes.

MS: I want to say that this feature is not for people in this room. I think it is more for people new to Ember.

RJ: I'd love to use it!

YK: I think so too.

(discussion `.ember-cli` file)

GC: There was some chatter about maybe considering —interactive instead of wizard

GC: I'd like the guide to have the interactive version being taught as well, but that means the guide needs to be able to execute this stuff.

RJ: Yes this stuff is hard to test as well. So I think whatever capability we have for testing will also be the capability we use for this.

MB: Wanted to say we can use `?` at prompts as well to help the learning process

RJ: Ok we are over time and this is a bikeshed lightening rod. We should figure it out in the RFC

### RFC: lang

RJ: Opposed to landing the lang RFC?

It is a go!

### RFC: setupTest customization

(discussion)

YK: I don't really have a proposal for an alternative. The alternative of "there is a lot that goes into it and configuring this is a complex thing" is not better.

RJ: I'm not sure you are saying we should not do this...

YK: I'm not saying that. I feel a little frogboiled with this RFC is what I'm saying.

RJ: the setupForTest stuff was to remove a lot of the complexity.... Basically if you think there are opportunities to improve the output of the test file when generating a component, lets talk about it.

(discussion)

GC: I think I would like to take the opportunity to talk about classes. I don't think it is in conflict with this RFC, but it is a viable alternative to this direction. I think when I say classes I mean like now in Ember tests and glimmer tests we have a class based API. I think that is more intuitive... It matches the Ember programming model in some ways including how to extract shared logic into a private method or whatever. That (classes) is basically how you otherwise share functionality, it works better with TypeScript... I think we should consider exploring that.

CHG: I've had the opposite experience. It is very very difficult to figure out how tests get setup and torn down. I think this is a larger discussion and we should talk about it, but I think we should get into other topics.

YK: I think the glimmer one is the worst for historical reasons.

CHG: I don't think that should block this RFC

GC: It is in the alternatives of the RFC

YK: If you go to a class based model... RJ said I don't know what you're talking about but this is a version...

CHG: I think it is a much, much larger conversation for classes.

RJ: It is fine for the alternatives to make a more steelman explanation of the class based alternative. We could even say we can address this in a holistic RFC. Personally I find the Ember test system very confusing.

YK: It is just hard for me to understand exactly what the issue is with it

(discussion)

### invokeHelper

CHG: We had consensus last week but decided to punt for tweaks to be rationalized in terms of the other primitives.

RJ: I read through the diff and looks good from that perspective

### Stages RFC
