set -eo nounset

cd /other-repos || cd /repos

if [ -d libevent ] ; then
	pushd libevent
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/libevent/libevent.git
fi

rm -rf libevent-build
mkdir  libevent-build
pushd  libevent-build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../libevent
make
#make verify
make install

#./autogen.sh
#./configure --prefix=/usr --disable-static
#make
##make verify
#make install

popd
rm -rf libevent-build
