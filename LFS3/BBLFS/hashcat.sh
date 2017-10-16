set -eo nounset

cd /other-repos || cd /repos

if [ -d hashcat ] ; then
	pushd hashcat
	git reset --hard
	git clean -d -f -x
	git pull origin master
	git submodule update --init
	popd
else
	git clone https://github.com/hashcat/hashcat.git
	git submodule update --init
fi

cd hashcat

make
make install

