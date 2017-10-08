# requires openssl
cd /sources

test -f openssh-7.5p1.tar.gz || \
wget --no-check-certificate \
    http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.5p1.tar.gz

test -f openssh-7.5p1-openssl-1.1.0-1.patch || \
wget --no-check-certificate \
    http://www.linuxfromscratch.org/patches/blfs/svn/openssh-7.5p1-openssl-1.1.0-1.patch

rm -rf openssh-7.5p1
tar xf openssh-7.5p1.tar.gz
cd     openssh-7.5p1

install  -v -m700 -d /var/lib/sshd
chown    -v root:sys /var/lib/sshd

groupadd -g 50 sshd
useradd  -c 'sshd PrivSep' \
         -d /var/lib/sshd  \
         -g sshd           \
         -s /bin/false     \
         -u 50 sshd

patch -Np1 -i ../openssh-7.5p1-openssl-1.1.0-1.patch

./configure --prefix=/usr                     \
            --sysconfdir=/etc/ssh             \
            --with-md5-passwords              \
            --with-privsep-path=/var/lib/sshd
make

make install
install -v -m755    contrib/ssh-copy-id /usr/bin

install -v -m644    contrib/ssh-copy-id.1 \
                    /usr/share/man/man1
install -v -m755 -d /usr/share/doc/openssh-7.5p1
install -v -m644    INSTALL LICENCE OVERVIEW README* \
                    /usr/share/doc/openssh-7.5p1

echo "PermitRootLogin no" >> /etc/ssh/sshd_config

echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config

make install-sshd
