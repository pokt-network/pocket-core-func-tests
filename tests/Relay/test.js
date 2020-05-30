//Import Pocket JS and declare the following variables
const PocketJS = require('@pokt-network/pocket-js');
const Pocket = PocketJS.Pocket;
const Configuration = PocketJS.Configuration;
const Provider = PocketJS.HttpRpcProvider;
const PocketAAT = PocketJS.PocketAAT;

/*
    Let's create a pocket instance with the base configurations
*/

/* Create an array of dispatchers that will be connecting you to a Pocket node. A list of Dispatchers can be found here: https://docs.pokt.network/docs/known-dispatcher-list
*/

const dispatchers = [new URL("http://node6.testnet.pokt.network:8081"), new URL("http://node7.testnet.pokt.network:8081")];

/* 
The id of the blockchain you want to connect to, you can check all the supported blockchains for pocket network here: 
https://docs.pokt.network/docs/supported-networks#
*/

const chainId = "0022";

/*
(optional)Configuration stores multiple properties used to interact with the Pocket Network. 
   - maxDispatchers - (optional) Maximun amount of dispatchers urls to stored in rounting table, default 0.
   - maxSessions - (optional) Maximun amount of sessions to stored for the session manager, default 0.
   - maxConsensusNodes - (optional) Maximun amount of nodes for local consensus, mandatory ODD number, default 0.
   - requestTimeOut - (optional) Maximun timeout for every request in miliseconds, default 0.
   - acceptDisputedResponses - (optional) Accept or reject responses based on having a full consensus, default false.
   - 
*/

const configuration = new Configuration(0,5,3,30000,false)

//Create RPC Provider
const rpcProvider = new Provider(dispatchers)

/*
 create a pocket instance and stores muliple configuration options for your node
    - dispatchers: Array holding the initial dispatcher url(s).
    - rpcProvider:(optional) Provider which will be used to reach out to the Pocket Core RPC interface.
    - configuration:(optional) configuration object
    - store: (optional)Save data using a Key/Value relationship. This object save information in memory.
*/

const pocket = new Pocket(dispatchers, rpcProvider, configuration)

const appPubKeyHex = "66f4ee97b6a046d53ee908d6804872650b1068522e04f2d7105dece64cd1cf00";
const appPrivKeyHex = "b4c8d5ead49c075195cfd118ac662952c36117d0a395a60da1ac51a5e33e362266f4ee97b6a046d53ee908d6804872650b1068522e04f2d7105dece64cd1cf00";
const passphrase = "nelson";

async function sendRelay(){
    /* 
        Create a client account that will be used to relay requests on the application account behalf. All you will need is:
         -- passphrase : a passphrase that will be used to encrypt the the account
    */

    const clientPassphrase = "testing";
    const clientAccount = await pocket.keybase.createAccount(clientPassphrase);

    // Import application account 
    const importAcc = await pocket.keybase.importAccount(appPrivKeyHex, passphrase);

    /* 
        Unlock client account with:
            - addressHex: address of the account that will be unlocked in hex string format
            - passphrase : passphrase of the account to unlock
            - unlockPeriod: The amount of time (in ms) the account is going to be unlocked
    */

    const unlockAcct = await pocket.keybase.unlockAccount(clientAccount.addressHex, clientPassphrase, 0);

    const isUnlocket = await pocket.keybase.isUnlocked(clientAccount.addressHex);

     /*
    Create AAT Token with the following arguments:
    - version: Version information
    - clientPublicKey:Client Public Key
    - applicationPublicKey: Application Public Key
    - privateKey: Application Private Key
    */
   const pocketAAT = await PocketAAT.from("0.0.1", clientAccount.publicKey.toString("hex"),appPubKeyHex.toString("hex"),appPrivKeyHex);

   // Sending transaction: 
   // Create the payload for the transaction:
   var payload = JSON.stringify({
       "jsonrpc": "2.0",
       "method": "eht_getBalance",
       "params": ["0x7c719e140ecf652afcfe0fe3ebc65af03e6ca217f844cc61d1cb4146fffbff83", "latest"],
       "id": (new Date()).getTime()
    })
    // send the relay to the pocket network
    const relayResponse = await pocket.sendRelay(payload, "0022", pocketAAT);
    console.log(relayResponse);
    // const parsedResponse = JSON.parse(relayResponse.payload);
    // console.log(parsedResponse);
}

sendRelay();