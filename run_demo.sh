#! /bin/bash
let nonce=0


echo "deploying blake2b contract"

# deploy blake2b contract
./generate_init_wasm.sh blake2b.wasm
#./sendTx.sh $nonce
node txn.js --data=txn-wasm.wasm  --nonce $nonce

# deploy invocation contract: contractwhich calls blake2b contract
let nonce=$nonce+1 

exit -1

sleep 15s

echo "deploying contract that calls blake2b contract"

./generate_call_wasm.sh
node txn.js --data=txn-wasm.wasm --nonce $nonce
#./sendTx.sh $nonce

sleep 15s

echo "invoking deployed contract"

let nonce=$nonce+1 
./callContract.sh $nonce
