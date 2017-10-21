set -eo nounset

cd /other-repos || cd /repos

if [ -d 9base ] ; then
	pushd 9base
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/9base
fi

cd 9base

sed -i s@/usr/local@/usr@g config.mk
make
make PREFIX=/usr install

