@principal @proposals @addClassesToExcelOutput @excel @wip
Feature: Add Classes To Excel Output
  As a Requester
  I want to see classes in the Excel proposal output
  So that I can see which classes apply to the included plans

  Background:
    Given I login as a "Requester"
    And I have a group with "3" job classes
    And I have quoted plans with different number of assigned classes per plan
      | Vision | Vision Plan 1 | 1, 2    |
      | Vision | Vision Plan 2 | 1, 2, 3 |
    And I create a new proposal based on created quote(s)

  @critical
  Scenario: Downloaded proposal contains data about plans and their respective classes
    When I download a proposal
    Then the downloaded file should contain data about plans and their respective classes

  Scenario: TBD
