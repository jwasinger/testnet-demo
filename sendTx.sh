curl -X POST --data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_sendRawTransaction\",\"params\":[\"$(node txn.js)\"],\"id\":1}" localhost:8545
