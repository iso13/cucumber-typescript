@createPreDecisionProposal @adp @cami
Feature: Create Pre Decision Proposal
  As a User
  I want to create pre decision proposals
  So that I can propose new quotes for clients to review

  Background:
    Given I login as a "userRole"

  Scenario Outline: Create a pre decision proposal with a published <product> quote
    And I have a published "medical" quote
    When I create a proposal with a published <product> quote
    Then A proposal should be successfully created for my group
    Examples:
      | product                                           |
      | 4-Tier Composite medical standard modeling        |
      | ACA Age-Rated medical standard modeling           |
      | custom 4-Tier Composite medical standard modeling |
      | custom ACA Age-Rated medical standard modeling    |
      | published medical market snapshot                 |
      | custom medical market snapshot                    |

  Scenario Outline: Create a pre decision proposal with a published 4-Tier dental quote
    And I have a published "dental" quote
    When I create a proposal with a published <product> quote
    Then A proposal should be successfully created for my group
    Examples:
      | product                                           |
      | 4-Tier                                            |
      | 3-Tier                                            |
      | custom 4-Tier Composite medical standard modeling |
      | custom ACA Age-Rated medical standard modeling    |
      | published medical market snapshot                 |
      | custom medical market snapshot                    |

  Scenario Outline: Create a pre decision proposal with a published <product> vision quote
    And I have a published "vision" quote
    When I create a proposal with a published <product> quote
    Then A proposal should be successfully created for my group
    Examples:
      | product |
      | 4-Tier  |
      | 3-Tier  |

  Scenario Outline: Create a pre decision proposal with a published <product> life quote
    And I have a published "life" quote
    When I create a proposal with a published <product> quote
    Then A proposal should be successfully created for my group
    Examples:
      | product           |
      | 4-Tier            |
      | AD&D not included |

  Scenario Outline: Create a pre decision proposal with medical <type> quote
    And I have a published medical quote
    When I create a proposal with a published <type> quote
    Then A proposal should be successfully created for my group
    Examples:
      | type      |
      | current   |
      | renewal   |
      | real time |

  Scenario Outline: Create a pre decision proposal with dental <type> quote
    And I have a published dental quote
    When I create a proposal with a published <type> quote
    Then A proposal should be successfully created for my group
    Examples:
      | type      |
      | current   |
      | renewal   |
      | real time |

  Scenario Outline: Create a pre decision proposal with vision <type> quote
    And I have a published vision quote
    When I create a proposal with a published <type> quote
    Then A proposal should be successfully created for my group
    Examples:
      | type      |
      | current   |
      | renewal   |
      | real time |

  Scenario Outline: Create a pre decision proposal with life <type> quote
    And I have a published life quote
    When I create a proposal with a published <type> quote
    Then A proposal should be successfully created for my group
    Examples:
      | type      |
      | current   |
      | renewal   |
      | real time |

  Scenario Outline: Create a pre decision proposal with <product> quote
    And I have a published <product> quote
    When I create a proposal with a published quote
    Then A proposal should be successfully created for my group
    Examples:
      | product |
      | medical |
      | dental  |
      | vision  |
      | life    |
