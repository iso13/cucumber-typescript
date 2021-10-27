@trinet @sideBySideCostBreakdown @wip @fernando
Feature: Benefit programs side-by-side cost breakdown report
  As a BCT user
  I want to see the Employer / Employee / Total cost breakdown per coverage tier for every Medical, Dental and Vision plan on my PCR proposals
  So that I can show the contributions by each benefit programs

  @critical
  Scenario: "Benefit Programs Side-by-Side Cost Breakdown" report is present for Medical, Dental and Vision quotes in multiple benefit programs group

  @critical
  Scenario: Benefit Programs SBS Cost Breakdown page for all PCR Standard Modeling quote is present after "Enrolled Census Breakdown" page in proposal

  @critical
  Scenario: Benefit Programs SBS Cost Breakdown page for all PCR Market Snapshot quote is present after Detail SBS Plan Comparison page in proposal

  @critical
  Scenario: Validate Appendix: Benefit Programs SBS Cost Breakdown page is generated with details for unmapped plans for all PCR Standard Modeling quote

  @critical
  Scenario: Non-mapped plans for PCR Standard Modeling quotes should displayed but not highlighted on Benefit Programs SBS Cost Breakdown report

  @critical
  Scenario: The following values should display for every coverage tier [Employer Cost / Employee Cost and Total Cost]

  @critical
  Scenario: Contribution strategy without Funding cap displays correct format for plans on Appendix and Benefit Programs SBS Cost Breakdown reports

  @critical
  Scenario: $ Funding cap plan details should display in correct format for every plan on Appendix and Benefit Programs SBS Cost Breakdown reports

  @critical
  Scenario: Funding cap plan details should display in correct format for every plan on Appendix and Benefit Programs SBS Cost Breakdown reports

  @critical
  Scenario: For contribution strategy EE, % - Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans

  @critical
  Scenario: For contribution strategy EE, $ - Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans

  @critical
  Scenario: For contribution strategy EE, % - Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans

  @critical
  Scenario: For contribution strategy EE and $ - Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans

  @critical
  Scenario: For contribution strategy ER, % and Funding cap - Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans
  @critical
  Scenario: For contribution strategy ER, % and Funding $ cap-Employer, Employee and Total Costs should be correct for Medical, Dental and Vision plans

  @critical
  Scenario: C/R plan details is display only for Medical standard modeling quotes on Appendix and Benefit Programs SBS Cost Breakdown report

  @critical
  Scenario: N/A is display for Program ,Total ,Employer ,Employee Monthly Charge for PCR Standard Modeling quote on Appendix report

  @critical
  Scenario: Validate the ER/EE/Total Cost breakdown cost are accurate according to the funding and contribution strategy selected

  @critical
  Scenario: Validate ER/EE/Total monthly cost breakdown displays and is accurate for each benefit program

  @critical
  Scenario: Validate contribution strategy data should display as defined in MDV quotes

  @critical
  Scenario: Validate counts per coverate tier displays properly for each plan and benefit program displayed in the report

  @critical
  Scenario: TOTAL MONTHLY CHARGE on Benefit Programs SBS Cost Breakdown report is sum total of monthly charges for each benefit program

  @critical
  Scenario: EMPLOYER MONTHLY CHARGE on Benefit Programs SBS Cost Breakdown report is sum total of Employer monthly charges for each benefit program

  @critical
  Scenario: EMPLOYEE MONTHLY CHARGE on Benefit Programs SBS Cost Breakdown report is sum total of Employee monthly charges for each benefit program

  @critical
  Scenario: After census modification when proposal is generated with out of date quotes, Employer, Employee and total cost should get updated

  @critical
  Scenario: After benefit programs modification when proposal is generated with out of date quotes, Employer, Employee and total cost should get updated

  @critical
  Scenario: Calculations for employer, employee and total cost are correctly updated when new proposal is generated with an out of date quote.

  @critical
  Scenario: Calculations for employer, employee and total cost should be updated accordingly when a proposal has been requoted

  @critical
  Scenario: Benefit programs not mapped to a census member should not display on "Benefit Programs Side-by-Side Cost Breakdown" report

  @critical
  Scenario: Only for multi benefit program groups, on Requoting BCR proposal to PCR , should display Benefit Programs SBS Cost Breakdown

  @critical
  Scenario: Plans not selected on quote creation are not displayed on both Benefit Programs SBS Cost Breakdown and Appendix page

  Scenario: "Benefit Programs Side-By-Side Cost Breakdown" should be display with correct title on proposal for each Product line

  Scenario: Disclaimer should display at the bottom on "Appendix: Benefit Programs Side-By-Side Cost Breakdown" report for Market Snapshot quotes

  Scenario: Disclaimer should not display at the bottom on "Appendix: Benefit Programs Side-By-Side Cost Breakdown" report for Standard Modeling quotes

  Scenario: Appendix: Benefit Programs SBS Cost Breakdown page displays when for PCR Standard modeling quote, Include Plan Appendix is selected

  Scenario: Benefit program details are present on both Benefit Programs SBS Cost Breakdown and Appendix page,and placed above contribution strategy

  Scenario: Plan names should be displayed next to "RATES & CHARGES" row for each plan

  Scenario: Plan with members mapped to them should be highlighted

  Scenario: "Quote Name" should display top-right aligned for each report in the report

  Scenario: Coverage tier counts are displayed next to the benefit program name for each benefit program on Benefit Programs SBS Cost Breakdown page

  Scenario: Coverage tiers rows should display in correct order below "RATES & CHARGES" column on Benefit Programs SBS Cost Breakdown

  Scenario: Coverage tiers rows should display in correct order below "RATES & CHARGES" column on Appendix: Benefit Programs SBS Cost Breakdown reports

  Scenario: Validate the correct icon is displayed in the report next to the title for Medical

  Scenario: Validate the correct icon is displayed in the report next to the title for Dental

  Scenario: Validate the correct icon is displayed in the report next to the title for Vision

  Scenario: Validate the correct icon is displayed in the report next to the title for Life

  Scenario: Current plan should display on Benefit Programs SBS Cost Breakdown but not on Appendix: Benefit Programs SBS Cost Breakdown

  Scenario: C/R plan shouldn't display on Benefit Programs SBS Cost Breakdown and Appendix: Benefit Programs SBS Cost Breakdown for PCR MS proposals

  Scenario: Age-rated C/R plan doesn't display on Benefit Programs SBS Cost Breakdown and Appendix:Benefit Programs SBS Cost Breakdown for PCR proposals
