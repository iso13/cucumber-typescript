@trinet @groupUIProperties @wip @carlos
Feature: Group UI properties
  As a BCT user
  I need to be able to create groups
  So I can manage those groups inside Quotepad with an initial behavior

  Scenario: Auto-populate City, State and County fields after enter a valid Zip Code
  Any valid Zip Code should populate City, State and County fields.

  Scenario: Auto-populate City, State and display County dropdown list after enter a valid Zip Code with Multi County
  Any valid Zip Code should populate City, State and County fields.

  Scenario: Medical current offering should be selected by default

  Scenario: Product lines and Current Offering to Employees check should be selected by default
  All Product Lines and Current Offering to Employees check should be enabled
  and selected by default.

  Scenario: Save & Continue button should be disabled by default
  Group Creation screen should always display "Save & Continue" button as disabled by default.

  Scenario: Save & Continue button should be enabled/disabled if data is/isn't entered
  Once either valid minimum required data or valid full set of data is entered
  to create a new Group, "Save & Continue" button should be enabled in other case
  should be disabled.

  Scenario: "Primary" label should be displayed by default under "Company Information" label
