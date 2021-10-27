@trinet @groupCreation @carlos
Feature: Create Groups
  As a BCT user
  I need to be able to create groups
  So I can manage those groups inside Quotepad

  @blocker
  Scenario Outline: Create a new group with the minimum required data
  Any BCT user with permissions should be able to create a new group
  with the minimum required data:
  - Company Name
  - Zip Code

    Given I login as a "<user>"
    And I create a new group with "minimum group data" and owner as "<owner>"
    Then A group should be successfully created

    Examples:
      | user              | owner              |
      | carrier_admin     | TriNet Sales       |
      | sales_executive   | Eric Brown         |
      | account_manager   | Automation Broker2 |
      | regional_director | Eric Brown         |
      | carrier_support   | Automation Broker2 |

  @blocker
  Scenario Outline: Create new group with a full set of data
  Any BCT user with permissions should be able to create a new group
  with a full set of data.

    Given I login as a "<user>"
    And I create a new group with "default group data" and owner as "<owner>"
    Then A group should be successfully created

    Examples:
      | user              | owner              |
      | carrier_admin     | TriNet Sales       |
      | sales_executive   | Eric Brown         |
      | account_manager   | Automation Broker2 |
      | regional_director | Eric Brown         |
      | carrier_support   | Automation Broker2 |

  @critical @wip
  Scenario: Group Owner should be selected before entering group information
