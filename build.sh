#! /bin/bash

cd rust-ewasm/blake2b
make -j32
mv blake2b.wasm ../..
