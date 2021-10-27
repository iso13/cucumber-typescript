@principal @quotes @selectingPlans @reviewWarningPromptOnProductClasses @wip
Feature: Review Warning Prompt On Product Classes
  As a Requester
  I want my plan selection to be validated automatically
  So that I'm warned that not all product classes are selected for quoting

  Background:
    Given I login as a "Requester"
    And I have a group with census
      | censusWith3Classes.xlsx |
    And I create a "Vision" custom plan for class
      | MCV_plan       | Class_number |
      | customMCV.json | 1            |
      | customMCV.json | 2            |
      | customMCV.json | 3            |
    And I create a "Dental" custom plan for class
      | Dental_plan       | Class_number |
      | customDental.json | 1            |
      | customDental.json | 2            |

  @minor
  Scenario: When user selects to quote all job classes within a product line, then no warnings appear
    When I select a "Vision" custom plan for quoting
      | plan1 |
      | plan2 |
      | plan3 |
    And I select a "Dental" custom plan for quoting
      | plan4 |
      | plan5 |
    And continue with quotes creation
    Then warning about unselected classes should not display

  @major
  Scenario: Warning message appears, when user leaves unselected at least one job class (that has a plan designed for it)
    When I select a "Dental" custom "plan4" for quoting
    And continue with quotes creation
    Then warning about unselected classes should display

  @major
  Scenario: User can proceed to quoting after warning appears
    When I select a "Vision" custom "plan1" for quoting
    And continue with quotes creation
    And I close the warning dialog to proceed with current plan selection
    Then quotes for all selected plans are successfully created
      | plan1 |

  Scenario: User can go back to plans selection after warning appears
    When I select a "Vision" custom "plan1" for quoting
    And continue with quotes creation
    And I dismiss the warning dialog to return to plans selection
    Then the warning dialog closes and I'm still on "Select Plans" page

  @minor
  Scenario: If job class exists, but plan is not designed for it, then no warnings appear after plans selection
    When I delete a "Vision" custom plan
      | plan3 |
    And I select a "Vision" custom plan for quoting
      | plan1 |
      | plan2 |
    And continue with quotes creation
    Then warning about unselected classes should not display

  @minor
  Scenario: Validation for classes inclusion runs for every product independently
    When I select a "Vision" custom "plan1" for quoting
    And continue with quotes creation
    Then warning about unselected classes should contain "Vision" product line
    And warning about unselected classes should not contain "Dental" product line

  @minor
  Scenario: Warning prompt contains a list of all product lines and classes, that haven't been selected
    When I select a "Vision" custom plan for quoting
      | plan1 |
    And I select a "Dental" custom plan for quoting
      | plan4 |
    And continue with quotes creation
    Then warning about unselected classes should contain "Vision, Dental" product lines
    And warning about unselected classes should contain "2, 3" class numbers for "Vision" product line
    And warning about unselected classes should contain "2" class number for "Dental" product line

  Scenario: User can dismiss the warning dialog from appearing in the future within current user's session
    When I select a "Vision" custom plan for quoting
      | plan1 |
    And continue with quotes creation
    And I choose to not see the warning message again
    And I close the warning dialog to proceed with current plan selection
    # And I start the quote creation process again
    And I select a "Vision" custom plan for quoting
      | plan1 |
    And continue with quotes creation
    Then warning about unselected classes should not display
