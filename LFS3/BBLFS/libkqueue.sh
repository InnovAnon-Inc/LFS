set -eo nounset

cd /other-repos || cd /repos

if [ -d libkqueue ] ; then
	pushd libkqueue
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/mheily/libkqueue.git
fi

cd libkqueue

cmake -DCMAKE_INSTALL_PREFIX=/usr .
make
make install
