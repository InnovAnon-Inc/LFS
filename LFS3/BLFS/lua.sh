set -eo nounset

cd /sources

for k in \
http://www.lua.org/ftp/lua-5.3.4.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/lua-5.3.4-shared_library-1.patch \
http://www.lua.org/tests/lua-5.3.4-tests.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf lua-5.3.4
tar xf lua-5.3.4.tar.gz
pushd  lua-5.3.4

cat > lua.pc << "EOF"
V=5.3
R=5.3.4

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/share/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
EOF

patch -Np1 -i ../lua-5.3.4-shared_library-1.patch &&
sed -i '/#define LUA_ROOT/s:/usr/local/:/usr/:' src/luaconf.h &&

make MYCFLAGS="-DLUA_COMPAT_5_2 -DLUA_COMPAT_5_1" linux

make INSTALL_TOP=/usr                \
     INSTALL_DATA="cp -d"            \
     INSTALL_MAN=/usr/share/man/man1 \
     TO_LIB="liblua.so liblua.so.5.3 liblua.so.5.3.4" \
     install &&

mkdir -pv                      /usr/share/doc/lua-5.3.4 &&
cp -v doc/*.{html,css,gif,png} /usr/share/doc/lua-5.3.4 &&

install -v -m644 -D lua.pc /usr/lib/pkgconfig/lua.pc

popd
rm -rf lua-5.3.4
