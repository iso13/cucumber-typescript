@trinet @searchComponent @carlos @wip
Feature: Search to narrow data retrieved
  As a Broker
  I need the ability to perform a keyword search
  So that I can narrow the set of data displayed on the screen

  @blocker
  Scenario: Validate search field component default behavior in available plans screen
    |default behavior                                         |
    |search field component is collapsed                      |
    |search field is represented with a magnifying glass icon |
    |search field is displayed on the toolbar                 |

  @blocker
  Scenario: Validate search field component allowed characters in available plans screen
    |allowed values                                           |
    |search field allow alpha-numeric characters              |
    |search field allow special characters                    |

  @blocker
  Scenario: Validate plans are narrowed dynamically as characters are entered into the search field in available plans screen
    |search options                                     | outcome                  |
    |search an specific plan                            | only one plan received   |
    |search for a benefit that match more than one plan | multiple plans retrieved |

  @blocker
  Scenario: Validate plans are increased dynamically as characters are deleted from the search field in available plans screen

  @blocker
  Scenario: Search field is active upon clicking over the magnifying glass icon in available plans screen
    |expected validations|
    |text entry cursor is live |
    |one or more characters are present in the search field|

  @critical
  Scenario: Search field is collapsed in available plans screen
    |triggering event                             |
    |there are not characters present in the field|
    |click outside of the search field            |
    |blanks in the search field (no characters)   |

  @blocker
  Scenario: Validate search field component default behavior in selected plans screen
    |default behavior                                         |
    |search field component is collapsed                      |
    |search field is represented with a magnifying glass icon |
    |search field is displayed on the toolbar                 |

  @blocker
  Scenario: Validate search field component allowed characters in selected plans screen
    |allowed values                                           |
    |search field allow alpha-numeric characters              |
    |search field allow special characters                    |

  @blocker
  Scenario: Validate plans are narrowed dynamically as characters are entered into the search field in selected plans screen
    |search options                                     | outcome                  |
    |search an specific plan                            | only one plan received   |
    |search for a benefit that match more than one plan | multiple plans retrieved |

  @blocker
  Scenario: Validate plans are increased dynamically as characters are deleted from the search field in selected plans screen

  @blocker
  Scenario: Search field is active upon clicking over the magnifying glass icon in selected plans screen
    |expected validations|
    |text entry cursor is live |
    |one or more characters are present in the search field|

  @critical
  Scenario: Search field is collapsed in selected plans screen
    |triggering event                             |
    |there are not characters present in the field|
    |click outside of the search field            |
    |blanks in the search field (no characters)   |
