@principal @proposals @excel @displayProposalDataOnExcel
Feature: Display Proposal Data On Excel
  As a Requester
  I want to be able to see all the data about my plans/quotes on Excel proposal output
  So that I can present all that information to my client

  Background:
    Given I login as a "Requester"

  @critical @wip
  Scenario: Every product line displays on its respective sheet of Excel proposal
    And I have a proposal created for few product lines:
      | mcv plan 1      |
      | gtl plan 1      |
      | accident plan 1 |
      | dental plan 1   |
      | std plan 1      |
      | vtl plan 1      |
      | ltd plan 1      |
      | ci plan 1       |
    When I download my proposal in Excel format
    Then I should be able to see all the product lines on its respective excel sheet:
      | Vision   |
      | Life     |
      | Accident |
      | Dental   |
      | STD      |
      | VTL      |
      | LTD      |
      | CI       |

  @critical @mvp1 @PFG-1477 @QUOTE-367
  Scenario Outline: Basic group info displays at the top of <product> product line sheet of Excel proposal
    And I have a proposal
      | <plan> |
    When I download my proposal in Excel format
    Then Basic group info should display on the <product> proposal
    Examples:
      | product  | plan            |
      #| MCV      | mcv plan 1      |
      #| GTL      | gtl plan 1      |
      | Accident | accident plan 1 |
      #| Dental   | dental plan 1   |
      #| STD      | std plan 1      |
      | VTL      | vtl plan 1      |
      #| LTD      | ltd plan 1      |
      | CI       | ci plan 1       |

  @blocker @mvp1 @QUOTE-333 @QUOTE-367
  Scenario Outline: Plan benefits display for <product> product on Excel proposal
    And I have a proposal
      | <plan> |
    When I download my proposal in Excel format
    Then Both basic and detailed benefits of "<plan>" should display on the "<product>" proposal
    Examples:
      | product  | plan                      |
      #| MCV      | mcv plan 1                       |
      #| GTL      | gtl plan 1                       |
      #| STD      | std plan 1                       |
      #| STD      | std plan voluntary no commission |
      | VTL      | vtl plan 1                |
      | Accident | accident plan 1           |
      #| LTD      | ltd plan 1                       |
      #| LTD      | ltd voluntary plan               |
      | CI       | ci plan heaped commission |
      | CI       | ci plan 1                 |

  @critical @mvp1 @wip
  Scenario Outline: Plan benefits display on <product> Excel proposal for a group with less than 10 EEs
    And I have a group with census created with
      | group_data          | census_data            |
      | Group_CA_3571_5_LTD | Template_5EEs_1cl.xlsx |
    And I create a proposal based on plan:
      | <plan> |
    When I download my proposal in Excel format
    Then Both basic and detailed benefits of "<plan>" should display on the "<product>" proposal
    Examples:
      | product | plan                                               |
      | LTD     | ltd plan non voluntary flat commission small group |

  @blocker @mvp1 @QUOTE-367
  Scenario Outline: <parameters_on_proposal> display for <product> product on Excel proposal
    And I have a proposal
      | <plan> |
    When I download my proposal in Excel format
    Then <parameters_on_proposal> should display for the "<plan>" of "<product>" proposal
    Examples:
      | product  | plan                      | parameters_on_proposal                          |
      #| MCV      | mcv plan 1                       | Calculated rates, lives and total cost values                            |
      #| GTL      | gtl plan 1                       | Calculated rates, volumes and total cost values                          |
      #| STD      | std plan 1                       | Calculated rates, lives, volumes and total cost values                   |
      #| STD      | std plan voluntary no commission | Determined upon enrollment lives, volumes and total cost values          |
      | VTL      | vtl plan 1                | Calculated lives, volumes and total cost values |
      | Accident | accident plan 1           | Calculated rates and lives                      |
      #| LTD      | ltd plan 1                       | Calculated composite rate, CME, lives and monthly cost values            |
      #| LTD      | ltd voluntary plan               | Determined upon enrollment monthly earnings, lives and total cost values |
      | CI       | ci plan heaped commission | Calculated age rates, total cost values         |
      | CI       | ci plan 1                 | Calculated age-banded rates                     |

  @critical @mvp1 @wip
  Scenario Outline: <parameters_on_proposal> display on <product> Excel proposal for a group with less than 10 EEs
    And I have a group with census created with
      | group_data          | census_data            |
      | Group_CA_3571_5_LTD | Template_5EEs_1cl.xlsx |
    And I create a proposal based on plan:
      | <plan> |
    When I download my proposal in Excel format
    Then <parameters_on_proposal> should display for the "<plan>" of "<product>" proposal
    Examples:
      | product | plan                                               | parameters_on_proposal                                        |
      | LTD     | ltd plan non voluntary flat commission small group | Calculated composite rate, CME, lives and monthly cost values |

  @wip
  Scenario Outline: Disclaimer text, GP and Policy Form numbers display for <product> product on Excel proposal
    And I have a proposal
      | <plan> |
    When I download my proposal in Excel format
    Then Principal disclaimer text should display on the "<product>" proposal
    And GP number "<gp_number>" should display on the "<product>" proposal
    And Policy Form number "<policy_number>" should display on the "<product>" proposal
    Examples:
      | product  | plan            | gp_number   | policy_number |
      | Dental   | dental plan 1   | GP62456DNT  | GC7100        |
      | MCV      | mcv plan 1      | GP62456VIS  | GC9000        |
      | STD      | std plan 1      | GP62456STD  | GC4000        |
      | GTL      | gtl plan 1      | GP62456LIFE | GC6000        |
      | VTL      | vtl plan 1      | GP62456VTL  | GC6000(VTL)   |
      | Accident | accident plan 1 | GP62456ACC  | GC8000        |
      | LTD      | ltd plan 1      | GP62456LTD  | GC3000        |
      | CI       | ci plan 1       | GP62456CI   | GC5700(CI)    |

  @wip
  Scenario Outline: Multiple plans of a <product> display side-by-side on Excel proposal
    And I have a proposal created based on multiple <plans>
    When I download my proposal in Excel format
    Then all <product> plans should display side-by-side on the proposal
    Examples:
      | product | plans                                        |
      | MCV     | mcv plan 1, mcv plan 1 voluntary             |
      | STD     | std plan 1, std_plan voluntary no commission |
      | LTD     | ltd plan 1, ltd voluntary plan               |
      | CI      | ci plan 1, ci plan heaped commission         |

  @critical @mvp1 @QUOTE-367 @wip
  Scenario Outline: Washington plan benefits display for <product> product on Excel proposal
    And I have a group with census created with
      | group_data          | census_data                  |
      | Group_WA_3571_50_DV | Tmpl_50EEs_3cl_all_data.xlsx |
    And I answer "Yes" to the small group question
    And I create a proposal based on plan:
      | <plan> |
    When I download my proposal in Excel format
    Then Both basic and detailed benefits of "<plan>" should display on the "<product>" proposal
    Examples:
      | product | plan                        |
      | MCV     | mcv plan for small group    |
      | Dental  | dental plan for small group |
