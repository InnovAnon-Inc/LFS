set -eo nounset

cd /other-repos || cd /repos

if [ -d quark ] ; then
	pushd quark
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/quark
fi

cd quark

sed -i s@/usr/local@/usr@g config.mk
make
make install

