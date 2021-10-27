@uploadGlobalPlan @globalPlan @cami
Feature: Upload Global Plan
  As a User
  I want to be able to upload documents to a Global Plan
  So I can manage the Global Plan details

  * What documents are valid for upload?

  Scenario: Upload single document to a global plan
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to upload documents to my global plan

  Scenario: Upload multiple documents to a global plan
    Given I login as a "userRole"
    When I open the global plan designer
    Then I should be able to upload several documents to my global plan
