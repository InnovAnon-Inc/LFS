set -eo nounset

cd /other-repos || cd /repos

if [ -d hashcat-utils ] ; then
	pushd hashcat-utils
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone --recursive https://github.com/hashcat/hashcat-utils.git
fi

cd hashcat-utils/src

make
make install

