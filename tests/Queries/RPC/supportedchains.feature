Feature: /v1/query/supportedchains endpoint
    Scenario: Returns list of supported blockchains specified in the height
        Given a pocket core node
        And a genesis file query-supportedchains-genesis-step1.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supportedchains
        And the body request has the parameters
        {
            "height": 0
        }
        Then the HTTP POST response will be a JSON detail indicating:
        {
            "supported_chains": [
            "string"
            ]
        }
    
    Scenario: Returns an error code with invalid height
        Given a pocket core node
        And a genesis file query-supportedchains-genesis-step2.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supportedchains
        And the body request has the parameters
        {
            "height": -io
        }
        Then the HTTP POST response will be a JSON error indicating:
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }

    Scenario: Returns an error code with invalid char in height
        Given a pocket core node
        And a genesis file query-supportedchains-genesis-step3.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/supportedchains
        And the body request has the parameters
        {
            "height": -io
        }
        Then the HTTP POST response will be a JSON error indicating:
        {
            "code":400,
            "message":"invalid character 'i' in numeric literal"
        }