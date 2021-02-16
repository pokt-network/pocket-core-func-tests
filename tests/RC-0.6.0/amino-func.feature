Scenario: Make sure that existing functionality it's still working
    Given that the user it's running pocket's latest version.
    And user does `pocket version`
    And user receives 
    |RC-0.6.0|
    When user executes current pocket core func-test suite totally ignoring the --legacyCodec flag
    Then all results should be as expected, and encoding it's happening by default with Proto.

Scenario: Send a transaction using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts send-tx <fromAddr> <toAddr> <amount> <chainID> <fee> <memo> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Send a transaction using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts send-tx <fromAddr> <toAddr> <amount> <chainID> <fee> <memo> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Build and sign a multisignature using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts build-MS-Tx  <signer-address> <json-message> <hex-pubkeys> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Build and sign a multisignature using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts build-MS-Tx  <signer-address> <json-message> <hex-pubkeys> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Sign a multisignature with public keys using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts sign-ms-tx  <signer-address> <hex-stdtx> <hex-pubkeys> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Sign a multisignature with public keys using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts sign-ms-tx  <signer-address> <hex-stdtx> <hex-pubkeys> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Sign a multisignature transaction object, result is hex encoded standard using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts sign-ms-next <signer-address> <hex-stdtx> <hex-pubkeys> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Sign a multisignature transaction object, result is hex encoded standard using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket accounts sign-ms-next <signer-address> <hex-stdtx> <hex-pubkeys> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction signed as follows: <multisignatureTx>|

Scenario: Stake an APP, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket app stake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Stake an APP, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket app stake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unstake an APP, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket app unstake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unstake an APP, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket app unstake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Stake a node, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node stake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Stake a node, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node stake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unstake a node, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unstake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unstake a node, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unstake <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unjail a node, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unjail <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unjail a node, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unjail <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unjail a node, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unjail <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=true>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Unjail a node, using defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket node unjail <fromAddr> <amount> <chains> <chainID> <fee> <legacyCodec=false>`
    Then user receives:
    |Transaction submitted with hash: <Transaction Hash>|

Scenario: Decodes a given transaction encoded in Amino/Proto base64 bytes, using amino encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket util decode-tx <tx> <legacyCodec=true>`
    Then user receives:
    |Type:           claim
    Msg:            {{7eaceace60765c8bb544038e14dc8c26455df82f55f8edd753a0459ff8361feb 0021 14461} {[71 124 234 141 235 220 242 18 233 162 183 9 111 188 47 113 61 37 147 4 28 87 76 214 67 38 203 181 230 185 36 63] {0 18388159010740356465}} 286 8C3A7C2B9EB28E97C76EC1C1A0B45E5BD11F6A97 1 0}
    Fee:            10000upokt
    Entropy:        -7732596869214888187
    Memo:
    Signer          8c3a7c2b9eb28e97c76ec1c1a0b45e5bd11f6a97
    Sig:            0eeb3509becead6852c9cf27184b397694f1d74d89313a7aeedb01be4f9cb73f|

Scenario: Decodes a given transaction encoded in Amino/Proto base64 bytes, defaulted proto encoding
    Given that the user it's running pocket's latest version.
    When user does `pocket util decode-tx <tx> <legacyCodec=false>`
    Then user receives:
    |Type:           claim
    Msg:            {{7eaceace60765c8bb544038e14dc8c26455df82f55f8edd753a0459ff8361feb 0021 14461} {[71 124 234 141 235 220 242 18 233 162 183 9 111 188 47 113 61 37 147 4 28 87 76 214 67 38 203 181 230 185 36 63] {0 18388159010740356465}} 286 8C3A7C2B9EB28E97C76EC1C1A0B45E5BD11F6A97 1 0}
    Fee:            10000upokt
    Entropy:        -7732596869214888187
    Memo:
    Signer          8c3a7c2b9eb28e97c76ec1c1a0b45e5bd11f6a97
    Sig:            0eeb3509becead6852c9cf27184b397694f1d74d89313a7aeedb01be4f9cb73f|