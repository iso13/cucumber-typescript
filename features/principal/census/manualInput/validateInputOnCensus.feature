@principal @census @censusManual @validateInputOnCensus
Feature: Validate Input On Census
  As a Requester
  I need to be notified if I am missing data from my census
  So that I can quote successfully for a group

  Background:
    Given I login as a "Requester"

  @wip
  Scenario: Inform users when the census count does not match the number of eligible employees field on the group profile

  @critical
  Scenario: Required fields on census should show "Required" error message below the field, when left empty
    When I have a group with census created with
      | group_data     | census_data         |
      | i have a group | Tmpl_14EEs_4cl.xlsx |
    And I start adding a new employee
    Then Following required fields should show the "Required" message underneath them:
      | Age             |
      | Gender          |
      | Class           |
      | Dental Election |
      | Vision Election |

  @critical
  Scenario: Columns for Dental and Vision elections should be hidden on census, if products have not been selected
    And I have a group with census created with
      | group_data         | census_data         |
      | Group CA 3571 50 L | Tmpl_14EEs_4cl.xlsx |
    Then Election fields for Dental and Vision products should be hidden on census

  @wip
  Scenario Outline: <product> election values are not required, if <product> product has not been selected
    When I start creating new group with required fields
    But I unselect "Dental, Vision" lines for quoting
    And save a group
    And I add a new employee with minimum required data
    Then the added employee's info should be saved successfully
    Examples:
      | product |
      | Dental  |
      | Vision  |

  @wip
  Scenario: DOB values must be in the format M/D/YYYY. If the DOB is not int that format then a message in red should display "Must be in MM/DD/YYYY format"
