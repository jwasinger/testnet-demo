#! /bin/bash

# generate wasm bytecode which, when attached to a transaction, will create an account with the specified code

CONTRACT_WASM="$(cat $1 | xxd -p -c 100000)"
let WASM_SIZE=${#CONTRACT_WASM}/2

echo "(module \
	(import \"ethereum\" \"return\" (func \$return (param i32 i32))) \
	(memory 1) \
  (data (i32.const 0)  \"$(python endian-swap/swap.py $CONTRACT_WASM)\") \
	(export \"main\" (func \$main)) \
	(func \$main \
		(call \$return \
			(i32.const 0) \
			(i32.const $WASM_SIZE) \
		) \
	) \
)"
