@trinet @updateBenefitPrograms @wip @fernando
Feature: Update Benefit Programs
  As a BCT user
  I need to be able to modify benefit programs number and descriptions
  So that I can modify benefit programs numbers and descriptions in case they are incorrect or need a modification

  Scenario: Blanks for "description" field in "Benefit Programs" page should result in a preventive message displayed in red color

  Scenario: Blanks for "number" field in "Benefit Programs" page should result in a preventive message displayed in red color

  @critical
  Scenario: Duplicate a benefit program number in "Benefit Programs" page should result in a preventive message displayed in red color

  @critical
  Scenario: Duplicate a benefit program number in "Add benefit program" dialog should result in a preventive message displayed in red color

  @critical
  Scenario: Duplicate a benefit program description in "Benefit Programs" page should result in a preventive message displayed in red color

  @critical
  Scenario: On Giving Duplicate description in "Add Benefit program" dialog should result in a preventive message displayed in red color

  @critical
  Scenario: Set special characters for "number" field in "Benefit Programs" page should result in a preventive message displayed in red color

  @critical
  Scenario: Set minimum value for "number" field for an existing benefit program should result in a preventive message displayed in red color

  @critical
  Scenario: Set maximum value for "number" field for an existing benefit program should result in a preventive message displayed in red color

  @critical
  Scenario: Updating existing benefit program description with minimum number of characters results in preventive message displayed in red color

  @critical
  Scenario: Updating existing benefit program description with maximum number of characters results in preventive message displayed in red color

  Scenario: Required label is displayed when minimum value for "number" field is below than allowed for an existing benefit program

  Scenario: Required label is displayed when maximum value for "number" field is higher than allowed for an existing benefit program

  Scenario: Required label is displayed when minimum number of characters is below than allowed for an existing benefit program

  Scenario: Required label is displayed when maximum number of characters is higher than allowed for an existing benefit program

  @critical
  Scenario: Benefit program number is updated successfully if the number selected is available and is between 1 and 999

  @critical
  Scenario: Benefit program description is updated successfully in "Benefit Programs" page

  @critical
  Scenario: WSE column value should be updated if new members are mapped to a benefit program
