set -eo nounset

cd /other-repos || cd /repos

if [ -d dwm ] ; then
	pushd dwm
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/dwm
fi

cd dwm

sed -i s@/usr/local@/usr@g config.mk
make
make PREFIX=/usr install

