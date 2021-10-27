@principal @census @censusValidation @validateCensusbyEE
Feature: Validate Census by EE
  As a Requester
  I need to be notified, if my census doesn't comply with requirements to a minimum number of eligible employees per product
  So that I can choose to remove the product from the group or undo the latest census changes to make product valid again

  Background:
    Given I login as a "Requester"
    And I have a group with census created with
      | group_data          | census_data            |
      | Group_CA_3571_5_ALL | Template_5EEs_1cl.xlsx |

  @critical @dev @test
  Scenario: Dialog shows up, if I delete members manually and number of eligible EEs drops below 3
    When I delete employees from census, so there are only "2" employees left
    Then warning dialog about low number of employees should appear
    And warning dialog about low number of employees should contain the message:
      | The minimum number of lives required to quote the following products is not met: |
    And the dialog should contain the invalidated products
      | Dental                |
      | Vision                |
      | Group Term Life       |
      | Short-Term Disability |
      | Long-Term Disability  |

  @critical
  Scenario: Dialog shows up, when the total number of lives drops below minimum required for combined coverage
    When I delete employees from census, so there are only "4" employees left
    Then warning dialog about low number of employees should appear
    And the dialog should contain the invalidated products
      | Critical Illness    |
      | Voluntary Term Life |
      | Accident            |

  @critical @dev @test
  Scenario Outline: Dialog shows up, when the total number of lives drops to <number_of> for <product> stand-alone coverage
    When I unselect all product lines except <product>
    And I delete employees from census, so there are only "<number_of>" employees left
    Then warning dialog about low number of employees should appear
    And warning dialog about low number of employees should contain the message:
      | The minimum number of lives required to quote the following products is not met: |
    And the dialog should contain the invalidated products
      | <product> |
    Examples:
      | number_of | product               |
      | 4         | Short-Term Disability |
      | 4         | Vision                |
      | 4         | Long-Term Disability  |
      | 4         | Group Term Life       |
      | 4         | Voluntary Term Life   |

  @critical
  Scenario Outline: Dialog shows up, when the minimum number of eligible employees required for <product> product is not met
    When I populate census "<field>" field with "Non-eligible" value for "3" employees
    And I try to save the census
    Then warning dialog about low number of employees should appear
    And the dialog should contain the invalidated products
      | <product> |
    Examples:
      | field           | product |
      | Vision Election | Vision  |
      | Dental Election | Dental  |

  @major @dev @test
  Scenario: Dialog shows up, if I overwrite census and number of eligible EEs drops below 3
    When I overwrite a census with "Template_2EEs" selecting "Principal Census Template" as template type
    Then warning dialog about low number of employees should appear
    And warning dialog about low number of employees should contain the message:
      | The minimum number of lives required to quote the following products is not met: |
    And the dialog should contain the invalidated products
      | Dental                |
      | Vision                |
      | Group Term Life       |
      | Critical Illness      |
      | Short-Term Disability |
      | Long-Term Disability  |
      | Voluntary Term Life   |
      | Accident              |

  @major
  Scenario Outline: User can agree with the latest census updates and automatically de-select invalidated <product_lines> products
    When I delete employees from census, so there are only "<number_of>" employees left
    And I "Accept" the changes on the warning dialog
    Then <product_lines> display unselected on Group Profile page
    Examples:
      | number_of | product_lines                                    |
      | 4         | CI, VTL, Accident                                |
      | 2         | Dental, STD, LTD, GTL, Vision, VTL, CI, Accident |

  @major
  Scenario: User can go back to census page and automatically roll back the removing of the last deleted employee
    When I delete employees from census, so there are only "4" employees left
    And I "Undo" the changes on the warning dialog
    Then the last deleted employee should re-appear so there are "5" employees

  @major
  Scenario: User can go back to census page and automatically roll back the latest changes made to product elections and other fields
    When I update all data for the Employee "1"
    And I populate census "Dental Election" field with "Non-eligible" value for "3" employees
    And I try to save the census
    And I "Undo" the changes on the warning dialog
    Then the eligible employees should re-appear as "5" eligible employees
