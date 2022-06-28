Feature: Change param 

   Governance procedure allows members of the DAO to be able to change parameters of the chain with a transaction.


   Scenario Outline: 306 Change param pocketcore/ClaimExpiration 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ClaimExpiration \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

   Scenario Outline: 307 Change pocketcore/ClaimExpiration, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ClaimExpiration “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change


   Scenario Outline: 308 Change param pocketcore/MinimumNumberOfProofs 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/MinimumNumberOfProofs \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

   Scenario Outline: 309 Change pocketcore/MinimumNumberOfProofs, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/MinimumNumberOfProofs “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

   Scenario Outline: 310 Change param pocketcore/SessionNodeCount
 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/SessionNodeCount \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

   Scenario Outline: 311 Change pocketcore/SessionNodeCount, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/SessionNodeCount “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

   Scenario Outline: 312 Change param pocketcore/ReplayAttackBurnMultiplier
 
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ReplayAttackBurnMultiplier \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

   Scenario Outline: 313 Change pocketcore/ReplayAttackBurnMultiplier, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ReplayAttackBurnMultiplier “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

   Scenario Outline: 314 Change param pocketcore/ClaimSubmissionWindow
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ClaimSubmissionWindow \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 315 Change pocketcore/ClaimSubmissionWindow, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/ClaimSubmissionWindow “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 316 Change param pocketcore/SupportedBlockchains
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/SupportedBlockchains “[\“01\“]” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 317 Change pocketcore/SupportedBlockchains, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pocketcore/SupportedBlockchains “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change


  Scenario Outline: 318 Change param pos/DAOAllocation
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/DAOAllocation \“10\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 319 Change pos/DAOAllocation, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/DAOAllocation “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 320 Change param pos/DowntimeJailDuration
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/DowntimeJailDuration \“600000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 321 Change pos/DowntimeJailDuration, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/DowntimeJailDuration “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 322 Change param pos/MaxEvidenceAge
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxEvidenceAge \"120000000000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 323 Change pos/MaxEvidenceAge, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxEvidenceAge “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 324 Change param pos/MaxJailedBlocks
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxJailedBlocks \"1000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 325 Change pos/MaxJailedBlocks, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxJailedBlocks “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 326 Change param pos/MaxValidators
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxValidators \"10000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 327 Change pos/MaxValidators, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaxValidators “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 328 Change param pos/MaximumChains
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaximumChains \"10000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 329 Change pos/MaximumChains, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MaximumChains “15” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 330 Change param pos/MinSignedPerWindow
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MinSignedPerWindow \"10000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 331 Change pos/MinSignedPerWindow, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/MinSignedPerWindow “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 332 Change param pos/ProposerPercentage
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/ProposerPercentage \"1\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 333 Change pos/ProposerPercentage, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/ProposerPercentage “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change


  Scenario Outline: 334 Change param pos/RelaysToTokensMultiplier
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/RelaysToTokensMultiplier \"0\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 335 Change pos/RelaysToTokensMultiplier, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/RelaysToTokensMultiplier “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 336 Change param pos/BlocksPerSession
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/BlocksPerSession \"25\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 337 Change pos/BlocksPerSession, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/BlocksPerSession “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 338 Change param pos/SignedBlocksWindow
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SignedBlocksWindow \"100\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 339 Change pos/SignedBlocksWindow, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SignedBlocksWindow “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 340 Change param pos/SlashFractionDoubleSign
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDoubleSign \"0.0500000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 341 Change pos/SlashFractionDoubleSign, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDoubleSign “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 342 Change param pos/SlashFractionDowntime
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDowntime \"0.01\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 343 Change pos/SlashFractionDowntime, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDowntime “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 344 Change param pos/SlashFractionDowntime
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDowntime \"upokt\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 345 Change pos/SlashFractionDowntime, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/SlashFractionDowntime “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 346 Change param pos/StakeMinimum
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/StakeMinimum \"1000000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 347 Change pos/StakeMinimum, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/StakeMinimum “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 348 Change param pos/UnstakingTime
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/UnstakingTime \"1814400000000000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 349 Change pos/UnstakingTime, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test pos/UnstakingTime “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 350 Change param application/UnstakingTime
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/UnstakingTime \"1814400000000000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 351 Change application/UnstakingTime, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/UnstakingTime “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 352 Change param application/MaxValidators
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/MaxValidators \"10000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 353 Change application/MaxValidators, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/MaxValidators “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 354 Change param application/MaximumChains
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/MaximumChains \"10000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 355 Change application/MaximumChains, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/MaximumChains “15” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 356 Change param application/StakeMinimum
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/StakeMinimum \"1000000\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 357 Change application/StakeMinimum, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/StakeMinimum “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 358 Change param application/BaseRelaysPerPOKT
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/BaseRelaysPerPOKT \"100\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 359 Change application/BaseRelaysPerPOKT, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/BaseRelaysPerPOKT “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 360 Change param application/StabilityAdjustment
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/StabilityAdjustment \"0\” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 361 Change application/StabilityAdjustment, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/StabilityAdjustment “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change

  Scenario Outline: 362 Change param application/ParticipationRateOn
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/ParticipationRateOn false 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|

  Scenario Outline: 363 Change application/ParticipationRateOn, invalid param
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params <DAO Address> <ChainID> <paramKey> <param> <fees>"
      | pocket gov change_param abf1df709a0cc486ac6db216ba9ed260e5597ba9 pocket-test application/ParticipationRateOn “10” 10000 |
    And hitting enter
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided
    Then user receives details of the transaction
    |{
    "height": "0",
    "txhash": "C62E109416B230A7E3BA75B55D3236E8792A2D39509DCCD0B7B8402CD71A05B2",
    "raw_log": "[{\"msg_index\":0,\"success\":true,\"log\":\"\",\"events\":[{\"type\":\"message\",\"attributes\":[{\"key\":\"action\",\"value\":\"change_param\"}]}]}]",
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
                            "value": "change_param"
                        }
                    ]
                }
            ]
        }
    ]
}|
   But value does not change



  Scenario Outline: 364 Change param incomplete
    Given a pocket network with <ChainID>
    And a DAO address
    When typing "pocket gov change_params"
    Then user should be prompted with error message
    |Error: accepts 5 arg(s), received 0
Usage:
  pocket gov change_param <fromAddr> <chainID> <paramKey module/param> <paramValue (jsonObj)> <fees> [flags]

Flags:
  -h, --help   help for change_param

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

2020/06/15 04:28:32 accepts 5 arg(s), received 0|