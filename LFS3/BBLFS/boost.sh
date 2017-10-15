set -eo nounset

cd /other-repos || cd /repos

if [ -d boost ] ; then
	pushd boost
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/boostorg/boost.git
fi

cd boost

sed -e '/using python/ s@;@: /usr/include/python${PYTHON_VERSION/3*/${PYTHON_VERSION}m} ;@' \
    -i bootstrap.sh

./bootstrap.sh --prefix=/usr
./b2 stage threading=multi link=shared

./b2 install threading=multi link=shared

