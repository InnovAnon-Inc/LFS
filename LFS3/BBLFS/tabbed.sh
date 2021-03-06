set -eo nounset

cd /other-repos || cd /repos

if [ -d tabbed ] ; then
	pushd tabbed
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/tabbed
fi

cd tabbed

sed -i s@/usr/local@/usr@g config.mk
make
make install

