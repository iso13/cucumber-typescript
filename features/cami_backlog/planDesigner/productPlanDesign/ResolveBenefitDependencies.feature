@planDesigner @resolveBenefitDependencies @cami
Feature: Resolve Benefit Dependencies
  As a User
  I want plan design benefits to display and behave correctly depending on defined business rules
  So that I'm prevented from incorrect input or allowed to set additional values

  * Perform 'show/hide' action on a benefit
  * Perform 'readonly' action on a benefit
  * Perform 'invalidate' action on a benefit
  * Perform 'set' action on benefit property
  * Perform 'set' action on benefit value/readable value
  * Perform 'set' action on benefit available option values

  Scenario Outline: Apply <condition_type> type of a condition to a benefit
    Examples:
      | condition_type |
      | AND            |
      | OR             |
      | comparison     |

  Scenario Outline: Apply <operand> operand of <operand_type> instance to resolve dependency condition
    Examples:
      | operand              | operand_type  |
      | another benefit      | plan_designer |
      | string               | plan_designer |
      | number               | constant      |
      | another operand      | arithmetic    |
      | role                 | user          |
      | total employee count | group         |
      | region               | group         |

  Scenario Outline: Apply <operand_type> operator of arithmetic condition to resolve dependency condition
    Examples:
      | operand_type |
      | +            |
      | -            |
      | /            |
      | *            |
      | <            |
      | >            |
      | <=           |
      | >=           |
      | =            |
      | !=           |
      | contains     |
