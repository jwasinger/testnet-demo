trap "exit -1" ERR
clang -emit-llvm --target=wasm32-unknown-unknown-elf -nostdlib -S blake2b.c
llc -march=wasm32 -o blake2b.s blake2b.ll
s2wasm -o blake2b.wast blake2b.s
wasm-as -o blake2b.wasm blake2b.wast
