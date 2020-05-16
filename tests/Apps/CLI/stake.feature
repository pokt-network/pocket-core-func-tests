Feature: stake method in pocket-core cli's apps namespace
    Scenario: Should stake to an app.
        Given a pocket core node
        And a genesis file apps-stake-genesis-step1.json
        And an application node exist with address 7ab712998671b09e1a266ce6901000acb657833b
        And the application node has blockchain id 0001 support
        And the application has available balance
        When I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb657833b
            amount: 50000000
            chains: 0001
            "
        Then the CLI should show a message indicating:
            "Transaction submitted: TxHash"

    Scenario: Shouldn't stake a nonexistent app.
        Given a pocket core node
        And a genesis file apps-stake-genesis-step1.json
        And an application node doesn't exist with address 7ab712998671b09e1a266ce6901000acb657111b
        When I use namespace nodes
        And I use method stake
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb657111b
            
            "
        Then the CLI should show a message:
            "key with address 7ab712998671b09e1a266ce6901000acb657111b not found"