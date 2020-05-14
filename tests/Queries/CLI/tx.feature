Feature: tx method in pocket-core cli's query namespace
    Scenario: Return a transaction detail
        Given a pocket core node
        And a genesis file query-transaction-genesis-step1.json
        And a transaction with the hash 0x197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22 exists in the pocket core network
        When I use query namespace
        And I use method tx
        And I send the parameter hash 0x197e4d46009879f28f978a90627c7dfeab64b4777afcc24e2b9c3d72b4dada22
        Then the CLI should respond with a JSON TX detail indicating:
        {
            "transaction": {
                "hash": "string",
                "height": 0,
                "index": 0,
                "tx_result": {
                "code": 0,
                "data": "string",
                "log": "string",
                "info": "string",
                "gas_wanted": 0,
                "gas_used": 0,
                "events": [
                    "string"
                ],
                "codespace": "string"
                },
                "tx": "string",
                "proof": {
                "root_hash": "string",
                "data": "string",
                "proof": {
                    "total": 0,
                    "index": 0,
                    "leaf_hash": "string",
                    "aunts": [
                    "string"
                        ]
                    }
                }
            }
        }

        Scenario: Transaction doesn't exist
            Given a pocket core node
            And a genesis file query-transaction-genesis-step2.json
            And a transaction with the hash 23197E4D46009879F28F978A90627C7DFEAB64B4777AFCC24E2B9C3D72B4DADA22 exists in the pocket core network
            When I use query namespace
            And I use method tx
            And I send the parameter hash 23197E4D46009879F28F978A90627C7DFEAB64B4777AFCC24E2B9C3D72B4DADA22
            Then the CLI should respond with a JSON TX detail indicating:
            {
                "code":400,
                "message":"Tx: response error: RPC error -32603 - Internal error: Tx (23197E4D46009879F28F978A90627C7DFEAB64B4777AFCC24E2B9C3D72B4DADA22) not found"
            }
        
        Scenario: Transaction has invalid characters 
            Given a pocket core node
            And a genesis file query-transaction-genesis-step2.json
            And a transaction with the hash 23197E4D4)(&09879F28F978A90627C7DFEAB64B4777AFCC24E2B9C3D72B4DADA22 exists in the pocket core network
            When I use query namespace
            And I use method tx
            And I send the parameter hash 23197E4D4)(&09879F28F978A90627C7DFEAB64B4777AFCC24E2B9C3D72B4DADA22
            Then the CLI should respond with a JSON TX detail indicating:
            {
                "code":400,
                "message":"encoding/hex: invalid byte: U+0029 ')'"
            }