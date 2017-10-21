set -eo nounset

cd /other-repos || cd /repos

if [ -d lz4 ] ; then
	pushd lz4
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/lz4/lz4.git
fi

cd lz4

make
make PREFIX=/usr install

