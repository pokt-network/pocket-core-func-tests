Feature: /v1/query/app
    Scenario: Application address exists
    Given a pocket core node
    And a genesis file query-app-rpc-genesis-step1.json
    And an application exists in the pocket core network with adress 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
    When I send a HTTP POST request to /v1/query/app endpoint
    And the request body has the parameters address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 0
    Then the HTTP POST response will be an application detail indicating:
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
    
    Scenario: Application address doesn't exist
    Given a pocket core node
    And a genesis file query-app-rpc-genesis-step2.json
    And an application doesn't exist in the pocket core network with adress 4920ce1d787123456aeff366c79e8aa2b82525f1
    When I send a HTTP POST request to /v1/query/app endpoint
    And the request body has the parameters address 4920ce1d787123456aeff366c79e8aa2b82525f1 and height 0
    Then the HTTP POST response will be an error detail indicating:
    {
        "code":400,
        "message":"no application found with address 4920ce1d787123456aeff366c79e8aa2b82525f1"
    }

    Scenario: Application address is not valid
    Given a pocket core node
    And a genesis file query-app-rpc-genesis-step3.json
    And an application address is invalid with the adress 4920ce1d787123456aeff366c79e8aa2
    When I send a HTTP POST request to /v1/query/app endpoint
    And the request body has the parameters address 4920ce1d787123456aeff366c79e8aa2 and height 0
    Then the HTTP POST response will be an application detail indicating:
    {
        "code":400,
        "message":"Incorrect address length"
    }

    Scenario: Application address has invalid characters
    Given a pocket core node
    And a genesis file query-app-rpc-genesis-step4.json
    And an application doesn't exist in the pocket core network with adress 4920ce1d78712-%^&aeff366c79e8aa2b82525f1
    When I send a HTTP POST request to /v1/query/app endpoint
    And the request body has the parameters address 4920ce1d78712-%^&aeff366c79e8aa2b82525f1 and height 0
    Then the HTTP POST response will be an application detail indicating:
    {
        "code":400,
        "message":"encoding/hex: invalid byte: U+002D '-'"
    }    