set -eo nounset

cd /other-repos || cd /repos

if [ -d kwprocessor ] ; then
	pushd kwprocessor
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone https://github.com/hashcat/kwprocessor.git
	git submodule update --init
fi

cd kwprocessor

make
make install

