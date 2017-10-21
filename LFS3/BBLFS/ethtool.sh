set -eo nounset

cd /other-repos || cd /repos

if [ -d ethtool ] ; then
	pushd ethtool
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.kernel.org/pub/scm/network/ethtool/ethtool.git
fi

cd ethtool

./autogen.sh
./configure --prefix=/usr
make
make install

