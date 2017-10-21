set -eo nounset

cd /other-repos || cd /repos

if [ -d slock ] ; then
	pushd slock
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/slock
fi

cd slock

sed -i s@/usr/local@/usr@g config.mk
make
make install

