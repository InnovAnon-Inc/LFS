set -eo nounset

cd /other-repos || cd /repos

if [ -d uzbl ] ; then
	pushd uzbl
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/uzbl/uzbl.git
fi

cd uzbl

make
make install

