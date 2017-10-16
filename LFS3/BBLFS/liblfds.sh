set -eo nounset

# TODO
exit 2

cd /other-repos || cd /repos

if [ -d liblfds ] ; then
	pushd liblfds
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/liblfds/liblfds.git
fi

cd liblfds

./autogen.sh
./configure
make
make install

