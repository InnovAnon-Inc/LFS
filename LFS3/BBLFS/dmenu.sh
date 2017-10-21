set -eo nounset

cd /other-repos || cd /repos

if [ -d dmenu ] ; then
	pushd dmenu
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/dmenu
fi

cd dmenu

sed -i s@/usr/local@/usr@g config.mk
make
make PREFIX=/usr install

