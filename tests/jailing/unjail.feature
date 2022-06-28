Feature: Unjail
 The Pocket Network ensures rewards stakers on the network, 
 in order to ensure estability of the network
 jail mechanisms are implemented to protect the network 
 unjailing allows users to pay a fee for infractions.


  Scenario: 151 Unjail jailed node from genesis
    Given a pocket network with <ChainID>
    And genesis file "jailed-validator-genesis.json" with a jailed validator
    And a node exist with address 0aad1b44723b909cb0cc5906b77ad0bae9772487
    When node wants to unjail
    When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
    And I send the parameters: 
        "
        fromAddr: 0aad1b44723b909cb0cc5906b77ad0bae9772487
        chainID: pocket-testet-playground
        fees: 50000
        "
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    And the details of the transaction should show "success: true"
      |
      http://localhost:8081/v1/client/rawtx
      {
          "height": "0",
          "logs": [
              {
                  "events": [
                      {
                          "attributes": [
                              {
                                  "key": "action",
                                  "value": "unjail_validator"
                              }
                          ],
                          "type": "message"
                      }
                  ],
                  "log": "",
                  "msg_index": 0,
                  "success": true
              }
          ],
          "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]",
          "txhash": "4DFF01B33C05B78EA87AC573259E493921CA8F78D246F8F9372B324CDDF6B9FD"
      }
      |

  Scenario: 151 Unjail a validator
    Given a pocket network with <ChainID>
    And a genesis file "nodes-stake-genesis.json"
    And a staked node exist with address df82af89fea299911f8cdac747de72b6bdb1468d
    When the node has missed <Jailed_blocks_counter>
    Then the network jails the validator
    When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
    And I send the parameters: 
        "
        fromAddr: 0aad1b44723b909cb0cc5906b77ad0bae9772487
        chainID: pocket-testet-playground
        fees: 50000
        "
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    And the details of the transaction should show "success: true"
      |
      http://localhost:8081/v1/client/rawtx
      {
          "height": "0",
          "logs": [
              {
                  "events": [
                      {
                          "attributes": [
                              {
                                  "key": "action",
                                  "value": "unjail_validator"
                              }
                          ],
                          "type": "message"
                      }
                  ],
                  "log": "",
                  "msg_index": 0,
                  "success": true
              }
          ],
          "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"unjail_validator\"}]}]}]",
          "txhash": "4DFF01B33C05B78EA87AC573259E493921CA8F78D246F8F9372B324CDDF6B9FD"
      }
      |