Scenario: 046 To show existing commands within the pocket query section
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
    account-txs        Get the transactions sent by the address, paginated by page and per_page
    acl                Gets the gov acl
    app                Gets app from address
    app-params         Gets app parameters
    apps               Gets apps
    balance            Gets account balance
    block              Get block at height
    block-txs          Get the transactions at a certain block height, paginated by page and per_page
    daoOwner           Gets the owner of the dao
    node-claim         Gets node pending claim for work completed
    node-claims        Gets node pending claims for work completed
    height             Get current height
    node               Gets node from address
    node-params        Gets node parameters
    nodes              Gets nodes
    param              Get a parameter with the given key
    params             Gets all parameters
    pocket-params      Gets pocket parameters
    signing-info       Gets validator signing info
    supply             Returns
    supported-networks Gets pocket supported networks
    tx                 Get the transaction by the hash
    upgrade            Gets the latest gov upgrade

    Flags:
    -h, --help   help for query

    Global Flags:
      --datadir string            data directory (default is $HOME/.pocket/
      --madvdontneed              if enabled, run with GODEBUG=madvdontneed=1, --madvdontneed=true/false (default true)
      --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
      --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
      --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
      --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    Use "pocket query [command] --help" for more information about a command.|

Scenario: 047 To query an existing account
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: 048 To query an existing account, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 049 To query an existing account, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account <accAddr> <height> [flags]", with wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 050 To query an existing account, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account"
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

Scenario: 051 To query an existing account txs
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account-txs <address> <page> <per_page> <prove> <received> [flags]"
    Then user should be prompted succeed message see the account txs paginated.

Scenario: 052 To query an existing account txs, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account-txs <address> <page> <per_page> <prove> <received> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 053 To query an existing account txs, wrong proof 
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account-txs <address> <page> <per_page> <prove> <received> [flags]", with wrong proof 
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 054 To query an existing account txs, incomplete command
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query account-txs"
    Then user should be prompted a failure message and suggestions. Examples:
    |Error: accepts between 1 and 5 arg(s), received 0
    Usage:
    pocket query account-txs <address> <page> <per_page> <prove> <received> [flags]

    Flags:
    -h, --help   help for account-txs

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    2020/06/21 01:58:22 accepts between 1 and 5 arg(s), received 0|

Scenario: 055 To query current acl
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query acl [flags]"
    Then user should be prompted succeed message see the current ACL

Scenario: 056 To query an existing app from address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: 057 To query an existing app from address, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]", wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 058 To query an existing app from address, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address
    When typing "pocket query app <address> <height> [flags]", wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 059 To query an existing app from address, incomplete command
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

Scenario: 060 To query an existing app parameters
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address, such as parameters
    When typing "pocket query app-params <address>"
    Then user should be prompted succeed message see the app params information.

Scenario: 061 To query an existing app parameters, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an app information from an existing address, such as parameters
    When typing "pocket query app-params <address>", wrong address
    Then user should be prompted a failure message.

Scenario: 062 To query the list of existing apps
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query apps [flags]"
    Then user should be prompted succeed message see the app list.

Scenario: 063 To query an address balance in the network
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]"
    Then user should be prompted succeed message see the app params information.

Scenario: 064 To query an address balance in the network, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]", wrong address
    Then user should be prompted a failure message.

Scenario: 065 To query an address balance in the network, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query an addresses' balance information
    When typing "pocket query balance <accAddr> <height> [flags]", wrong height
    Then user should be prompted a failure message.

Scenario: 066 To query an address balance in the network, incomplete command
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

Scenario: 067 To query a block's at height
    Given that the user has Pocket Network latest version installed.
    And wants to see the block's height
    When typing "pocket query block <height>"
    Then user should be prompted succeed message and see the block's height.

Scenario: 068 To query a block's at height
    Given that the user has Pocket Network latest version installed.
    And wants to see the block's height
    When typing "pocket query block-txs <height> <page> <per_page> <prove> [flags]"
    Then user should be prompted succeed message and see the block's height.

Scenario: 069 To query a block's at height, incomplete
    Given that the user has Pocket Network latest version installed.
    And wants to see the block's height
    When typing "pocket query block-txs [flags]"
    Then user should be prompted a failure message and suggestions. Examples:
    |Error: accepts between 1 and 4 arg(s), received 0
    Usage:
    pocket query block-txs <height> <page> <per_page> <prove> [flags]

    Flags:
    -h, --help   help for block-txs

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    2020/06/21 02:05:22 accepts between 1 and 4 arg(s), received 0|

Scenario: 070 To query dao owner 
    Given that the user has Pocket Network latest version installed.
    And wants to see the height
    When typing "pocket query daoOwner"
    Then user should be prompted succeed message and see the height.

Scenario: 071 To query the chains height
    Given that the user has Pocket Network latest version installed.
    And wants to see the height
    When typing "pocket query height"
    Then user should be prompted succeed message and see the height.

Scenario: 072 To query an existing node from address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]"
    Then user should be prompted succeed message see the account information.

Scenario: 073 To query an existing node from address, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]", wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 074 To query an existing node from address, wrong height
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node <address> <height> [flags]", wrong height
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 075 To query an existing node from address, incomplete command
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

Scenario: 076 To query an existing node claim
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height> [flags]"
    Then user should be prompted succeed message see the node claim information.

Scenario: 077 To query an existing node claim, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 078 To query an existing node claim, wrong pub key
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height> [flags]", with wrong public key 
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 079 To query an existing node claim, invalid session height
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height> [flags]", with invalid height
    Then user should be prompted a failure message

