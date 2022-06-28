Scenario: 304 Relay rewards 
Given a pocket core network with latest version.
And a staked validator
And a session with the validator
Then a block is proposed
And the validator receives rewards based on relays