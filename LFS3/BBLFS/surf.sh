set -eo nounset

cd /other-repos || cd /repos

if [ -d surf ] ; then
	pushd surf
	git reset --hard
	git clean -d -f -x
	git checkout surf-webkit2
	git pull origin surf-webkit2
	popd
else
	git clone https://git.suckless.org/surf
	git checkout surf-webkit2
fi

cd surf

sed -i s@/usr/local@/usr@g config.mk
sed -i 's@# *CC *= *c99@CC = cc -std=c99@g' config.mk
make
make install

