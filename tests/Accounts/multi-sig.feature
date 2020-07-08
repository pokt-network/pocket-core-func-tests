Feature: multi signature accounts

Multi signature accounts allow for multiple individual accounts to join into one account
transactions for the multi signature accounts require all members of the multi signature account
to sign the transaction message.

  Scenario: create multi signature account
    Given a keybase with account "df82af89fea299911f8cdac747de72b6bdb1468d"
    And account "c9b632ff626260d3590af614b7d6989213d83536"
    When account holders want to create a multi signature account
    Then typing "pocket accounts create-multi-public <ordered-comma-separated-hex-pubkeys>"
    And I send the parameters: 
      "
      ordered-comma-separated-hex-pubkeys:  '883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d16403,6047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99'
      "
    Then CLI prompts results of the account:
      |
      Sucessfully generated Multisig Public Key:
      f325b8ad0a259d54477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99
      With Address:
      FA0177C27D88BBD30E10C843B4461424554A2960
      | 
  Scenario: create multi signature account, invalid character
    Given a keybase with account "df82af89fea299911f8cdac747de72b6bdb1468d"
    And account "c9b632ff626260d3590af614b7d6989213d83536"
    When account holders want to create a multi signature account
    Then typing "pocket accounts create-multi-public <ordered-comma-separated-hex-pubkeys>"
    And I send the parameters: 
      "
      ordered-comma-separated-hex-pubkeys:  '883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d16403,6047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99@2323Q4R1'
      "
    Then CLI prompts results of the account:
      |
      error in public key creation: encoding/hex: invalid byte: U+0020 ' '
      | 

  Scenario Outline:  multi signature account wants to create a transaction
  Creating a multi signature transaction requires all members of the account to sign the message in order

    Scenario: build a multi-signature transaction
      Given a pocket core node with <chainID> 
      And a multi signature account "fa0177c27d88bbd30e10c843b4461424554a2960"
      And a keybase with "df82af89fea299911f8cdac747de72b6bdb1468d"
      When typing "pocket accounts build-MS-Tx <signer-address> <json-msg> <ordered-comma-separated-hex-pubkeys> <chainID> <fees>  [flags]"
      And I send the parameters: 
        '
        signer-address: df82af89fea299911f8cdac747de72b6bdb1468d
        ordered-comma-separated-hex-pubkeys:  "883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d16403,6047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99@2323Q4R1"
        chainID: pocket-testet-playground
        fees: 50000
        json-msg: "{\"type\":\"pos/Send\",\"value\":{\"amount\":\"100000\",\"from_address\":\"fa0177c27d88bbd30e10c843b4461424554a2960\",\"to_address\":\"df82af89fea299911f8cdac747de72b6bdb1468d\"}}"
        '
      Then user should be prompted to enter its passphrase: "Enter Passphrase: "
      When passphrase is provided
      Then user receives a txHash signed by the signer-address
      |
      Multisig transaction: 
      f801db0b170d0a38a5e344a60a14fa0177c27d88bbd30e10c843b4461424554a29601214df82af89fea299911f8cdac747de72b6bdb1468d1a06313030303030120e0a0575706f6b74120531303030301a9c010a52f325b8ad0a259d5
      4477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c991246b2f515f90a40ec54cf02464f90036822
      b987f48ee76d2d2d43d4f59677f6effce45ecc82f595c2cb5f9a90a6827f60c901293dcf225d0ffeecfa1493e1324d34367ebb4ad70b28bd96f7c4b1c4b0ece401
      |

    Scenario: Sign a multi-signature transaction next
      Given a pocket core node with <chainID>
      And the msg bytes of a multi signature transaction with one signature
      Then typing "pocket accounts sign-ms-next <your-signer-address> <hex-amino-stdtx> <chainID>"
      And I send the parameters: 
        '
        signer-address: c9b632ff626260d3590af614b7d6989213d83536
        chainID: pocket-testet-playground
        hex-amino-stdtx: "f801db0b170d0a38a5e344a60a14fa0177c27d88bbd30e10c843b4461424554a29601214df82af89fea299911f8cdac747de72b6bdb1468d1a06313030303030120e0a0575706f6b74120531303030301a9c010a52f325b8ad0a259d5
      4477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c991246b2f515f90a40ec54cf02464f90036822
      b987f48ee76d2d2d43d4f59677f6effce45ecc82f595c2cb5f9a90a6827f60c901293dcf225d0ffeecfa1493e1324d34367ebb4ad70b28bd96f7c4b1c4b0ece401"
        '
      Then user should be prompted to enter its passphrase: "Enter Passphrase: "
      When passphrase is provided
      Then user receives raw tx bytes signed with address
      |
      Multisig transaction: 
      ba02db0b170d0a38a5e344a60a14fa0177c27d88bbd30e10c843b4461424554a29601214df82af89fea299911f8cdac747de72b6bdb1468d1a06313030303030120e0a0575706f6b74120531303030301adf010a52f325b8ad0a259d5
      4477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99128801b2f515f90a403ff021db289ce68d83
      effd17134124e355a57c55788bce15425d9e1b4d3cf79c0cab9109b05cd8220d155db1ea1836b57b10e66276c609a5de3bcfdb7d6287000a4073e8d9a8a6b76a346ed1be500172e86ffe7c7d7c2d43b6ff95fcfb93ddefd014d0fe5db
      3a2ed27e88b56308b417b2021c8e3b8496b0a8bd3abde9056cc54350c28ebbd898bd8e4b5836d
      |

    Scenario: Sign a multi-signature transaction 
      Given a pocket core node with <chainID>
      And the msg bytes of a multi signature transaction with one signature
      Then typing "pocket accounts sign-ms-tx <your-signer-address> <hex-amino-stdtx> <ordered-comma-separated-hex-pubkeys> <chainID>"
      And I send the parameters: 
        '
        your signer-address: c9b632ff626260d3590af614b7d6989213d83536
        hex-amino-stdtx: "f801db0b170d0a38a5e344a60a14fa0177c27d88bbd30e10c843b4461424554a29601214df82af89fea299911f8cdac747de72b6bdb1468d1a06313030303030120e0a0575706f6b74120531303030301a9c010a52f325b8ad0a259d5
      4477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c991246b2f515f90a40ec54cf02464f90036822
      b987f48ee76d2d2d43d4f59677f6effce45ecc82f595c2cb5f9a90a6827f60c901293dcf225d0ffeecfa1493e1324d34367ebb4ad70b28bd96f7c4b1c4b0ece401"
        ordered-comma-separated-hex-pubkeys:  "883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d16403,6047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99@2323Q4R1"
        chainID: pocket-testet-playground
        '
      Then user should be prompted to enter its passphrase: "Enter Passphrase: "
      When passphrase is provided
      Then user receives raw tx bytes signed with the address
      |
      Multisig transaction: 
      ba02db0b170d0a38a5e344a60a14fa0177c27d88bbd30e10c843b4461424554a29601214df82af89fea299911f8cdac747de72b6bdb1468d1a06313030303030120e0a0575706f6b74120531303030301adf010a52f325b8ad0a259d5
      4477420883cc39e7f73259b4d5cb601a3251911373e6c10221e5f3b81c321caf5d164030a259d544774206047cca57f58f55bbe1e0c829c09d513986344d0081e832af18ad99517fc5c99128801b2f515f90a403ff021db289ce68d83
      effd17134124e355a57c55788bce15425d9e1b4d3cf79c0cab9109b05cd8220d155db1ea1836b57b10e66276c609a5de3bcfdb7d6287000a4073e8d9a8a6b76a346ed1be500172e86ffe7c7d7c2d43b6ff95fcfb93ddefd014d0fe5db
      3a2ed27e88b56308b417b2021c8e3b8496b0a8bd3abde9056cc54350c28ebbd898bd8e4b5836d
      |