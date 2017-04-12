# FastBoot Meeting Notes 2016-08-17
*Please add yourself.*
Dan McClain, Patrick Fisher, Arjan Singh
## Agenda
- [x] Last Week's  Action Items
  - [x] Arjan to continue debugging Boot promise issue
  - [x] Dan to reach out to Stef about Targets work
- [x] [ember-data-fastboot](https://github.com/cardstack/ember-data-fastboot/pull/4)
  - [x] HTML character encoding [<,>,&] (https://github.com/ember-fastboot/fastboot/issues/78)
  - [x] non-JSONAPISerializer support
- [x] broccoli-asset-rewrite
## Notes
- Arjan has continued to debug the boot promise error logging issue. Has seen the issue in the fastboot-app-server, thinks it may be in the clusting logic there swallows the error. ember-cli-fastboot properly handles the failures
- ember-data-fastboot 
- SimpleDOM [createTextNode](https://github.com/ember-fastboot/fastboot/blob/3dbc026be449c9cd7e53f4c2864cccccab944725/src/ember-app.js#L313) escapes &<>, which garbles Shoebox data
- broccoli-asset-rewrite for JS needed for fastboot config.manifest, but so unperformant that it is unusable (for large asset maps and JS files)
  - early exit in broccoli-asset-rewrite for 10x performance boost in JS files
## Action Items
- [ ] Further discussion upon ember-data and fastboot (Tom, ef4, ...)
- [x] AS + PF: failing test for Shoebox data with {&,<,>}
  - [x] see SimpleDOM RawHTMLSection
- [x] PF: broccoli-asset-rewrite performance issue PR
