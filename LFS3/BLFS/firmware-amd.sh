set -eo nounset

cd /sources

#rm -rf intel-ucode
#tar xf microcode-20170707.tgz

mkdir -pv /lib/firmware/amd-ucode

cp -v microcode_amd* /lib/firmware/amd-ucode

#echo 1 > /sys/devices/system/cpu/microcode/reload

dmesg | grep -e 'microcode' -e 'Linux version' -e 'Command line'

#rm -rf intel-ucode

rm -rf initrd
mkdir -p initrd/kernel/x86/microcode
cd initrd

cp -v /lib/firmware/amd_ucode/<MYCONTAINER> kernel/x86/microcode/AuthenticAMD.bin

find . | cpio -o -H newc > /boot/microcode.img

# TODO update GRUB
# if /boot on separate partition
#initrd /microcode.img
# else
#initrd /boot/microcode.img

#initrd /microcode.img /other-initrd.img

cd ..
rm -rf initrd
