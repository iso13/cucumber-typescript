@trinet @sortOrder @carlos @wip
Feature: Sort Order
  As a Broker
  I need the ability to change the sort order of the plans that I am viewing
  So that I can build a compelling presentation

  @blocker
  Scenario Outline: Manual sort order of PCR Medical plans by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR Medical quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order on PCR Dental plans by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR Dental quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of PCR Vision plans using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR Vision quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of PCR Life plans using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR Life quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of BCR Medical Plans by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a BCR Medical quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of BCR Dental by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a BCR Dental quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of BCR Vision by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a BCR Vision quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order of BCR Life by using the "<option>"
    Given I login as a 'Carrier Admin'
    When I start the process to create a BCR Life quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @blocker
  Scenario Outline: Manual sort order by using the 'change position link'
    Given I login as a 'Carrier Admin'
    When I start the process to create a BCR life quote
    And I am on 'Selected Plans' screen
    And I sort a plan manually by using the '<action>' '<plan name>' from '<option>'
    Then The plan is moved properly and 'custom' displays as selection
    Examples:
      | option               | action                | plan name          |
      | change position link | move to front         | n/a                |
      | change position link | move to back          | n/a                |
      | change position link | move to after         | HDHP 6350 South CA |
      | < button             | move one plan back    | n/a                |
      | > button             | move one plan forward | n/a                |

  @critical
  Scenario Outline: 'Custom' should not be a selectable option for Sort By Dropdown
    Given I login as a 'Carrier Admin'
    When I start the process to create a '<quote type>' '<product line>' quote
    And I am on '<screen name>' screen
    Then The 'custom' option should not display for 'Sort By' dropdown
    Examples:
      | quote type                       | product line | screen name     |
      | benefits market snapshot - bcr   | medical      | available plans |
      | quick benefits comparision - pcr | medical      | selected plans  |
      | Benefits Market Snapshot - bcr   | dental       | available plans |
      | quick benefits comparision - pcr | dental       | selected plans  |
      | quick benefits comparision - pcr | vision       | available plans |
      | quick benefits comparision - bcr | vision       | selected plans  |
      | Benefits Market Snapshot - bcr   | life         | available plans |
      | quick benefits comparision - bcr | life         | selected plans  |

  @critical
  Scenario Outline: Sort Plans for PCR quotes by using the options from 'Sort By' dropdown on Selected Plans screen
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR '<product line>' quote
    And I am on 'Available Plans' screen
    And I sort the plans displayed by '<option>'
    Then Plans should display sorted by '<option>'
    Examples:
      | product line | option                 |
      | medical      | by carrier             |
      | dental       | by carrier / Plan type |
      | vision       | plan type              |
      | life         | lowest to highest cost |
      | medical      | highest to lowest cost |

  @critical
  Scenario Outline: Sort Plans for PCR quotes by using the options from 'Sort By' dropdown on Selected Plans screen
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR '<product line>' quote
    And I am on 'Selected Plans' screen
    And I sort the plans displayed by '<option>'
    Then Plans should display sorted by '<option>'
    Examples:
      | product line | option                 |
      | medical      | by carrier             |
      | dental       | by carrier / Plan type |
      | vision       | plan type              |
      | life         | lowest to highest cost |
      | medical      | highest to lowest cost |

  @critical
  Scenario Outline: Sort Plans for BCR quotes by using the options from 'Sort By' dropdown on Selected Plans screen
    Given I login as a 'Carrier Admin'
    When I start the process to create a PCR '<product line>' quote
    And I am on 'Selected Plans' screen
    And I sort the plans displayed by '<option>'
    Then Plans should display sorted by '<option>'
    Examples:
      | product line | option                 |
      | medical      | by carrier             |
      | dental       | by carrier / Plan type |
      | vision       | plan type              |
      | life         | lowest to highest cost |
      | medical      | highest to lowest cost |

  @critical
  Scenario Outline: Sort selection is reflected on the proposal output for PCR modeling quotes
    Given I login as a 'Carrier Admin'
    When I create a new proposal '<data filename>'
    Then Proposal output should reflect the sort selected
    Examples:
      | data filename                             |
      | pcr_medical_sort_by_carrier               |
      | pcr_medical_sort_by_carrier_plan_type     |
      | pcr_dental_sort_by_plan_type              |
      | pcr_vision_sort_by_lowest_to_highest_cost |
      | pcr_life_sort_by_highest_to_lowest_cost   |
      | pcr_dental_sort_by_carrier                |
      | pcr_dental_sort_by_carrier_plan_type      |
      | pcr_vision_sort_by_plan_type              |
      | pcr_life_sort_by_lowest_to_highest_cost   |
