set -eo nounset

cd /other-repos || cd /repos

if [ -d lapack ] ; then
	pushd lapack
	git reset --hard
	git clean -d -f -x
	git checkout lapack-3.7.1
	git pull origin lapack-3.7.1
	popd
else
	git clone https://github.com/Reference-LAPACK/lapack-release.git lapack
	git checkout lapack-3.7.1
fi

rm -rf lapack-build
mkdir  lapack-build
pushd  lapack-build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../lapack
make
make install

popd
