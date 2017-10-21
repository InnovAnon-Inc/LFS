set -eo nounset

cd /other-repos || cd /repos

if [ -d glfw ] ; then
	pushd glfw
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/glfw/glfw.git
fi

cd glfw

cmake .
./configure --prefix=/usr
make
make install

