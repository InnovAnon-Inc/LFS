set -eo nounset

cd /sources

for k in  \
ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.45.tgz \
http://www.linuxfromscratch.org/patches/blfs/svn/openldap-2.4.45-consolidated-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf openldap-2.4.45
tar xf openldap-2.4.45.tgz
pushd  openldap-2.4.45

#patch -Np1 -i ../openldap-2.4.45-consolidated-1.patch
#autoconf
#
#./configure --prefix=/usr     \
#            --sysconfdir=/etc \
#            --disable-static  \
#            --enable-dynamic  \
#            --disable-debug   \
#            --disable-slapd
#
#make depend
#make
#
#make install

# gotta dump BDB

grep -q ldap /etc/group || \
groupadd -g 83 ldap
grep -q ldap /etc/passwd || \
useradd  -c "OpenLDAP Daemon Owner" \
         -d /var/lib/openldap -u 83 \
         -g ldap -s /bin/false ldap

patch -Np1 -i ../openldap-2.4.45-consolidated-1.patch
autoconf

./configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --localstatedir=/var  \
            --libexecdir=/usr/lib \
            --disable-static      \
            --disable-debug       \
            --with-tls=openssl    \
            --with-cyrus-sasl     \
            --enable-dynamic      \
            --enable-crypt        \
            --enable-spasswd      \
            --enable-slapd        \
            --enable-modules      \
            --enable-rlookups     \
            --enable-backends=mod \
            --disable-ndb         \
            --disable-sql         \
            --disable-shell       \
            --disable-bdb         \
            --disable-hdb         \
            --enable-overlays=mod \

make depend
make

make install

install -v -dm700 -o ldap -g ldap /var/lib/openldap

install -v -dm700 -o ldap -g ldap /etc/openldap/slapd.d
chmod   -v    640     /etc/openldap/slapd.{conf,ldif}
chown   -v  root:ldap /etc/openldap/slapd.{conf,ldif}

install -v -dm755 /usr/share/doc/openldap-2.4.45
cp      -vfr      doc/{drafts,rfc,guide} \
                  /usr/share/doc/openldap-2.4.45

make install-slapd

/etc/rc.d/init.d/slapd start

ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts | \
grep -qz \
'# extended LDIF
#
# LDAPv3
# base <> with scope baseObject
# filter: (objectclass=*)
# requesting: namingContexts
#

#
dn:
namingContexts: dc=my-domain,dc=com

# search result
search: 2
result: 0 Success

# numResponses: 2
# numEntries: 1'

popd
rm -rf openldap-2.4.45
