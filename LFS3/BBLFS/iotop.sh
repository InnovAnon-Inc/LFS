set -eo nounset

cd /other-repos || cd /repos

if [ -d iotop ] ; then
	pushd iotop
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/Tomas-M/iotop.git
fi

cd iotop

make
make install

