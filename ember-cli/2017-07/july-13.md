# ember-cli Meeting Notes - 2017-07-13

## Attendees

- @hjdivad dh David Hamilton
- @twokul Alex Navasardyan
- @turbo87 tb Tobias Bieniek
- @kategengler kg Katie Gengler
- @kellyselden ks Kelly Selden
- @kratiahuja ka Krati Ahuja 


## Agenda

rfc 108 (api for custom transforms)
pr 7019
peer deps
ember-cli-babel catch


## Discussion Notes

### rfc 108 (API for custom transforms)

- ka: updated rfc to make the collision move to soft error
- tb: i believe chad had some issues around extending import making future tree shaking more difficult (everyone happy to move to fcp)
- as: there was some talk at portland about tree-shaking concerns
- ks: let's get chad's feedback on the PR
- (general agreement that the RFC was good for FCP pending chad's feedback)

### pr 7019

- dh: just want to confirm there isn't some known issue blocking this
- tb: don't think so

### peer dependencies

- dh: peer dependency issues can be pretty tricky in upgrades, eg ember-cli-stylelint 0.14 vs 0.15.  It would help a lot if we could easily release thing slike 0.14.1 to make the version incompatibility clearer during upgrades
- tb: the problem with peer dependencies is they just produce warnings that people
- will miss
- dh: can we just make them hard errors?  even if only for ember addons?
- ks: we could use version checking or check peer dependencies and warn during every install
- dh: make upgrade story easier; eg ember-cli-stylelint 0.14, 0.15
- tb: during ember install we don't show the output of npm or yarn; is there a verify command
- dh: don't know
- kg: I'm working on an rfc for ember upgrade; it doesn't yet address this issue
- dh: are there any concerns with hard erroring on peer dependencies?
- kg: there will be problems as with ruby gems; people will set peer dependencies too pessimistically and cause other upgrade problems if we hard error
- dh: ah I was imagining we'd recommend leaving peer deps optimistic (so only a lower bound) and only add upper bounds on point releases when there are known incompatibilities.
- ks: that would work but I think people will still set peer deps pessimistically
- dh: maybe we could add a flag for verification and point people to it in an upgrade troubleshooting duie?


### babel catch rerun validation

- dh: there's a similar upgrade problem with babel incompatibility.
- ka: you mean the `import require from 'require'` problem?
- dh: yes.  It is quite painful for users to debug; I'd like to make this a smoother path for app (non-addon) developers.  In discussing with rob we thought it might work to have ember-cli-babel `try/catch` and re-run with only babel validator plugins in the event of an error.  tb: can't we just write an eslint rule for this?
- dh: that's worth exploring as a simpler alternative

