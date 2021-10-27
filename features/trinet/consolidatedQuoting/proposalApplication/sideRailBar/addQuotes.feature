@trinet @addQuotes @wip @carlos
Feature: Add Quotes
  As a User
  I want the ability to add quotes for a particular product line either manually or automatically
  So that I can build my proposal

  Background:
    Given I login as a 'Carrier Admin'

  @blocker
  Scenario Outline: Quote is automatically added for 'Benefits Market Snapshot' <quote type> <product line>
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    Then New '<product line>' quote is added automatically in the container
    Examples:
      | report type              | quote type | product line |
      | benefits market snapshot | BCR        | medical      |
      | benefits market snapshot | PCR        | dental       |
      | benefits market snapshot | BCR        | std          |
      | benefits market snapshot | PCR        | ltd          |
      | benefits market snapshot | PCR        | vision       |

  @blocker
  Scenario Outline: Quote is automatically added for 'Quick Benefits Comparison' <quote type> <product line>
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    And I create a new '<quote type>' '<product line>' quote
    Then New '<product line>' quote is added automatically in the container
    Examples:
      | report type               | quote type | product line |
      | quick benefits comparison | BCR        | medical      |
      | quick benefits comparison | PCR        | dental       |
      | quick benefits comparison | BCR        | std          |
      | quick benefits comparison | PCR        | ltd          |
      | quick benefits comparison | PCR        | vision       |

  @blocker
  Scenario Outline: Notification message is displayed if the maximum number of allowable quotes is reached for '<report type>' '<quote type>'
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    And I select the container for '<product line>' product line
    And I try to add a new quote by clicking the add button "+"
    Then A notification should display and add button "+" should be disabled
    Examples:
      | report type               | quote type | product line |
      | benefits market snapshot  | BCR        | vision       |
      | benefits market snapshot  | PCR        | vision       |
      | quick benefits comparison | BCR        | std          |
      | quick benefits comparison | PCR        | ltd          |
      | quick benefits comparison | PCR        | dental       |

  @blocker
  Scenario Outline: Add a new 'Advanced Modeling Comparison' <quote type> <product line> quote
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    And I create a new '<quote type>' '<product line>' quote
    Then New '<quote type>' '<product line>' quote should be displayed in the container
    Examples:
      | report type                  | quote type | product line |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | dental       |
      | advanced modeling comparison | BCR        | std          |
      | advanced modeling comparison | PCR        | ltd          |
      | advanced modeling comparison | PCR        | vision       |

  @blocker
  Scenario Outline: Notification message is displayed if the maximum number of allowable quotes is reached for '<report type>' '<quote type>'
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I create a new '<quote type>' '<product line>' quote
    And I try to add a new '<quote type>' '<product line>'
    Then A notification should display and add button "+" should be disabled
    Examples:
      | report type                  | quote type | product line |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | dental       |
      | advanced modeling comparison | BCR        | std          |
      | advanced modeling comparison | PCR        | ltd          |
      | advanced modeling comparison | PCR        | vision       |

  @critical
  Scenario Outline: Product line container is active during the creation of a quote
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    And I select the container for '<product line>' product line
    Then Container title and icon are highlighted and sub-components are shaded
    Examples:
      | report type                  | quote type | product line |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | medical      |
      | benefits market snapshot     | BCR        | vision       |
      | benefits market snapshot     | PCR        | vision       |
      | quick benefits comparison    | BCR        | std          |
      | quick benefits comparison    | PCR        | ltd          |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | medical      |
      | advanced modeling comparison | BCR        | dental       |
      | quick benefits comparison    | PCR        | dental       |

  @critical
  Scenario Outline: Collapse side bar during the creation of a quote
    When I select a report type as '<report type>'
    And I select any of the exchanges available
    And I select '<quote type>' from the PCR toggle
    And I select the container for '<product line>'
    And I collapse the sidebar container
    Then Product Icon is highlighted for '<product line>'
    Examples:
      | report type                  | quote type | product line |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | medical      |
      | benefits market snapshot     | BCR        | vision       |
      | benefits market snapshot     | PCR        | vision       |
      | quick benefits comparison    | BCR        | std          |
      | quick benefits comparison    | PCR        | ltd          |
      | advanced modeling comparison | BCR        | medical      |
      | advanced modeling comparison | PCR        | medical      |
      | advanced modeling comparison | BCR        | dental       |
      | quick benefits comparison    | PCR        | dental       |
