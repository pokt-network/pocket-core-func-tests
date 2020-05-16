Feature: Unstake method in pocket-core cli's nodes namespace
    Scenario: Should unstaked a node.
        Given a pocket core node
        And a genesis file nodes-unstake-genesis-step1.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node property of staked is true
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            height: 0
            "
        Then the CLI should show a message:
            "Transaction submitted: TxHash"
        And the details of the transaction should show:
            "...
            success: true
            ..."

    Scenario: Unstaked a node that's not staked.
        Given a pocket core node
        And a genesis file nodes-unstake-genesis-step2.json
        And a node exist with address ED7B858387905068B45022A7AB2B4952F2C97AAE
        And the node property of staked is false
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C97AAE
            height: 0
            "
        Then the CLI should show a message:
            "Transaction submitted: TxHash"
        And the details of the transaction should show:
            "...
            success: false
            ..."

    Scenario: unstake a node that doesn't exist
        Given a pocket core node
        And a genesis file nodes-unstake-genesis-step3.json
        And a node doesn't exist with address ED7B858387905068B45022A7AB2B4952F2C9AAAA
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952F2C9AAAA
            height: 0
            "
        Then the CLI should show a message:
            "panic: key with address ed7b858387905068b45022a7ab2b4952f2c9aaaa not found"

    Scenario: Use invalid chars in address
        Given a pocket core node
        And a genesis file nodes-unstake-genesis-step4.json
        And a node doesn't exist with address ED7B858387905068B45022A7AB2B4952@$AAAA
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: ED7B858387905068B45022A7AB2B4952@$AAAA
            height: 0
            "
        Then the CLI should show a message:
            "encoding/hex: invalid byte: U+0040 '@'"