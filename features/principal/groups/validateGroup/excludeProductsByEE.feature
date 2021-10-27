@principal @groups @validateGroup @excludeProductsByEe
Feature: Exclude Product Lines by Number of EE
  As a Requester
  I should not be able to select product lines that are unavailable for groups with certain number of eligible employees
  So I cannot quote such products and don't do excessive work which will be declined eventually

  Background:
    Given I login as a "Requester"
    And start creating new group
    And I populate some group profile fields with data
      | group without products |

  @blocker
  Scenario Outline: Select product lines (<available>), if group has at least <number_of> eligible employees
    When I input <number_of> eligible employees
    Then <available> products should be available for selection
    And <unavailable> products should not be available for selection

    Examples:
      | number_of | available                                        | unavailable       |
      | 3         | Dental, STD, LTD, GTL, Vision                    | VTL, CI, Accident |
      | 5         | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident | None of the       |

  @blocker
  Scenario: Select product lines without restrictions, if group has not more than 100 eligible employees
    When I input 100 eligible employees
    Then Dental, STD, LTD, GTL, Vision, VTL, CI, Accident products should be available for selection

  @critical
  Scenario Outline: Select product line (<product>) as stand-alone product, if group has at least <number_of> eligible employees
    When I input <number_of> eligible employees
    And I select <product> line
    And save a group
    Then A group should be successfully created

    Examples:
      | number_of | product |
      | 3         | Dental  |
      | 5         | STD     |
      | 5         | Vision  |
      | 5         | LTD     |
      | 5         | VTL     |
      | 5         | GTL     |

  @critical
  Scenario Outline: Exclude product line (<product>) as stand-alone product at any time
    When I input 100 eligible employees
    And I select <product> line
    And save a group
    Then group cannot be saved, error dialog with the message "<message>" pops up

    Examples:
      | product  | message                                                     |
      | Accident | Accident is not available for stand-alone coverage.         |
      | CI       | Critical Illness is not available for stand-alone coverage. |

  @blocker
  Scenario Outline: Exclude product lines (decline to quote) (<unavailable>), if group contains only <number_of> eligible employees
    When I input <number_of> eligible employees
    Then <unavailable> products should not be available for selection

    Examples:
      | number_of | unavailable                                      |
      | 2         | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |
      | 4         | VTL, CI, Accident                                |

  @critical
  Scenario Outline: Exclude <product> product line (decline to quote) (<product>) as stand-alone product, if group contains only <number_of> eligible employees
    When I input <number_of> eligible employees
    And I select <product> line
    And save a group
    Then group cannot be saved, error dialog with the message "<message>" pops up

    Examples:
      | number_of | product | message                                                          |
      | 4         | STD     | Short-Term Disability is not available for stand-alone coverage. |
      | 4         | Vision  | Vision is not available for stand-alone coverage.                |
      | 4         | LTD     | Long-Term Disability is not available for stand-alone coverage.  |
      | 4         | GTL     | Group Term Life is not available for stand-alone coverage.       |

  @blocker
  Scenario Outline: Exclude product lines (all: <unavailable>), if group has more than 100 eligible employees
    When I input 101 eligible employees
    Then <unavailable> products should not be available for selection
    And "<message>" should be displayed under the Number of Eligible Lives entry box

    Examples:
      | unavailable                                      | message                                            |
      | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident | Please contact your local sales office for rating. |
