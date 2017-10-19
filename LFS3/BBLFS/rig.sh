set -eo nounset

cd /other-repos || cd /repos

if [ -d rig ] ; then
	pushd rig
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/EinBaum/rig.git
fi

cd rig

make
make PREFIX=/usr install

