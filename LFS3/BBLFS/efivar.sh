set -eo nounset

cd /other-repos || cd /repos

if [ -d efivar ] ; then
	pushd efivar
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/rhboot/efivar.git
fi

cd efivar

cp -p Make.defaults{,.dist}
sed s/-O2/-Os/g -i Make.defaults

cp -p src/test/Makefile{,.dist}
sed 's|-path=$(TOPDIR)/src/|-rpath=$(libdir)|g' \
	-i src/test/Makefile

# do NOT run make test

make libdir=/usr/lib bindir=/usr/bin \
	mandir=/usr/share/man \
	includedir=/usr/include V=1 -j1

make -j1 V=1 libdir=/usr/lib \
	bindir=/usr/bin mandir=/usr/share/man \
	includedir=/usr/include install

#install -vDm0577 src/test/tester /usr/bin/efivar-tester

