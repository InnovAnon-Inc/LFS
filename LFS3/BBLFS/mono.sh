set -eo nounset

cd /other-repos || cd /repos

if [ -d mono ] ; then
	pushd mono
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/mono/mono.git
fi

cd mono

./autogen.sh
./configure
make get-monolite-latest
make
make install

