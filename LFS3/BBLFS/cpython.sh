set -eo nounset

cd /other-repos || cd /repos

if [ -d cpython ] ; then
	pushd cpython
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/python/cpython.git
fi

cd cpython

export PYTHONIOENCODING=utf-8

autoreconf -fi
./configure --with-lto
#make
make profile-opt
make install
