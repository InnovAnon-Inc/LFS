set -eo nounset

DEV=/srv/lfs.img
MNT=/mnt/lfs

cp -a /root/workspace/LFS/LFS3/* /mnt/sda4/workspace/LFS/LFS3/

chroot /mnt/sda4 << EOF
cd /workspace/LFS/LFS3

if [ ! -f $DEV ] ; then
	#touch $DEV
	#truncate -s 10G $DEV
	dd if=/dev/zero of=$DEV count=10 bs=1G
fi

mkfs -v -t ext4 $DEV
(
	trap "umount -v -f $MNT" 0
	mount -v -t ext4 -o loop $DEV $MNT

	rm -rf /tools
	mkdir $MNT/tools
	chown -v lfs:lfs $MNT/tools
	chmod -v a+wt $MNT/tools
	ln -v -s $MNT/tools /tools

	su - lfs << EOF2
	source \\\$HOME/.bashrc
	cd /workspace/LFS/LFS3/TOOLS
	./tools.sh
EOF2
)
EOF

