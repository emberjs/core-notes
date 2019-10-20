# Meeting: Ember Core Team 2019/08/16

## Agenda

- (20 min) template generation (JW)
    - [https://gist.github.com/chancancode/120ed93b2aa8b6df781cf69bd73d6cb9](https://gist.github.com/chancancode/120ed93b2aa8b6df781cf69bd73d6cb9) (GC)
        - "Champion's recommendation" (GC's): we do 1 (?), 2, 3 but not 4
            - Do we know how long we plan to keep 1 for?
- ~~(10 min) plan for multiple release helpers (JW)~~
- (10 min) Octane tutorial updates
- RFCs
    - → FCP
        - [@model](https://github.com/emberjs/rfcs/pull/523) (GC)
    - FCP → Merge
    - → FCP to Close
    - FCP to Close → Close
    - Enable

## Attendees

- [x]  Yehuda Katz
- [x]  Tom Dale
- [x]  Kris Selden
- [ ]  Leah Silber
- [x]  Robert Jackson
- [ ]  Igor Terzic
- [ ]  Matthew Beale
- [ ]  Edward Faulkner

- [x]  Dan Gebhardt
- [x]  Godfrey Chan
- [ ]  Ricardo Mendes
- [x]  Chad Hietala
- [x]  Katie Gengler
- [x]  Melanie Sumner
- [x]  Jen Weber
- [x]  Chris Garrett

## Action Items

- [ ]  Chris + Yehuda to sync on QPs
- [ ]  GC opens an issue on the generator proposals 1, 2, and 3

## Minutes

### Template Generation

See: [https://gist.github.com/chancancode/120ed93b2aa8b6df781cf69bd73d6cb9](https://gist.github.com/chancancode/120ed93b2aa8b6df781cf69bd73d6cb9)

GC: Linked gist contains the various proposals, summed up

TD: Can we agree to the semantics without the specific names/terms? "Class" may not be super intuitive in this context, since it means you're adding behavior.

YK: I agree with the high level point, but I don't think it will end up being a problem in this case, classes are very common.

GC: `g component-class` and `--no-component-class` have already shipped to beta, so would have to change these

TD: I'd like to constrain that more, specifically would like to tweak/wordsmith the protip in proposed feature 1

TD: Can we make the option name `--with-class`?

GC: No, this is a limitation of ember-cli, flags apply to all commands, no way to scope them to a single command.

RJ: Yeah, very generic commands can be problematic because of this.

RJ: We should mock out a pre-RFC for fixing this problem, the work is simple and it could be done by 3.14

GC: As long as the original flags remain supported, we can always revisit and add shorthands later on if we get the ability to do this later on.

JW: So these proposals are not mutually exclusive?

GC: No, we can implement any or all of them.

JW: Ok, in that case, do we want to go with the champion's recommendation? (1, 2, 3)

JW: Do we need an RFC? Does anyone strongly want one here?

*No answers*

JW: Ok, so the champion's proposal?

RJ: I like option 4

YK: Agreed, I can't think of a reason why you'd want the default behavior to overwrite

GC: The case in the gist is concerning (generate a classic component, then attempt to generate a glimmer component)

TD: Rob why do you like option 4?

RJ: It's the simplest answer

YK: Option 4 feels like the behavior people usually want

YK: We are not foreclosing on 4, we can come back to that later as another change

RJ: Ok that's fine

JW: Cool. In terms of implementation, who should take this on? Godfrey?

GC: I could, would be best to pair with Rob, but if not I could try? I'm busy then vacation though

TD: Could we ask Preston?

Summary - agreed on doing 1, 2, 3. We are not foreclosed on 4. We'll wordsmith the ProTip as needed.

### Octane Tutorial Updates

GC: Been working on it for 7 days straight, so far it's looking pretty good!

GC: Would like people to review and provide feedback. No good preview at the moment, but you can read the markdown.

GC: Pretty proud of what we've come up together, great job team!

### `@model` RFC → FCP

No consensus was reached (Chris got distracted while taking notes ☹️)
