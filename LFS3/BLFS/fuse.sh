set -eo nounset

cd /sources

test -f fuse-3.2.0.tar.xz || \
wget --no-check-certificate \
	https://github.com/libfuse/libfuse/releases/download/fuse-3.2.0/fuse-3.2.0.tar.xz

rm -rf fuse-3.2.0
tar xf fuse-3.2.0.tar.xz
pushd  fuse-3.2.0

sed -i '/^udev/,$ s/^/#/' util/meson.build &&

meson --prefix=/usr $PWD build &&
cd build                       &&
ninja

ninja install                                             &&

mv -vf   /usr/lib/libfuse3.so.3*     /lib                 &&
ln -sfvn ../../lib/libfuse3.so.3.2.0 /usr/lib/libfuse3.so &&

mv -vf /usr/bin/fusermount3  /bin  &&
mv -vf /usr/sbin/mount.fuse3 /sbin &&

install -v -m755 -d /usr/share/doc/fuse-3.2.0      &&
install -v -m644    ../doc/{README.NFS,kernel.txt} \
                    /usr/share/doc/fuse-3.2.0      &&
cp -Rv doc/html     /usr/share/doc/fuse-3.2.0      &&

gunzip /usr/share/man/{man1/fusermount3.1,man8/mount.fuse.8}.gz

test -e /etc/fuse.conf || \
cat > /etc/fuse.conf << "EOF"
# Set the maximum number of FUSE mounts allowed to non-root users.
# The default is 1000.
#
#mount_max = 1000

# Allow non-root users to specify the 'allow_other' or 'allow_root'
# mount options.
#
#user_allow_other
EOF

popd
rm -rf fuse-3.2.0
