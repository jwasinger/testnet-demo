## Setup
```
npm install
git submodule update --init
```

## Usage
Have a running CPP/Hera node with genesis config (`genesis.json`) in this repo.
```
eth/eth -K --vm hera --evmc fallback=true -d /tmp/ewasm-node/4201 --listen 4201 --no-bootstrap -m on -t 1 -a 0x031159dF845ADe415202e6DA299223cb640B9DB0 --config genesis.json --peerset "required:61e5475e6870260af84bcf61c02b2127a5c84560401452ae9c99b9ff4f0f343d65c9e26209ec32d42028b365addba27824669eb70c73f69568964f77433afbbe@127.0.0.1:1234" --verbosity 12
```

Compile blake rust code to WASM:
```
./build.sh
```

Run the demo:
```
./run_demo.sh
```

This script does the following:
 - creates a contract `A` containing compiled wasm for rust blake2b implementation
 - creates another contract `B` which calls `A`
 - sends a transaction to `B`
