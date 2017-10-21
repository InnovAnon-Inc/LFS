set -eo nounset

cd /other-repos || cd /repos

if [ -d tcl ] ; then
	pushd tcl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/tcl/tcl.git
fi

cd tcl

./autogen.sh
./configure
make
make install

