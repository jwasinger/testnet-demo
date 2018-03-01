## Setup
```
npm install
git submodule update --init
```

## Usage
Have a running CPP/Hera node

Build C code (currently `blake2b.c`)
```
./build.sh
```

Run the demo:
```
./run_demo.sh
```

This script does the following:
 - creates a contract `A` containing compiled wasm for `blake2b.c`
 - creates another contract `B` which calls `A`
 - sends a transaction to `B`
