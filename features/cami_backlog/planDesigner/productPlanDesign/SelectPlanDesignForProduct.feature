@planDesigner @selectPlanDesignForProductLine @cami
Feature: Select Plan Designs for a Product Line
  As a User
  I need to be able to select different versions of a plan design
  So that I can create custom plans specific to my needs

  Scenario Outline: Select plan design <view>
    Given I login as a "userRole"
    And I have existing plans
    When I change to "<view>"
    Then I should be in "<view>"
    Examples:
      | view             |
      | Plan View        |
      | Plan Preset      |
      | Contract Version |
