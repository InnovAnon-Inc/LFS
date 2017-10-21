set -eo nounset

cd /other-repos || cd /repos

if [ -d ii ] ; then
	pushd ii
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/ii
fi

cd ii

sed -i s@/usr/local@/usr@g config.mk
make
make PREFIX=/usr install

