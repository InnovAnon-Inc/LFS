set -eo nounset

cd /other-repos || cd /repos

if [ -d distcc ] ; then
	pushd distcc
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init --recursive
	popd
else
	git clone --recursive https://github.com/distcc/distcc.git
fi

cd distcc

./autogen.sh
./configure --prefix=/usr
make
make install
