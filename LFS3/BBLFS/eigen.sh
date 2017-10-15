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
mkdir eigen-build
pushd eigen-build

cmake ../eigen
make
make install

popd
rm -rf eigen-build
