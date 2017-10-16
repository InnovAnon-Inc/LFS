set -eo nounset

# requires openssl
cd /sources

OPENSSH_VERSION=7.6p1

test -f openssh-$OPENSSH_VERSION.tar.gz || \
wget --no-check-certificate \
    http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$OPENSSH_VERSION.tar.gz

test -f openssh-$OPENSSH_VERSION-openssl-1.1.0-1.patch || \
wget --no-check-certificate \
    http://www.linuxfromscratch.org/patches/blfs/svn/openssh-$OPENSSH_VERSION-openssl-1.1.0-1.patch

rm -rf openssh-$OPENSSH_VERSION
tar xf openssh-$OPENSSH_VERSION.tar.gz
pushd  openssh-$OPENSSH_VERSION

install  -v -m700 -d /var/lib/sshd
chown    -v root:sys /var/lib/sshd

groupadd -g 50 sshd
useradd  -c 'sshd PrivSep' \
         -d /var/lib/sshd  \
         -g sshd           \
         -s /bin/false     \
         -u 50 sshd

patch -Np1 -i ../openssh-$OPENSSH_VERSION-openssl-1.1.0-1.patch

./configure --prefix=/usr                     \
            --sysconfdir=/etc/ssh             \
            --with-md5-passwords              \
            --with-privsep-path=/var/lib/sshd
make

make install
install -v -m755    contrib/ssh-copy-id /usr/bin

install -v -m644    contrib/ssh-copy-id.1 \
                    /usr/share/man/man1
install -v -m755 -d /usr/share/doc/openssh-$OPENSSH_VERSION
install -v -m644    INSTALL LICENCE OVERVIEW README* \
                    /usr/share/doc/openssh-$OPENSSH_VERSION

echo "PermitRootLogin no" >> /etc/ssh/sshd_config

echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config

#make install-sshd
/workspace/LFS/LFS3/BLFS/bootscripts.sh sshd

popd
rm -rf openssh-$OPENSSH_VERSION
