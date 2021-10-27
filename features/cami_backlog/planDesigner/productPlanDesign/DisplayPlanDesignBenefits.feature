@planDesigner @displayPlanDesignBenefits @cami
Feature: Display Plan Design Benefits
  As a User
  I want to be able to see correct set of benefits and respective values available for them
  So I can create correct custom plans for further quoting

  Scenario: Benefits with defined 'value' properties should have that value set by default

  Scenario Outline: Benefit <text> property should apply to its value

    Examples:
      | text     |
      | number   |
      | currency |
      | percent  |

  Scenario Outline: Benefit of <pd_type> type should be represented by <element_type> element
    Examples:
      | pd_type | element_type |
      | radio   | radio-group  |
      | select  | dropdown     |
      | range   | slider       |
      | text    | input field  |

  Scenario: Benefits with the property 'visible' set to 'true' should be visible

  Scenario: Benefits with the property 'detailed' set to 'true' should be hidden by default

  Scenario: Benefits with the property 'readonly' set to 'true' should be uneditable

  Scenario: Benefits that have 'options' array should have all the listed options available for selection

  Scenario: All benefits should display in the order defined by 'seq_benefit' property
