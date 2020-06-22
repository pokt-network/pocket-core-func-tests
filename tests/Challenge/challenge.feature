Feature: Challenge wrong relay data served by node.
    In order to test the challenge RPC, we need to have a local pocket core network
    With 5 nodes, with a minority of them servicing wrong data thought relays, we as user decide to send a challenge request.
    
    Example: A node is returning wrong data from external chain query through relay
    Scenario: User Submits Challenge Request
        Given the user sent same relay request to at least 3 of the 5 nodes per session.
        And a minority of service nodes return wrong data while servicing relays
        And a majority of service nodes return same data while servicing relays
        When a relay is send to the chain for each of them
        Then a challenge request is sent by the user using the endpoint /v1/client/challenge, submitting the relay response/proof of the majority and offending minority.

    Scenario: Challenge Transaction submitted to the network
        Given a challenge transaction is handled by the network
        And the transaction is well formed
        And the offending node/validator is not unstaked
        Then the network evaluates the majority proof against the minority proof and if necessary slashes the minority for bad servicing

    Scenario: User Submits Challenge Request without majority proof
        Given the user sent same relay request to at least 3 of the 5 nodes per session.
        And all of service nodes return different data while servicing relays
        When a relay is send to the chain for each of them
        Then the challenge request can't be sent by the user as no clear majority of valid responses has been reached by the nodes/validators
