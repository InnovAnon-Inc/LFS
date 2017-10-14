set -eo nounset

cd /sources

test -f samba-4.7.0.tar.gz || \
wget --no-check-certificate \
	https://www.samba.org/ftp/samba/stable/samba-4.7.0.tar.gz

rm -rf samba-4.7.0
tar xf samba-4.7.0.tar.gz
pushd samba-4.7.0

echo "^samba4.rpc.echo.*on.*ncacn_np.*with.*object.*nt4_dc" >> selftest/knownfail

./configure                            \
    --prefix=/usr                      \
    --sysconfdir=/etc                  \
    --localstatedir=/var               \
    --with-piddir=/run/samba           \
    --with-pammodulesdir=/lib/security \
    --enable-fhs                       \
    --without-ad-dc                    \
    --without-systemd                  \
    --enable-selftest \
 \
--without-pam
make

make install

mv -v /usr/lib/libnss_win{s,bind}.so*   /lib
ln -v -sf ../../lib/libnss_winbind.so.2 /usr/lib/libnss_winbind.so
ln -v -sf ../../lib/libnss_wins.so.2    /usr/lib/libnss_wins.so

install -v -m644    examples/smb.conf.default /etc/samba

mkdir -pv /etc/openldap/schema

install -v -m644    examples/LDAP/README              \
                    /etc/openldap/schema/README.LDAP

install -v -m644    examples/LDAP/samba*              \
                    /etc/openldap/schema

install -v -m755    examples/LDAP/{get*,ol*} \
                    /etc/openldap/schema

ln -v -sf /usr/bin/smbspool /usr/lib/cups/backend/smb

#cat > /etc/samba/smb.conf << "EOF"
#[global]
#    workgroup = MYGROUP
#    dos charset = cp850
#    unix charset = ISO-8859-1
#EOF

#cat > /etc/samba/smb.conf << "EOF"
#[global]
#    workgroup = MYGROUP
#    dos charset = cp850
#    unix charset = ISO-8859-1
#
#[homes]
#    comment = Home Directories
#    browseable = no
#    writable = yes
#
#[printers]
#    comment = All Printers
#    path = /var/spool/samba
#    browseable = no
#    guest ok = no
#    printable = yes
#EOF

#    server string =
#    security =
#    hosts allow =
#    load printers =
#    log file =
#    max log size =
#    socket options =
#    local master =

groupadd -g 99 nogroup || :
useradd -c "Unprivileged Nobody" -d /dev/null -g nogroup \
    -s /bin/false -u 99 nobody || :

make install-samba

make install-winbindd

popd
rm -rf samba-4.7.0
