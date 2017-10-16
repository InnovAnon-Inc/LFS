set -eo nounset

cd /other-repos || cd /repos

if [ -d princeprocessor ] ; then
	pushd princeprocessor
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone --recursive https://github.com/hashcat/princeprocessor.git
fi

cd princeprocessor/src

make
make install

