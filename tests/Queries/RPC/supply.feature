Feature: /v1/query/supply endpoint
    Scenario: Returns the list of node params specified in the height
        Given a pocket core node
        And a genesis file query-supply-genesis-step1.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supply
        And the body request has the parameters
        {
            "height": 0
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "node_staked": 0,
            "app_staked": 0,
            "dao": 0,
            "total_staked": 0,
            "total_unstaked": 0,
            "total": 0
        }

    Scenario: Returns error code with wrong height
        Given a pocket core node
        And a genesis file query-supply-genesis-step2.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supply
        And the body request has the parameters
        {
            "height": -1
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }

    Scenario: Returns error code with invalid char height
        Given a pocket core node
        And a genesis file query-supply-genesis-step3.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supply
        And the body request has the parameters
        {
            "height": -io
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "code":400,
            "message":"invalid character 'i' in numeric literal"
        }