Feature: Burn 

   Governance procedure allows members of the DAO to burn funds from the DAO 

   Scenario Outline: Burn funds from DAO 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov transfer <amount> <DAO Address> <toAddress> <ChainID>  <fees>"
      | pocket gov burn 100000 abf1df709a0cc486ac6db216ba9ed260e5597ba9 1445e7a38aaf8b78440366f5b7af97fdef3e3b1f testnet pocket gov transfer abf1df709a0cc486ac6db216ba9ed260e5597ba9 1445e7a38aaf8b78440366f5b7af97fdef3e3b1f testnet 100000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "9E5AA38C27A9E0FB8EF5B4715DE67087B3DC7AB1E2AF123F6416567AB488BCE1",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"dao_burn\"}]}]}]",
    "logs": [
        {
            "msg_index": 0,
            "success": true,
            "log": "",
            "events": [
                {
                    "type": "message",
                    "attributes": [
                        {
                            "key": "action",
                            "value": "dao_burn"
                        }
                    ]
                }
            ]
        }
    ]
}|

   Scenario Outline: Burn funds from DAO, wrong address 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov burn <amount> <DAO Address> <ChainID>  <fees>"
      | pocket gov burn 100000 c993cbc7d29eb94e6429eee2268b6937ce67d75f abf1df709a0cc486ac6db216ba9ed260e5597ba9 testnet 10000|
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user should be prompted with error message
    |{
    "height": "0",
    "txhash": "4DE681E9CE90134B8895C47DB781F93676E93A77F7ABCFFAE12457C17973785F",
    "code": 9,
    "raw_log": "{\"codespace\":\"sdk\",\"code\":9,\"message\":\"account c993cbc7d29eb94e6429eee2268b6937ce67d75f does not exist\"}"
}|

   Scenario Outline: burn funds from DAO, incomplete 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov burn"
      | pocket gov burn |
    Then user should be prompted with error message
    | Error: accepts 5 arg(s), received 0
Usage:
  pocket gov burn <amount> <fromAddr> <toAddr> <chainID> <fees> [flags]

Flags:
  -h, --help   help for burn 

Global Flags:
      --blockTime int             how often should the network create blocks (default 1)
      --datadir string            data directory (default is $HOME/.pocket/
      --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
      --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
      --pocketRPCPort string      the port for pocket rpc
      --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
      --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
      --simulateRelay             would you like to be able to test your relays
      --testnet                   would you like to connect to Pocket Network testnet
      --tmPeersPort string        the port for tendermint p2p
      --tmRPCPort string          the port for tendermint rpc

2020/06/15 03:17:19 accepts 5 arg(s), received 0 |

