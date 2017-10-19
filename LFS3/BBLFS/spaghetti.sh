set -eo nounset

cd /other-repos || cd /repos

if [ -d spaghetti ] ; then
	pushd spaghetti
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/EinBaum/spaghetti.git
fi

cd spaghetti

sed -i s@/usr/local@/usr@g Makefile

make
make PREFIX=/usr install

