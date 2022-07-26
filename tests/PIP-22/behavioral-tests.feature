Scenario: xxx Make sure relay rewards are unchanged when RSCAL is disabled
    Given that the user is running pocket version RC 0.9.0 and current block is less than RSCAL activation
    And user is running 2 nodes 1 with 15001 (node1) pocket staked the other with 30001 (node2).
    When user executes a single relay on both nodes.
    Then user executes `pocket query node-claims` on both nodes
    And user receives the proof of the pending claims.
    Then user confirms its account's balance by doing `pocket query balance <accAddrNode1> <heightOfPreviousVersion> [flags]` and `pocket query balance <accAddrNode2> <heightOfPreviousVersion> [flags]'
    And confirms its actual balance before the next block
    And user waits for the next block.
    Then user checks in the block information logs, that claims are being paid to his address. 
    And user executes `pocket query node-claims` for both nodes
    Then user notices that there are no pending claims for either node.
    When user checks its balance again by doing `pocket query balance <accAddr1> <currentHeight> [flags]` and `pocket query balance <accAddr2> <currentHeight> [flags]`
    Then user notices that node1 and node2 both recieved the same amount of pokt on each node.

Scenario: xxx Make sure relay rewards scale when RSCAL is enabled
    Given that the user is running pocket version RC 0.9.0 and current block is greater than RSCAL activation
    Given ServicerStakeFloorMultiplier = 15000000000, ServicerStakeWeightMultiplier = 1, ServicerStakeWeightCeiling = 60000000000 and ServicerStakeFloorMultiplierExponent = 1
    And user is running 2 nodes 1 with 15001 (node1) pocket staked the other with 30001 (node2).
    When user executes a single relay on both nodes.
    Then user executes `pocket query node-claims` on both nodes
    And user receives the proof of the pending claims.
    Then user confirms its account's balance by doing `pocket query balance <accAddrNode1> <heightOfPreviousVersion> [flags]` and `pocket query balance <accAddrNode2> <heightOfPreviousVersion> [flags]'
    And confirms its actual balance before the next block
    And user waits for the next block.
    Then user checks in the block information logs, that claims are being paid to his address. 
    And user executes `pocket query node-claims` for both nodes
    Then user notices that there are no pending claims for either node.
    When user checks its balance again by doing `pocket query balance <accAddr1> <currentHeight> [flags]` and `pocket query balance <accAddr2> <currentHeight> [flags]`
    Then user notices that node2 recieved twice the amount of node1.
    
Scenario: xxx Make sure stake slashing does not scale when RSCAL is disabled
    Given that the user is running pocket version RC 0.9.0 and current block is less than RSCAL activation
    Given ServicerStakeFloorMultiplier = 15000000000, ServicerStakeWeightMultiplier = 1, ServicerStakeWeightCeiling = 60000000000 and ServicerStakeFloorMultiplierExponent = 1
    And user is running 2 nodes 1 with 15001 (node1) pocket staked the other with 30001 (node2).
    And each node is subjected to a single slashing event
    Then the stake of both node1 and node2 should have fallen by the same amount.
    
Scenario: xxx Make sure stake slashing does scale when RSCAL is enabled
    Given that the user is running pocket version RC 0.9.0 and current block is greater than RSCAL activation
    Given ServicerStakeFloorMultiplier = 15000000000, ServicerStakeWeightMultiplier = 1, ServicerStakeWeightCeiling = 60000000000 and ServicerStakeFloorMultiplierExponent = 1
    And user is running 2 nodes 1 with 15001 (node1) pocket staked the other with 30001 (node2).
    And each node is subjected to a single slashing event
    Then the stake of node2 should have reduced twice as much than that of node1
    
Scenario: xxx Make sure stake can be updated freely within the same bin when VEDIT is disabled and RSCAL is diabled
    Given that the user is running pocket version RC 0.9.0 and current block is less than VEDIT activation and RSCAL activation
    And a given node it's in a current session with stake 15001000000 upokt
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> 15002000000 <chains> <serviceURI> <chainID> <fees>"
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 15002000000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds that the stake amount has been updated.

Scenario: xxx Make sure stake can be updated freely within the same bin when VEDIT is disabled and RSCAL is enabled
    Given that the user is running pocket version RC 0.9.0 and current block is less than VEDIT activation and greater than RSCAL activation
    And a given node it's in a current session with stake 15001000000 upokt
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> 15002000000 <chains> <serviceURI> <chainID> <fees>"
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 15002000000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds that the stake amount has been updated.

Scenario: xxx Make sure stake can be updated freely within the same bin when VEDIT is enabled and RSCAL is disabled
    Given that the user is running pocket version RC 0.9.0 and current block is greater than VEDIT activation but not greater than RSCAL activation
    And a given node it's in a current session with stake 15001000000 upokt
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> 15002000000 <chains> <serviceURI> <chainID> <fees>"
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 15002000000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds that the stake amount has been updated.

Scenario: xxx Make sure stake can not be updated freely within the same bin when VEDIT and RSCAL is enabled
    Given that the user is running pocket version RC 0.9.0 and current block is greater than VEDIT and RSCAL activation
    And a given node it's in a current session with stake 15001000000 upokt
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> 15002000000 <chains> <serviceURI> <chainID> <fees>"
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 15002000000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds that the stake amount has NOT been updated.

Scenario: xxx Make sure stake can be updated freely to the next bin when VEDIT and RSCAL is enabled
    Given that the user is running pocket version RC 0.9.0 and current block is greater than VEDIT and RSCAL activation
    And a given node it's in a current session with stake 15001000000 upokt
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> 30001000000 <chains> <serviceURI> <chainID> <fees>"
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 30001000000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds that the stake amount has been updated.
    
Scenario: xxx Make sure PIP22 DAO parameters are seeded with the correct default values on RSCAL activation
    Given a pocket network at block X and RSCAL activation at block X+1
    And the chain is advanced by 1 block
    Then the PIP22 paramters ServicerStakeFloorMultiplier, ServicerStakeWeightMultiplier, ServicerStakeWeightCeiling, ServicerStakeFloorMultiplierExponent should return 15000000000,1.0,15000000000,1.0 respectively
