@trinet @consolidatedQuoting @overviewCharges @wip
Feature: View Overview Charges Page
  As a Carrier Admin
  I want the Overview of Charges page to only display the plans that are mapped to WSEs
  So that Medical, Dental and Vision quotes should display it

  Scenario: Validate plans that are mapped to WSEs should be listed on Overview Charges page for Quick Benefits Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate plans are sorted by number of WSEs mapped to the plans, in decending order, top to bottom for Quick Benefits Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate that disclaimer copy should display on the bottom of the page for Quick Benefits Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate plans that are mapped to WSEs should be listed first on Overview Charges page for Advanced Modeling Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate non mapped plans to WSEs are listed subsequent to mapped plans on Overview Charges for Advanced Modeling Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate that mapped plans should be Sorted by number of enrolled WSEs in descending order for Advanced Modeling Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate that no mapped plans should be listed in descending order by number of eligible WSEs for Advanced Modeling Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |

  Scenario: Validate that disclaimer should not be displayed on page for Advanced Modeling Comparison proposal
    | quotes     |
    | medical    |
    | dental     |
    | vision     |
