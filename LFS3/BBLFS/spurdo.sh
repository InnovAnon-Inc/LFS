# borked

set -eo nounset

cd /other-repos || cd /repos

if [ -d spurdo ] ; then
	pushd spurdo
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/EinBaum/spurdo.git
fi

cd spurdo

sed -i s@/usr/local@/usr@g Makefile

make
make PREFIX=/usr install

