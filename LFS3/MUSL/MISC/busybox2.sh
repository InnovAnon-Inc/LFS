set -eo nounset

cd /other-repos || cd /repos

if [ -d busybox ] ; then
	pushd busybox
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://busybox.net/busybox.git
fi

cd busybox

make \
	defconfig
make \
	PREFIX=/mnt/mini \
	menuconfig
make \
	PREFIX=/mnt/mini
make \
	PREFIX=/mnt/mini \
	install -s

