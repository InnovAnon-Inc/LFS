set -eo nounset

cd /other-repos || cd /repos

if [ -d farbfeld ] ; then
	pushd farbfeld
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/farbfeld
fi

cd farbfeld

sed -i s@/usr/local@/usr@g config.mk
make
make install

