Feature: block-txs method in pocket-core cli's query namespace
    Scenario: Get block height
        Given a pocket core node
        And a genesis file query-blocktxs-genesis-step1.json
        And a pocket core network is running
        And transactions have occurred in height 2
        When I use the pocket namespace query
        And I use the method of block
        And I use the parameters of height 2 in the method
        Then the CLI should return a JSON response will be a transactions details indicating:
        {
            "block": {
                "data": {
                "txs": null
                },
                "evidence": {
                "evidence": null
                },
                "header": {
                "app_hash": "",
                "chain_id": "pocket-test",
                "consensus_hash": "90B6C64F69FDCF9746F038BD2D27DFFFAE814E19EA6F974C740896AA62EDDA1D",
                "data_hash": "",
                "evidence_hash": "",
                "height": "1",
                "last_block_id": {
                    "hash": "",
                    "parts": {
                    "hash": "",
                    "total": "0"
                    }
                },
                "last_commit_hash": "",
                "last_results_hash": "",
                "next_validators_hash": "AC2B8D79A789E27A51E809BED90DCA8EA0E640CA134F9ADDD1B4510E8CE8C1C0",
                "num_txs": "0",
                "proposer_address": "AD8EAF52981A102068AA1FE4108E5520542078C3",
                "time": "2020-03-10T00:04:35.159615Z",
                "total_txs": "0",
                "validators_hash": "AC2B8D79A789E27A51E809BED90DCA8EA0E640CA134F9ADDD1B4510E8CE8C1C0",
                "version": {
                    "app": "0",
                    "block": "10"
                }
                },
                "last_commit": {
                "block_id": {
                    "hash": "",
                    "parts": {
                    "hash": "",
                    "total": "0"
                    }
                },
                "precommits": null
                }
        },
            "block_meta": {
                "block_id": {
                "hash": "D0A2AB1DE2FB356AEBF4CD9B18EA6E6754323512196858557787358C279E0473",
                "parts": {
                    "hash": "581F3CCD645EB60EC4F16575F1C73393C9405C76E42C6C5D14938875FE4912F5",
                    "total": "1"
                }
                },
                "header": {
                "app_hash": "",
                "chain_id": "pocket-test",
                "consensus_hash": "90B6C64F69FDCF9746F038BD2D27DFFFAE814E19EA6F974C740896AA62EDDA1D",
                "data_hash": "",
                "evidence_hash": "",
                "height": "1",
                "last_block_id": {
                    "hash": "",
                    "parts": {
                    "hash": "",
                    "total": "0"
                    }
                },
                "last_commit_hash": "",
                "last_results_hash": "",
                "next_validators_hash": "AC2B8D79A789E27A51E809BED90DCA8EA0E640CA134F9ADDD1B4510E8CE8C1C0",
                "num_txs": "0",
                "proposer_address": "AD8EAF52981A102068AA1FE4108E5520542078C3",
                "time": "2020-03-10T00:04:35.159615Z",
                "total_txs": "0",
                "validators_hash": "AC2B8D79A789E27A51E809BED90DCA8EA0E640CA134F9ADDD1B4510E8CE8C1C0",
                "version": {
                    "app": "0",
                    "block": "10"
                }
            }
        }

    Scenario: Given an invalid number height
        Given a pocket core node
        And a genesis file query-blocktxs-genesis-step2.json
        And a pocket core network is running
        When I use the pocket namespace query
        And I use the method of block
        And I use the parameters of height 9999999 in the method
        Then the CLI should return a JSON response will be a transactions details indicating
        {
            "code":400,
            "message":"Block: response error: RPC error -32603 - Internal error: Height must be less than or equal to the current blockchain height"
        }
    
    Scenario: Given an invalid char in height
        Given a pocket core node
        And a genesis file query-blocktxs-genesis-step3.json
        And a pocket core network is running
        When I use the pocket namespace query
        And I use the method of block
        And I use the parameters of height 12-$2 in the method
        Then the CLI should return a JSON response will be a transactions details indicating
        {
            "code":400,
            "message":"invalid character '-' after object key:value pair"
        }