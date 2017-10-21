set -eo nounset

cd /other-repos || cd /repos

if [ -d eigen ] ; then
	pushd eigen
	# TODO hg reset
	popd
else
	hg clone https://bitbucket.org/eigen/eigen
fi

#cd eigen
rm -rf eigen-build
mkdir  eigen-build
pushd  eigen-build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../eigen
make
make install

popd
rm -rf eigen-build
