Scenario: Make sure TXs are not affected after the upgrade
    Given that the user it's running pocket's previous stable version, RC-0.5.2.9 or any other previus stable version.
    And user does `pocket version`
    And user receives 
    |RC-0.5.2.9|
    And user executes a sample transaction in an specific block height. E.g. `pocket accounts send-raw-tx <fromAddr> <txBytes> [flags]`
    Then user received the TX hash successfully.
    And user waits for the next block to confirm that the TX has been made successfully. E.g. `pocket query tx <receivedTXHash>`
    When user proceeds to upgrade to the latest RC-0.6.0 version.
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When user waits for the next block to confirm that the TX has been made successfully. E.g. `pocket query tx <receivedTXHash>`
    Then user receives the transaction details as originated before the upgrade.

Scenario: Make sure claims are not affected after the upgrade
    Given that the user it's running pocket's previous stable version, RC-0.5.2.9 or any other previus stable version.
    And user does `pocket version`
    And user receives 
    |RC-0.5.2.9|
    And user's node is staked and serving relays.
    When user executes a single relay.
    Then user executes `pocket query node-claims`
    And user receives the proof of the pending claims.
    Then user confirms its account's balance by doing `pocket query balance <accAddr> <heightOfPreviousVersion> [flags]`
    And confirms its actual balance before updating.
    Then user upgrades to pocket version RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When user waits for the next block.
    Then user checks in the block information logs, that claims are being paid to his address. 
    And user executes `pocket query node-claims`
    Then user notices that there are no pending claims.
    When user checks its balance again by doing `pocket query balance <accAddr> <currentHeight> [flags]`
    Then user notices the claimed balance before the upgrade have been added even after the upgrade.

Scenario: Make sure claims are not affected after the upgrade, claims not present
    Given that the user it's running pocket's previous stable version, RC-0.5.2.9 or any other previus stable version.
    And user does `pocket version`
    And user receives 
    |RC-0.5.2.9|
    And user's node is staked and serving relays.
    When user executes a single relay.
    Then user executes `pocket query node-claims`
    And user receives the proof of the pending claims.
    Then user confirms its account's balance by doing `pocket query balance <accAddr> <heightOfPreviousVersion> [flags]`
    And confirms its actual balance before updating.
    Then user upgrades to pocket version RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When user waits for the next block.
    Then user checks in the block information logs, that claims are missing. 
    When user queries the relay TX, `pocket query tx <relayTxHash>`
    Then user notices that the relay transaction has not been successful and the relay has stopped.

Scenario: Make sure unstaked APPs are removed from the state
    Given that the user it's running pocket's latest version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    And user has handy an staked APP.
    When user executes `pocket query app <appAddress>`
    Then user received the APP information as staked.
    |status: 2|
    When user unstakes the APP, `pocket apps unstake <fromAddr> <chainID> <fees> [flags]`
    And the APP have been properly unstaked.
    And user executes `pocket query app <appAddress>`
    Then user received the APP information as unstaked.
    |status: 0|
    Then user queries the /state.
    |v1/query/state|
    And user execute a find operation, by the <appAddress>.
    Then APP is not present anymore.

Scenario: Make sure that max age of evidence is enforced in blocks
    Given that the user it's running pocket's latest version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    

