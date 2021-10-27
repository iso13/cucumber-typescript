@importGlobalPlan @adp @globalPlan @cami
Feature: Import Global Plans
  As a User
  I want to be able to import global plans
  So that I can reuse custom plans across multiple groups

  * Plans imported and altered should not affect the original plan
  * Benefits should be displayed with their values in the list for medical, dental, vision, and life
  * A limited number of plans should be displayed per page

  Scenario: Import Global Medical Plan into a group
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to import the "<global medical plan>" into a group

  Scenario: Import Global Dental Plan into a group
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to import the "<global dental plan>" into a group

  Scenario: Import Global Vision Plan into a group
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to import the "<global vision plan>" into a group

  Scenario: Import Global Life Plan into a group
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to import the "<global life plan>" into a group

  Scenario: Import several global plans at once
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to import several plans into a group
