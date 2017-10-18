set -eo nounset
set +h

cd /sources

rm -rf shadow-4.5
tar xf shadow-4.5.tar.xz
pushd  shadow-4.5

sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs

# TODO cracklib
#sed -i 's@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@' etc/login.defs

sed -i 's/1000/999/' etc/useradd

./configure --sysconfdir=/etc --with-group-name-max-length=32

make

make install

mv -v /usr/bin/passwd /bin

pwconv

grpconv

# no default mailbox
sed -i 's/yes/no/' /etc/default/useradd

#passwd root

popd
rm -rf shadow-4.5
