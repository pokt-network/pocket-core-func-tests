Feature: Challenge RPC testing.
    In order to test the challenge RPC, we need to have a local pocket core network
    With 5 nodes, which 2 of them have wrong db, that ends up in not getting consesus for a transaction
    Creating instead a challenge request.
    
    Example: Consesus can't be reached and a challenge request is created.
    Scenario Outline: Challenge request is created    
        Given a pocket core network with 5 validators 
        And 2 validators have wrong data 
        And those 2 validators status are not jailed
        When a transaction is send to the chain
        Then a challenge request should be generated   