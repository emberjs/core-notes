# Ember Core Team 2016-11-18

### Agenda

(please note (private) or (public))

- Update verbiage for `RECEIVING SECURITY UPDATES` section of [emberjs.com/security](http://emberjs.com/security) (RJ)
- [JS Modules RFC next steps](https://github.com/emberjs/rfcs/pull/176) (TD)
- FastBoot Update (TD)

### Attendees

RJ, MB, YK. TD, EF, LS

### Minutes

#### Security

RJ: I was contacted and asked what content would go out on the emberjs security list. I don't think the website says exactly what projects and packages we will notify people about. Perhaps we can add verbiage about this.

RJ: We should state that things under the emberjs/ and ember-cli/ org will be cause for notification. However perhaps we would notify for other high-profile things as well, like liquid-fire?

(some discussion)

MB: For things under the emberjs/ org and ember-cli/ org that we do not want to have supported for security, perhaps we should just flag those things (ala list-view) as not supported or archived?

MB: Or perhaps the security policy should just specify exactly what repos are supported?

YK: This is starting to sound like an RFC. There will be opinions from outside this chat that are important.

RJ: Ok, I just want to be able to answer the question about what repos or projects are part of the security umbrella.

YK: I think the motivation for this is very strong.

#### JS Modules RFC

TD: If you have not look at this, please do. It has been surprisingly uncontroversial.

RJ: I'm not wild about the outcome on computed macros, but I don't disagree enough to right the RFC on it.

 TD: I can make a one-pager on that topic and we can discuss at the next core chat. It seems like this is basically ready for FCP.

MM: The Rust process seems good where several people review and check off

TD: I will start nagging everyone next week on this then. And create the brief on computeds.

RJ: Is the codemod part of the RFC? Must you implement it to implement the RFC?

TD: I don't think completing the codemod blocks merging the RFC. My plan is to donate it to the community, transfer it to the Emberjs org or whatever

RJ: I think the number of apps that can use the codemod and have it work is important to track. I think the shims repo from marten and the codemod together could be used by apps today.
