set -eo nounset
set +h

cd /sources

rm -rf linux-4.13.3
tar xf linux-4.13.3.tar.xz
pushd  linux-4.13.3

make mrproper

make defconfig

make menuconfig

make

make modules_install

# from the host
#mount --bind /boot /mnt/lfs/boot

cp -v arch/x86/boot/bzImage /boot/vmlinuz-4.13.3-lfs-SVN-20170924

cp -v System.map /boot/System.map-4.13.3

cp -v .config /boot/config-4.13.3

install -d /usr/share/doc/linux-4.13.3
cp -r Documentation/* /usr/share/doc/linux-4.13.3

install -v -m755 -d /etc/modprobe.d
test -e /etc/modprobe.d/usb.conf || \
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

popd
rm -rf linux-4.13.3
