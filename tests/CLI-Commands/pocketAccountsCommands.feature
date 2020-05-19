Scenario: Pocket Accounts commands
    Given that the user has Pocket Network latest version installed.
    And from his terminal, types in "pocket accounts"
    When hitting enter
    Then user should be able to see following list of available commands and description as Examples:
    | command  | description  |
    {
        create            Create a new account
        delete            Delete an account
        export            Export an account
        export-raw        Export Plaintext Privkey
        get-coinbase      Gets the coinbase account from the keybase
        import-armored    Import keypair using armor
        import-raw        import-raw <private-key-hex>
        list              List all accounts
        send-raw-tx       Send raw transaction from signed bytes
        send-tx           Send POKT
        show              Shows a pubkey for address
        sign              Sign a message with an account
        update-passphrase Update account passphrase
    }

Scenario: To create a new account
    Given that the user has Pocket Network latest version installed.
    And wants to create an account
    When typing "pocket accounts create"
    Then user should be prompted to enter its passphrase: "Enter Passphrase: "
    When passphrase is provided...
    Then user received its account details after the "Account generated successfully:" message:
    | Address: 72e1baa0dea9658d9d2fa5929c99e83c2a532552. |

Scenario: To delete an existing account
    Given that the user has Pocket Network latest version installed.
    And wants to delete an account
    When typing "pocket accounts delete <address>". Examples:
    | pocket accounts delete 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be prompted to enter its existing passphrase: "Enter Passphrase: "
    And noticed by the following notification message: "Account deleted successfully"

Scenario: To delete an existing account by providing wrong command format
    Given that the user has Pocket Network latest version installed.
    And wants to delete an account
    When typing "pocket accounts delete". Examples:
    | pocket accounts delete |
    Then user should be prompted to view an error validation message (not existing at the moment)
    And showed the right command as a suggestion.

Scenario: To export an existing account
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export <address> [flags]". Examples:
    | pocket accounts export 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be prompted to enter the Decrypt passphrase: "Enter Decrypt Passphrase"
    And user should be prompted to enter the Encrypt passphrase: "Enter encrypt Passphrase"
    And showed the correct successfull message.

Scenario: To export an existing account, and failing the passphrase
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export <address> [flags]". Examples:
    | pocket accounts export 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be prompted to enter the Decrypt passphrase wrong: "Enter Decrypt Passphrase"
    And user should be prompted to enter the Encrypt passphrase wrong: "Enter encrypt Passphrase"
    And showed the following error message: "Ciphertext decryption failed"

