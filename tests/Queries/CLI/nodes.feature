Feature: nodes method in pocket-core cli's query namespace
    Scenario: Returns page of nodes
        Given various pocket core nodes
        And a genesis file query-nodes-rpc-genesis-step1.json
        And they exist in the pocket core network
        And they are at the same height
        When I use the query namespace
        And I use the nodes method
        Then the CLI should recieve a page nodes detailing:
        {
            "result": [
                {
                "address": "98a18a38aa6826a55dccce19f607e3171cf1436e",
                "public_key": "d6b3785f00961059d2a5c6448cae7ddb02475de79c22261687a92cb905ff0de9",
                "jailed": false,
                "status": 2,
                "tokens": "1000000000000000",
                "service_url": "0.0.0.0:8081",
                "chains": [
                    "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
                ],
                "unstaking_time": "0001-01-01T00:00:00Z"
                }
            ],
            "page": 1,
            "total_pages": 100
        }
    
    Scenario: Returns error when given wrong height
        Given various pocket core nodes
        And a genesis file query-nodes-rpc-genesis-step2.json
        And they exist in the pocket core network
        And they are at the same height
        When I use the query namespace
        And I use the nodes method
        And I use the parameter height as 565656
        Then I should recieve a page nodes detailing:
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }

    Scenario: Returns null when given 0 page
        Given various pocket core nodes
        And a genesis file query-nodes-rpc-genesis-step2.json
        And they exist in the pocket core network
        And they are at the same height
        When I use the query namespace
        And I use the nodes method
        And I use the parameter height as 565656
        Then I should recieve a page nodes detailing:
        {
            "result":null,
            "total_pages":1,
            "page":0
        }    