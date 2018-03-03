const EthereumTx = require('ethereumjs-tx')
const privateKey = Buffer.from('d90b721461bda3adb40e5967e26bc90627b4ec30b2afee383e6b2b3103bc926e', 'hex')
const argv = require('yargs').argv;
const fs = require('fs')
const request = require('request')

let data = argv.data ? argv.data : ''
let nonce = argv.nonce ? argv.nonce : ''
let to = argv.to ? argv.to : ''

if (data) {
  data = fs.readFileSync(data).toString('hex')
}

const txParams = {
  nonce: '0x'+nonce,
  gasPrice: '0x174876e800', 
  gasLimit: '0x500000',
  to: to,
  value: '0xa', 
  data: '0x'+data,
  chainId: 66
}

let tx = new EthereumTx(txParams)
tx.sign(privateKey)
let serializedTx = tx.serialize()
serializedTx = serializedTx.toString('hex')

var options = {
  uri: 'http://localhost:8545',
  method: 'POST',
  json: {
    jsonrpc: "2.0",
    method: "eth_sendRawTransaction",
    id: 1,
    params: [
      serializedTx
    ]
  }
};


request(options, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    console.log(body) // Print the shortened url.
  }
});
