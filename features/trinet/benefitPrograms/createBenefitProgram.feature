@trinet @createBenefitPrograms @wip @fernando
Feature: Create new benefit programs
  As a BCT user
  I need to be able to add new benefit programs
  So that I can map members to those programs

  @critical
  Scenario: Add a new benefit program from the Benefit programs page

  @critical
  Scenario: New benefit program should be present for all product lines with any existing benefit programs

  @critical
  Scenario: New benefit program should be displayed in programs panel on census page with any existing benefit programs

  @critical
  Scenario: New benefit program should be displayed in the "modeling census" tab for PCR quotes with any existing benefit programs

  @critical
  Scenario: New benefit program should be displayed in the "Contributions" tab for PCR quotes along with any existing benefit programs

  @critical
  Scenario: New benefit program should be displayed in the "modeling census" tab for C/R quotes along with any existing benefit programs

  @critical
  Scenario: New benefit program should be displayed in the "Contributions" tab for C/R quotes along with any existing benefit programs

  @critical
  Scenario: New benefit program cannot be created with empty values for number and description fields

  @critical
  Scenario: New benefit program cannot be created with empty value for number field

  @critical
  Scenario: New benefit program cannot be created with empty value for description field

  @critical
  Scenario: Add minimum value for number field during the creation of a benefit program

  @critical
  Scenario: Add maximum value for number field during the creation of a benefit program

  @critical
  Scenario: Add minimum number of characters for description field during the creation of a benefit program

  @critical
  Scenario: Add maximum number of characters for description field during the creation of a benefit program

  Scenario: Required label displayed when minimum value for number field is below than allowed in Add Benefit Program dialog

  Scenario: Required label displayed when maximum value for number field is higher than allowed in Add Benefit Program dialog

  Scenario: Required label displayed when minimum number of characters is below than allowed in Add Benefit Program dialog

  Scenario: Required label displayed when maximum number of characters is higher than allowed in Add Benefit Program dialog

  @critical
  Scenario: Duplicate benefit program number shouldn't be allowed in Add Benefit Program dialog

  @critical
  Scenario: Duplicate benefit program description shouldn't be allowed in Add Benefit Program dialog

  @critical
  Scenario: Duplicate the description for a new benefit program shouldn't be allowed in Add Benefit Program dialog

  @critical
  Scenario: Set special characters for number field shouldn't be allowed in Add Benefit Program dialog

  Scenario: Benefit program with long description should be displayed truncated with three dots "..." on quote modeling screen

  Scenario: Long description Benefit program should display truncated on View all programs tab and on hover full description should appear

  @critical
  Scenario: WSE column should display zero members attached by default when a new benefit program is created
