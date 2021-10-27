@principal @census @promptUnsavedDataWarning @critical @wip
Feature: Prompt Unsaved Data Warning
  As a Requester
  I want a warning dialog to appear if I attempt to navigate away from the page when there is unsaved data
  So I won't lose the work I've done

  Background:
    Given I login as a "Requester"
    And I have a group

  Scenario Outline: Warning prompt pops up, when requester tries to navigate away, if employee's "<field_name>" value has been updated, but not saved
    When I edit field <field_name> without saving the changes in my census
    And I navigate away
    Then I should be able to see a warning prompt with message "There is unsaved info on this page Are you sure you want to leave?"
    Examples:
      | field_name      |
      | Dental Election |
      | Vision Election |
      | Age             |
      | Gender          |
      | Class           |

  Scenario Outline: Warning prompt pops up, when requester tries to navigate away, if "<field_name>" of a group has been updated, but not saved
    When I edit the field <field_name> without saving the changes in my group profile
    And I navigate away
    Then I should be able to see a warning prompt with message "There is unsaved info on this page Are you sure you want to leave?"
    Examples:
      | field_name                   |
      | Company Name                 |
      | Zip Code                     |
      | SIC Code                     |
      | Number of Eligible Employees |
      | Effective Date               |

  Scenario Outline: Warning prompt pops up, when requester tries to navigate away, if class "<field_name>" value has been updated, but not saved
    When I edit the field <field_name> without saving the changes on my classes page
    And I navigate away
    Then I should be able to see a warning prompt with message "There is unsaved info on this page Are you sure you want to leave?"
    Examples:
      | field_name  |
      | Number      |
      | Description |
