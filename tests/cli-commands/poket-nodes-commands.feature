Scenario: To show existing commands within the pocket nodes section
    Given that the user has Pocket Network latest version installed.
    And wants to see the available actions for pocket nodes
    When typing "pocket nodes".
    And hitting "enter "
    Then user should be prompted the following suggestion. Examples:
    | node management

    Usage:
    pocket nodes [command]

    Available Commands:
    stake       Stake a node in the network
    unjail      Unjails a node in the network
    unstake     Unstake a node in the network

    Flags:
    -h, --help   help for nodes

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --madvdontneed              if enabled, run with GODEBUG=madvdontneed=1, --madvdontneed=true/false (default true)
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
    Use "pocket nodes [command] --help" for more information about a command.|

Scenario: To stake an node in the network
    Given that the user has Pocket Network latest version installed.
    Given a minimum stake of 100000
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
      | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    Then user should be shown a success message

Scenario: To stake an node in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>", with wrong address
      | pocket nodes stake "foobar" 100000 0022 testnet 100000 |
    Then user should be shown a failure message

Scenario: To stake a nodes in the network, amount lower than minimum stake
    Given that the user has Pocket Network latest version installed.
    Given a param pos/StakeMinimum of 100000
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>", lower than pos/StakeMinimum
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 0 0022 testnet 100000 |
    Then user should be shown a failure message

Scenario: To stake a nodes in the network, wrong serviceURI
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <serviceURI> <chains> <fees>", with non registered chains
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 "foobar" testnet 100000 |
    Then user should be shown a failure message

Scenario: To stake a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr>"
    And typing "pocket nodes stake <fromAddr> <amount>"
    And typing "pocket nodes stake <amount>"
    And typing "pocket nodes stake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 6 arg(s), received 0
    Usage:
    pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees> [flags]

    Flags:
    -h, --help   help for stake

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 6 arg(s), received 0|

Scenario: To unjail a node in the network
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]"
    | pocket nodes unjail abf1df709a0cc486ac6db216ba9ed260e5597ba9 testnet 100000 |
    Then user should be shown a success message

Scenario: To unjail a node in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail <fromAddr> <chainID> <fees> [flags]", with wrong address
    | pocket nodes unjail foobar testnet 100000 |
    Then user should be shown a failure message

Scenario: To unjail a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 3 arg(s), received 0
    Usage:
    pocket nodes unjail <fromAddr> <chainID> <fees>[flags]

    Flags:
    -h, --help   help for unjail

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 3 arg(s), received 0|

Scenario: To unstake a node in the network
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]"
    | pocket nodes unstake abf1df709a0cc486ac6db216ba9ed260e5597ba9 testnet 100000 |
    Then user should be shown a success message

Scenario: To unstake a node in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake <fromAddr> <chainID> <fees> [flags]", with wrong address
    | pocket nodes unstake foobar testnet 100000 |
    Then user should be shown a failure message

Scenario: To unstake a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 3 arg(s), received 0
    Usage:
    pocket nodes unstake <fromAddr> <chainID> <fees>[flags]

    Flags:
    -h, --help   help for unstake

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    accepts 3 arg(s), received 0|

Scenario: To be able to edit an stake amount from a node
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same.
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds the new staking details there.

Scenario: To prevent a user of staking less amount
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is less than it was before.
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 10000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds the new staking details are not there, and the old ones are kept.

Scenario: To verify that the node which edit stake have happened it's not dispatching anymore
    Given that the user has Pocket Network latest version installed.
    And a given node it's in a current session
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same, but the chainID is different than the ones in the current session
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds the new staking details there.
    And when v1/dispatch is queried, the node is not participating anymore after the session ends for that chain.

Scenario: To verify that a node doesn't get paid when removing a current session chain from the current list.
    Given that the user has Pocket Network latest version installed.
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same, but the current dispatching chainID is changed.
    And the node is within a session for X chainID.
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds the new staking details there.
    And the claims for the old chainID should never arrive.
    | pocket query node-claim <nodeAddress> -> Should return an empty object. |

Scenario: To verify that the node which edit stake have happened reflects ServiceURL changing right away
    Given that the user has Pocket Network latest version installed.
    And a given node it's in a current session
    And wants to edit or modify his current stake within the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> <chainID> <fees>"
    And providing the new details, in which the amount is kept the same, but service URL have changed
    Then user should be prompted a success message/transaction:
    | pocket nodes stake abf1df709a0cc486ac6db216ba9ed260e5597ba9 100000 0022 testnet 100000 |
    And after a block have passed.
    And user queries the node. 
    | pocket query node <NodeAddress> | 
    Then user finds the new staking details there.
    And when v1/dispatch is queried, the node is showing the new serviceURL right away. (Next block)