Scenario: To export an existing account, not provide the address
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export <address> [flags]". Examples:
    | pocket accounts export|
    Then user should be prompted the right command suggestion, as well as the flags list to be added. Examples:
    | Error: accepts 1 arg(s), received 0
        Usage:
        pocket accounts export <address> [flags]

        Flags:
        -h, --help   help for export

        Global Flags:
            --blockTime int             how often should the network create blocks (default 1)
            --datadir string            data directory (default is $HOME/.pocket/
            --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
            --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
            --pocketRPCPort string      the port for pocket rpc (default "8081")
            --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
            --tmPeersPort string        the port for tendermint p2p (default "26656")
            --tmRPCPort string          the port for tendermint rpc (default "26657") |
  
 Scenario: To export an existing account with wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export <address> [flags]". Examples:
    | pocket accounts export 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be showed the following error: "Address Error encoding/hex: invalid byte: U+0077"

Scenario: To export an existing plaintext private key
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export-raw <address> [flags]". Examples:
    | pocket accounts export-raw 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be prompted to enter the Decrypt passphrase: "Enter Decrypt Passphrase"
    And showed the correct successfull message. Examples:
    | Exported Raw Private Key: 285208ad8e505dd5672dc03b0c005efe78d97dff48c5b4811ca7582cc04fb98c57692033055cbdd1a3308a6364b24121d32d7536bb51660843ddfd96c879c2ba  |

Scenario: To export an existing plaintext private key, providing wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export-raw <address> [flags]". Examples:
    | pocket accounts export-raw 72e1baa0dea9658d9d2fa5929c99e83c2a532552 |
    Then user should be prompted an error message, such as... Examples:
    | Address Error encoding/hex: invalid byte: U+0077  |

Scenario: To export an existing plaintext private key, providing incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to import an existing account
    When typing "pocket accounts export-raw <address> [flags]". Examples:
    | pocket accounts export-raw|
    Then user should be prompted the right command suggestion, as well as the flags list to be added. Examples:
    | Error: accepts 1 arg(s), received 0
        Usage:
        pocket accounts export-raw <address> [flags]

        Flags:
        -h, --help   help for export-raw

        Global Flags:
            --blockTime int             how often should the network create blocks (default 1)
            --datadir string            data directory (default is $HOME/.pocket/
            --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
            --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
            --pocketRPCPort string      the port for pocket rpc (default "8081")
            --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
            --tmPeersPort string        the port for tendermint p2p (default "26656")
            --tmRPCPort string          the port for tendermint rpc (default "26657")

        accepts 1 arg(s), received 0
        |

Scenario: To get an accounts coinbase
    Given that the user has Pocket Network latest version installed.
    And wants to get an accounts coinbase address
    When typing "pocket accounts get-coinbase".
    Then user should receive the coinbase as follows: "Coinbase Account:<address>". Examples:
    | Coinbase Account:031ccd0821df95cd80b78182c04937b45456b08f|

Scenario: To get an accounts coinbase, within a list of accounts
    Given that the user has Pocket Network latest version installed.
    And wants to get an accounts coinbase address
    When typing "pocket accounts get-coinbase 031ccd0821df95cd80b78182c04937b45456b08f".
    Then user should receive the coinbase as follows: "Coinbase Account:<address>". Examples:
    | Coinbase Account:031ccd0821df95cd80b78182c04937b45456b08f|

Scenario: To import a keypairs using armor
    Given that the user has Pocket Network latest version installed.
    And wants to import keypairs using armor
    When typing "pocket accounts import-armored <armored> [flags]".
    Then user should see a success message as follows: "Keypar value imported successully".

Scenario: To import a keypairs using armor, providing incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to import keypairs using armor
    When typing "pocket accounts import-armored".
    Then user should see a wrong command message, with its suggestion. Examples:
    | Usage:
    pocket accounts import-armored <armor> [flags]

    Flags:
    -h, --help   help for import-armored

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")
    |

 Scenario: To import raw private key
    Given that the user has Pocket Network latest version installed.
    And wants to import raw private key
    When typing "pocket accounts import-raw <private-key-hex> [flags]".
    Then user should see a success message as follows: "Accout imported successfully".

Scenario: To import raw private key, providing incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to import keypairs using armor
    When typing "pocket accounts import-raw".
    Then user should see a wrong command message, with its suggestion. Examples:
    | pocket accounts import-raw <private-key-hex> [flags]
        Flags:
        -h, --help   help for import-raw

        Global Flags:
            --blockTime int             how often should the network create blocks (default 1)
            --datadir string            data directory (default is $HOME/.pocket/
            --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
            --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
            --pocketRPCPort string      the port for pocket rpc (default "8081")
            --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
            --tmPeersPort string        the port for tendermint p2p (default "26656")
            --tmRPCPort string          the port for tendermint rpc (default "26657")
        |

Scenario: To see the list of existing accounts
    Given that the user has Pocket Network latest version installed.
    And wants to the list of existing addresses or accounts
    When typing "pocket accounts list".
    Then user should see a the existing accounts, having the consideration that first position is (0). Examples:
    | (0) 031ccd0821df95cd80b78182c04937b45456b08f|

Scenario: To send raw transaction from signed bytes
    Given that the user has Pocket Network latest version installed.
    And wants to the send a raw transaction from signed bytes
    When typing "pocket accounts send-raw-tx <fromAddr> <txBytes> [flags]".
    Then user should see a successfull message for the sent Tx.

Scenario: To send raw transaction from signed bytes, with incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to the send a raw transaction from signed bytes
    When typing "pocket accounts send-raw-tx <fromAddr>"
    And typing "pocket accounts send-raw-tx <txBytes> [flags]"
    Then user should see a wrong command message, with its suggestion. Examples:
    | Usage:
    pocket accounts send-raw-tx <fromAddr> <txBytes> [flags]

    Flags:
    -h, --help   help for send-raw-tx

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 2 arg(s), received 0 |

Scenario: To send a POKT tx to a specific address
    Given that the user has Pocket Network latest version installed.
    And wants to the send a specific quantity of POKT from address to address
    When typing "pocket accounts send-tx <fromAddr> <toAddr> <amount> [flags]".
    Then user should see a successfull message for the sent Tx.

Scenario: To send a POKT tx to a specific address, missing commands
    Given that the user has Pocket Network latest version installed.
    And wants to the send a specific quantity of POKT from address to address
    When typing "pocket accounts send-tx <fromAddr>".
    And typing "pocket accounts send-tx <fromAddr> <toAddr>"
    And typing "pocket accounts send-tx <fromAddr> <amount>"
    And typing "pocket accounts send-tx <amount>"
    And typing "pocket accounts send-tx <toAddr>"
    And typing "pocket accounts send-tx"
    Then user should see a wrong command message, with its suggestion. Examples:
    | Error: accepts 3 arg(s), received 0
Usage:
  pocket accounts send-tx <fromAddr> <toAddr> <amount> [flags]

Flags:
  -h, --help   help for send-tx

Global Flags:
      --blockTime int             how often should the network create blocks (default 1)
      --datadir string            data directory (default is $HOME/.pocket/
      --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
      --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
      --pocketRPCPort string      the port for pocket rpc (default "8081")
      --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
      --tmPeersPort string        the port for tendermint p2p (default "26656")
      --tmRPCPort string          the port for tendermint rpc (default "26657")

accepts 3 arg(s), received 0 |

Scenario: To see the public key for an address
    Given that the user has Pocket Network latest version installed.
    And wants to see an addresses's public key
    When typing "pocket accounts show <address>".
    Then user should see a successfull message and the address and pubkey returned. Examples:
    | Address:	031ccd0821df95cd80b78182c04937b45456b08f
    Public Key:	57692033055cbdd1a3308a6364b24121d32d7536bb51660843ddfd96c879c2ba | 

Scenario: To see the public key for an address, incomplete command.
    Given that the user has Pocket Network latest version installed.
    And wants to see an addresses's public key
    When typing "pocket accounts show".
    Then user should see a wrong command message, with its suggestion. Examples:
    | Error: accepts 1 arg(s), received 0
    Usage:
    pocket accounts show  <address> [flags]

    Flags:
    -h, --help   help for show

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 1 arg(s), received 0
    Emanuels-MacBook-Pro:~ emanuelmedrano$ pocket accounts list
    (0) 031ccd0821df95cd80b78182c04937b45456b08f
    Emanuels-MacBook-Pro:~ emanuelmedrano$ pocket accounts show 031ccd0821df95cd80b78182c04937b45456b08f
    Address:	031ccd0821df95cd80b78182c04937b45456b08f
    Public Key:	57692033055cbdd1a3308a6364b24121d32d7536bb51660843ddfd96c879c2ba |

Scenario: To sign a message with an account
    Given that the user has Pocket Network latest version installed.
    And wants to sing a message for an specific account
    When typing "pocket accounts sign <address> <msg>".
    Then user should see a successfull message.

Scenario: To sign a message with an account, missing commands
    Given that the user has Pocket Network latest version installed.
    And wants to sing a message for an specific account
    When typing "pocket accounts sign <address>".
    And typing "pocket accounts sign <msg>".
    And typing "pocket accounts sign".
    Then user should see a wrong command message, with its suggestion. Examples:
    | Error: accepts 2 arg(s), received 3
Usage:
  pocket accounts sign <address> <msg> [flags]

Flags:
  -h, --help   help for sign

Global Flags:
      --blockTime int             how often should the network create blocks (default 1)
      --datadir string            data directory (default is $HOME/.pocket/
      --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
      --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
      --pocketRPCPort string      the port for pocket rpc (default "8081")
      --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
      --tmPeersPort string        the port for tendermint p2p (default "26656")
      --tmRPCPort string          the port for tendermint rpc (default "26657")|

Scenario: To sign a message with an account, incorrect text sintax
    Given that the user has Pocket Network latest version installed.
    And wants to sing a message for an specific account
    When typing "pocket accounts sign <address> "testing".
    And typing "pocket accounts sign <address> 'testing'".
    Then user should see a wrong command message, with its suggestion. Examples:
    | encoding/hex: invalid byte: U+0054 'T' |
    | encoding/hex: invalid byte: U+0054 'T' |

Scenario: To update existing account passphrase
    Given that the user has Pocket Network latest version installed.
    And wants to update his, or any other addresses's passphrase
    When typing "pocket accounts update-passphrase <address>".
    Then user should be prompted to input the old existing passphrase.
    And user should be prompted to input the new passphrase. Examples:
    | Ciphertext decryption passed |

Scenario: To update existing account passphrase, miss any of the passphrases
    Given that the user has Pocket Network latest version installed.
    And wants to update his, or any other addresses's passphrase
    When typing "pocket accounts update-passphrase <address>".
    Then user should be prompted to input the old existing passphrase, which will be wrong
    And user should be prompted to input the new passphrase, which will be wrong.
    And user should be showed a notification message that passwords doesn't match or are wrong. Examples:
    | Ciphertext decryption failed |

Scenario: To update existing account passphrase, missing address
    Given that the user has Pocket Network latest version installed.
    And wants to update his, or any other addresses's passphrase
    When typing "pocket accounts update-passphrase".
    Then user should be prompted to a suggested and explained message. Examples:
    | Error: accepts 1 arg(s), received 0
    Usage:
    pocket accounts update-passphrase <address> [flags]

    Flags:
    -h, --help   help for update-passphrase

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 1 arg(s), received 0|