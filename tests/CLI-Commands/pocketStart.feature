Scenario: User wants to start pocket
    Given that user has Pocket installed and running
    And wants to start pocket
    When user types in "pocket start"
    And user provides the coinbase passphrase
    Then user should see the node starting and syncing with the network