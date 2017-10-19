set -eo nounset

cd /other-repos || cd /repos

if [ -d adns ] ; then
	pushd adns
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.chiark.greenend.org.uk/~ianmdlvl/adns.git
fi

cd adns

autoreconf -fi
./configure --prefix=/usr
make
make install

