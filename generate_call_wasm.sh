#! /bin/bash

set -e

TMP_FILE=$(mktemp)

trap 'rm -f -- "$TMP_FILE"' INT TERM HUP EXIT

echo " \
  (module \
    (import \"ethereum\" \"call\" (func \$call (param i64 i32 i32 i32 i32) (result i32))) \
    (import  \"ethereum\" \"getExternalBalance\"  (func \$getBalance (param i32 i32))) \
    (import \"ethereum\" \"storageStore\" (func \$storageStore (param i32 i32))) \
    (import \"ethereum\" \"getAddress\" (func \$getAddress (param i32))) \
    (import \"debug\" \"printMemHex\" (func \$printMemHex (param i32 i32))) \
    (memory 1 ) \
    (data (i32.const 0)  \"\\4c\\c3\\8c\\3b\\e1\\f9\\ab\\94\\36\\72\\4e\\53\\d9\\25\\d7\\fe\\89\\6a\\2f\\23\") \
    (export \"memory\" (memory 0)) \
    (export \"main\" (func \$main)) \
    (func \$main \
      (call \$printMemHex (i32.const 0) (i32.const 20)) \
      (call \$printMemHex (i32.const 20) (i32.const 32)) \
      (call \$printMemHex (i32.const 52) (i32.const 4)) \
      (call \$printMemHex (i32.const 56) (i32.const 4)) \
      (drop  \
        (call \$call (i64.const 200000) (i32.const 0) (i32.const 20) (i32.const 52) (i32.const 4)) ) \
    ) \
  )" > $TMP_FILE

rm -rf txn-wasm.wasm
wasm-as -d -o txn-wasm.wasm $TMP_FILE
