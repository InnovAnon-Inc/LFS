set -eo nounset

cd /other-repos || cd /repos

if [ -d ntopng ] ; then
	pushd ntopng
	git reset --hard
	git clean -d -f -x
	git checkout dev
	git pull origin dev
	git submodule update --init --recursive
	popd
else
	git clone --recursive https://github.com/ntop/ntopng.git
fi

cd ntopng

./autogen.sh
./configure --prefix=/usr
make
make install

