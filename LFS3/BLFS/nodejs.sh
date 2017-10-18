set -eo nounset

cd /sources

test -f node-v8.6.0.tar.xz || \
wget --no-check-certificate \
	https://nodejs.org/dist/v8.6.0/node-v8.6.0.tar.xz

rm -rf node-v8.6.0
tar xf node-v8.6.0.tar.xz
pushd  node-v8.6.0

PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
    ./configure --prefix=/usr                  \
                --shared-cares                 \
                --shared-openssl               \
                --shared-zlib                  \
                --with-intl=system-icu         &&
make

make install &&
ln -sf node /usr/share/doc/node-8.6.0

#npm install npm@latest -g

popd
rm -rf node-v8.6.0
