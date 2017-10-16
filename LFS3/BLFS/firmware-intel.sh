set -eo nounset

cd /sources

rm -rf intel-ucode
tar xf microcode-20170707.tgz

mkdir -pv /lib/firmware/intel-ucode

cp -v intel-ucode/06-55-08 /lib/firmware/intel-ucode

#echo 1 > /sys/devices/system/cpu/microcode/reload

dmesg | grep -e 'microcode' -e 'Linux version' -e 'Command line'

rm -rf intel-ucode

rm -rf initrd
mkdir -p initrd/kernel/x86/microcode
cd initrd

cp -v /lib/firmware/intel-ucode/06-55-08 kernel/x86/microcode/GenuineIntel.bin

find . | cpio -o -H newc > /boot/microcode.img

# TODO update grub config
# separate mount for /boot
#initrd /microcode.img
# else
#initrd /boot/microcode.img

#initrd /microcode.img /other-initrd.img

cd ..
rm -rf initrd
