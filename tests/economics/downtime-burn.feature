Scenario: 305 Downtime burn
Given a pocket core network with latest version
When a staked validator is not reachable for a number of blocks
Then the network jails the validator
And slashes the validators POKT

Scenario: - Downtime burn [PIP22]
Given a pocket core network with latest version and RSCALKey active.
When a staked validator is not reachable for a number of blocks
Then the network jails the validator
And slashes the validators POKT scaled by the bin position of the validator.