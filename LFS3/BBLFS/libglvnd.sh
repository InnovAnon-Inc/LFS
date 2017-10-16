set -eo nounset

cd /other-repos || cd /repos

if [ -d libglvnd ] ; then
	pushd libglvnd
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/NVIDIA/libglvnd.git
fi

cd libglvnd

./autogen.sh
./configure
make
make install

