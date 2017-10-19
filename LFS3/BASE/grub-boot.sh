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

	#../BLFS/openssl.sh
	#../BLFS/make-ca.sh
	#../BLFS/wget.sh

	#../BLFS/nspr.sh
	#../BBLFS/libedit.sh
	#../BLFS/unzip.sh
	#../BLFS/sqlite-autoconf.sh
	#../BLFS/libtasn.sh
	#../BLFS/p11-kit.sh
	#../BLFS/nss.sh
	#../BLFS/make-ca.sh
	#../BLFS/nettle.sh
	#../BLFS/libunistring.sh
	#../BLFS/gnutls.sh
	#../BLFS/wget.sh

	#../BLFS/popt-static.sh
	#../BLFS/pciutils-static.sh
	#../BLFS/which-static.sh
	#../BLFS/libpng-static.sh
	#../BLFS/freetype2-static.sh
	# glib
	# gobject-introspection, python
	# ...
	#../BLFS/harfbuzz-static.sh
	#../BLFS/freetype2-static.sh
	#../BLFS/dosfstools.sh
	#../BLFS/curl.sh
	#../BLFS/git.sh
	#../BBLFS/efivar.sh
	#../BBLFS/efibootmgr.sh
	#../BBLFS/unifont.sh
	#../BASE/grub-efi.sh

#	--pubkey=?               \
#	--themes=?               \
#	--core-compress=xz       \
#	--locales=C              \
#	/dev/sda4

grub-install \
	--compress=xz            \
	--bootloader-id=lfs-grub \
	--efi-directory=/efi     \
	--no-bootsector          \
	--removable              \
        --recheck                \
	--target=x86_64-efi      \
        --debug                  \
	/dev/sda4

#efibootmgr -c -d /dev/sda -p 4 -l '\EFI\lfs-grub\bootx86.efi' -L 'LFS Grub BootLoader'

echo TODO there is '(Beyond)' BLFS stuff to do here
fi

if [ ! -d /boot/grub ] ; then
	echo ACHTUNG skipping Grub Configuration
elif [ ! -e /boot/grub/grub.cfg ] ; then
if [ ! -d /sys/firmware/efi ] ; then
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
else
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod gzio
insmod part_gpt
insmode ext2
#set root=(hd0,gpt4)

insmod efi_gop
insmod efi_uga
insmod font
if loadfont /grub/unicode.pf2; then
	loadfont /grub/unicode.pf2
	set bfxmode=auto
	insmod gfxterm
	set gfxpayload=keep
	terminal_output gfxterm
fi

menuentry "GNU/Linux, Linux 4.13.7-lfs-SVN-20171015" {
	# if using a separate boot partition,
	# then remove /boot file path prefix
        linux   /boot/vmlinuz-4.13.7-lfs-SVN-20171015 root=/dev/sda4 ro
}
EOF
fi
fi

# TODO grub-mkconfig

