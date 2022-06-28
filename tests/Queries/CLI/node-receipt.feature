Feature: node-receipt method in pocket-core cli's query namespace
    Scenario: 222 Pocket node exists 
        Given a pocket core node
        And a genesis file query-nodereceipt-rpc-genesis-step1.json
        And an account exists in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
        And an account has a height of 0
        And is a pocket node of blockchain of 0001
        And has a app_pubkey = string
        And has a session_height = string 
        When I use method node-receipt method
        And I send the parameters of nodeAddress = 4920ce1d787c60e2eaeff366c79e8aa2b82525f1, height = number, receiptType = string, networkId = string, sessionHeight = number
        Then the CLI response will be an account detail indicating:
        {
           "session_header":{
                "app_public_key":"string",
                "chain":"string",
                "session_height":0
            },
            "servicer_address":"string",
            "total_relays":0
        }
      
    Scenario: 223 Node information is invalid
        Given a pocket core node
        And a genesis file query-nodereceipt-rpc-genesis-step2.json
        And an account doesn't exist in the pocket network with address 4920ce1d787c60e2eaeff366c79e8aa2b82525f1
        And an account has a height of 0
        And is a pocket node of blockchain of 0001
        And has a app_pubkey = string
        And has a session_height = string 
        When I use method node-receipt method
        And I send the parameters of nodeAddress = 4920ce1d787c60e2eaeff366c79e8aa2b82525f1, height = number, receiptType = string, networkId = string, sessionHeight = number
        Then the CLI response will be an account detail indicating:
        {
            "code":400,
            "message":
            "{
                "codespace":"sdk",
                "code":1,
                "message":"type in the receipt query is not recognized: (relay or challenge)"
            }"
        }