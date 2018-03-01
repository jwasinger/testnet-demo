const EthereumTx = require('ethereumjs-tx')
const privateKey = Buffer.from('d90b721461bda3adb40e5967e26bc90627b4ec30b2afee383e6b2b3103bc926e', 'hex')
const argv = require('yargs').argv;

let data = argv.data ? argv.data : ''
let nonce = argv.nonce ? argv.nonce : ''
let to = argv.to ? argv.to : ''

const txParams = {
  nonce: '0x'+nonce,
  gasPrice: '0x174876e800', 
  gasLimit: '0x100000',
  to: to,
  value: '0xa', 
  data: '0x'+data,
  chainId: 66
}

const tx = new EthereumTx(txParams)
tx.sign(privateKey)
const serializedTx = tx.serialize()
console.log(serializedTx.toString('hex'))
