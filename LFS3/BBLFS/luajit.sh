set -eo nounset

cd /other-repos || cd /repos

if [ -d luajit ] ; then
	pushd luajit
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone http://luajit.org/git/luajit-2.0.git luajit
fi

cd luajit

make
make PREFIX=/usr install

