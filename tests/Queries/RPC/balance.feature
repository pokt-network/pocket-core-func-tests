Feature: /v1/query/balance endpoint
    Scenario: 258 account exists
        Given a pocket core node
        And a genesis file query-balance-rpc-genesis-step1.json
        And an account exists in the pocket core network with address 1b1973906ee85993e994422eddeab89f385a00a4
        When I send a HTTP POST request to the /v1/query/balance endpoint
        And the request body has the parameters 
        {
            "address": "1b1973906ee85993e994422eddeab89f385a00a4",
            "height": 2
        }
        Then the HTTP response will be a balance detailing:
        {
            "balance": 1000000000
        }
    
    Scenario: 259 account doesn't exist
        Given a pocket core node
        And a genesis file query-balance-rpc-genesis-step2.json
        And an account exists in the pocket core network with address 1b1973906ee85993e994422eddeab89f385a1234
        When I send a HTTP POST request to the /v1/query/balance endpoint
        And the request body has the parameters 
        {
            "address": "1b1973906ee85993e994422eddeab89f385a1234",
            "height": 2
        }
        Then the HTTP response will be a balance detailing:
        {
            "balance": 0
        }    