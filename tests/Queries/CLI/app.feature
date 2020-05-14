Feature: App method in pocket-core cli's query namespace
    Scenario: Returns app details
        Given a pocket core node
        And a genesis file query-app-rpc-genesis-step1.json
        And an application exists in the pocket core network with adress 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
        When I use pocket query namespace
        And I use the method app
        And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 0
        Then the CLI response should be a JSON detailing:
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
        When I use pocket query namespace
        And I use the method app
        And the arguments of the method has the account address as 4920ce1d787c60e2eaeff366c79e8aa2b82525f1 and height 0
        Then the CLI response should be a message detailing:
            "no application found with address 4920ce1d787123456aeff366c79e8aa2b82525f1"
    
    Scenario: Application address has incorrect length valid
        Given a pocket core node
        And a genesis file query-app-rpc-genesis-step3.json
        And an application doesn't exist in the pocket core network with adress 4920ce1d787123456aeff366c79e8aa2
        When I use pocket query namespace
        And I use the method app
        And the arguments of the method has the account address as 4920ce1d787123456aeff366c79e8aa2 and height 0
        Then the CLI response should be a message detailing:
            "Incorrect address length"
    
    Scenario: Scenario: Application address has invalid characters
        Given a pocket core node
        And a genesis file query-app-rpc-genesis-step3.json
        And an application doesn't exist in the pocket core network with adress 4920ce1d787123456aeff366c79e8aa2
        When I use pocket query namespace
        And I use the method app
        And the arguments of the method has the account address as 4920ce1d787123456aeff366c79e8aa2 and height 0
        Then the CLI response should be a message detailing:
            "encoding/hex: invalid byte: U+0024 '$'"    