set -eo nounset

cd /other-repos || cd /repos

if [ -d libpsl ] ; then
	pushd libpsl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/rockdaboot/libpsl.git
fi

cd libpsl

./autogen.sh
./configure --prefix=/usr
make
#make check
make install

