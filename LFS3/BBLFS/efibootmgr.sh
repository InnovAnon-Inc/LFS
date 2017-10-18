set -eo nounset

cd /other-repos || cd /repos

if [ -d efibootmgr ] ; then
	pushd efibootmgr
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/rhboot/efibootmgr.git
fi

cd efibootmgr

EFIDIR=/efi make

install -vDm0755 src/efibootmgr /usr/sbin/efibootmgr
install -vDm0644 src/efibootmgr.8 \
	/usr/share/man/man8/efibootmgr.8
install -vDm0644 src/efibootdump.8 \
	/usr/share/man/man8/efibootdump.8
