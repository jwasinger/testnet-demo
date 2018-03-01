#! /bin/bash

# generate wasm bytecode which, when attached to a transaction, will create an account with the specified code

set -e

CONTRACT_WASM="$(cat $1 | xxd -p -c 100000)"
let WASM_SIZE=${#CONTRACT_WASM}/2
TMP_FILE=$(mktemp)

trap 'rm -f -- "$TMP_FILE"' INT TERM HUP EXIT

echo "(module \
	(import \"ethereum\" \"return\" (func \$return (param i32 i32))) \
  (import \"debug\" \"printMemHex\" (func \$printMemHex (param i32 i32))) \
	(memory 1) \
  (data (i32.const 100)  \"$(python endian-swap/swap.py $CONTRACT_WASM)\") \
	(export \"main\" (func \$main)) \
	(func \$main \
    (call \$printMemHex (i32.const 0) (i32.const $WASM_SIZE)) \
		(call \$return \
			(i32.const 0) \
			(i32.const 1) \
		) \
	) \
)" > $TMP_FILE

rm -rf txn-wasm.wasm
wasm-as -o txn-wasm.wasm $TMP_FILE
