set -eo nounset

cd /other-repos || cd /repos

if [ -d sent ] ; then
	pushd sent
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/sent
fi

cd sent

sed -i s@/usr/local@/usr@g config.mk
make
make install

