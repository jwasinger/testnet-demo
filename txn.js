const EthereumTx = require('ethereumjs-tx')
const privateKey = Buffer.from('d90b721461bda3adb40e5967e26bc90627b4ec30b2afee383e6b2b3103bc926e', 'hex')
const argv = require('yargs').argv;

let data = argv.data ? argv.data : ''

const txParams = {
  nonce: '0x00',
  gasPrice: '0x174876e800', 
  gasLimit: '0x100000',
  to: '',
  value: '0xa', 
  data: data,
  chainId: 66
}

const tx = new EthereumTx(txParams)
tx.sign(privateKey)
const serializedTx = tx.serialize()
console.log(serializedTx.toString('hex'))
