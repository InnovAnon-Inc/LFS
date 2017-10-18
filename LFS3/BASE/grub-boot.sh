set -eo nounset
set +h

# make boot ISO
#../BLFS/libburn.sh
#../BLFS/libiso.sh
#../BLFS/libisoburn.sh
#
#cd /tmp 
#grub-mkrescue --output=grub-img.iso 
#xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
#
#rm grub-img.iso

# overwrite current boot loader
#grub-install /dev/sda

if [ ! -d /sys/firmware/efi ] ; then
	echo Legacy BIOS Grub Install
grub-install \
	--compress=xz            \
	--locales=POSIX          \
	--no-bootsector          \
	--removable              \
        --recheck                \
        --debug                  \
	/dev/sda
else
	echo Modern UEFI Grub Install

#	--pubkey=?               \
#	--themes=?               \
#	--core-compress=xz       \

#grub-install \
#	--compress=xz            \
#	--locales=POSIX          \
#	--bootloader-id=lfs-grub \
#	--efi-directory=/efi     \
#	--no-bootsector          \
#	--removable              \
#        --recheck                \
#	--target=x86_64-efi      \
#        --debug                  \
#	/dev/sda

#efibootmgr -c -d /dev/sda -p 4 -l '\EFI\lfs-grub\bootx86.efi' -L 'LFS Grub BootLoader'

echo TODO there is (Beyond) BLFS stuff to do here
fi


test -e /boot/grub/grub.cfg || \
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,4)

menuentry "GNU/Linux, Linux 4.13.7-lfs-SVN-20171015" {
	# if using a separate boot partition,
	# then remove /boot file path prefix
        linux   /boot/vmlinuz-4.13.7-lfs-SVN-20171015 root=/dev/sda4 ro
}
EOF

# TODO grub-mkconfig

