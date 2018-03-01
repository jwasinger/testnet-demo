#! /bin/bash
let nonce=0

# deploy blake2b contract
./generate_init_wasm.sh blake2b.wasm
./sendTx.sh $nonce

# deploy invocation contract: contractwhich calls blake2b contract
let nonce=$nonce+1 

sleep 15s

./generate_call_wasm.sh $address
./generate_init_wasm.sh txn-wasm.wasm
./sendTx.sh $nonce

sleep 15s

exit -1

echo "invoking deployed contract"

let nonce=$nonce+1 
./callContract.sh $nonce
