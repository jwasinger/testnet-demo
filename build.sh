set -e
cd libb2
./autogen.sh
./configure.sh
make
cd ..
emcc -L libb2/src/.libs -llibb2 main.c -s WASM=1
