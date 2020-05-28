// Require the PocketAAT class
const PocketAAT = require('pocket-aat-js');

/* Define the arguments needed to build an AAT:
    - version: the version of the client
    - clientPublicKey: the account that the dApp is using to connect to the staked account
    - applicationPublicKey: the public key of the account staked on the network
    - applicationPrivateKey: the encrypted application private key
*/
const version= '0.0.1';
const clientPublicKey = 'ae95ea39894c4c834c6503060d030f0a11779358a143594b15ab0d67031e6596';
const applicationPublicKey = 'ae95ea39894c4c834c6503060d030f0a11779358a143594b15ab0d67031e6596';
const applicationPrivateKey = '8feaea7d4aaeceb9a3edccdddb6c129a6e27b726';

// Create a new PocketAAT instance
const pocketAAT = PocketAAT.from(version, clientPublicKey, applicationPublicKey, applicationPrivateKey);

// Example JSON output
console.log(JSON.stringify(pocketAAT));