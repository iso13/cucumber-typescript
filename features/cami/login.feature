@cami @login
Feature: Login
    As a User
    I would like to log into the application
    So I have access to the application features

    * Need to define the user roles

  @blocker
  Scenario Outline: Authenticate as a Admin User
    Given I login as a "<user>"
    Then For Admin user I should be able to access create groups groups proposals and tools
    Examples:
      | user  |
      | admin |

  @blocker
  Scenario Outline: Authenticate as a Broker User
    Given I login as a "<user>"
    Then For Broker user I should be able to access create groups groups proposals and video tutorial
    Examples:
      | user      |
      | requester |

  @blocker
  Scenario Outline: Authenticate as a Sales executive and Underwriter User
    Given I login as a "<user>"
    Then For Service Team Producer I should be able to access create group groups and proposals
    Examples:
      | user            |
      | sales_executive |
      | underwriter     |

  @critical
  Scenario: Login with invalid credentials
    Given I launch the application
    When I login with invalid credentials
    Then I should not be able to access QuotePad
