# ember-engines Meeting Notes - 2018-07-20

## Attendees

+ [Dan Gebhardt](https://github.com/dgeb/)
+ [Melanie Sumner](https://github.com/melsumner)
+ [Robert Jackson](https://github.com/rwjblue)
+ [Alex Navasardyan](https://github.com/twokul)

## Agenda

+ Ember Engines Documentation
+ Package API spike

## Discussion Notes

Dan proposed to make several changes to the documentation summarized
[here](https://gist.github.com/dgeb/fd16fbfce17f5626748735d7a1d1c4e1).

We discussed the results of [Ember Engines
survey](https://github.com/MelSumner/case-studies/blob/master/ember-engines_use-cases.pdf)
to make sure they were no surprises.

We also discussed:

+ testing APIs; Robert and Mike North are playing around with several ideas.
+ lazy loading; Alex is working on ember engines packager and going to test it
  with some of the apps at Square.
+ dependency mismatch; improving `dependency-lint` to surface possible
  version conflicts and warn developers.
