set -eo nounset

cd /other-repos || cd /repos

if [ -d thin-provisioning-tools ] ; then
	pushd thin-provisioning-tools
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/jthornber/thin-provisioning-tools.git
fi

cd thin-provisioning-tools

autoreconf -fi
./configure
make
make install

