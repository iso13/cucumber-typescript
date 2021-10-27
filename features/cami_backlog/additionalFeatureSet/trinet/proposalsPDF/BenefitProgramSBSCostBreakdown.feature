@proposalPDF @benefitProgramsSBSCostBreakdown @trinet @cami
Feature: Benefit Programs SBS Cost Breakdown
  As a User
  I want to see the Employer / Employee / Total cost breakdown per coverage tier for all plan on proposals
  So that I can show the contributions by each benefit programs for all product lines

  Scenario: "Benefit Programs Side-by-Side Cost Breakdown" report is present for Medical, Dental and Vision quotes in multiple benefit programs group
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Benefit Programs SBS Cost Breakdown page for all PCR Standard Modeling quote is present after "Enrolled Census Breakdown" page in proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Benefit Programs SBS Cost Breakdown page for all PCR Market Snapshot quote is present after Detail SBS Plan Comparison page in proposal
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate Appendix: Benefit Programs SBS Cost Breakdown page is generated with details for unmapped plans for all PCR Standard Modeling quote
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Non-mapped plans for PCR Standard Modeling quotes should displayed but not highlighted on Benefit Programs SBS Cost Breakdown report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: The following values should display for every coverage tier [Employer Cost / Employee Cost and Total Cost]
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Contribution strategy without Funding cap displays correct format for plans on Appendix and Benefit Programs SBS Cost Breakdown reports
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: $ Funding cap plan details should display in correct format for every plan on Appendix and Benefit Programs SBS Cost Breakdown reports
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Funding cap plan details should display in correct format for every plan on Appendix and Benefit Programs SBS Cost Breakdown reports
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate For contribution strategy  Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: C/R plan details is display only for Medical standard modeling quotes on Appendix and Benefit Programs SBS Cost Breakdown report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: N/A is display for Program ,Total ,Employer ,Employee Monthly Charge for PCR Standard Modeling quote on Appendix report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate the ER/EE/Total Cost breakdown cost are accurate according to the funding and contribution strategy selected
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate ER/EE/Total monthly cost breakdown displays and is accurate for each benefit program
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate contribution strategy data should display as defined in MDV quotes
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate counts per coverate tier displays properly for each plan and benefit program displayed in the report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: TOTAL MONTHLY CHARGE ,EMPLOYER MONTHLY CHARGE , EMPLOYEE MONTHLY CHARGE  on Benefit Programs SBS Cost Breakdown report is displayed accurately
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: After census modification when proposal is generated with out of date quotes, Employer, Employee and total cost should get updated
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: After benefit programs modification when proposal is generated with out of date quotes, Employer, Employee and total cost should get updated
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Calculations for employer, employee and total cost are correctly updated when new proposal is generated with an out of date quote.
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Calculations for employer, employee and total cost should be updated accordingly when a proposal has been requoted
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Benefit programs not mapped to a census member should not display on "Benefit Programs Side-by-Side Cost Breakdown" report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Only for multi benefit program groups, on Requoting BCR proposal to PCR , should display Benefit Programs SBS Cost Breakdown
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Plans not selected on quote creation are not displayed on both Benefit Programs SBS Cost Breakdown and Appendix page
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: "Benefit Programs Side-By-Side Cost Breakdown" should be display with correct title on proposal for each Product line
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Disclaimer should display at the bottom on "Appendix: Benefit Programs Side-By-Side Cost Breakdown" report for Market Snapshot quotes
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Disclaimer should not display at the bottom on "Appendix: Benefit Programs Side-By-Side Cost Breakdown" report for Standard Modeling quotes
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Appendix: Benefit Programs SBS Cost Breakdown page displays when for PCR Standard modeling quote, Include Plan Appendix is selected
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Benefit program details are present on both Benefit Programs SBS Cost Breakdown and Appendix page,and placed above contribution strategy
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Plan names should be displayed next to "RATES & CHARGES" row for each plan
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Plan with members mapped to them should be highlighted
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: "Quote Name" should display top-right aligned for each report in the report
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Coverage tier counts are displayed next to the benefit program name for each benefit program on Benefit Programs SBS Cost Breakdown page
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Coverage tiers rows should display in correct order below "RATES & CHARGES" column on Benefit Programs SBS Cost Breakdown
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Coverage tiers rows should display in correct order below "RATES & CHARGES" column on Appendix: Benefit Programs SBS Cost Breakdown reports
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Validate the correct icon is displayed in the report next to the title for product line
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Current plan should display on Benefit Programs SBS Cost Breakdown but not on Appendix: Benefit Programs SBS Cost Breakdown
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: C/R plan shouldn't display on Benefit Programs SBS Cost Breakdown and Appendix: Benefit Programs SBS Cost Breakdown for PCR MS proposals
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"

  Scenario: Age-rated C/R plan doesn't display on Benefit Programs SBS Cost Breakdown and Appendix:Benefit Programs SBS Cost Breakdown for PCR proposals
    Given I login as an "userRole"
    And I have an existing proposal
    When I view the proposal
    Then I should have the "Benefit Program SBS Cost Breakdown"
