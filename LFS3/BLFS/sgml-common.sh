set -eo nounset

cd /sources

for k in \
https://sourceware.org/ftp/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz \
http://www.linuxfromscratch.org/patches/blfs/svn/sgml-common-0.6.3-manpage-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf sgml-common-0.6.3
tar xf sgml-common-0.6.3.tgz
pushd  sgml-common-0.6.3

patch -Np1 -i ../sgml-common-0.6.3-manpage-1.patch &&
autoreconf -f -i

if `which install-catalog` ; then
install-catalog --remove /etc/sgml/sgml-ent.cat \
    /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&

install-catalog --remove /etc/sgml/sgml-docbook.cat \
    /etc/sgml/sgml-ent.cat
fi

./configure --prefix=/usr --sysconfdir=/etc &&
make

make docdir=/usr/share/doc install &&

install-catalog --add /etc/sgml/sgml-ent.cat \
    /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&

install-catalog --add /etc/sgml/sgml-docbook.cat \
    /etc/sgml/sgml-ent.cat

#install-catalog --remove /etc/sgml/sgml-ent.cat \
#    /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&
#
#install-catalog --remove /etc/sgml/sgml-docbook.cat \
#    /etc/sgml/sgml-ent.cat

popd
rm -rf sgml-common-0.6.3
