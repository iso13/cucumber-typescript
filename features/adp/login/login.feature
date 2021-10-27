@adp @login @wip
Feature: Login
  As a Producer
  I need to be able to log in
  So I can use the application

  Scenario Outline: Authenticate as a Bussiness Team User
    Given I login as a "<user>"
    Then For Bussiness Team I should be able to access groups and proposals
  @blocker
    Examples:
      | user            |
      | VP Underwriter  |
      | Inside Producer |

    Examples:
      | user                                 |
      | Outbound Producer                    |
      | Digital Producer                     |
      | Payhealth DM Producer 1              |
      | Account Specialist Sales Executive 1 |
      | ASM Sales Executive                  |

  Scenario Outline: Authenticate as a Support User
    Given I login as a "<user>"
    Then For Support user I should be able to access groups proposals and tools
  @blocker
    Examples:
      | user                  |
      | Sales OPS Underwriter |

    Examples:
      | user                             |
      | Tech Support Specialist Producer |
      | OE Underwriter                   |

  Scenario Outline: Authenticate as a Service Team Producer User
    Given I login as a "<user>"
    Then For Service Team Producer I should be able to access create group groups and proposals
  @blocker
    Examples:
      | user               |
      | Team Lead Producer |

    Examples:
      | user                             |
      | Payhealth Sales Executive        |
      | Client Services Manager Producer |
      | Relationship Manager Producer    |
      | Renewal Specialist Producer      |
      | Client Manager Producer          |
      | Director Producer                |
