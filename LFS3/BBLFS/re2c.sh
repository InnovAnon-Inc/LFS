set -eo nounset

cd /other-repos || cd /repos

if [ -d re2c ] ; then
	pushd re2c
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/skvadrik/re2c.git
fi

cd re2c/re2c

./autogen.sh
./configure
make
make install

