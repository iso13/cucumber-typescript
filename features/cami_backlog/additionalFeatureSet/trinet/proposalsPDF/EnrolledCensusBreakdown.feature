@proposalsPDF @enrolledCensusBreakdown @trinet @cami
Feature: Enrolled Census Breakdown
  As a User
  I need to see the my proposal valuable rate breakdown per WSE data
  So I can be aware of my costs per member

  Scenario: Confirm "Enrolled Census Breakdown" is displayed as title
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Validate Enrolled Census Breakdown page is not displayed for BCR proposals
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Validate Enrolled Census Breakdown page is not displayed when census count is more than 100
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Validate Enrolled Census Breakdown page is not displayed for Market PCR proposals
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Validate Contribution strategy and Funding Cap Details are displayed correctly for single/multi benefit program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that all employees has a complete first name and abbreviated second name
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that the plan selected is correctly displayed for all employees per product line
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that coverages Statuses ,Benefit Type and Benefit Program are displayed accurately
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that Non-Eligible members does not appear in this report.
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that for out of state members are Highlighted in red color in out of state column
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that ER, EE and total costs are correct for various contribution strategy per product line
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that the total monthly charge is correctly calculated
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that the total annual charge is correctly calculated
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown

  Scenario: Confirm that disclaimer text is displayed accurately
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the enrolled cost breakdown
