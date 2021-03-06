set -eo nounset

cd /sources

test -f qemu-2.10.1.tar.bz2 || \
wget --no-check-certificate \
	http://download.qemu-project.org/qemu-2.10.1.tar.bz2

rm -rf qemu-2.10.1
tar xf qemu-2.10.1.tar.bz2
pushd  qemu-2.10.1

#egrep '^flags.*(vmx|svm)' /proc/cpuinfo

groupadd -g 61 kvm

#usermod -a -G kvm <username>

if [ $(uname -m) = i686 ]; then
   QEMU_ARCH=i386-softmmu
else
   QEMU_ARCH=x86_64-softmmu
fi

mkdir -vp build
cd        build

../configure --prefix=/usr               \
             --sysconfdir=/etc           \
             --target-list=$QEMU_ARCH    \
             --audio-drv-list=alsa       \
             --with-sdlabi=2.0           \
             --docdir=/usr/share/doc/qemu-2.10.1

unset QEMU_ARCH

make

make install

cat > /lib/udev/rules.d/65-kvm.rules << "EOF"
KERNEL=="kvm", GROUP="kvm", MODE="0660"
EOF

chgrp kvm  /usr/libexec/qemu-bridge-helper &&
chmod 4750 /usr/libexec/qemu-bridge-helper

ln -sv qemu-system-`uname -m` /usr/bin/qemu

#VDISK_SIZE=50G
#VDISK_FILENAME=vdisk.img
#qemu-img create -f qcow2 $VDISK_FILENAME $VDISK_SIZE

#qemu -enable-kvm                           \
#     -drive file=$VDISK_FILENAME           \
#     -cdrom Fedora-16-x86_64-Live-LXDE.iso \
#     -boot d                               \
#     -m 1G

#qemu -enable-kvm                     \
#     -smp 4                          \
#     -cpu host                       \
#     -m 1G                           \
#     -drive file=$VDISK_FILENAME     \
#     -cdrom grub-img.iso             \
#     -boot order=c,once=d,menu=on    \
#     -net nic,netdev=net0            \
#     -netdev user,id=net0            \
#     -soundhw ac97                   \
#     -vga std                        \
#     -serial mon:stdio               \
#     -name "fedora-16"

cat > /usr/share/X11/xorg.conf.d/20-vmware.conf << "EOF"
Section         "Monitor"
  Identifier    "Monitor0"
  # cvt 1600 900
  # 1600x900 59.95 Hz (CVT 1.44M9) hsync: 55.99 kHz; pclk: 118.25 MHz
  Modeline      "1600x900"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
  Option        "PreferredMode" "1600x900"
  HorizSync     1-200
  VertRefresh   1-200
EndSection

Section         "Device"
  Identifier    "VMware SVGA II Adapter"
  Option        "Monitor" "default"
  Driver        "vmware"
EndSection

Section         "Screen"
  Identifier    "Default Screen"
  Device        "VMware SVGA II Adapter"
  Monitor       "Monitor0"

  SubSection    "Display"
    Depth       24
    Modes       "1600x900" "1440x900" "1366x768" "1280x720" "800x480"
  EndSubSection

EndSection
EOF

#install -vdm 755 /etc/qemu &&
#echo allow br0 > /etc/qemu/bridge.conf

popd
rm -rf qemu-2.10.1
