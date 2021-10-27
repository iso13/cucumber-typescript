@duplicatePlan @cami
Feature: Duplicate Plan
  As a User
  I need the ability to duplicate current and renewal
  So that I can fully manage the new and existing Current and Renewal Plans

  Scenario: Duplicate existing plans
    Given I login as a "<user_role>"
    When I have an existing plan
    Then should be able to duplicate an existing plan
