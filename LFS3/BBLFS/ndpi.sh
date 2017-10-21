set -eo nounset

cd /other-repos || cd /repos

if [ -d nDPI ] ; then
	pushd nDPI
	git reset --hard
	git clean -d -f -x
	git checkout dev
	git pull origin dev
	git submodule update --init --recursive
	popd
else
	git clone --recursive https://github.com/ntop/nDPI.git
fi

cd nDPI

./autogen.sh
./configure --prefix=/usr
make
make install

