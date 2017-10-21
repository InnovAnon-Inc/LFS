set -eo nounset

cd /other-repos || cd /repos

if [ -d libzahl ] ; then
	pushd libzahl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/libzahl
fi

cd libzahl

sed -i s@/usr/local@/usr@g config.mk
make
make install

