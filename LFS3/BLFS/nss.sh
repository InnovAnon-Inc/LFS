set -eo nounset

cd /sources

for k in \
https://archive.mozilla.org/pub/security/nss/releases/NSS_3_33_RTM/src/nss-3.33.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/nss-3.33-standalone-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf nss-3.33
tar xf nss-3.33.tar.gz
pushd  nss-3.33

patch -Np1 -i ../nss-3.33-standalone-1.patch

cd nss

make -j1 BUILD_OPT=1                  \
  NSPR_INCLUDE_DIR=/usr/include/nspr  \
  USE_SYSTEM_ZLIB=1                   \
  ZLIB_LIBS=-lz                       \
  NSS_ENABLE_WERROR=0                 \
  $([ $(uname -m) = x86_64 ] && echo USE_64=1) \
  $([ -f /usr/include/sqlite3.h ] && echo NSS_USE_SYSTEM_SQLITE=1)


cd ../dist

install -v -m755 Linux*/lib/*.so              /usr/lib
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib

install -v -m755 -d                           /usr/include/nss
cp -v -RL {public,private}/nss/*              /usr/include/nss
chmod -v 644                                  /usr/include/nss/*

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin

install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig

if [ -e /usr/lib/libp11-kit.so ]; then
  readlink /usr/lib/libnssckbi.so ||
  rm -v /usr/lib/libnssckbi.so    &&
  ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
fi

popd
rm -rf nss-3.33

