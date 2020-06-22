Scenario: Downtime burn
Given a pocket core network with latest version
When a staked validator is not reachable for a number of blocks
Then the network jails the validator
And slashes the validators POKT