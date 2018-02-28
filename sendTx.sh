curl -X POST --data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"$(node txn.js --data=$(cat txn-wasm.wasm | xxd -p -c 100000))\"],\"id\":1}" localhost:8545
