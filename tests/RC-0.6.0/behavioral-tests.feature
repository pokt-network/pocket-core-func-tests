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
    And then upgrade height tx is submitted.
    When new blocks are generated
    Then user should be able to see double signing from older blocks.

Scenario: Make sure security patch is functional on merkle sum index height
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    And The user's node serve's and process relays before the upgrade height TX.
    And the user is able to see the claims for the pending work done.
    Then proofs are submitted.
    And user received pending claims.
    Then user goes in the code and modifies the pocket-core/codec/codec.go to a specific intentional height.
    When user sets the upgrade height TX
    Then user start intentionally to produce relays, which claims/proofs are to be generated and sent in the session block where the upgrade height TX is happening (set steps above)
    When upgrade height tx is submitted.
    Then the user should be able to see his nodes claims intact.
    When blocks passes.
    Then the user should receive the proof and payments for those claims.
    And The user's node serve's and process relays before the upgrade height TX.
    And the user is able to see the claims for the pending work done.
    Then proofs are submitted.
    And user received pending claims.

Scenario: Make sure security patch is functional on blockhash for height
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    And The user's node serve's and process relays before the upgrade height TX.
    And the user is able to see the claims for the pending work done.
    Then proofs are submitted.
    And user received pending claims.
    Then user goes in the code and modifies the pocket-core/codec/codec.go to a specific intentional height.
    When user sets the upgrade height TX
    Then user start intentionally to produce relays, which claims/proofs are to be generated and sent in the session block where the upgrade height TX is happening (set steps above)
    When upgrade height tx is submitted.
    Then the user should be able to see his nodes claims intact.
    When blocks passes.
    Then the user should receive the proof and payments for those claims.
    And The user's node serve's and process relays before the upgrade height TX.
    And the user is able to see the claims for the pending work done.
    Then proofs are submitted.
    And user received pending claims.

Scenario: Make sure current latest version works even for lower upgradeTX versions
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When the user (DAO) submits an upgrade height TX of a version lower than the current latest version.
    Then all nodes in the latest version should continue as normal and not suffer anything.
    And all nodes in a version lower than the upgraded one, should stop until upgrading.

Scenario: Make sure that max validator validation/param is working - max validators decreased.
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When the network is set to start with 5 max_validators in the genesis.json
    And those validators are staked.
    And those validators have served relays and have pending claims, after 2 sessions.
    Then user changes the max_validators params to 2:
    |pocket-core gov change_param 4fd7bb7c7b62752cb29163ff455ae4d31326c2d3 0011 pocketcore/MaxValidators \“2\” 10000 false | 
    When TX has been executed, then user waits 2 more sessions for the new max_validators and non_max_validators to have claims pending.
    And user confirm that new excluded validators are not in consensus:
    |client/validators RPC endpoint|
    Then user waits 16 blocks for claims and proofs to be completed.
    And user checks each validator balance and claims.
    Then all claims and proofs should have been intact, not affected by the change in any validator.

Scenario: Make sure that max validator validation/param is working - max validators increased.
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When the network is set to start with 2 max_validators in the genesis.json
    And those validators are staked.
    And those validators have served relays and have pending claims, after 2 sessions.
    Then user changes the max_validators params to 5:
    |pocket-core gov change_param 4fd7bb7c7b62752cb29163ff455ae4d31326c2d3 0011 pocketcore/MaxValidators \“2\” 10000 false | 
    When TX has been executed, then user waits 2 more sessions for the new max_validators and ex-non_max_validators to have claims pending.
    And user confirm that new included validators are in consensus:
    |client/validators RPC endpoint|
    Then user waits 16 blocks for claims and proofs to be completed.
    And user checks each validator balance and claims.
    Then all claims and proofs should have been intact, not affected by the change in any validator.

Scenario: Make sure that max validator validation/param is working - max validators decreased - node staking.
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When the network is set to start with 2 max_validators in the genesis.json
    And those validators are staked.
    And those validators have served relays and have pending claims, after 2 sessions.
    Then user changes the max_validators params to 5:
    |pocket-core gov change_param 4fd7bb7c7b62752cb29163ff455ae4d31326c2d3 0011 pocketcore/MaxValidators \“2\” 10000 false | 
    When TX has been executed, then user waits 2 more sessions for the new max_validators and ex-non_max_validators to have claims pending.
    And user confirm that new included validators are in consensus:
    |client/validators RPC endpoint|
    Then user waits 16 blocks for claims and proofs to be completed.
    And user checks each validator balance and claims.
    Then all claims and proofs should have been intact, not affected by the change in any validator.
    And user creates a new validator in the pocket core CLI.
    And user staked that validator.
    Then after 1 block, the validator must be staked and receiving relays.

Scenario: Make sure that max validator validation/param is working - max validators increased - node staking.
    Given that the user it's running pocket's older version, RC-0.6.0
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When the network is set to start with 2 max_validators in the genesis.json
    And those validators are staked.
    And those validators have served relays and have pending claims, after 2 sessions.
    Then user changes the max_validators params to 5:
    |pocket-core gov change_param 4fd7bb7c7b62752cb29163ff455ae4d31326c2d3 0011 pocketcore/MaxValidators \“2\” 10000 false | 
    When TX has been executed, then user waits 2 more sessions for the new max_validators and ex-non_max_validators to have claims pending.
    And user confirm that new included validators are in consensus:
    |client/validators RPC endpoint|
    Then user waits 16 blocks for claims and proofs to be completed.
    And user checks each validator balance and claims.
    Then all claims and proofs should have been intact, not affected by the change in any validator.
    And user creates a new validator in the pocket core CLI.
    And user staked that validator.
    Then after 1 block, the validator must be staked and receiving relays.