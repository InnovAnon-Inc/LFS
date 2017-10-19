set -eo nounset

cd /other-repos || cd /repos

if [ -d libfuse ] ; then
	pushd libfuse
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/libfuse/libfuse.git
fi

cd libfuse

mkdir build
cd    build

meson ..
#mesonconf
ninja
#chown root:root util/fusermount3
#chmod 4755      util/fusermount3
#python3 -m pytest test/
ninja install
