#! /bin/bash

# generate wasm bytecode which, when attached to a transaction, will create an account with the specified code

set -e

CONTRACT_WASM="$(cat $1 | xxd -p -c 100000)"
let WASM_SIZE=${#CONTRACT_WASM}/2
TMP_FILE=$(mktemp)

trap 'rm -f -- "$TMP_FILE"' INT TERM HUP EXIT

echo "(module \
	(import \"ethereum\" \"return\" (func \$return (param i32 i32))) \
	(memory 100) \
  (data (i32.const 0)  \"$(python endian-swap/swap.py $1)\") \
  (export \"memory\" (memory 0)) \
	(export \"main\" (func \$main)) \
	(func \$main \
		(call \$return \
			(i32.const 0) \
			(i32.const $WASM_SIZE) \
		) \
	) \
)" > $TMP_FILE

rm -rf txn-wasm.wasm
wasm-as -o txn-wasm.wasm $TMP_FILE
