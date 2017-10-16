set -eo nounset

cd /other-repos || cd /repos

if [ -d statsprocessor ] ; then
	pushd statsprocessor
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone --recursive https://github.com/hashcat/statsprocessor.git
fi

cd statsprocessor/src

make
make install

