set -eo nounset

cd /other-repos || cd /repos

if [ -d dotgnu-pnet ] ; then
	pushd dotgnu-pnet
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.sv.gnu.org/dotgnu-pnet.git
fi

cd dotgnu-pnet

./autogen.sh
./configure --prefix=/usr
make
make install

