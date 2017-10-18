set -eo nounset
set +h

rm -rf /tmp/*

#chroot "$LFS" /usr/bin/env -i              \
#    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
#    PATH=/bin:/usr/bin:/sbin:/usr/sbin     \
#    /bin/bash --login

rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libfl_pic.a
rm -f /usr/lib/libz.a
