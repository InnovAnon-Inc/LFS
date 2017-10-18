set -eo nounset

cd /other-repos || cd /repos

if [ -d shim ] ; then
	pushd shim
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/rhboot/shim.git
fi

cd shim

make
make install

