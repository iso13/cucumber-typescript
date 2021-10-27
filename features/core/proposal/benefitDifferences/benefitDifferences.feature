@core @proposal @benefitDifferences @wip @ferChacon
Feature: Benefit differences
  As a Broker
  I want my benefit difference report from my quote to display on the proposal
  So that I can make the best decision when selecting what plan to recommend to my client

  Scenario: Quote name and report name should be displayed in the top right of each benefit differences page

  Scenario: A maximum of five plans should be displayed per benefit difference report page (including the base plan)

  Scenario: Each plan should have their plan name and carrier/marketplace logo displayed above their plan data

  Scenario: The following benefits and benefit data should be displayed for each plan: Network Name, Network Size, Deductible Single, Deductible Single OON, Deductible Family, Deductible Family OON, OOP Max Single, OOP Max Single OON, OOP Family Max, OOP Family Max OON, Co-insurance, Co-insurance OON, Doctor Visits, Specialist Visits, Lab & X-Ray, Emergency Room Visit, Urgent Care Visit, Outpatient Facility, Outpatient Surgery, Inpatient Hospital, Rx Ded(Non-Generic), Rx Tier 1, Rx Tier 2, Rx Tier 3, Rx Tier 4

  Scenario: Benefits with no differences should not show any benefit difference icon

  Scenario: Benefits that can not be compared should show a yellow icon with a not-equal-to sign

  @critical
  Scenario: Benefits with an improvement should show a green arrow and, if applicable, the %/$ improvement

  @critical
  Scenario: Benefits with a decrease in quality should show a red arrow and, if applicable, the %/$ change
