Feature: node-params method in pocket-core cli's query namespace
    Scenario: 219 Correct height number
        Given a pocket core node
        And a genesis file query-nodeparams-rpc-genesis-step1.json
        And an node exists in the pocket network in height 2
        When I use pocket's namespace query
        And the parameter I use is height 2
        Then the CLI response will JSON detail indicating:
        {
            "unstaking_time": "2020-05-12T18:10:20.211Z",
            "max_validators": 0,
            "stake_denom": "string",
            "stake_minimum": 0,
            "session_block_frequency": 0,
            "dao_allocation": 0,
            "proposer_allocation": 0,
            "max_evidence_age": "string",
            "signed_blocks_window": 0,
            "min_signed_per_window": 0,
            "downtime_jail_duration": 0,
            "slash_fraction_double_sign": 0,
            "slash_fraction_downtime": 0
        }
    Scenario: 220 Incorrect height number
        Given a pocket core node
        And a genesis file query-nodeparams-rpc-genesis-step2.json
        And an node doesn't exist in the pocket network in height -1
        When I use pocket's namespace query
        And the parameter I use is height -1
        Then the CLI response will be a JSON detail indicating:
        {
            "code":400,
            "message":
            "{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4108)"                
            }"
        }

    Scenario: 221 Invalid height number
        Given a pocket core node
        And a genesis file query-nodeparams-rpc-genesis-step3.json
        And a node doesn't exist in the pocket network in height -i
        When I use pocket's namespace query
        And the parameter I use is height -i 
        Then the CLI response will be a JSON detail indicating:
        {
            "code":400,
            "message":"invalid character 'i' in numeric literal"
        }
    
    