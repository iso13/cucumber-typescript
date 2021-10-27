@trinet @consolidatedQuoting @editQuoteName @poorna @wip
Feature: Edit Quote Name
  As a Carrier Admin
  I need the ability to quickly and easily name and rename the grouping of
  plans of quotes for product line so I can add to my proposals

  Background:
    Given I login as a "Carrier Admin"
    And I create a new group
    And I create a proposal

  Scenario Outline: Validate Edit Quote naming for <Products>
    When I edit <Products> quote name
    Then quote name is saved
    Examples:
      | Products |
      | Medical  |
      | Dental   |
      | Vision   |
      | Life     |
      | STD      |
      | LTD      |

  Scenario Outline: Validate Edit Quote naming blank for <Products>
    When I edit <Products> quote name with a blank name
    Then quote is NOT saved
    Examples:
      | Products |
      | Medical  |
      | Dental   |
      | Vision   |
      | Life     |
      | STD      |
      | LTD      |

  Scenario Outline: Validate Edit Quote naming with duplicate quote name for <Products>
    When I edit "<Products>" quote name with a duplicate name
    Then quote is saved
    Examples:
      | Products |
      | Medical  |
      | Dental   |
      | Vision   |
      | Life     |
      | STD      |
      | LTD      |

  Scenario Outline: Validate Edit Quote naming with special characters for <Products>
    When I edit "<Products>" quote name with a special characters
    Then quote is not saved
    Examples:
      | Products |
      | Medical  |
      | Dental   |
      | Vision   |
      | Life     |
      | STD      |
      | LTD      |

  Scenario: Validate a quote that is NOT actively selected that is not being viewed
    When user selects on the name of a quote that is NOT actively selected
    Then that should make that quote the actively selected quote

  Scenario:Validate the quote name of an actively selected quote
    When user selects on the name of a quote that is actively selected
    Then that should change the state of the quote name to a writable state with an active cursor

  Scenario: Validate the ability to edit the quote name
    When user selects on the name of a quote that is actively selected
    And edit quote name as "Custom Edited Quote name"
    Then quote name revised to what user has inserted text ex. "Custom Edited Quote name"

  Scenario: Validate the ability to save edited quote name
    When user selects or clicks on on the name of a quote that is actively selected
    And type quote name as "Custom Edited Quote name"
    And user saves the quote name
    Then revised quote name is saved succssfully
