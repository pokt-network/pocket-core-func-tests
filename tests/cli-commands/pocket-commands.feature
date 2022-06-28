Scenario: 046 Pocket main commands
    Given that the user has Pocket Network latest version installed.
    When typing in "pocket help"
    Then user should be able to see following list of available commands and description as Examples:
    | command  | description  |:
    {
        Available Commands:
            accounts    account management
            apps        application management
            gov         governance management
            help        Help about any command
            nodes       node management
            query       query the blockchain
            reset       Reset pocket-core
            start       starts pocket-core daemon
            util        utility functions
            version     Get current version

            Flags:
                --datadir string            data directory (default is $HOME/.pocket/
            -h, --help                      help for pocket
                --madvdontneed              if enabled, run with GODEBUG=madvdontneed=1, --madvdontneed=true/false (default true)
                --node string               takes a remote endpoint in the form <protocol>://<host>:<port>
                --persistent_peers string   a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
                --remoteCLIURL string       takes a remote endpoint in the form of <protocol>://<host> (uses RPC Port)
                --seeds string              a comma separated list of PeerURLs: '<ID>@<IP>:<PORT>,<ID2>@<IP2>:<PORT>...<IDn>@<IPn>:<PORT>'
            -t, --toggle                    help message for toggle
    } 