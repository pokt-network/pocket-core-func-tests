Feature: unstake method in pocket-core cli's apps namespace
    Scenario: Should unstake to an app.
        Given a pocket core node
        And a genesis file apps-unstake-genesis-step1.json
        And an application node exist with address 7ab712998671b09e1a266ce6901000acb657833b
        And the application node has stake status true
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb657833b
            "
        Then the CLI should show a message indicating:
            "Transaction submitted: TxHash"

    Scenario: Shouldn't unstake a nonexistent app.
        Given a pocket core node
        And a genesis file apps-unstake-genesis-step1.json
        And an application node doesn't exist with address 7ab712998671b09e1a266ce6901000acb657111b
        When I use namespace nodes
        And I use method unstake
        And I send the parameters: 
            "
            address: 7ab712998671b09e1a266ce6901000acb657111b
            
            "
        Then the CLI should show a message:
            "key with address 7ab712998671b09e1a266ce6901000acb657111b not found"
    
    