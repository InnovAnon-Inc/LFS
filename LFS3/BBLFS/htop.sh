set -eo nounset

cd /other-repos || cd /repos

if [ -d htop ] ; then
	pushd htop
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/hishamhm/htop.git
fi

cd htop

./autogen.sh
./configure
make
make install

