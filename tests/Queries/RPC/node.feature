Feature: /v1/query/node endpoint
    Scenario: Return information about node
        Given a pocket core node
        And a genesis file query-node-genesis-step1.json
        And an account exists in the pocket core network with address 0xA5DE6D4184016708c1040c355F1c958192276DB5
        When I send a HTTP POST request to the /v1/query/node
        And the HTTP POST bode has the parameters
        {
            "address": "0xA5DE6D4184016708c1040c355F1c958192276DB5",
            "height": 2
        }
        Then the HTTP POST response will be a node detail indicating:
        {
            "address": "05d98fbedf63cd4b4e337ef488ec2ad7e5072cb2",
            "chains": [
                "36f028580bb02cc8272a9a020f4200e346e276ae664e45ee80745574e2f5ab80"
            ],
            "jailed": false,
            "public_key": "bac2790f5786d4e016ed1f03a54205ba99b949e6a3c4b4641317977dfedfce79",
            "service_url": "0.0.0.0:8081",
            "status": 2,
            "tokens": "1000000000000000",
            "unstaking_time": "0001-01-01T00:00:00Z"
        }
    
    Scenario: Node doesn't exist in pocket core network
        Given a pocket core node
        And a genesis file query-node-genesis-step2.json
        And an account doesn't exist in the pocket core network with address 0xA5DE6D4184016708c1040c355F1c958192271234
        When I send a HTTP POST request to the /v1/query/node
        And the HTTP POST bode has the parameters
        {
            "address": "0xA5DE6D4184016708c1040c355F1c958192271234",
            "height": 2
        }
        Then the HTTP POST response will be a error detail indicating:
        {
            "code":400,
            "message":"no validator found with address 029a0da72bbca5dc9792c72ac3a2616910c479b3"
        }

    Scenario: Node address with invalid chars
        Given a pocket core node
        And a genesis file query-node-genesis-step3.json
        And an account doesn't exist in the pocket core network with address 02$%0DA72BBCA5DC9792C72AC3A2616910C479B3
        When I send a HTTP POST request to the /v1/query/node
        And the HTTP POST bode has the parameters
        {
            "address": "02$%0DA72BBCA5DC9792C72AC3A2616910C479B3",
            "height": 2
        }
        Then the HTTP POST response will be a error detail indicating:
        {
            "code":400,
            "message":"encoding/hex: invalid byte: U+0024 '$'"
        }    
    