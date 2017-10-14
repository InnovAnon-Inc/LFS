set -eo nounset

cd /sources

test -f cups-2.2.4-source.tar.gz || \
wget --no-check-certificate \
	https://github.com/apple/cups/releases/download/v2.2.4/cups-2.2.4-source.tar.gz

rm -rf cups-2.2.4
tar xf cups-2.2.4-source.tar.gz
pushd  cups-2.2.4

useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp

groupadd -g 19 lpadmin

#usermod -a -G lpadmin <username>

sed -i 's#@CUPS_HTMLVIEW@#firefox#' desktop/cups.desktop.in

sed -i '2062,2069d' cups/dest.c



sed -i 's:444:644:' Makedefs.in
sed -i '/MAN.EXT/s:.gz::' configure config-scripts/cups-manpages.m4
sed -i '/LIBGCRYPTCONFIG/d' config-scripts/cups-ssl.m4

aclocal  -I config-scripts
autoconf -I config-scripts

CC=gcc \
./configure --libdir=/usr/lib            \
            --disable-systemd            \
            --with-rcdir=/tmp/cupsinit   \
            --with-system-groups=lpadmin \
            --with-docdir=/usr/share/cups/doc-2.2.4
make

make install
rm -rf /tmp/cupsinit
ln -svnf ../cups/doc-2.2.4 /usr/share/doc/cups-2.2.4

echo "ServerName /var/run/cups/cups.sock" > /etc/cups/client.conf

#gtk-update-icon-cache

cat > /etc/pam.d/cups << "EOF"
# Begin /etc/pam.d/cups

auth    include system-auth
account include system-account
session include system-session

# End /etc/pam.d/cups
EOF

#make install-cups
/workspace/LFS/LFS3/BLFS/bootscripts.sh cups

popd
rm -rf cups-2.2.4

