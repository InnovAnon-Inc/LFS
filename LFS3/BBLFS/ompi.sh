set -eo nounset

cd /other-repos || cd /repos

if [ -d ompi ] ; then
	pushd ompi
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/open-mpi/ompi.git
fi

cd ompi

./autogen.pl
./configure
make
make install
