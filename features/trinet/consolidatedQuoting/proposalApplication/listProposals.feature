@trinet @listProposals @carlos @wip
Feature: List Proposals
  As a Broker
  I need the ability to see the proposals created listed in a page
  So that I can see the consolidate information of the proposals listed

  @blocker
  Scenario Outline: Sort proposals listed by <column name> in ascending order
    Given I login as a "Carrier Admin"
    When  I sort my proposals by <column name> in ascending order
    Then  proposals are listed by <column name> in ascending order
    Examples:
      | column name |
      | type        |
      | name        |
      | id          |
      | created     |
      | eff date    |
      | products    |
      | status      |

  @blocker
  Scenario Outline: Sort Proposals listed by <column name> in descending order
    Given I login as a "Carrier Admin"
    When  I sort my proposals by <column name> in descending order
    Then  Proposals information is listed by <column name> in descending order
    Examples:
      | column name |
      | type        |
      | name        |
      | id          |
      | created     |
      | eff date    |
      | products    |
      | status      |

  @blocker
  Scenario Outline: Filter listed proposals
    Given I login as a "Carrier Admin"
    When I navigate to "Group Proposals" page
    And I have proposals listed
    And I filter by <option>
    Then proposals should be properly filtered
    Examples:
      | option         |
      | type           |
      | created        |
      | effective date |
      | products       |
      | status         |

  @blocker
  Scenario: Out-of-Date proposals listed
    Given I login as a "Carrier Admin"
    When I have proposals with Out-of-Date status listed
    Then A requoting message should display within the toolbar

  @critical
  Scenario Outline: Proposal information is properly listed
    Given I login as a "Carrier Admin"
    When I create <amount> proposal(s) of a random type
    Then Data is properly displayed on the columns for the proposals listed
    Examples:
      | amount |
      | one    |
      | five   |
      | ten    |
