set -eo nounset

cd /other-repos || cd /repos

if [ -d blind ] ; then
	pushd blind
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/blind
fi

cd blind

sed -i s@/usr/local@/usr@g config.mk
make
make install

