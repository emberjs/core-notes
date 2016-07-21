# ember-cli Meeting Notes - 2016-07-14

## Attendees

- Nathan Hammond
- Tobias Bieniek
- Jake Bixby
- Chad Hietala
- David Hamilton
- Stefan Penner
- Kelly Selden
- Katie Gengler
- Robert Jackson

## Actions

- [ ] Nathan - Document merging `[BUGFIX master/beta]` back on a timeline.
- [ ] Stef - Find GitHub contact.
- [ ] Tobias - Changelog script updates minimizes milestones.
- [ ] Stef - RFC/plan for AssetGraph.
- [ ] Rob - Spike AssetGraph
- [ ] Tobias - Document plans for babel/eslint.

## Discussion

### Busted release

- broccoli-caching-writer changed its sort method.
- Previously "undefined" had a consistent order, but not explicitly set.
- Now has guarantees.
- The change required proper use of `headerFiles` in broccoli-concat (downstream of BCW) to play nicely.

### Merge vs. Cherry-Pick

Right now we are following both the "target a particular branch" as well as the cherry-pick strategy.

- Aim to minimize amount of time where differences exist in branches.
- When landing something on the beta/release branches as `[BUGFIX beta/release]` the merger should make sure it is merged back into master.
- Can't guaranteedly be automated because of merge conflicts.
- Should get in touch with GitHub...

### GitHub

- We would like the ability to retarget a user's PR to a different branch.
- Want to force things to be assigned to milestones before merging.
- Can we query the API by milestone?

### broccoli-asset-rev

- [Has pretty serious problems with walking a graph.](https://github.com/rickharrison/broccoli-asset-rev/issues/29#issuecomment-231413530)
- Need to come up with attack plan for this.
- Either update asset-rev to use the right library or replace.
- Investigate [AssetGraph](https://github.com/assetgraph/assetgraph).

### ESLint/Babel

- Hard (/impossible) to use `npm link` with their current setup.
- Resolves relative to usage place instead.
- Can we work with them to improve how we dynamically load plugin packages?