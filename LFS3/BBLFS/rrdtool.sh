set -eo nounset

cd /other-repos || cd /repos

if [ -d rrdtool ] ; then
	pushd rrdtool
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/oetiker/rrdtool-1.x.git rrdtool
fi

cd rrdtool

./bootstrap
./configure
make
make install

