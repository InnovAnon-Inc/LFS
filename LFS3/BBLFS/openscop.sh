set -eo nounset

cd /other-repos || cd /repos

if [ -d openscop ] ; then
	pushd openscop
	git reset --hard
	git clean -d -f -x
	git pull origin master
else
	git clone https://github.com/periscop/openscop.git
fi

cd openscop

./autogen.sh
./configure
make
make install
