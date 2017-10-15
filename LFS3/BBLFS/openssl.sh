set -eo nounset

cd /other-repos || cd /repos

if [ -d openssl ] ; then
	pushd openssl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/openssl/openssl.git
fi

cd openssl

./config --prefix=/usr \
         --openssldir=/etc/ssl \
         --libdir=lib \
         shared \
         zlib-dynamic
make
make install

