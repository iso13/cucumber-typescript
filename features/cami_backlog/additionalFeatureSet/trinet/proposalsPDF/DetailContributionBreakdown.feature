@proposalPDF @detailContributionBreakdown @trinet @cami
Feature: Detail Contribution BreakDown
  As a User
  I need to be able to see the contributions for each benefit program I set when quoting
  So I can be aware of my costs per benefit program on proposal

  * These values should be evaluated in the DB and have a single scenario tested through the UI

  Scenario: Validate quote details for different contribution strategies are displayed accurately for all product lines for each benefit program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Market benefit Proposal ,ER ,EE charge for product line is total of eligible lowest cost plan per employee per benefit Program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Market benefit Proposal, the total charge is the sum of EE cost and ER cost per benefit type
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Benefit comparison proposal, ER charge for product line is total of eligible lowest cost plan per employee per benefit Program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Benefit comparison proposal, EE charge for product line is total of eligible lowest cost plan per employee per benefit Program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Benefit comparison proposal, the total charge is the sum of EE cost and ER cost per benefit type
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that for a benefit comparison proposal for medical standard modeling, the ER , EE ,total charge are accurate
  # based of member-plan assignments and the contributions strategy that is set for the benefit program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: For Life benefit type, the ER ,EE and total charge are accurately displayed
  # based of the benefit program the employees were enrolled and the Plan assigned to it.
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the employer calculated
  with the The sum of all the ER charges of the benefit types
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the employee calculated
  with the The sum of all the EE charges of the benefit types
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that in the footer of every benefit program table you see the Benefit Program total charges for the
  sum of ER and EE benefit program total charges
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that at the end of the report you see the total charges for employer, the total charges
  for employee and total charges of the sum of employer and employee charges.
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you change the zip code of some members and then re-quote you see all rates are calculated according to the new members
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you remove some members and then re-quote you see all rates are calculated according to the left members and also
  WSE count get updated
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you change any contribution strategy in the original quote and then re-quote, such contribution strategy and
  their corresponding rates would be reflected in the new proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you add a benefit program and then you re-quote tne new Benefit Program will be reflected in the proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you remove a benefit program and then you re-quote tne removed Benefit Program wil not be present in the proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you change the benefit program name and then you re-quote tne changed Benefit Program will be reflected in the proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you re-quote from PCR to PCR you do not see any change in the page of new proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you re-quote from BCR to PCR and all detail contributions break down conditions for being displayed are met, you
  see the page.
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm that when you re-quote from PCR to BCR you do not see the page being displayed
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm this section does not appear for BCR
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm you see the page immediately after the Recommended Quotes page
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm you see as many benefit programs tables as mapped benefit programs you have
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm disclaimer is always displayed at the bottom of the page
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm you see benefit type in the following order for a benefit program table: medical, dental, vision, life
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown

  Scenario: Confirm funding cap plan is displayed with the selected plan name or with N/A if the strategy does not apply
  for all product lines of each benefit program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the detail contribution breakdown
