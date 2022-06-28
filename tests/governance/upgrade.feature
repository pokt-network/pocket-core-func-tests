
Feature: Upgrade 

   Governance procedure allows members of the DAO to issue protocol upgrades, 
   this makes sure all nodes follow through on upgrading.

   Scenario Outline: 336 Upgrade protocol
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov upgrade  <DAO Address> <height> <version> <ChainID> <fees>"
      | pocket gov upgrade abf1df709a0cc486ac6db216ba9ed260e5597ba9 50 0.1.0 pocket-testet-playground 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "83467B4A4F124626D3CB00B6E12C8A70315FA1280E372F2C2B29726234E643A3",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"upgrade\"}]}]}]",
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
                            "value": "upgrade"
                        }
                    ]
                }
            ]
        }
    ]
}|
  When the network reaches the given height, blockchain will halt

   Scenario Outline: 336 Upgrade protocol, incomplete
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov burn"
      | pocket gov burn |
    Then user should be prompted with error message
    | pocket gov upgrade
Error: accepts 5 arg(s), received 0
Usage:
  pocket gov upgrade <fromAddr> <atHeight> <version>, <chainID> <fees> [flags]

Flags:
  -h, --help   help for upgrade

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

2020/06/15 03:35:19 accepts 5 arg(s), received 0|