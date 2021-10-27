@validateInputOnCensus @critical @cami
Feature: Validate Input On Census
  As a User
  I need to be notified if I am missing data from my census
  So that I can quote successfully for a group

  * Product election values are not required, if <product> product has not been selected
  * DOB values must be in the format M/D/YYYY. If the DOB is not int that format then a message in red should display "Must be in MM/DD/YYYY format"
  * Inform users when the census count does not match the number of eligible employees field on the group profile

  Scenario: Required fields on census should show "Required" error message below the field, when left empty
    Given I login as a "Requester"
    And I navigate to group '<existingTestGroup>'
    When I try to manually add a member with the following data:
      | firstName | lastName |
      | dummy     | member   |
    Then The following required fields should show the "Required" message underneath them:
      | fieldName       |
      | Age             |
      | Gender          |
      | Class           |
      | Dental Election |
      | Vision Election |

  Scenario: Columns for Dental and Vision elections should be hidden on census, if products have not been selected
    Given I login as a "Requester"
    And I navigate to group '<existingTestGroup>'
    And I remove following product lines:
      | Dental |
      | Vision |
    Then The following fields should be not present on the census:
      | Dental Election |
      | Vision Election |
