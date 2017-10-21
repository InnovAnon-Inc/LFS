set -eo nounset

cd /other-repos || cd /repos

if [ -d irssi ] ; then
	pushd irssi
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/irssi/irssi.git
fi

cd irssi

./autogen.sh
./configure --prefix=/usr
make
make install
