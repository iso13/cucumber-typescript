@trinet @editGroup @carlos
Feature: Edit Groups
  As a BCT user
  I need to be able to edit groups
  So I can update groups based on information received from my client

  Background: User login on the portal
    Given I login as a "Carrier Admin"
    And I create a new group with "minimum group data" and owner as "TriNet Sales"
    And I upload a census "Overwrite Me" selecting "Exchange II / XI RFP Template File" as template type

  @blocker @MSTR-1984 @DISTRIBUTE-379
  Scenario: Update existing group changing minimum required data and confirm the data is saved
    When I update the minimum data for the new group using zip code "95912"
    And I should be able to save the group with the changes
    Then I verify the group has been modified with zip code "95912"

  @wip
  Scenario: Update existing group changing full data and confirm the data is saved

  @wip
  Scenario: Update existing group changing Company Name to -blanks- and confirm that cannot be saved

  @wip
  Scenario: Update existing group changing Zip Code to "abc" and confirm that cannot be saved

  @wip
  Scenario: Update existing group changing Zip Code to -blanks- and confirm that cannot be saved

  @wip
  Scenario: Update existing group changing Company Name, Zip Code, City, Address to -blanks- and confirm that cannot be saved

  @wip
  Scenario: Update Zip Code should auto-populate City, State and County fields

  @wip
  Scenario: Update to a Multi County Zip Code should auto-populate City, State and display dropdown County list

  @wip
  Scenario: Update existing group removing required data and confirm that cannot be saved

  @wip
  Scenario: Update existing group removing optional data and confirm that can be saved

  @wip
  Scenario: Update existing group removing Product Lines and confirm that cannot be saved

  @wip
  Scenario: Update existing group unchecking Currently Offering check of any Product line and confirm that can be saved

  @wip
  Scenario: "Primary" label with Primary consultant name under it should be displayed by default under "Company Information" label

  @wip
  Scenario: "Secondary" label with Secondary consultant name under it should be displayed under "Primary" information if exist
