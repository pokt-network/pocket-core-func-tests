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
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    Use "pocket nodes [command] --help" for more information about a command.|

Scenario: To stake an node in the network
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI>"
    Then user should be shown a success message

Scenario: To stake an nodePP in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI>, with wrong address
    Then user should be shown a failure message

Scenario: To stake a nodes in the network, zero as amount
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes a failure message"

Scenario: To stake a nodes in the network, wrong serviceURI
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr> <amount> <chains> <serviceURI>", with wrong chains
    Then user should be shown a failure message

Scenario: To stake a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to stake his node into the network
    When typing "pocket nodes stake <fromAddr>"
    And typing "pocket nodes stake <fromAddr> <amount>"
    And typing "pocket nodes stake <amount>"
    And typing "pocket nodes stake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 4 arg(s), received 0
    Usage:
    pocket nodes stake <fromAddr> <amount> <chains> <serviceURI> [flags]

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

    accepts 4 arg(s), received 0|

Scenario: To unjail a node in the network
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail <fromAddr> [flags]"
    Then user should be shown a success message

Scenario: To unjail a node in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail <fromAddr> [flags]", with wrong address
    Then user should be shown a failure message

Scenario: To unjail a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to unjail his node into the network
    When typing "pocket nodes unjail "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 1 arg(s), received 0
    Usage:
    pocket nodes unjail <fromAddr> [flags]

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

    accepts 1 arg(s), received 0|

Scenario: To unstake a node in the network
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake <fromAddr> [flags]"
    Then user should be shown a success message

Scenario: To unstake a node in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake <fromAddr> [flags]", with wrong address
    Then user should be shown a failure message

Scenario: To unstake a node in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to unstake his node into the network
    When typing "pocket nodes unstake "
    Then user should be prompted an error message, such as. Examples:
    | Error: accepts 1 arg(s), received 0
    Usage:
    pocket nodes unstake <fromAddr> [flags]

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

    accepts 1 arg(s), received 0|