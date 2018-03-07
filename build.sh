#! /bin/bash

cd rust-ewasm/blake2b
make -j32
mv blake2b.wasm ../..
cd ../..
wasm2wat blake2b.wasm > blake2b.wat
#sed -e s/env/ethereum/g -e "s/\"ethereum\" \"printMemHex\"/\"debug\" \"printMemHex\"/g" blake2b.wat
sed -i -e s/env/ethereum/g -e s/"\"ethereum\" \"printMemHex\"/\"debug\" \"printMemHex\""/g blake2b.wat
wat2wasm blake2b.wat
