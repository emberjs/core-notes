### July 9 2015

##### Topics

Guides: What Is Working

* Versioning lets us focus only on "current best recommendation" and move away from needing the current guide to support every part of Ember from today back to 1.0
* Quick edit button is useful

Guides: What Is Not Workingity to know how to help

* JSBins are painful to maintain :(

API Docs: What Is Working

* Search
* Quick edit button is useful

API Docs: What Is Not Working

* Not versioned and the versioning project was halted so we could version the guides (which was identified as a higher priority) and until we resolved our many libs/many versions problem
* Need to verify that YUI doc can doc `@for namespaced/package-name` and not just `@for ClassName`
* People don't like the method list's organization
* Lots of private APIs accidentally made public
* Organized by Class and not module

Questions

* How do we make sure new commits to any Ember.js family project also have guides updates?
* What are the coarse H1 topics for the guides?  Core/Persistence/Animation/CLI have been proposed as possible top-level guides that all contain their own sub-sections, but this might reflect the current organization?
* Where do the more philosophical "why" parts go in the guides? Some people like know why, others just want to know "how" so they can get their job done and move on.
* How do we document the sub-systems of the Ember.js family? There are many topics to cover and each topic is fairly deep this point.

Outline of the 1.12 guides:

* Getting Started
  * Installing Ember
  * Glossary
* Concepts
  * Core Concepts
  * Naming Conventions
* The Object Model
  * Classes and Instances
  * Reopening Classes and Instances
  * Computed Properties
  * Computed Properties and Aggregate Data with @each
  * Observers
  * Bindings
  * Bindings, Observers, Computed Properties: What Do I Use When?
* Application
  * Introduction
* Templates
  * Handlebars Basics
  * The Application Template
  * Conditionals
  * Displaying a List of Items
  * Binding Element Attributes
  * Binding Element Class Names
  * Links
  * Actions
  * Input Helpers
  * Development Helpers
  * Rendering with Helpers
  * Writing Helpers
* Routing
  * Introduction
  * Defining Your Routes
  * Generated Objects
  * Specifying a Route's Model
  * Setting Up a Controller
  * Rendering a Template
  * Redirection
  * Specifying the URL Type
  * Query Parameters
  * Asynchronous Routing
  * Loading / Error Substates
  * Preventing and Retrying Transitions
* Components
  * Introduction
  * Defining a Component
  * Passing Properties to a Component
  * Wrapping Content in a Component
  * Customizing a Component's Element
  * Handling User Interaction with Actions
  * Sending Actions from Components to Your Application
* Controllers
  * Introduction
  * Representing Multiple Models with ArrayController
  * Managing Dependencies Between Controllers
* Models
  * Introduction
  * Defining Models
  * Creating and Deleting Records
  * Pushing Records into the Store
  * Persisting Records
  * Finding Records
  * Working with Records
  * The Rest Adapter
  * Connecting to an HTTP Server
  * Handling Metadata
  * Customizing Adapters
  * Frequently Asked Questions
* Views
  * Introduction
  * Defining a View
  * Handling Events
  * Inserting Views in Templates
  * Adding Layouts to Views
  * Customizing a View's Element
  * Built-in Views
  * Manually Managing View Hierarchy
* Enumerables
  * Introduction
* Testing
  * Introduction
  * Acceptance Tests
  * Test Helpers
  * Testing User Interactions
  * Unit Testing Basics
  * Unit Test Helpers
  * Testing Components
  * Testing Controllers
  * Testing Routes
  * Testing Models
* Configuring Ember.js
  * Disabling Prototype Extensions
  * Embedding Applications
  * Feature Flags
* Ember Inspector
  * Installing the Inspector
  * Object Inspector
  * The View Tree
  * Inspecting Routes
  * Data Tab
  * Tackling Deprecations
  * Library Info
  * Debugging Promises
  * Inspecting the Container
  * Rendering Performance
  * Troubleshooting
* Cookbook
  * Introduction
  * Contributing
  * User Interface and Interaction
  * Event Handling & Data Binding
  * Helpers & Components
  * Working with Objects
* Understanding Ember.js
  * The View Layer
  * Managing Asynchrony
  * Debugging
  * The Run Loop
  * Dependency Injections & Service Lookup
* Contributing  to Ember.js
  * Adding New Features
  * Repositories

#### Minutes

Attendees: Robert, Trek, Matt, Martin, Tom, Stefan, Yehuda, Locks, Michael, Leah


TD: docs have reached a crises level, they are of upmost importance to sort out

TG: guide structure needs consensus

TD: its hard to get consensus in a call

TG: we need to start somewhere

TD: I believe our guides to follow the narrative of building a modern web api

TG: we need to figure out what that means

TG: how do we weave in projects (like ember-cli, liquid-fire, ember-data) in

TG: we should be cautious of exploding the concepts is large (think advanced ember-addon stuff)

TG: nailing the TOC will help move this forward

TD: lets be sure NOT to organize the guides, in terms of the pieces.

M: conflict, 2 goals of the guides 1. get new users up and running 2. deep dives.

TD: more context, this discussion is geared not towards the getting started, rather the already comfortable user requiring additional knowledge

TD: Would be nice to have the requirement of docs be explicit, and automated

SP+TG: This will likely just be done by hand for now

TG: often people want a new feature to become a new guide. Instead they should understand the implication of that feature on the guides, and make cross-cutting changes.

TD: it is not fair to expect feature authors or bugfix authors to also master all the guides. It would be preferable to have a team dedicated to this

RJ: requiring a guide PR to have landed before a feature lands behind a flag is messy

TG: Ideally the guides team can take an old PR and update it. So a PR would be required for the guides, but merging it would not be required.

LS: Docs team should also view it as their responsibility to help build contributors for docs up

RIC: We've talked about moving cookbooks to EmberWatch

(much meandering conversation, too broad ranging to make minutes for this time)
