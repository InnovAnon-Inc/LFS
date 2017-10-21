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

CC=/usr/local/musl/bin/musl-gcc \
LD_CONFIG_PATH=/usr/local/musl/lib \
C_INCLUDE_PATH=/usr/local/musl/include \
make \
	defconfig
CC=/usr/local/musl/bin/musl-gcc \
LD_CONFIG_PATH=/usr/local/musl/lib \
C_INCLUDE_PATH=/usr/local/musl/include \
make \
	SYSROOT=/usr/local/musl \
	CONFIG_SYSROOT=/usr/local/musl \
	CONFIG_PREFIX=/usr/local/musl \
	menuconfig
CC=/usr/local/musl/bin/musl-gcc \
LD_CONFIG_PATH=/usr/local/musl/lib \
C_INCLUDE_PATH=/usr/local/musl/include \
make \
	SYSROOT=/usr/local/musl \
	CONFIG_SYSROOT=/usr/local/musl \
	CONFIG_PREFIX=/usr/local/musl
CC=/usr/local/musl/bin/musl-gcc \
LD_CONFIG_PATH=/usr/local/musl/lib \
C_INCLUDE_PATH=/usr/local/musl/include \
make \
	SYSROOT=/usr/local/musl \
	CONFIG_SYSROOT=/usr/local/musl \
	CONFIG_PREFIX=/usr/local/musl \
	install


