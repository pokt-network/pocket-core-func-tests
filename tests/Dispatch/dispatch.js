/* 
 Import and declare these libraries: 
    - PocketLib: (required) Used to call multiple Pocket libraries.
    - Web3: (required) to send a transaction to the desired blockchain.
    - TransactionSigner:(optional) Used for allowing your application to sign data to the blockchian.  
    - Pocket: (required) to create a pocket instance to send a relay to the Pocket Network 
    - PocketAAT: (required) Required to allow the client to access the network on the applications behalf. 
    - Configuration: (required) Storing network settings like: timeout, blockchainID, SSL, ect. 
    - PocketProvider:(required) Used to create the Pocket Provider
    - HttpProvider: (required) Used to create RPC provider
    - TransactionSigner: (optional) An interface for custom transaction signer object
*/

const PocketLib = require('@pokt-network/web3-provider');
const Web3 = require('web3');
const Transaction = require('ethereumjs-tx').Transaction;
const Pocket = PocketLib.Pocket;
const PocketAAT = PocketLib.PocketAAT;
const Configuration = PocketLib.Configuration;
const PocketProvider = PocketLib.PocketProvider;
const HttpProvider = PocketLib.HttpRpcProvider;
const TransactionSigner = PocketLib.TransactionSigner;

// An array holding the initial dispatcher url(s). You can use our known dispatcher list found here(https://docs.pokt.network/docs/known-dispatcher-list) 
const dispatchers = [new URL("http://node6.testnet.pokt.network:8081"), new URL("http://node7.testnet.pokt.network:8081")];

/*
    - Configuration: Stores multiple properties used to interact with the Pocket Network.
    - maxDispatchers - (optional) Maximun amount of dispatchers urls to stored in rounting table, default 0.
    - maxSessions - (optional) Maximun amount of sessions to stored for the session manager, default 0.
    - maxConsensusNodes - (optional) Maximun amount of nodes for local consensus, mandatory ODD number, default 0.
    - requestTimeOut - (optional) Maximun timeout for every request in miliseconds, default 0.
    - acceptDisputedResponses - (optional) Accept or reject responses based on having a full consensus, default false.
*/

const configuration = Configuration(5,100,undefined,40000);

//Application privatekey hex
const appPrivKey = "8mzY0IeO8otj0cQ33LK19xNiv6GGmETaZv0BoUUHz/3NG6+KNxwThxIssNjxxuLV/wVjeFYsbOmCHyRPRUYtAA=="

//blockchain 
const blockchain = "0002"; 

/*
    Create transaction signer.
*/

const transactionSigner = {
    // Needs at least 2 accounts in the node to run all tests
    accounts: ["029a0da72bbca5dc9792c72ac3a2616910c479b3".toLowerCase(), "8feaea7d4aaeceb9a3edccdddb6c129a6e27b726".toLowerCase()],
    /* 
        Callback method called to determine whether or not the TransactionSigner supports signing transactions for the given address.
    */
   hasAddress: async function (address){
       return transactionSigner.accounts.includes(address.toLowerCase())
   },
   // Update this object  with the address - private keys for each account in the same order they are declared
    privateKeys: ["F3D..."],
    /*
        Callback method called to generate a serialized signed format
        of the given a Web3.js transaction object
        (https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction)
    */
   signTransaction: async function (txParams) {
       try {
           const pkString = ethTransactionSigner.privateKeys[0]
           const privateKeyBuffer = Buffer.from(pkString, 'hex')
           const tx = new Transaction(txParams, {
               chain: "testnet"
           })
           tx.sign(privateKeyBuffer)
           return '0x' + tx.serialize().toString('hex')
       } catch (error) {
           console.log(error)
           return error
       }
   }
}

/* 
    (Optional)
        Transaction signer if you dont want to use the transactionSigner object directly.
*/
const ethTransactionSigner = new TransactionSigner(transactionSigner.accounts, transactionSigner.privateKeys, transactionSigner.hasAddress, transactionSigner.signTransaction)

/*
Creates a Pocket relay that takes the following params:
    - dispatchers: Array holding the initial dispatcher url(s).
    - rpcProvider: (optional) Provider which will be used to reach out to the Pocket Core RPC interface.
    - configuration: (optional) Configuration object.
    - store — (optional) Save data using a Key/Value relationship. This object save information in memory.
*/

const httpProvider = new HttpProvider(dispatchers);
const pocket = new Pocket(dispatchers, httpProvider, configuration);

/*
    ------- CREATING AAT TOKEN
*/

async function sendRelay(){
    
    //generate a new client account
    const clientPassphrase = "testing";
    const clientAccount =  await pocket.keybase.createAccount(clientPassphrase);

    /*
        Import application account:
            - privatekey: (required) The application accounts private key
            - passphrase: (required) A passphrase to encrypt the private key in the keybase
    */
   const importAcct = await pocket.keybase.importAccount(appPrivKeyHex,"Func-Test");
   const unlockAcct = await pocket.keybase.unlockAccount(clientAccount.addressHex, clientPassphrase, 0);

   //optional check to see if it has been unlocked returns true or false;
   const isUnlocked = await pocket.keybase.isUnlocked(clientAccount.addressHex);
   /* 
     pocketAAT: Creates a PocketAAT object, and creates the signature using the provided parameters:
        - version: The spec version under which this ATT needs to be interpreted.
        - clientPublicKey: The client wallets address
        - applicationPublicKey: The hexadecimal publicKey of the Application
        - privateKey: private key of the application    
   */

   const pocketAAT = PocketAAT.from("0.0.1", clientAccount.publicKey.toString("hex"),appPubKeyHex,appPrivKeyHex);

   /*
   Create the Pocket Provider instance:
      - activeBlockchain: Target blockchain hash
      - pocketAAT: Pocket Authentication Token object.
      - pocket: Pocket instance
      - transactionSigner: Object containing the TransactionSigner interface methods.
    */ 

    const pocketProvider = new PocketProvider(blockchain, pocketAAT, pocket, transactionSigner);
        
    //inject into web3
    const web3Ins = new Web3(pocketProvider)

    /* 
        Query the blockchain
    */

    // call the web3 getBalance function.
    const ethBal = web3Ins.eth.getBalance()
}