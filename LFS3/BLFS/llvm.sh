set -eo nounset

# required cmake
cd /sources

for k in \
http://llvm.org/releases/5.0.0/llvm-5.0.0.src.tar.xz \
http://llvm.org/releases/5.0.0/cfe-5.0.0.src.tar.xz \
http://llvm.org/releases/5.0.0/compiler-rt-5.0.0.src.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf llvm-5.0.0.src
tar xf llvm-5.0.0.src.tar.xz
pushd  llvm-5.0.0.src

tar -xf ../cfe-5.0.0.src.tar.xz -C tools
tar -xf ../compiler-rt-5.0.0.src.tar.xz -C projects

mv tools/cfe-5.0.0.src tools/clang
mv projects/compiler-rt-5.0.0.src projects/compiler-rt

mkdir -v build
cd       build

CC=gcc CXX=g++                              \
cmake -DCMAKE_INSTALL_PREFIX=/usr           \
      -DLLVM_ENABLE_FFI=ON                  \
      -DCMAKE_BUILD_TYPE=Release            \
      -DLLVM_BUILD_LLVM_DYLIB=ON            \
      -DLLVM_TARGETS_TO_BUILD="host;AMDGPU" \
      -Wno-dev ..
make

cmake -DLLVM_ENABLE_SPHINX=ON         \
      -DSPHINX_WARNINGS_AS_ERRORS=OFF \
      -Wno-dev ..
make docs-llvm-html  docs-llvm-man

make docs-clang-html docs-clang-man

make install

install -v -m644 docs/man/* /usr/share/man/man1
install -v -d -m755 /usr/share/doc/llvm-5.0.0/llvm-html
cp -Rv docs/html/* /usr/share/doc/llvm-5.0.0/llvm-html

install -v -m644 tools/clang/docs/man/* /usr/share/man/man1
install -v -d -m755 /usr/share/doc/llvm-5.0.0/clang-html
cp -Rv tools/clang/docs/html/* /usr/share/doc/llvm-5.0.0/clang-html

popd
rm -rf llvm-5.0.0.src
