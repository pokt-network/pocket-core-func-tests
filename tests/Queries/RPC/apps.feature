Feature: /v1/query/apps endpoint

    Scenario: 256 Group of application exists.
        Given a pocket core node
        And a query-apps-rpc-genesis-step1.json
        And a collection of apps exist in the pocket core network.
        When I send an HTTP POST request to /v1/query/apps
        And the request body has the parameters:
        {
            "height": 2,
            "opts": {
                "staking_status": 2,
                "page": 1,
                "per_page": 100
        }
        Then the HTTP response will be a page application detail indicating: 
        {
            "result": [
                {
                "address": "string",
                "public_key": "string",
                "jailed": false,
                "status": 0,
                "chains": [
                    "string"
                ],
                "tokens": "string",
                "max_relays": 0,
                "unstaking_time": "string"
                }
            ],
            "page": 0,
            "total_pages": 0
        }
    
    Scenario: 257 Group of application doesn't exist
        Given a pocket core node
        And a query-apps-rpc-genesis-step2.json
        And a collection of apps doesn't exist in the pocket core network.
        When I send an HTTP POST request to /v1/query/apps
        And the request body has the parameters:
        {
            "height":2,
            "opts":{
                "staking_status":0,
                "page":1,
                "per_page":100
            }
        }
        Then the HTTP response will be a null detail indicating:
        {
            "result":null,
            "total_pages":1,
            "page":1
        }
    
    
        

    