set -eo nounset

cd /other-repos || cd /repos

if [ -d ntopng ] ; then
	pushd ntopng
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/ntop/ntopng.git
fi

cd ntopng

./autogen.sh
./configure --prefix=/usr
make
make install

