set -eo nounset

cd /other-repos || cd /repos

if [ -d ccache ] ; then
	pushd ccache
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/ccache/ccache.git
fi

cd ccache

./autogen.sh
./configure --prefix=/usr
make
make install

