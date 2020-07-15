  Scenario: Challenge reward
    Given a pocket core network with latest version
    And 2 validators have wrong data
    And those 2 validators are not jailed
    When a transaction is sent to the chain
    Then a challenge request should be generated.
    When challenge is successful
    Then the network rewards the challenger with POKT

  Scenario: Challenge burn
    Given a pocket core network with latest version
    And 2 validators have wrong data
    And those 2 validators are not jailed
    When a transaction is sent to the chain
    Then a challenge request should be generated.
    When challenge is successful the challenger POKT is burned