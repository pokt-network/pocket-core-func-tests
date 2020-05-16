Feature: stake method in pocket-core cli's nodes namespace
    Scenario: Should stake the correct amount.
        Given a pocket core node
        And a genesis file nodes-stake-genesis-step1.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node has upokt available
        And the node supports blochainid 0001
        And the node has an url of http://node1-tostake.com
        When I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            upokt: 50000000
            blockchainid: 0001
            url: http://node1-tostake.com:8081
            "
        Then the CLI should show a message:
            "Transaction submitted: TxHash"

    Scenario: Using non existent address
        Given a pocket core node
        And a genesis file nodes-stake-genesis-step1.json
        And a node doesn't exist with address ED7B858387905068B45022A7AB2B4952F2AA7AAE
        And the node has upokt available
        And the node supports blochainid 0001
        And the node has an url of http://node1-tostake.com
        When I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2AA7AAE
            upokt: 50000000
            blockchainid: 0001
            url: http://node1-tostake.com:8081
            "
        Then the CLI should show a message:
            "key with address ED7B858387905068B45022A7AB2B4952F2AA7AAE not found"

    Scenario: Sending transaction with insufficient founds
        Given a pocket core node
        And a genesis file nodes-stake-genesis-step2.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node doesn't have upokt available
        And the node supports blochainid 0001
        And the node has an url of http://node1-tostake.com
        When I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            upokt: 999999999999999
            blockchainid: 0001
            url: http://node1-tostake.com:8081
            "
        Then the CLI should show a message:
            "Transaction submitted: TxHash"
        And the pocket query node ED7B858387905068B45022A7AB2B4952F2C97AAE message to be returned should show that the staked amount previously submitted, was not succesful