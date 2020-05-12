Feature: /v1/query/pocketparams endpoint
    Scenario: Return parameters at height
        Given a pocket core node
        And a genesis file query-height-genesis-step1.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/pocketparams
        {
            "height": 2
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "claim_expiration":"100",
            "proof_waiting_period":"3",
            "replay_attack_burn_multiplier":"0",
            "session_node_count":"5",
            "supported_blockchains":[
                "0001",
                "0002",
                "0003",
                "0004",
                "0005",
                "0006",
                "0007",
                "0008",
                "0009",
                "000A",
                "000B",
                "000C",
                "000D",
                "000E",
                "000F",
                "0010",
                "0011",
                "0012",
                "0013",
                "0014",
                "0015",
                "0016",
                "0017",
                "0018",
                "0019",
                "001A",
                "001B",
                "001C",
                "001D",
                "001E",
                "001F",
                "0020",
                "0021",
                "0022",
                "0023",
                "0024",
                "0025",
                "0026",
                "0027",
                "0028",
                "0029",
                "002A",
                "002B",
                "002C",
                "002D",
                "002E",
                "002F",
                "0030",
                "0031",
                "0032",
                "0033",
                "0034",
                "0035",
                "0036",
                "0037",
                "0038",
                "0039",
                "003A",
                "003B",
                "003C",
                "003D",
                "003E",
                "003F",
                "0040",
                "0041",
                "0042",
                "0043",
                "0044",
                "0045",
                "0046",
                "0047",
                "0048",
                "0049",
                "004A",
                "004B",
                "004C",
                "004D",
                "004E",
                "004F",
                "0050",
                "0051",
                "0052",
                "0053",
                "0054",
                "0055",
                "0056",
                "0057",
                "0058",
                "0059",
                "005A",
                "005B",
                "005C",
                "005D",
                "005E",
                "005F",
                "0060",
                "0061",
                "0062",
                "0063",
                "0064",
                "0065",
                "0066",
                "0067",
                "0068",
                "0069",
                "006A",
                "006B"
            ]
        }
    Scenario: Return error with incorrect height
        Given a pocket core node
        And a genesis file query-height-genesis-step2.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/pocketparams
        {
            "height": -1
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "code":400,
            "message":"{
                "codespace":"sdk",
                "code":1,
                "message":"failed to load state at height -1; failed to get Store: no data (latest height: 4308)"
            }"
        }
    Scenario: Return error with invalid chars in height
        Given a pocket core node
        And a genesis file query-height-genesis-step2.json
        And a pocket core network is running
        When I send a HTTP POST request to the /v1/query/pocketparams
        {
            "height": -io
        }
        Then the HTTP POST response will be a block detail indicating:
        {
            "code":400,
            "message":"invalid character 'i' in numeric literal"
        }