# ember-cli Meeting Notes - 2016-11-03

## Attendees

- Jake Bixby
- Kelly Selden
- Chad Hietala
- Katie Gengler
- Robert Jackson
- Stefan Penner
- David Hamilton

## Actions

- [ ] All interested - Be prepared to discuss RFC #75 at next meeting
- [ ] Next meeting we will be triaging old RFCs
- [ ] Stefan - write new RFC regarding nested addons

## Discussion Notes

(KG) Ember Try and Ember source seems to work

(SP) Is ember-try still using old core-object?

(KG) Yes. Will update.

(SP) Grandstanding about yarn

(SP) Going down 2 paths of pit of success for Broccoli RFC #76: https://github.com/ember-cli/rfcs/pull/76

(SP) To write RFC for nested addons. Potentially could be a multi-part RFC

(SP) asked wycats about yarn LTS commitment.

(RJ) Proposes we split the RFCs and ship the building dupes of addons

(RJ) yes, we should make RFCs even for sure fire things.

(SP) Sounds good, we should try and prevent RFC bitrot, maybe an RFC bookclub?

(KS) prune RFCs that have gone stale (possibly during a meeting).

(DH) If we have a weekly "RFC bookclub", our weekly meeting will cover them.

(DH) so we are largely forgetting to close them

(RJ) we are well equipped to iterate

(SP) let me propose the upcoming week we focus on RFC cleanup.

1. several of us should likely, cleanup / categorize existing RFC
2. next week, we will decide "close vs needs more info vs we intend to implement"

(DH) the above process should become part of our ongoing meetings, that way we do not let this linger.

(JB) Likely also, some RFC can very likely be merged

-- discussion about brandolini's law

(KS) build targets RFC

- concern about chaining too many targets
    - may want to remove the "dependsOn" option for now

- is it compatible with module unification
- more discussion next week.
