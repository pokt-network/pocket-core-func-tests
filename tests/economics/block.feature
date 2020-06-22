Scenario: block proposer reward
Given a picket core network with latest version
When a pseudo-random staked validator is picked to propose a block
And the validator proposes a block
Then the network rewards the block proposer node