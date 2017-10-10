set -eo nounset

cd /sources

test -f rsync-3.1.2.tar.gz || \
wget --no-check-certificate \
	https://www.samba.org/ftp/rsync/src/rsync-3.1.2.tar.gz

rm -rf rsync-3.1.2
tar xf rsync-3.1.2.tar.gz
pushd  rsync-3.1.2

groupadd -g 48 rsyncd &&
useradd -c "rsyncd Daemon" -d /home/rsync -g rsyncd \
    -s /bin/false -u 48 rsyncd

./configure --prefix=/usr --without-included-zlib &&
make

make install

install -v -m755 -d          /usr/share/doc/rsync-3.1.2/api &&
install -v -m644 dox/html/*  /usr/share/doc/rsync-3.1.2/api

cat > /etc/rsyncd.conf << "EOF"
# This is a basic rsync configuration file
# It exports a single module without user authentication.

motd file = /home/rsync/welcome.msg
use chroot = yes

[localhost]
    path = /home/rsync
    comment = Default rsync module
    read only = yes
    list = yes
    uid = rsyncd
    gid = rsyncd

EOF

make install-rsyncd

popd
rm -rf rsync-3.1.2
