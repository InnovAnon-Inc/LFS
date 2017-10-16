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
	git clone https://github.com/hashcat/hashcat-utils.git
	git submodule update --init
fi

cd hashcat-utils/src

make
make install

