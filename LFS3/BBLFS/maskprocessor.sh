set -eo nounset

cd /other-repos || cd /repos

if [ -d maskprocessor ] ; then
	pushd maskprocessor
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone --recursive https://github.com/hashcat/maskprocessor.git
fi

cd maskprocessor/src

make
make install

