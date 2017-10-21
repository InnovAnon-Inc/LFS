set -eo nounset

cd /other-repos || cd /repos

if [ -d st ] ; then
	pushd st
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/st
fi

cd st

sed -i s@/usr/local@/usr@g config.mk
sed -i 's@# *CC *= *c99@CC = cc -std=c99@g' config.mk
make
make install

