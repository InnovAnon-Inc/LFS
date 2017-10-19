set -eo nounset

cd /other-repos || cd /repos

if [ -d musl-cross-make ] ; then
	pushd musl-cross-make
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/richfelker/musl-cross-make.git
fi

cd musl-cross-make

cp -v config.mak.dist config.mak
vi config.mak
make
make install

