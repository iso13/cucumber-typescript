@trinet @benefitProgramsSettings @wip
Feature: Setup benefit programs settings
  As a Broker
  I need to be able to setup benefit programs information
  So I can accurately view benefit programs information

  Scenario: Set to false bulk_edit.edit_options should not enable bulk editing for the census

  Scenario: Set to true bulk_edit.edit_options should enable bulk editing for the census

  Scenario: permissions.maximum_classes should be display 36 by default

  Scenario: Update permissions.maximum_classes to a negative integer shoud not be allowed

  Scenario: Update permissions.maximum_classes to a float number should not be allowed

  Scenario: Update permissions.maximum_classes to an empty value should not be allowed

  Scenario: Update permissions.maximum_classes to an integer value greater than 36 should not be allowed
