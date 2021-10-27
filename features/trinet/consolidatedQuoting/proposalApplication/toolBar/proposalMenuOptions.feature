@trinet @proposalMenuOptions @carlos @wip
Feature: Proposal menu options
  As a Broker
  I need the ability to execute all the existing actions for quotes and proposals
  So that I can fully manage the new and existing proposals

  @blocker
  Scenario: Validate the default selectable options for Proposal Listing dropdown
    |options             |
    |preview proposal    |
    |duplicate & edit    |
    |download pdf package|
    |view all benefits   |
    |ready to present    |
    |requote             |
    |delete              |

  @blocker
  Scenario: Validate the proposal title and name for the duplicated proposal when 'Duplicate & Edit' option is selected
    |proposal type & format output                                       |
    |edit benefits market snapshot  : <former proposal name> + 'Copy'    |
    |edit quick benefits comparison : <former proposal name> + 'Copy'    |
    |edit advanced modeling comparison : <former proposal name> + 'Copy' |

  @blocker
  Scenario: Validate a proposal can be renamed after it is duplicated by clicking on it's name

  @blocker
  Scenario: Validate the proposal name is updated in the proposal listing screen when the proposal is renamed after duplicating it

  @blocker
  Scenario: Validate the proposal name is updated in the proposal listing page when a proposal

  @blocker
  Scenario: Validate quotes are auto-generated from the former proposals when 'Duplicate & Edit' option is selected

  @blocker
  Scenario: Validate plans selected in quotes are the same from the former proposals when 'Duplicate & Edit' option is selected

  @blocker
  Scenario: Validate a new entry is created after a proposals is duplicated when 'Duplicate & Edit' option is selected

  @api
  Scenario: Available proposal actions should be configurable by the org settings
    |configurations                                    |
    |by org                                            |
    |user role type                                    |
    |logged-in user                                    |
    |link to the former proposal is retained or deleted|

  @api
  Scenario: Ensure configurable proposal actions can be turned off/on
    |configurations|
    |by org        |
    |user role type|
    |logged-in user|
