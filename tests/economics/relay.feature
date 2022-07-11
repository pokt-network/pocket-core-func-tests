Scenario: 304 Relay rewards 
Given a pocket core network with latest version.
And a staked validator
And a session with the validator
Then a block is proposed
And the validator receives rewards based on relays

Scenario: - Relay rewards [PIP22]
Given a pocket core network with latest version and RSCALKey active.
And a staked validator
And a session with the validator
Then a block is proposed
And the validator receives rewards based on relays and scaled based on the bin position of the validator.