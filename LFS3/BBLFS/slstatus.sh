set -eo nounset

cd /other-repos || cd /repos

if [ -d slstatus ] ; then
	pushd slstatus
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.suckless.org/slstatus
fi

cd slstatus

sed -i s@/usr/local@/usr@g config.mk
make
make install

