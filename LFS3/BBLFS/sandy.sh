set -eo nounset

cd /other-repos || cd /repos

if [ -d sandy ] ; then
	pushd sandy
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/sandy
fi

cd sandy

sed -i s@/usr/local@/usr@g config.mk
make
make install

