@publishPlans @planlibrary @adp @cami
Feature: Publish Plans
  As a User
  I want the ability to publish custom plans
  So I can make them available in group plan designer

  Scenario Outline: Publish plans with start today and ends today
    Given I login as a "userRole"
    And I have a plan
    When I have a plan that starts "<start>" and ends "<end>"
    Then plans should be "<status>"
    Examples:
      | start           | end                 | status      |
      | today           | today               | published   |
      | today           | end tomorrow        | published   |
      | today           | end of year         | published   |
      | early this year | end today           | published   |
      | early this year | end of the year     | published   |
      | today           | end yesterday       | unpublished |
      | today           | end early this year | unpublished |
      | end of the year | end early this year | unpublished |
