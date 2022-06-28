Feature: /v1/query/appparams endpoint 
    
    Scenario: 253 Request valid app height.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step1.json
        And an application exists in the pocket core network
        When I send an HTTP POST request to /v1/query/appparams
        And the body request has the parameter height 2 
        Then the HTTP POST response will be an application detail indicating:
        {
            "unstaking_time": "string",
            "max_applications": 0,
            "app_stake_minimum": 0,
            "base_relays_per_pokt": 0,
            "stability_adjustment": 0,
            "participation_rate_on": true
        }

    Scenario: 254 Request invalid app height.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step2.json
        And an application exists in the pocket core network
        When I send an HTTP POST request to /v1/query/appparams
        And the body request has the parameter height -1
        Then the HTTP POST response will be an application detail indicating:
        {
                "code":400,
                "message":"{
                \"codespace\":\"sdk\",
                \"code\":1,
                \"message\":\"failed to load state at height -1; failed to get Store: no data (latest height: number)\"
                }"
        }

    Scenario: 255 Request invalid app height with bad chars.
        Given a pocket core node
        And a genesis file query-appparams-rpc-genesis-step3.json
        And an application exists in the pocket core network
        When I send an HTTP POST request to /v1/query/appparams
        And the body request has the parameter height 1234$%^&*
        Then the HTTP POST response will be an application detail indicating:
        {
            "code":400,
            "message":"invalid character '$' after object key:value pair"
        }    