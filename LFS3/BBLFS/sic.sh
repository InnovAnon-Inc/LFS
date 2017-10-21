set -eo nounset

cd /other-repos || cd /repos

if [ -d sic ] ; then
	pushd sic
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/sic
fi

cd sic

sed -i s@/usr/local@/usr@g config.mk
make
make install

