set -eo nounset

cd /other-repos || cd /repos

if [ -d distcc ] ; then
	pushd distcc
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/distcc/distcc.git
fi

cd distcc

./autogen.sh
./configure
make
make install
