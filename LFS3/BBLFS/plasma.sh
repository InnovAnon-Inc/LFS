set -eo nounset

#cd /other-repos || cd /repos

#if [ -d plasma ] ; then
#	pushd plasma
#	git reset --hard
#	git clean -d -f -x
#	git pull origin master
#	popd
#else
#	git clone https://bitbucket.org/icl/plasma
#fi

#cd plasma

cd /sources

test -f plasma-17.1.tar.gz || \
wget --no-check-certificate \
	https://bitbucket.org/icl/plasma/downloads/plasma-17.1.tar.gz

rm -rf plasma-17.1
tar xf plasma-17.1.tar.gz
pushd  plasma-17.1

test ! -z ${MKLROOT+x}
cp make.inc.mkl-gcc make.inc
make
make install

rm -rf plasma-17.1
