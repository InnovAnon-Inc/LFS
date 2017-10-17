set -eo nounset

cd /other-repos || cd /repos

if [ -d pmt-code ] ; then
	pushd pmt-code
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.code.sf.net/p/pmt/code pmt-code
fi

cd pmt-code

./autogen.sh
./configure
make
make install