Scenario: 080 To query an existing node claim, invalid claimType
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height> [flags]", with invalid claimType
    Then user should be prompted a failure message

Scenario: 081 To query an existing node claim, incomplete
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-claim"
    Then user should be prompted a failure message and suggestions. Examples:
    |Error: requires at least 5 arg(s), only received 0
    Usage:
    pocket query node-claim <nodeAddr> <appPubKey> <claimType> <networkId> <sessionHeight> <height>` [flags]

    Flags:
    -h, --help   help for node-claim

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    2020/06/21 02:09:42 requires at least 5 arg(s), only received 0|

Scenario: 082 To query an existing node claims
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query node-claims <nodeAddr> <height> [flags]"
    Then user should be prompted succeed message see the node claims information.

Scenario: 083 To query an existing node claims, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query node-claims <nodeAddr> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 084 To query an existing node claims, incomplete
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query node-claims"
    Then user should be prompted a failure message and suggestions. Examples:
    |Error: requires at least 1 arg(s), only received 0
    Usage:
    pocket query node-claims <nodeAddr> <height> [flags]

    Flags:
    -h, --help   help for node-claims

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    2020/06/21 02:29:47 requires at least 1 arg(s), only received 0|

Scenario: 085 To query an existing node parameters
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address, such as parameters
    When typing "pocket query node-params <address>"
    Then user should be prompted succeed message see the node params information.

Scenario: 086 To query an existing node parameters, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address, such as parameters
    When typing "pocket query node-params <address>", wrong address
    Then user should be prompted a failure message.

Scenario: 087 To query an existing node receipt 
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height> [flags]"
    Then user should be prompted succeed message see the node receipt information.

Scenario: 088 To query an existing node receipt, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 089 To query an existing node receipt, wrong pub key
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height> [flags]", with wrong public key 
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 090 To query an existing node receipt, invalid session height
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height> [flags]", with invalid height 
    Then user should be prompted a failure message

Scenario: 091 To query an existing node receipt, invalid claimType
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height> [flags]", with invalid claim type 
    Then user should be prompted a failure message

Scenario: 092 To query an existing node receipt, incomplete
    Given that the user has Pocket Network latest version installed.
    And wants to query a node information from an existing address
    When typing "pocket query node-receipt"
    Then user should be prompted a failure message and suggestions. Examples:
    |Error: requires at least 5 arg(s), only received 0
    Usage:
    pocket query node-receipt <nodeAddr> <appPubKey> <receiptType> <networkId> <sessionHeight> <height>` [flags]

    Flags:
    -h, --help   help for node-claim

    Global Flags:
        --datadir string            data directory (default is $HOME/.pocket/
        --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
        --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
        --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
        --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'

    2020/06/21 02:09:42 requires at least 5 arg(s), only received 0|
    
Scenario: 093 To query an existing node receipts 
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query node-receipts <nodeAddr> <height> [flags]"
    Then user should be prompted succeed message see the node receipts information.

Scenario: 094 To query an existing node receipts, wrong address
    Given that the user has Pocket Network latest version installed.
    And wants to query an accounts information
    When typing "pocket query node-claims <nodeAddr> <height> [flags]", with wrong address
    Then user should be prompted a failure message. Examples:
    | encoding/hex: invalid byte: U+0073|

Scenario: 095 To query the list of existing nodes 
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query nodes [flags]"
    Then user should be prompted succeed message see the nodes list.

Scenario: 096 To query single param
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query param <key> <height> [flags]"
    Then user should be prompted succeed message see param information.

Scenario: 097 To query the list of params
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query params [flags]"
    Then user should be prompted succeed message see the params list.

Scenario: 098 To query the list of pocketcore params 
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query pocket-params [flags]"
    Then user should be prompted succeed message see the node's signing information.
    |pocket query signing-info 1467d02c1438f7b9563a7017758eeeb1b1b39c98|
    |{
        "page": 1,
        "result": [
            {
                "address": "1467d02c1438f7b9563a7017758eeeb1b1b39c98",
                "index_offset": 4,
                "jailed_blocks_counter": 0,
                "jailed_until": "0001-01-01T00:00:00Z",
                "missed_blocks_counter": 0,
                "start_height": 41118
            }
        ],
        "total_pages": 1
    }|

Scenario: 099 To query a specific node's signing info 
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query signing-info <address> [<height>] [flags]"
    Then user should be prompted succeed message see the pocketcore params list.


Scenario: 100 To get supplies
    Given that the user has Pocket Network latest version installed.
    And wants to see the supplies
    When typing "pocket query supply"
    Then user should be prompted succeed message and see the supplies.

Scenario: 101 To get existing supported networks
    Given that the user has Pocket Network latest version installed.
    And wants to see the supplies
    When typing "pocket query supported-networks"
    Then user should be prompted succeed message and see the supported networks.

Scenario: 102 To get transactions based on the hash
    Given that the user has Pocket Network latest version installed.
    And wants to make transactions based on the hashes
    When typing "pocket query tx <hash> [flags]"
    Then user should be prompted succeed message and see the transaction showed queried by the hash.

Scenario: 103 To get transactions based on the hash, wrong hash
    Given that the user has Pocket Network latest version installed.
    And wants to make transactions based on the hashes
    When typing "pocket query tx <hash> [flags]"
    Then user should be prompted a failure message.

Scenario: 104 To get transactions based on the hash, incomplete commands
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

Scenario: 105 To query the latest upgrade
    Given that the user has Pocket Network latest version installed.
    And wants to query the list of apps
    When typing "pocket query upgrade [flags]"
    Then user should be prompted succeed message see the upgrade information.