Scenario: To show existing commands within the pocket query section
    Given that the user has Pocket Network latest version installed.
    And wants to see the available actions for pocket query
    When typing "pocket query".
    And hitting "enter"
    Then user should be prompted the following suggestion. Examples:
    | query the blockchain

    Usage:
    pocket query [command]

    Available Commands:
    account            Gets an account
    app                Gets app from address
    app-params         Gets app parameters
    apps               Gets apps
    balance            Gets account balance
    block              Get block at height
    height             Get current height
    node               Gets node from address
    node-params        Gets node parameters
    node-receipt       Gets node receipt for work completed
    node-receipts      Gets node receipts for work completed
    nodes              Gets nodes
    pocket-params      Gets pocket parameters
    supply             Returns
    supported-networks Gets pocket supported networks
    tx                 Get the transaction by the hash

    Flags:
    -h, --help   help for query

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    Use "pocket query [command] --help" for more information about a command.|

Scenario: To query an existing account
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: To query an existing account
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: To query an existing account, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing account, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]", with wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing account, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account", with wrong height
    Then user should be prompted a failure message and suggestions. Examples:
    | Error: requires at least 1 arg(s), only received 0
    Usage:
    pocket query account <accAddr> <height> [flags]

    Flags:
    -h, --help   help for account

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    requires at least 1 arg(s), only received 0|

Scenario: To query an existing app from address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: To query an existing app from address, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]", wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing app from address, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]", wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing app from address, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]"
    Then user should be prompted a failure message and suggestions. Examples:
    | Error: requires at least 1 arg(s), only received 0
    Usage:
    pocket query app <address> <height> [flags]

    Flags:
    -h, --help   help for app

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")|

Scenario: To query an existing app parameters
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address, such as parameters
    When typing "pocket query app-params <address>"
    Then user should be prompted succeed message see the app params information.

Scenario: To query an existing app parameters, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address, such as parameters
    When typing "pocket query app-params <address>", wrong address
    Then user should be prompted a failure message.

Scenario: To query the list of existing apps
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query apps"
    Then user should be prompted succeed message see the app list.

Scenario: To query an address balance in the network
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]"
    Then user should be prompted succeed message see the app params information.

Scenario: To query an address balance in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]", wrong address
    Then user should be prompted a failure message.

Scenario: To query an address balance in the network, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]", wrong height
    Then user should be prompted a failure message.

Scenario: To query an address balance in the network, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance"
    Then user should be prompted a failure message and the suggestion. Examples:
    | Error: requires at least 1 arg(s), only received 0
    Usage:
    pocket query balance <accAddr> <height> [flags]

    Flags:
    -h, --help   help for balance

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")

    requires at least 1 arg(s), only received 0|

Scenario: To query a block's height
    Given that the user has Pocket Network latest version installed.
    And wants to see the block's height
    When typing "pocket query block"
    Then user should be prompted succeed message and see the block's height.

Scenario: To query the general height
    Given that the user has Pocket Network latest version installed.
    And wants to see the height
    When typing "pocket query height"
    Then user should be prompted succeed message and see the height.

Scenario: To query an existing node from address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: To query an existing node from address, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]", wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing node from address, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]", wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: To query an existing node from address, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]"
    Then user should be prompted a failure message and suggestions. Examples:
    | Error: requires at least 1 arg(s), only received 0
    Usage:
    pocket query node <address> <height> [flags]

    Flags:
    -h, --help   help for node

    Global Flags:
        --blockTime int             how often should the network create blocks (default 1)
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: <ID>@<IP>:<PORT>
        --pocketRPCPort string      the port for pocket rpc (default "8081")
        --seeds string              a comma separated list of PeerURLs: <ID>@<IP>:<PORT> (default "610CF8A6E8CEFBADED845F1C1DC3B10A670BE26B@node1.testnet.pokt.network:26656, E6946760D9833F49DA39AAE9500537BEF6F33A7A@node2.testnet.pokt.network:26656, 7674A47CC977326F1DF6CB92C7B5A2AD36557EA2@node3.testnet.pokt.network:26656, C7B7B7665D20A7172D0C0AA58237E425F333560A@node4.testnet.pokt.network:26656, F6DC0B244C93232283CD1D8443363946D0A3D77A@node5.testnet.pokt.network:26656, 86209713BEFECA0807714BCDD5B79E81073FAF8F@node6.testnet.pokt.network:26656, 915A58AE437D2C2D6F35AC11B79F42972267700D@node7.testnet.pokt.network:26656, B3D86CD8AB4AA0CB9861CB795D8D154E685A94CF@node8.testnet.pokt.network:26656, 17CA63E4FF7535A40512C550DD0267E519CAFC1A@node9.testnet.pokt.network:26656, F99386C6D7CD42A486C63CCD80F5FBEA68759CD7@node10.testnet.pokt.network:26656")
        --tmPeersPort string        the port for tendermint p2p (default "26656")
        --tmRPCPort string          the port for tendermint rpc (default "26657")|

Scenario: To query an existing node parameters
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address, such as parameters
    When typing "pocket query node-params <address>"
    Then user should be prompted succeed message see the node params information.

Scenario: To query an existing node parameters, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address, such as parameters
    When typing "pocket query node-params <address>", wrong address
    Then user should be prompted a failure message.

Scenario: To get supplies
    Given that the user has Pocket Network latest version installed.
    And wants to see the supplies
    When typing "pocket query supply"
    Then user should be prompted succeed message and see the supplies.

Scenario: To get existing supported networks
    Given that the user has Pocket Network latest version installed.
    And wants to see the supplies
    When typing "pocket query supported-networks"
    Then user should be prompted succeed message and see the supported networks.

Scenario: To get transactions based on the hash
    Given that the user has Pocket Network latest version installed.
    And wants to make transactions based on the hashes
    When typing "pocket query tx <hash> [flags]"
    Then user should be prompted succeed message and see the transaction showed queried by the hash.

Scenario: To get transactions based on the hash, wrong hash
    Given that the user has Pocket Network latest version installed.
    And wants to make transactions based on the hashes
    When typing "pocket query tx <hash> [flags]"
    Then user should be prompted a failure message.

Scenario: To get transactions based on the hash, incomplete commands
    Given that the user has Pocket Network latest version installed.
    And wants to make transactions based on the hashes
    When typing "pocket query tx  [flags]"
    Then user should be prompted a failure message, and suggestions. Examples:
    | Error: accepts 1 arg(s), received 0
    Usage:
    pocket query tx <hash> [flags]

    Flags:
    -h, --help   help for tx

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